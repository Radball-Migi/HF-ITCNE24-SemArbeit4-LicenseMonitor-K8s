<#
install-argocd.ps1

Zweck:
- Installiert Argo CD (kubectl apply)
- Startet minikube tunnel im Hintergrund
- Bootstrapped GitOps via Root-App (App-of-Apps)
- Wartet bis sealed-secrets Controller ready ist
- Fetch sealed-secrets public cert (für neue SealedSecrets nach Cluster-Rebuild)
- Gibt initiales ArgoCD admin Passwort aus (nur initial sichtbar)

Hinweise:
- sealed-secrets wird NICHT mehr per kubectl apply sealed-secrets.yaml installiert,
  sondern über die Root-App aus dem Git Repo.
#>

$ErrorActionPreference = "Stop"

# ---- Paths (anpassen falls dein Repo-Pfad anders ist) ------------------------
$repoRoot = "C:\Users\miguel.schneider\OneDrive - TBZ\GitHub_Repos_HF\HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s"

$argocdInstallYaml = Join-Path $repoRoot "infra\k8s\bootstrap\argocd\install\deploy-argocd.yaml"
$rootAppYaml       = Join-Path $repoRoot "infra\k8s\bootstrap\argocd\root-app\dev-bootstrap.yaml"

$sealedSecretsCertOut = Join-Path $repoRoot "infra\k8s\certs\sealed-secrets\sealed-secrets-cert.pem"

$minikubeProfile = "semar4-demo"  # Anpassen falls anderer Minikube Profilname

# -----------------------------------------------------------------------------

function Ensure-Namespace {
  param([string]$Name)
  $exists = kubectl get ns $Name -o name 2>$null
  if (-not $exists) {
    Write-Host "Creating namespace '$Name'..." -ForegroundColor Magenta
    kubectl create ns $Name | Out-Null
  }
}

function Wait-DeploymentReady {
  param(
    [string]$Namespace,
    [string]$DeploymentName,
    [int]$TimeoutSeconds = 240
  )
  Write-Host "Waiting for deployment/$DeploymentName in ns/$Namespace ..." -ForegroundColor Magenta
  kubectl -n $Namespace rollout status "deploy/$DeploymentName" "--timeout=${TimeoutSeconds}s"
}

function Wait-ArgoAppExists {
  param(
    [string]$AppName,
    [int]$TimeoutSeconds = 120
  )
  $deadline = (Get-Date).AddSeconds($TimeoutSeconds)

  Write-Host "Waiting for ArgoCD Application '$AppName' to exist..." -ForegroundColor Magenta
  do {
    $app = kubectl -n argocd get app $AppName -o name 2>$null
    if ($app) { return }
    Start-Sleep -Seconds 2
  } while ((Get-Date) -lt $deadline)

  throw "ArgoCD Application '$AppName' not found after ${TimeoutSeconds}s. Check Root-App path/repo config."
}

function Start-MinikubeTunnelBackground {
  param([string]$Profile)

  Write-Host "Starting minikube tunnel in background (profile: $Profile)..." -ForegroundColor Magenta

  # Minimiertes PowerShell Fenster, bleibt offen (-NoExit), damit tunnel weiterläuft
  Start-Process pwsh `
    -WindowStyle Minimized `
    -ArgumentList "-NoExit", "-Command", "minikube -p $Profile tunnel"
}

# -------------------- Start --------------------------------------------------

Write-Host "=== ArgoCD Install + GitOps Bootstrap ===" -ForegroundColor Cyan

# Namespace argocd sicherstellen
Ensure-Namespace -Name "argocd"

# ArgoCD installieren (server-side apply)
Write-Host "Applying ArgoCD install manifest..." -ForegroundColor Magenta
kubectl apply `
  --server-side `
  --force-conflicts `
  -n "argocd" `
  -f $argocdInstallYaml | Out-Null

# Warten bis argocd-server ready ist
Wait-DeploymentReady -Namespace "argocd" -DeploymentName "argocd-server" -TimeoutSeconds 300

Kubectl -n ingress-nginx apply -f "C:\Users\miguel.schneider\OneDrive - TBZ\GitHub_Repos_HF\HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s\infra\k8s\apps\ingress-nginx\base\ingress-nginx-controler-lb.yaml"
Kubectl -n ingress-nginx rollout status deploy/ingress-nginx-controller
start-sleep -Seconds 10

# Minikube tunnel im Hintergrund (falls du LB/Ingress brauchst)
Start-MinikubeTunnelBackground -Profile $minikubeProfile

Write-Host "Waiting briefly for minikube tunnel to establish..." -ForegroundColor Magenta
Start-Sleep -Seconds 10

# Restart argocd-repo-server damit es den Tunnel/LB erkennt
Write-Host "Restarting argocd-repo-server to recognize minikube tunnel..." -ForegroundColor Magenta
kubectl -n argocd rollout restart deploy/argocd-repo-server
Wait-DeploymentReady -Namespace "argocd" -DeploymentName "argocd-repo-server" -TimeoutSeconds 180
Start-Sleep -Seconds 10 # Extra warten damit Repo-Server wirklich bereit ist.

# Root-App anwenden (App-of-Apps)
Write-Host "Applying Root-App (GitOps bootstrap)..." -ForegroundColor Magenta
kubectl apply -n argocd -f $rootAppYaml | Out-Null

# Warten bis sealed-secrets Application existiert (Argo hat sie aus Git erstellt)
Wait-ArgoAppExists -AppName "sealed-secrets" -TimeoutSeconds 180

# Warten bis sealed-secrets Controller Deployment wirklich ready ist
Wait-DeploymentReady -Namespace "kube-system" -DeploymentName "sealed-secrets"
Start-Sleep -Seconds 20 # Extra warten damit Controller wirklich bereit ist.
Wait-DeploymentReady -Namespace "kube-system" -DeploymentName "sealed-secrets"

# sealed-secrets public cert fetchen (für neue SealedSecrets nach Rebuild)
Write-Host "Fetching sealed-secrets public cert -> $sealedSecretsCertOut" -ForegroundColor Magenta

# Output-Verzeichnis sicherstellen
$certDir = Split-Path -Parent $sealedSecretsCertOut
if (-not (Test-Path $certDir)) {
  New-Item -ItemType Directory -Path $certDir | Out-Null
}

kubeseal --fetch-cert `
  --controller-namespace kube-system `
  --controller-name sealed-secrets |
  Out-File -FilePath $sealedSecretsCertOut -Encoding ascii

Write-Host "sealed-secrets cert saved." -ForegroundColor Green

# Initial ArgoCD Admin Passwort ausgeben (nur initial sinnvoll)
try {
  $initPWArgoCD = kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" `
    | ForEach-Object { [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($_)) }

  Write-Host "Initial ArgoCD admin password: '$initPWArgoCD' (please change immediately!)" -ForegroundColor Blue
}
catch {
  Write-Host "Could not read argocd-initial-admin-secret (maybe already changed/removed). Continuing." -ForegroundColor Yellow
}

Write-Host "=== Done: ArgoCD installed, Root-App applied, sealed-secrets ready ===" -ForegroundColor Green

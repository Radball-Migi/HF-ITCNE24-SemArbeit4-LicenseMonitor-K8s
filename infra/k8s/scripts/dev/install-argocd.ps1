kubectl apply `
    --server-side `
    --force-conflicts `
    -n "argocd" `
    -f "C:\Users\miguel.schneider\OneDrive - TBZ\GitHub_Repos_HF\HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s\infra\k8s\dev\yaml-files\deploy_argocd.yaml"

kubectl -n argocd rollout status deploy/argocd-server

Write-Host "Starting minikube tunnel in background..." -ForegroundColor Magenta

Start-Process pwsh `
  -ArgumentList "-NoExit", "-Command", "minikube -p semar4-dev tunnel"

Write-Host "Waiting for minikube tunnel to establish..." -ForegroundColor Magenta
start-sleep -Seconds 10

# create sealed-secrets app in argocd
kubectl apply -f "C:\Users\miguel.schneider\OneDrive - TBZ\GitHub_Repos_HF\HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s\infra\k8s\dev\yaml-files\sealed-secrets.yaml"

Write-Host "Waiting for sealed-secrets controller to be ready..." -ForegroundColor Magenta
Start-Sleep -Seconds 20

kubectl -n argocd get app sealed-secrets
kubectl -n kube-system rollout status deploy/sealed-secrets

# Gets the public key from the sealed-secrets controller and saves it to a file
kubeseal `
    --fetch-cert `
    --controller-namespace kube-system `
    --controller-name sealed-secrets `
> "C:\Users\miguel.schneider\OneDrive - TBZ\GitHub_Repos_HF\HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s\infra\k8s\dev\certs\sealed-secrets\sealed-secrets-cert.pem"


$initPWArgoCD = kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | % { [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($_)) }
Write-Host "Initial ArgoCD admin password: '$initPWArgoCD', please change it immediately!" -ForegroundColor Blue

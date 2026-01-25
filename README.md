# 🧭 Repository-Wegweiser – HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s

Dieses Repository enthält alle Ressourcen, Quellcodes und CI/CD-Konfigurationen für die **Semesterarbeit 4 – LicenseMonitor**.  
Die **Dokumentation** selbst befindet sich auf **GitHub Pages**:

👉 **[Zur Projektdokumentation](https://radball-migi.github.io/HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s/)**

---

## 🔗 Wichtige Dateien & Links

| Bereich | Beschreibung | Link |
|----------|---------------|------|
| 🧠 **Dokumentation** | Projektbeschreibung, Ziele, Evaluation etc. | [GitHub Pages](https://radball-migi.github.io/HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s/) |
| 🧭 **Git-Konventionen** | Commit-Kultur, Branching & SemVer-Regeln | [`.github/CONTRIBUTING.md`](./.github/CONTRIBUTING.md) |
| ⚙️ **CI/CD Pipeline** | GitHub Actions Workflow für Build & Deployment | [`.github/workflows`](./.github/workflows/) |

---

## 🧱 Hinweise zur Nutzung

- **Hauptentwicklung:** in `dev`-Branch  
- **Stable / Releases:** in `main`  
- **Automatische Builds:** werden durch Push auf `dev` oder `main` ausgelöst  
- **Versions-Tags:** nach SemVer (`vX.Y.Z`)  

---

## 🧩 Weiteres

Später können zusätzliche Inhalte (z. B. Architekturdiagramme, API-Doku oder Tests) ergänzt werden.  
Dieses README bleibt der zentrale Einstiegspunkt und Navigations-Wegweiser durch das Repository.

---

## 🗂️ Strukturübersicht

```
HF-ITCNE24-SEMARBEIT4-LICENSEMONITOR-K8S
│   .gitignore
│   README.md
│   _config.yml
│
├───.github
│   │   CODEOWNERS
│   │   CONTRIBUTING.md
│   │
│   └───workflows
│           documentation_cicd.yml
│           licensetool_ci.yml
│           licensetool_ci_dev.yml
│           syntaxtests.yml
|
├───documentation
│   │   Gemfile
│   │   index.md
│   │
│   ├───Einleitung
│   │       21_ausgangslage.md
│   │       22_ziele.md
│   │       23_zeitplan.md
│   │       24_risiken.md
│   │       25_projektmanagement-methode.md
│   │       index.md
│   │
│   ├───Haupteil
│   │       31_define.md
│   │       32_measure.md
│   │       33_analyze.md
│   │       34_improve.md
│   │       35_control.md
│   │       index.md
│   │
│   ├───Quellverzeichnis
│   │       index.md
│   │
│   └───Sprints
│           index.md
│           sprint1_17-11-2025.md
│           sprint2_15-12-2025.md
│           sprint3_23-01-2026.md
│
├───infra
│   └───k8s
│       ├───apps
│       │   ├───ingress-nginx
│       │   │   └───base
│       │   │           ingress-nginx-controler-lb.yaml
│       │   │
│       │   ├───licensetool
│       │   │   ├───base
│       │   │   │       kustomization.yaml
│       │   │   │       licensetool-dev.yaml
│       │   │   │       service.yaml
│       │   │   │
│       │   │   └───overlays
│       │   │       ├───dev
│       │   │       │   │   ingress-nginx.yaml
│       │   │       │   │   kustomization.yaml
│       │   │       │   │
│       │   │       │   ├───patches
│       │   │       │   │       deployment-patch.yaml
│       │   │       │   │
│       │   │       │   └───sealedsecrets
│       │   │       │           licensetool-cert-flask-service-iseapp-1588.sealedsecret.yaml
│       │   │       │           licensetool-cert-infos.sealedsecret.yaml
│       │   │       │           licensetool-cert-iseschool.sealedsecret.yaml
│       │   │       │           licensetool-cert-iseschool2013.sealedsecret.yaml
│       │   │       │           licensetool-env.sealedsecret.yaml
│       │   │       │           licensetool-profiles-auth.sealedsecret.yaml
│       │   │       │           licensetool-profiles-sharepoint.sealedsecret.yaml
│       │   │       │           licensetool-profiles-tenants.sealedsecret.yaml
│       │   │       │           licensetool-tls.sealedsecret.yaml
│       │   │       │           regcred.sealedsecret.yaml
│       │   │       │
│       │   │       └───prod
│       │   │               kustomization.yaml
│       │   │
│       │   └───sealed-secrets
│       │       └───values
│       │               dev.yaml
│       │               prod.yaml
│       │
│       ├───archive
│       │       create-secret-bsp.ps1
│       │       deploy-mount-secrets.yaml
│       │       ingress.yaml
│       │       lb.yaml
│       │       licensetool-dev.yaml
│       │
│       ├───bootstrap
│       │   └───argocd
│       │       ├───install
│       │       │       deploy-argocd.yaml
│       │       │
│       │       └───root-app
│       │               dev-bootstrap.yaml
│       │
│       ├───certs
│       │   ├───sealed-secrets
│       │   │       sealed-secrets-cert.pem
│       │   │
│       │   └───tls
│       │           key_with_attrs.pem
│       │           licensetool.local.crt
│       │           licensetool.local.crt.pem
│       │           licensetool.local.key
│       │           licensetool.local.key.pem
│       │           licensetool.local.pfx
│       │
│       ├───clusters
│       │   └───dev
│       │       │   kustomization.yaml
│       │       │
│       │       └───applications
│       │               licensetool.yaml
│       │               sealed-secrets.yaml
│       │
│       └───scripts
│           ├───dev
│           │       create-cluster.ps1
│           │       create-sealed-secrets-bsp.ps1
│           │       create-sealed-secrets.ps1
│           │       create-secret-bsp.ps1
│           │       create-secrets.ps1
│           │       create_tls_self-signed-cert-bsp.ps1
│           │       create_tls_self-signed-cert.ps1
│           │       install-argocd.ps1
│           │       README.md
│           │
│           └───prod
├───ressources
│   │   Link.md
│   │
│   ├───docs
│   │       .$seusag.drawio.bkp
│   │       .$zielarchitektur.drawio.bkp
│   │       infrastructure_evaluation.md
│   │       ITCNE24_Semesterarbeit_4_Einreichungsformular_Miguel_Schneider.pdf
│   │       Risikomatrix.pptx
│   │       seusag.drawio
│   │       zielarchitektur.drawio
│   │
│   ├───images
│   │       <Bilder für Doku>
│   │
│   ├───licensetool
│   │   │   .env
│   │   │   app.db
│   │   │   compose.test.yaml
│   │   │   compose.yaml
│   │   │   config.py
│   │   │   dockerfile
│   │   │   dockerfile.test
│   │   │   requirements.txt
│   │   │
│   │   ├───app
│   │   │   │   extensions.py
│   │   │   │   __init__.py
│   │   │   │
│   │   │   ├───auth
│   │   │   │       routes.py
│   │   │   │       utils.py
│   │   │   │       __init__.py
│   │   │   │
│   │   │   ├───licenses
│   │   │   │       routes.py
│   │   │   │       __init__.py
│   │   │   │
│   │   │   ├───main
│   │   │   │       routes.py
│   │   │   │       __init__.py
│   │   │   │
│   │   │   ├───models
│   │   │   │       license.py
│   │   │   │
│   │   │   ├───modules
│   │   │   │       logging_config.py
│   │   │   │       mggraph.py
│   │   │   │       sku_mapping.py
│   │   │   │
│   │   │   ├───monitoring
│   │   │   │       routes.py
│   │   │   │       __init__.py
│   │   │   │
│   │   │   ├───static
│   │   │   │   │   frontend.css
│   │   │   │   │   mainpage.css
│   │   │   │   │   monitoring.css
│   │   │   │   │   statusall.css
│   │   │   │   │   tenant.css
│   │   │   │   │
│   │   │   │   └───images
│   │   │   │           logo_license-tool_mainpage.png
│   │   │   │
│   │   │   └───templates
│   │   │           frontend.html
│   │   │           mainpage.html
│   │   │           monitoring.html
│   │   │           statusall.html
│   │   │           tenant.html
│   │   │
│   │   ├───certs
│   │   │   │   certcreation.sh
│   │   │   │
│   │   │   ├───flask_service_ISEAPP-1588
│   │   │   │       mycert_semarb3.cer
│   │   │   │       mycert_semarb3.key
│   │   │   │       mycert_semarb3.pem
│   │   │   │       mycert_semarb3.pfx
│   │   │   │
│   │   │   ├───infos
│   │   │   │       cert-iseschool-info.json
│   │   │   │       cert-iseschool2013-info.json
│   │   │   │
│   │   │   ├───iseschool
│   │   │   │       mycert_iseschool.crt
│   │   │   │       mycert_iseschool.key
│   │   │   │       mycert_iseschool.pem
│   │   │   │       mycert_iseschool.pfx
│   │   │   │
│   │   │   └───iseschool2013
│   │   │           mycert_iseschool2013.crt
│   │   │           mycert_iseschool2013.key
│   │   │           mycert_iseschool2013.pem
│   │   │           mycert_iseschool2013.pfx
│   │   │
│   │   ├───config
│   │   │       sku_mappings.json
│   │   │
│   │   ├───config-profiles
│   │   │   ├───auth
│   │   │   │       oidc-config-iseschool2013-profile.json
│   │   │   │
│   │   │   ├───sharepoint
│   │   │   │       sp-config-iseschool2013-profile.json
│   │   │   │
│   │   │   └───tenants
│   │   │           config-iseschool-profile.json
│   │   │           config-iseschool2013-profile.json
│   │   │
│   │   ├───logs
│   │   │       licensetool.log
│   │   │
│   │   ├───notes
│   │   │       logs_login-logout_and_request.txt
│   │   │
│   │   └───test
│   │           conftest.py
│   │           create_test_data.py
│   │           test_auth.py
│   │           test_license.py
│   │           test_main.py
│   │           test_mggraph.py
│   │           test_monitoring.py
│   │           __init__.py
│   │
│   └───notizen
│           Backup_improvesem4.md
│           Kubectlcomands.md
│           minikubecomands.md
│
└───_includes
        title.html
```


---

*© 2025 – HF ITCNE24 – Seminararbeit 4 – LicenseMonitor (K8s)*

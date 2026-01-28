# 🧭 Repository-Wegweiser – HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s

Dieses Repository enthält alle Ressourcen, Quellcodes und CI/CD-Konfigurationen für die **Semesterarbeit 4 – LicenseMonitor**.  
Die **Dokumentation** selbst befindet sich auf **GitHub Pages**:

👉 **[Zur Projektdokumentation](https://radball-migi.github.io/HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s/)**

---

## 🔗 Wichtige Dateien & Links

| Bereich                 | Beschreibung                                                                         | Link                                                                                     |
| ----------------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
| 🧠 **Dokumentation**    | Projektbeschreibung, Ziele, Evaluation etc.                                          | [GitHub Pages](https://radball-migi.github.io/HF-ITCNE24-SemArbeit4-LicenseMonitor-K8s/) |
| 🧠  **Dokumentation**   | Projektbeschreibung, Ziele, Evaluation etc. (Alles in einem File, ohne Formatierung) | [merged.md](./documentation/merged.md)                                                   |
| ⚙️ **CI/CD Pipeline**   | GitHub Actions Workflow für Build & Deployment                                       | [`.github/workflows`](./.github/workflows/)                                              |
| 🧭 **Git-Konventionen** | Commit-Kultur, Branching & SemVer-Regeln                                             | [`.github/CONTRIBUTING.md`](./.github/CONTRIBUTING.md)                                   |

---

## 🧱 Hinweise zur Nutzung

- **Hauptentwicklung:** in `dev`-Branch  
- **Stable / Releases:** in `main`  
- **Automatische Builds:** werden durch Push auf `dev` oder `main` ausgelöst  
- **Versions-Tags:** nach SemVer (`vX.Y.Z`)  

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
│   │   merged.md
│   │   merge_all_file2one.ps1
│   │
│   ├───Abschluss
│   │       51_reaced_goals.md
│   │       52_reflections_and_experiences.md
│   │       index.md
│   │
│   ├───Einleitung
│   │       21_ausgangslage.md
│   │       22_ziele.md
│   │       23_zeitplan.md
│   │       24_risiken.md
│   │       25_projektmanagement-methode.md
│   │       26_SEUSAG.md
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
|
├───ressources
│   │   Link.md
│   │
│   ├───docs
│   │       .$seusag.drawio.bkp
│   │       .$zielarchitektur.drawio.bkp
│   │       HF-ITCNE24-SemArbeit4-Licensetool-k8s.ppsx
│   │       HF-ITCNE24-SemArbeit4-Licensetool-k8s.pptx
│   │       infrastructure_evaluation.md
│   │       ITCNE24_Semesterarbeit_4_Einreichungsformular_Miguel_Schneider.pdf
│   │       Risikomatrix.pptx
│   │       seusag.drawio
│   │       zielarchitektur.drawio
│   │
│   ├───images
│   │       abschluss.png
│   │       analyze.png
│   │       argocd.png
│   │       argocd_application_overview.png
│   │       argocd_apps.png
│   │       argocd_apps_health.png
│   │       argocd_sync_licensetool.png
│   │       argocd_ui_overview.png
│   │       ausgangslage.png
│   │       check_file_toml.png
│   │       ci1.png
│   │       ci2.png
│   │       ci3.png
│   │       ci_pipeline_god.png
│   │       ci_pipeline_merge_error.png
│   │       cluster.png
│   │       control.png
│   │       create_cluster_and_install_argocd.gif
│   │       create_cluster_output.png
│   │       define.png
│   │       devops.png
│   │       dockerhub_image_dev.png
│   │       encripted_sealedsecret.png
│   │       error_pat_deploy.png
│   │       experience.png
│   │       get_pods.png
│   │       get_secrets.png
│   │       goal.png
│   │       idee.png
│   │       image_in_dockerhub.png
│   │       image_of_pod.png
│   │       ise-licensemonitor_app_symbol.png
│   │       issue_in_planer.png
│   │       kanban.png
│   │       kanban_and_scrum.png
│   │       licensetool_argocd_states.png
│   │       login_error_log_argocd.png
│   │       login_new_app_on_k8s.png
│   │       logo_license-tool_mainpage.png
│   │       logs_licensetool.png
│   │       logs_licensetool_argocd.png
│   │       measure.png
│   │       merge-errors.png
│   │       migi.jpg
│   │       migi_logo.png
│   │       milestone_sprint_2.png
│   │       minikube_cluster_dev_status.png
│   │       msvc-k8s.png
│   │       pods_events.png
│   │       pods_ready.png
│   │       pods_restarts.png
│   │       pytest_ci.png
│   │       quellverzeichnis.png
│   │       reached-goals.png
│   │       redeploy-health.gif
│   │       retro_sprint-1-old.png
│   │       retro_sprint-1.png
│   │       retro_sprint-2.png
│   │       retro_sprint-3.png
│   │       risikomatrix.png
│   │       roadmap_github-project.png
│   │       scrum.png
│   │       sealed_secrets_in_k8s.png
│   │       sealed_secrets_in_repo.png
│   │       seusag.gif
│   │       six-sigma.png
│   │       sprint-review.png
│   │       sprint1_roadmap.png
│   │       sprint2_roadmap.png
│   │       sprint3_roadmap.png
│   │       verbessern.png
│   │       welcome.png
│   │       zielarchitektur.png
│   │
│   ├───licensetool
│   │   │   .env
│   │   │   app.db
│   │   │   compose.test.yaml
│   │   │   compose.yaml
│   │   │   config.py
│   │   │   dockerfile
│   │   │   dockerfile.test
│   │   │   pyproject.toml
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
│           Kubectlcomands.md
│           minikubecomands.md
│
└───_includes
        title.html
```


---

*© 2025 – HF ITCNE24 – Seminararbeit 4 – LicenseMonitor (K8s)*

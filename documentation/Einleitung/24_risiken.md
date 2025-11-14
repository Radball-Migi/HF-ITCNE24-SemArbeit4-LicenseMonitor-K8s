---
layout: default
title: 2.4 Risiken
parent: 2. Einleitung
nav_order: 6
---
# Risiken

Bei Projektarbeiten sind Risiken immer vorhanden. Diese Risiken können jedoch im Voraus identifiziert und geeignete Massnahmen getroffen werden. So wird sichergestellt, dass das Projekt planmässig verläuft und die festgelegten Ziele erreicht werden.

**Während der Arbeit rechne ich mit folgenden Risiken :** 

| Risiko                                                                                                         | Eintritt | Auswirkung | Massnahme zur Vermeidung / Minderung                                                                                                                                 |
| -------------------------------------------------------------------------------------------------------------- | -------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Komplexität bei der Einrichtung der CI/CD-Pipeline (z. B. YAML-Fehler, Pipeline-Trigger)                       | Mittel   | Mittel     | Schrittweise Implementierung, Nutzung von Templates, regelmässige Tests und Code-Reviews                                                                             |
| Fehlkonfiguration von Kubernetes-Ressourcen (z. B. Pods, Services, Secrets)                                    | Mittel   | Hoch       | Einsatz von Helm-Charts, Validierung der Konfiguration über Testumgebungen und Dokumentation der Deployments                                                         |
| Datenschutzrisiko durch unsichere Speicherung von Lizenzdaten                                                  | Niedrig  | Hoch       | Klare Trennung von sensiblen Daten, Speicherung innerhalb der definierten Systemumgebung und Einhaltung interner Datenschutzrichtlinien                              |
| Integrationsprobleme zwischen Microservices oder Pipeline-Komponenten                                          | Mittel   | Mittel     | Klare Schnittstellendefinitionen, Integrationstests in jeder Pipeline-Stufe, Logging und Fehlerauswertung                                                            |
| Instabilität des Systems bei Skalierung oder Lasttests                                                         | Mittel   | Hoch       | Stufenweiser Ausbau der Skalierung, Tests unter realistischen Bedingungen, Nutzung von Kubernetes-Self-Healing-Mechanismen                                           |
| GitHub-Dokumentation wird nicht laufend gepflegt                                                               | Niedrig  | Niedrig    | Doku fix in Workflow einplanen, regelmässige Erinnerung im Taskboard                                                                                                 |
| Authentifizierungsprobleme mit der Microsoft Graph API in Kubernetes (z. B. Zertifikate, Thumbprints, Secrets) | Mittel   | Hoch       | Sichere Verwaltung und regelmässige Erneuerung der Zertifikate/Secrets, Einsatz von Kubernetes-Secrets oder Key Vault, Monitoring und Logging der Authentifizierung. |


![Risikoanalyse](../../ressources/images/risikoanalyse.png)

---
layout: default
title: 3.4 Verbessern
parent: 3. Hauptteil
nav_order: 7
---
#  Verbessern (Improve) Phase

Die Improve-Phase ist der vierte Schritt in einem Six Sigma Projekt. In dieser Phase werden die in der [Analyze-Phase](./33_analysieren.md) identifizierten Hauptursachen für Prozessabweichungen adressiert und Lösungen entwickelt, um diese zu beheben. Ziel ist es, durch gezielte Verbesserungsmassnahmen die Prozessleistung zu optimieren und die identifizierten Probleme nachhaltig zu lösen. Dies umfasst die Anwendung von Kreativitätstechniken, statistischen Methoden und Pilotprojekten, um die Wirksamkeit der vorgeschlagenen Lösungen zu testen und zu validieren.

Der Fokus dieser Phase liegt **nicht auf der Neuentwicklung der Applikation**, sondern auf der **Migration, Automatisierung und dem cloud-nativen Betrieb** eines bereits bestehenden Lizenzüberwachungstools. Der funktionale Umfang der Anwendung wurde in einer vorherigen Semesterarbeit umgesetzt und bleibt im Rahmen dieser Arbeit unverändert.

Ziel der Improve-Phase ist es, die bestehende Anwendung so weiterzuentwickeln, dass sie reproduzierbar bereitgestellt, automatisiert betrieben und nachhaltig gewartet werden kann – im Sinne moderner DevOps- und Cloud-Native-Core-Prinzipien.

![Verbessern](../../ressources/images/verbessern.png)

[Quelle](../Quellverzeichnis/index.md#improve-phase)

## Architekturgrundlage des Lizenzüberwachungstools

Das Lizenzüberwachungstool basiert auf einem **Microservice-Architekturstil (MSVC)** und nutzt **Python mit Flask** zur Umsetzung der einzelnen Services. Diese Architektur bildet die fachliche und technische Grundlage für die nachfolgenden Verbesserungsmassnahmen.

### Microservice-Architektur (MSVC) und Flask API

Bei einer Microservice-Architektur wird eine Anwendung nicht als monolithisches System umgesetzt, sondern in mehrere kleine, unabhängige Dienste aufgeteilt. Jeder dieser Dienste übernimmt eine klar abgegrenzte fachliche Aufgabe und kann unabhängig entwickelt, betrieben und skaliert werden.

Im vorliegenden Projekt fungieren die Flask-Services als **REST-basierte APIs**, welche unter anderem folgende Aufgaben übernehmen:
- Abfrage von Lizenzinformationen über die Microsoft Graph API
- Verarbeitung und Aufbereitung der Lizenzdaten
- Bereitstellung von Schnittstellen für weitere Systeme oder Automatisierungen

Durch den Einsatz von Flask als leichtgewichtigem Framework bleiben die Services bewusst schlank und stateless. Dies erleichtert nicht nur die Containerisierung, sondern ist auch eine zentrale Voraussetzung für den späteren Betrieb in einer Cloud-Native-Umgebung.

Diese Architekturentscheidung unterstützt die in der Analyze-Phase identifizierten Verbesserungsziele direkt: geringere Kopplung, bessere Wartbarkeit und gezielte Skalierbarkeit einzelner Komponenten.

---

## Cloud-Native Core (CNC) als Zielarchitektur

Um die bestehenden Microservices effizient, stabil und automatisiert betreiben zu können, wird das Lizenzüberwachungstool in eine **Cloud-Native-Core-Architektur (CNC)** überführt. CNC beschreibt dabei keinen einzelnen Technologie-Stack, sondern ein Architekturprinzip.

Zentrale Merkmale dieser Architektur sind:
- Containerisierte Anwendungen
- Deklarative Infrastruktur
- Automatisierte Deployments
- Skalierbarkeit und Self-Healing
- Klare Trennung von Code, Konfiguration und Laufzeit

Durch die Umsetzung dieser Prinzipien wird sichergestellt, dass die Anwendung reproduzierbar betrieben, einfach erweitert und zuverlässig überwacht werden kann.

---

## Minikube als Kubernetes-Laufzeitumgebung

Für die praktische Umsetzung der Cloud-Native-Core-Architektur wird **Minikube** als Kubernetes-Umgebung eingesetzt. Minikube ermöglicht den Betrieb eines vollständigen Kubernetes-Clusters in einer lokalen Umgebung und eignet sich damit ideal für Entwicklungs-, Test- und Evaluationszwecke.

Der Einsatz von Minikube bietet mehrere Vorteile im Kontext dieser Semesterarbeit:
- Realistisches Kubernetes-Verhalten ohne Cloud-Abhängigkeit
- Volle Kontrolle über Infrastruktur und Konfiguration
- Konformität mit den Datenschutzanforderungen (DSG)
- Nahtlose Integration in CI/CD-Pipelines

Durch Minikube kann die Zielarchitektur praxisnah umgesetzt werden, ohne die im Analyse-Teil identifizierten Risiken eines Cloud-Deployments einzugehen. Gleichzeitig bleibt die Architektur so gestaltet, dass ein späterer Wechsel auf eine Cloud-Plattform grundsätzlich möglich wäre.

---

## Einordnung der Improve-Phase

Die Analyse hat gezeigt, dass die bestehenden Probleme primär im Bereich **Deployment**, **Automatisierung** und **Betrieb** liegen. Entsprechend adressiert die Improve-Phase genau diese Punkte:

- Reduktion manueller Schritte im Build- und Deployment-Prozess
- Einführung einer cloud-nativen Laufzeitumgebung
- Automatisierte Bereitstellung der Anwendung
- Klare Trennung von Code, Konfiguration und Infrastruktur

Die folgenden Abschnitte beschreiben die schrittweise Umsetzung dieser Verbesserungsmassnahmen.

---

## Überblick über die umgesetzten Verbesserungen

Zur besseren Orientierung ist die Improve-Phase in mehrere logisch aufeinander aufbauende Abschnitte gegliedert. Die nachfolgende Übersicht zeigt die einzelnen Themenbereiche sowie deren Zielsetzung.

| Abschnitt                               | Beschreibung                                                                          | GitHub-Issue |
| --------------------------------------- | ------------------------------------------------------------------------------------- | ------------ |
| [Zielinfrastruktur](#Zielinfrastruktur) | Beschreibung der gewählten Infrastruktur und Architektur (lokale Kubernetes-Umgebung) |              |
| Cloud-Native-Core-Konzept               | Einordnung der Architekturprinzipien und deren Anwendung im Projekt                   |              |
| Containerisierung der Anwendung         | Anpassungen zur Bereitstellung der bestehenden Applikation als Container-Image        |              |
| CI-Pipeline (Build)                     | Automatisierter Build-Prozess inkl. Versionierung und Image-Erstellung                |              |
| CD / GitOps-Ansatz                      | Deployment der Anwendung mittels GitOps-Prinzipien                                    |              |
| Kubernetes-Deployment                   | Deployment der Anwendung in der Kubernetes-Umgebung                                   |              |
| Code- & Konfigurationsanpassungen       | Notwendige Anpassungen am bestehenden Code für den Betrieb in Kubernetes              |              |
| Aufbau der Testumgebung                 | Beschreibung und Aufbau der Entwicklungs- und Laufzeitumgebungen                      |              |

Diese Struktur ermöglicht es, die Verbesserungsmassnahmen nachvollziehbar vom konzeptionellen Ansatz bis zur technischen Umsetzung darzustellen.

---

## Zielinfrastruktur

Basierend auf der Infrastruktur-Evaluation in der Analyze-Phase wurde eine **lokale Kubernetes-Umgebung** als Zielinfrastruktur gewählt. Diese Entscheidung berücksichtigt sowohl technische als auch regulatorische Anforderungen, insbesondere im Hinblick auf Datenschutz und Kontrolle sensibler Lizenzdaten.

Die Zielinfrastruktur bildet die Grundlage für alle weiteren Verbesserungen und orientiert sich an realistischen Produktionsszenarien, ohne dabei Abhängigkeiten von Cloud-Anbietern einzugehen.




## Cloud-Native-Core-Konzept

Die Umsetzung folgt den Prinzipien einer Cloud-Native-Core-Architektur. Diese beschreibt keinen einzelnen Technologie-Stack, sondern eine Sammlung von Architektur- und Betriebsprinzipien, welche einen stabilen und skalierbaren Betrieb ermöglichen.

Zentrale Prinzipien im Projekt sind unter anderem:
- Containerisierung der Anwendung
- Deklarative Infrastrukturdefinition
- Automatisierte Deployments
- Trennung von Anwendung, Konfiguration und Laufzeit



---

## Containerisierung der bestehenden Anwendung

Die bestehende Applikation wird für den Betrieb in Kubernetes als Container-Image bereitgestellt. Dazu sind gezielte Anpassungen erforderlich, ohne die fachliche Logik der Anwendung zu verändern.

Ziel ist es, die Anwendung unabhängig von der Laufzeitumgebung betreiben zu können und eine konsistente Basis für automatisierte Deployments zu schaffen.



---

## CI-Pipeline (Build-Prozess)

Zur Reduktion manueller Schritte wird eine CI-Pipeline eingeführt, welche den Build-Prozess der Anwendung automatisiert. Änderungen am Quellcode führen automatisch zur Erstellung eines neuen, versionierten Artefakts.

Dadurch wird sichergestellt, dass jeder Build reproduzierbar ist und eindeutig einer Code-Version zugeordnet werden kann.



---

## Deployment-Strategie und GitOps-Ansatz

Die Auslieferung der Anwendung erfolgt nach dem GitOps-Prinzip. Dabei dient das Git-Repository als zentrale Quelle der Wahrheit für den gewünschten Systemzustand.

Änderungen an der Deployment-Konfiguration werden versioniert im Repository abgelegt und automatisch in die Kubernetes-Umgebung synchronisiert.



---

## Deployment in Kubernetes

Die Anwendung wird in der Kubernetes-Umgebung deployt und über entsprechende Ressourcen wie Deployments, Services und Konfigurationsobjekte betrieben.

Kubernetes übernimmt dabei zentrale Aufgaben wie:
- Überwachung der Anwendung
- Neustart bei Fehlern
- Skalierung



---

## Code- und Konfigurationsanpassungen

Für den Betrieb in einer cloud-nativen Umgebung sind gezielte Anpassungen am bestehenden Code notwendig. Diese betreffen insbesondere Konfigurationshandling, Logging und Umgebungsvariablen.

Der fachliche Funktionsumfang der Anwendung bleibt dabei unverändert.



---

## Aufbau der Umgebungen

Für den Betrieb und die Weiterentwicklung des Lizenzüberwachungstools werden mehrere logisch getrennte Umgebungen berücksichtigt. Ziel ist es, Änderungen kontrolliert entwickeln, testen und betreiben zu können, ohne den stabilen Betrieb der Anwendung zu gefährden.

Im Rahmen dieser Semesterarbeit liegt der Fokus auf einer lokalen Umgebung, welche sowohl Entwicklungs- als auch Laufzeitcharakter hat und ein späteres produktives Setup realistisch abbildet.

Die Umgebung basiert auf folgenden Grundprinzipien:
- Containerisierte Ausführung der Anwendung mittels Docker  
- Betrieb innerhalb einer lokalen Kubernetes-Umgebung (Minikube)  
- Trennung von Anwendungscode, Konfiguration und Infrastruktur  
- Reproduzierbare Bereitstellung über deklarative Konfigurationen  

Durch diese Struktur kann die Anwendung lokal entwickelt, getestet und betrieben werden, während die Architektur so ausgelegt ist, dass eine spätere Erweiterung auf weitere Umgebungen grundsätzlich möglich bleibt.

Die verwendeten Test-Tenants der ISE AG dienen dabei als Stellvertreter für weitere Tenants und ermöglichen eine realitätsnahe Validierung der implementierten Prozesse.

---
## Technische Stabilisierung und Standardisierung der Kubernetes-Integration

Im Rahmen der Improve-Phase wurde die Applikation systematisch stabilisiert und an die Anforderungen einer containerisierten Kubernetes-Umgebung angepasst. Ausgangspunkt war die Erkenntnis aus den vorherigen Phasen, dass die bestehende Anwendung zwar funktional war, jedoch stark auf eine lokale Ausführungsumgebung ausgelegt war. Insbesondere der Umgang mit Zertifikaten, Konfigurationsdateien und sensitiven Zugangsdaten führte nach dem Deployment in Kubernetes zu wiederkehrenden Fehlern und nicht reproduzierbarem Verhalten.

Ein zentrales Problem bestand darin, dass sicherheitsrelevante Artefakte wie Zertifikate, Tenant-Konfigurationen und Authentifizierungsparameter ursprünglich als lokale Dateien oder Umgebungsvariablen vorlagen. In einer Kubernetes-Umgebung mit mehreren Pods und Replikas ist dieser Ansatz nicht tragfähig, da Pods zustandslos sein müssen und keine impliziten Annahmen über lokale Dateisysteme zulässig sind. Diese Erkenntnis führte zur gezielten Entscheidung, sämtliche dieser Artefakte konsequent in Kubernetes Secrets zu überführen.

Im ersten Verbesserungsschritt wurden alle benötigten Konfigurationsprofile (OIDC-, SharePoint- und Tenant-spezifische Profile) identifiziert, bereinigt und als Secrets abgelegt. Anschliessend wurden diese Secrets als schreibgeschützte Volumes in die Pods gemountet. Dabei zeigte sich, dass bereits kleine Abweichungen in Pfadangaben oder Dateinamen zu Laufzeitfehlern führten, welche erst durch eine detaillierte Log-Analyse sichtbar wurden. Diese Fehler konnten durch eine konsequente Vereinheitlichung der Mount-Pfade und durch eine klare Ordnerstruktur innerhalb des Containers behoben werden.

Ein weiterer wesentlicher Verbesserungspunkt war die Trennung von tenant-spezifischen Zertifikaten und serviceweiten Zertifikaten. Ursprünglich wurden unterschiedliche Zertifikate teilweise gemeinsam abgelegt, was zu Unklarheiten bei der Zuordnung führte. Im Improve-Schritt wurden daher pro Tenant eigene Secrets erstellt, welche jeweils nur die zugehörigen Schlüsseldateien enthielten. Diese wurden gezielt an tenant-spezifische Mount-Pfade gebunden. Parallel dazu wurden die Konfigurationsdateien der Applikation angepasst, sodass sie explizit auf diese Pfade verweisen. Dadurch konnte sichergestellt werden, dass jede Instanz der Applikation jederzeit das korrekte Zertifikat verwendet.

Während der Umsetzung traten mehrere Kubernetes-spezifische Validierungsprobleme auf, unter anderem durch nicht konforme Ressourcennamen oder unzulässige Sonderzeichen. Diese Probleme führten zu einer zusätzlichen Verbesserung: Es wurden verbindliche Namenskonventionen für Secrets, Volumes und Mounts definiert und konsequent angewendet. Dies erhöhte nicht nur die technische Stabilität, sondern verbesserte auch die Wartbarkeit und Lesbarkeit der Deployment-Konfigurationen.

Die Wirksamkeit der getroffenen Massnahmen wurde iterativ überprüft. Dazu gehörten das gezielte Auslesen von Pod-Logs, das Validieren der gemounteten Dateien innerhalb der Container sowie funktionale Tests der relevanten API-Endpunkte. Durch diesen schrittweisen Verbesserungsprozess konnten FileNotFound-Fehler, Authentifizierungsprobleme gegenüber Microsoft Entra ID sowie fehlerhafte Zugriffe auf SharePoint-Listen vollständig eliminiert werden.

Nach Abschluss der Improve-Phase läuft die Applikation stabil in der Minikube-Umgebung und unterstützt den Betrieb mit mehreren Replikas ohne funktionale Einschränkungen. Die Authentifizierung funktioniert zuverlässig, Lizenzdaten können sowohl gelesen als auch zurück in SharePoint geschrieben werden, und alle sicherheitsrelevanten Daten werden Kubernetes-konform verwaltet. Damit wurde nicht nur ein technisches Problem gelöst, sondern auch eine nachhaltige, skalierbare Grundlage für den weiteren Betrieb und mögliche Erweiterungen geschaffen.






























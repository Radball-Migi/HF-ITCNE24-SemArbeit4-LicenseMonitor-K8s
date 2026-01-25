---
layout: default
title: 3.1 Definieren
parent: 3. Hauptteil
nav_order: 4
---
# Definieren (Define) Phase

Die Define-Phase ist der erste Schritt in einem Six Sigma Projekt. In dieser Phase wird das Projekt klar definiert, um sicherzustellen, dass alle Beteiligten ein gemeinsames Verständnis der Ziele und des Umfangs haben. Ein wesentlicher Bestandteil dieser Phase ist die Identifizierung und Beschreibung des zu lösenden Problems oder der zu verbessernden Prozesse.

![Define](../../ressources/images/define.png)

[Quelle](../Quellverzeichnis/index.md#define-phase)

## Zielvorstellung

Am Ende der Semesterarbeit soll das bestehende Lizenzüberwachungstool der ISE AG in einer Cloud-Native-Core-Architektur betrieben werden. Die Anwendung soll containerisiert, automatisiert deploybar und skalierbar sein. Kern der Zielvorstellung ist eine Kubernetes-basierte Laufzeitumgebung, welche den stabilen Betrieb der bestehenden Microservices ermöglicht und gleichzeitig eine flexible Weiterentwicklung unterstützt.

Ein zentraler Bestandteil der Zielarchitektur ist eine durchgängige CI/CD-Pipeline. Diese soll sicherstellen, dass Änderungen am Quellcode automatisiert gebaut, getestet und in der Kubernetes-Umgebung bereitgestellt werden können. Dadurch sollen manuelle Eingriffe reduziert, die Reproduzierbarkeit von Deployments erhöht und die Nachvollziehbarkeit der Release-Prozesse verbessert werden.

Die Lösung soll praxisnah umgesetzt, nachvollziehbar dokumentiert und so gestaltet sein, dass sie als Referenz für zukünftige Cloud-Native- und DevOps-Projekte dienen kann.

---

## Ressourceneinsatz

Für die Umsetzung der Semesterarbeit stehen folgende Ressourcen und Werkzeuge zur Verfügung:

 - **Kubernetes-Umgebung (lokal oder Cloud)**  
    Orchestrierung und Betrieb der containerisierten Microservices.
    
- **Docker / Docker Desktop**  
    Containerisierung der bestehenden Flask-Services und lokale Entwicklung.
    
- **CI/CD-Pipeline (GitHub Actions oder GitLab CI)**  
    Automatisierung von Build-, Test- und Deployment-Prozessen.
    
- **Bestehende Flask-Microservices**  
    Technische Basis aus der vorherigen Semesterarbeit.
    
- **GitHub / GitLab Repository**  
    Versionsverwaltung, Issue-Tracking, Projektdokumentation und Workflow-Steuerung.
    
- **Visual Studio Code**  
    Zentrale Entwicklungsumgebung für Code, Pipeline-Konfigurationen und Infrastrukturdefinitionen.
    
- **Microsoft 365 Test-Tenant (ISE AG)**  
    Bereitstellung von Testdaten zur Lizenzabfrage über die Microsoft Graph API.

---

## Warum wird die Zielvorstellung aktuell nicht erreicht?

Das bestehende Lizenzüberwachungstool wird derzeit in einer statischen Umgebung betrieben. Build- und Deployment-Prozesse sind nur teilweise automatisiert und erfordern manuelle Eingriffe. Eine containerisierte und orchestrierte Laufzeitumgebung fehlt ebenso wie eine standardisierte CI/CD-Pipeline.

Diese Situation führt zu mehreren Einschränkungen:  
Deployments sind fehleranfällig, Skalierung ist nur eingeschränkt möglich und Änderungen am System verursachen einen vergleichsweise hohen operativen Aufwand. Zudem ist die Nachvollziehbarkeit von Releases und Konfigurationsänderungen nicht durchgehend gewährleistet.

Um die angestrebte Zielvorstellung zu erreichen, sind daher folgende technische und organisatorische Massnahmen erforderlich:

- Einführung einer **containerisierten Architektur** für die bestehenden Microservices
- Aufbau einer **Kubernetes-basierten Laufzeitumgebung**
- Implementierung einer **CI/CD-Pipeline** zur automatisierten Bereitstellung
- Strukturierte Verwaltung von **Konfigurationen und Secrets**
- Dokumentation der Architektur und Prozesse zur nachhaltigen Nutzung

Diese Massnahmen sind notwendig, um den Betrieb des Lizenzüberwachungstools langfristig stabil, wartbar und erweiterbar zu gestalten und den Anforderungen moderner Cloud-Native-Systeme gerecht zu werden.


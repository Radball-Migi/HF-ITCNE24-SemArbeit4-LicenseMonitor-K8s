---
layout: default
title: 3.2 Messen
parent: 3. Hauptteil
nav_order: 5
---
# Messen (Measure) Phase

Die Measure-Phase ist der zweite Schritt in einem Six Sigma Projekt. Hier werden aktuelle Prozesse gemessen, um eine Basislinie zu erstellen. Dies umfasst die Sammlung und Analyse von Daten, um die aktuelle Leistung zu verstehen und Verbesserungspotenziale zu identifizieren. Ziel ist es, eine klare Darstellung des aktuellen Zustands zu erhalten.

![Measure](../../ressources/images/measure.png)

[Quelle](../Quellverzeichnis/index.md#measure-phase)

## Aktuelle Situation (Ist-Zustand)

Das bestehende Lizenzüberwachungstool wird aktuell in einer statischen Umgebung betrieben. Die Microservices basieren auf Python und Flask und werden ohne durchgängige Automatisierung bereitgestellt. Änderungen am Quellcode erfordern manuelle Build- und Deployment-Schritte, wodurch der Betrieb stark von individuellen Eingriffen abhängt.

Eine standardisierte CI/CD-Pipeline ist nur teilweise oder nicht vorhanden. Ebenso fehlt eine containerisierte und orchestrierte Laufzeitumgebung, welche Skalierung, Self-Healing und reproduzierbare Deployments ermöglichen würde. Konfigurationen, Secrets und Abhängigkeiten werden nicht einheitlich verwaltet.

---

## Prozessbeschreibung (derzeitiger Ablauf)

1. **Codeänderung am Microservice**  
    Änderungen am Quellcode werden lokal entwickelt und im Git-Repository versioniert.
    
2. **Manueller Build-Prozess**  
    Der Build der Anwendung (z. B. Docker-Image oder Applikationspaket) erfolgt manuell oder teilautomatisiert. Fehler werden erst während oder nach dem Build sichtbar.
    
3. **Manuelles Deployment**  
    Die Bereitstellung der Anwendung erfolgt manuell auf der Zielumgebung. Konfigurationsänderungen müssen separat gepflegt und angewendet werden.
    
4. **Fehlerbehandlung**  
    Tritt ein Fehler auf, erfolgt die Analyse manuell anhand von Logs oder Konsolenausgaben. Rollbacks oder Wiederherstellungen sind nicht standardisiert.
    
5. **Betrieb und Wartung**  
    Skalierung, Neustarts oder Konfigurationsanpassungen erfolgen manuell und sind nicht automatisiert oder überwacht.

---
#### Risiken & Auswirkungen

- Hoher manueller Aufwand bei Build und Deployment
- Erhöhte Fehleranfälligkeit durch manuelle Konfigurationen
- Eingeschränkte Skalierbarkeit der Anwendung
- Fehlende Reproduzierbarkeit von Deployments
- Begrenzte Transparenz über Build- und Release-Zustände

---

## Datenerhebung

Zur Analyse des aktuellen Zustands wurden folgende Aspekte erhoben und dokumentiert:

- **Automatisierungsgrad**  
    Anteil manueller Schritte im Build-, Test- und Deployment-Prozess.
    
- **Fehleranfälligkeit**  
    Häufigkeit von Konfigurations- oder Deployment-Fehlern aufgrund manueller Eingriffe.
    
- **Nachvollziehbarkeit**  
    Verfügbarkeit von Logs, Versionsinformationen und Deployment-Historien.
    
- **Betriebsaufwand**  
    Zeitlicher Aufwand für Build, Deployment und Fehlerbehebung pro Änderung.
    
- **Skalierbarkeit**  
    Möglichkeiten zur horizontalen oder vertikalen Skalierung im aktuellen Setup.
    

Die Ergebnisse dieser Erhebung bilden die Grundlage für die nachfolgende [**Analyze-Phase**](33_analyze.md), in der Ursachen für Ineffizienzen, Risiken und technische Einschränkungen systematisch untersucht werden.







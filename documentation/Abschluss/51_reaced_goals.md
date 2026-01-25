---
layout: default
title: 5.1 Erreichte Ziele
parent: 5. Abschluss
nav_order: 3
---

# Wurden sämtliche Zielsetzungen erfüllt?



![Reached Goals](../../ressources/images/reached-goals.png)

[Quelle](../Quellverzeichnis/index.md#erreichte-ziele) 


Zu Beginn der Semesterarbeit wurden diese Zielsetzungen bewusst **offen und adaptiv** formuliert. Dies ermöglichte es, im Projektverlauf neue Erkenntnisse zu berücksichtigen und technische Entscheidungen gezielt anzupassen, ohne die übergeordneten Projektziele aus den Augen zu verlieren.

|Zielsetzung|Kurzbeschreibung|Erfüllungsgrad|
|---|---|---|
|Evaluation und Festlegung der Infrastruktur|Analyse und Auswahl einer geeigneten Betriebsumgebung unter Berücksichtigung technischer, organisatorischer und sicherheitsrelevanter Aspekte.|✅|
|Aufbau einer CI/CD-Pipeline|Automatisierung von Build-, Test- und Bereitstellungsprozessen mit iterativer Toolwahl.|⚠️✅|
|Cloud-Native-Core-Architektur|Weiterentwicklung des bestehenden Tools in Richtung Containerisierung, Modularität und Skalierbarkeit.|✅|
|Datenschutz, Stabilität und Betriebssicherheit|Sicherstellung eines sicheren, stabilen und reproduzierbaren Betriebs durch geeignete technische Massnahmen.|✅|

Im Folgenden wird erläutert, wie die einzelnen Ziele konkret umgesetzt wurden und welche Anpassungen sich im Verlauf der Arbeit ergeben haben.

---

### Evaluation und Festlegung der Infrastruktur

Zu Projektbeginn wurde eine Evaluation möglicher Betriebsumgebungen durchgeführt. Dabei wurden sowohl lokale als auch cloudbasierte Szenarien betrachtet. Unter Berücksichtigung der verfügbaren Ressourcen, des zeitlichen Rahmens sowie der Lernziele fiel die Entscheidung auf eine **lokale Kubernetes-Umgebung mit Minikube**.

Diese Wahl ermöglichte es, Cloud-Native-Konzepte realitätsnah umzusetzen, ohne von externen Cloud-Anbietern abhängig zu sein. Die Infrastrukturentscheidung blieb – wie ursprünglich vorgesehen – offen für Anpassungen und wurde im Projektverlauf durch die Einführung von GitOps weiter konkretisiert.

✅ **Ziel erreicht**

---

### Aufbau einer CI/CD-Pipeline zur Automatisierung zentraler Prozesse

Ein zentrales Ziel war die Automatisierung der Build-, Test- und Deployment-Prozesse. Hierfür wurde **GitHub Actions** eingesetzt, um Container-Images automatisiert zu bauen und Tests auszuführen.

Im Verlauf des Projekts wurde das klassische CI/CD-Verständnis bewusst erweitert: Das eigentliche Deployment erfolgt deklarativ über **GitOps mit Argo CD**. Dadurch wurde der Fokus stärker auf **Nachvollziehbarkeit, Stabilität und Betriebssicherheit** gelegt als auf eine rein pipelinegesteuerte Auslieferung.

⚠️✅ **Ziel weitgehend erreicht**  
_(Automatisierung vorhanden, Schwerpunkt bewusst auf GitOps gelegt)_

---

### Weiterentwicklung in Richtung einer Cloud-Native-Core-Architektur

Das bestehende Lizenzüberwachungstool wurde konsequent in Richtung einer Cloud-Native-Architektur weiterentwickelt. Dabei wurden zentrale Prinzipien umgesetzt:

- Containerisierung der Anwendung
- Betrieb in Kubernetes
- Stateless-Design der Services
- Trennung von Code, Konfiguration und Secrets
- Skalierbarkeit durch deklarative Deployments

Der offen definierte Umfang dieses Ziels erwies sich als sinnvoll, da der Fokus im Projektverlauf stärker auf **Architekturqualität und Wartbarkeit** gelegt wurde.

✅ **Ziel erreicht**

---

### Sicherstellung von Datenschutz, Stabilität und Betriebssicherheit

Datenschutz und Betriebssicherheit wurden während der gesamten Arbeit kontinuierlich berücksichtigt. Umgesetzt wurden unter anderem:

- Speicherung sensibler Daten ausschliesslich in Kubernetes Secrets
- Verzicht auf Secrets im Git-Repository -> Sealed Secrets verwendet
- Reproduzierbarer Redeploy ohne manuelle Eingriffe
- Nutzung von Kubernetes-Mechanismen zur Fehlerbehandlung
- Logging zur Analyse von Fehlerfällen

Welche konkreten Lösungen eingesetzt wurden, wurde – wie geplant – iterativ evaluiert und dokumentiert.

✅ **Ziel erreicht**

---

## Gesamtbewertung der Zielerreichung

Die initial definierten Zielsetzungen wurden **in wesentlichen Punkten erreicht**.  
Abweichungen von der ursprünglichen Planung stellten keine Zielverfehlung dar, sondern führten zu **fundierteren architektonischen Entscheidungen** und einer nachhaltigeren Lösung.

Die daraus gewonnenen Erkenntnisse werden im folgenden Kapitel detailliert beschrieben.
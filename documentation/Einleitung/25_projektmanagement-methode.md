---
layout: default
title: 2.5 Projektmanagement-Methode
parent: 2. Einleitung
nav_order: 7
---

# Projektmanagement-Methode

## Kanban
Das **Kanban-System** ist eine agile Arbeitsmethode aus dem Projektmanagement, welche dabei hilft, die Zusammenarbeit von Teams zu verbessern. Durch die Visualisierung von Arbeitsprozessen können diese verwaltet und verbessert, sowie deren Effizienz und Qualität gesteigert werden. Die Arbeitsschritte werden dabei (digital) einzeln auf Tafeln dargestellt und in Verantwortlichkeiten unterteilt, sodass selbst komplexe Projekte für alle Beteiligten übersichtlich und leicht verständlich gemacht werden.

Das Kanban-System ermöglicht es durch seine Struktur zudem, konsistente Arbeitsabläufe zu gewährleisten, auf die sich Mitarbeiter und weitere am Projekt Beteiligte besser einstellen und so etwa besser Ressourcen einplanen können. Da das System kontinuierlich mit dem aktuellen Entwicklungsstand abgeglichen wird, ist auch eine ständige Verbesserung möglich, da Schwachstellen so leicht bemerkbar werden.
Kanban kann auch sehr gut für kleine Projekte, an welchen nur eine Person arbeitet, verwendet werden.

![Kanban](../../ressources/images/kanban.png)
[Quelle](../Quellverzeichnis/index.md#kanban)
## Scrum
**Scrum** ist ein Framework für eine bestimmte Art des Projektmanagements. Es zeichnet sich durch schlanke Prozesse, schrittweise Entwicklung und regelmäßige Feedbackschleifen aus. Ursprünglich wurde es vor allem in der Softwareentwicklung eingesetzt, mittlerweile findet es aber in vielen weiteren Branchen Anwendung.

Scrum verfolgt einen inkrementellen und iterativen Ansatz. In aufeinanderfolgenden, eigenständigen Phasen, den sogenannten Sprints, werden verschiedene Versionen eines Produkts entwickelt. Diese Sprints werden kontinuierlich wiederholt, bis ein zufriedenstellendes und vollständiges Produkt erreicht ist.

![Scrum](../../ressources/images/scrum.png)
[Quelle](../Quellverzeichnis/index.md#scrum)
## Kanban und Scrum in dieser Semesterarbeit

In meiner Semesterarbeit werde ich mit Kanban und Scrum arbeiten. 
Weshalb gleich mit beiden Methoden?
Kanban ist in GitHub bereits integriert, in welchen man Boards und Tasks selbst erstellen kann. Zusätzlich kann ich verschiedene Ansichten erstellen, wie beispielsweise eine Gant-Projektübersicht, etc. 
Zusätzlich verwende ich die Sprints, welche in Scrum integriert sind. Da ich jedoch alleine bin, habe ich bei mir nur 3 Sprintgespräche eingeplant. Dies, weil die Daily Sprints wegfallen, da ich die Semesterarbeit als Einzelarbeit mache, somit bin ich Zeitgleich auch der Scrum-Master. 
Um den Scrum-Prozess etwas aktiver zu gestalten, arbeite ich zudem mit **Userstorys**, welche ich im Projekt dokumentiere und priorisiere. Die Userstorys sind in den jeweiligen Issues im <a href="https://github.com/users/Radball-Migi/projects/9/views/3" target="_blank">License Tool Release</a> enthalten.

Dies ist der Link zu meiner Roadmap:
<a href="https://github.com/users/Radball-Migi/projects/9/views/8" target="_blank">Roadmap · HF ITCNE24 - 4. Semesterarbeit K8s</a>


![Scrum and Kanban](../../ressources/images/kanban_and_scrum.png)
[Quelle](../Quellverzeichnis/index.md#kanban-und-scrum)

## Six Sigma

Six Sigma ist eine Methode zur Prozessverbesserung, die Unternehmen dabei unterstützt, ihre Geschäftsprozesse zu optimieren. Ziel ist es, einheitliche Abläufe einzuführen, um Abweichungen im Endprodukt zu minimieren und somit die Anzahl der Produktfehler zu reduzieren.

Im Kern basiert Six Sigma auf der Annahme der DMAIC-Methode:

**Define (Definieren)**
In dieser Phase wird das Problem klar definiert. Es werden die Ziele des Projekts festgelegt, der Umfang bestimmt und die Kundenanforderungen identifiziert.

**Measure (Messen)**
Hier werden die aktuellen Prozesse gemessen, um eine Basislinie zu erstellen. Es werden Daten gesammelt, um den Ist-Zustand zu verstehen und die Leistung zu bewerten.
   
**Analyze (Analysieren)**
In dieser Phase werden die gesammelten Daten analysiert, um die Ursachen von Problemen und Variationen zu identifizieren. Es wird untersucht, welche Faktoren die Prozessleistung beeinflussen.

**Improve (Verbessern)**
Basierend auf den Analyseergebnissen werden Lösungen entwickelt und implementiert, um die identifizierten Probleme zu beheben. Ziel ist es, die Prozessleistung zu verbessern und die Variationen zu reduzieren.

**Control (Kontrollieren)**
In der letzten Phase werden die Verbesserungen überwacht und kontrolliert, um sicherzustellen, dass die erzielten Verbesserungen nachhaltig sind. Es werden Kontrollmechanismen eingeführt, um die Prozessleistung langfristig zu sichern.

Laut Six Sigma benötigen alle Prozesse Inputs und Outputs. 
**Inputs** sind die Aktionen, die dein Team durchführt, während **Outputs** die Ergebnisse dieser Aktionen darstellen. 
Grundsätzlich gilt: Je mehr Inputs (oder Aktionen) kontrolliert werden können, desto besser lassen sich auch die Outputs steuern.

![Six Sigma](../../ressources/images/six-sigma.png)

[Quelle](../Quellverzeichnis/index.md#six-sigma)

## DevOps

**DevOps** ist ein moderner Ansatz, der Entwicklung (Development) und IT-Betrieb (Operations) miteinander verbindet. Ziel ist es, Software schneller, zuverlässiger und mit einem hohen Automatisierungsgrad bereitzustellen. DevOps kombiniert dabei technische Praktiken wie Continuous Integration und Continuous Deployment (CI/CD) mit einer kollaborativen Arbeitskultur.

Ein wesentlicher Bestandteil von DevOps ist die Automatisierung von Build-, Test- und Deployment-Prozessen. Dazu nutze ich in dieser Semesterarbeit **GitHub Actions**, um Pipelines einzurichten, welche den Code testen, verarbeiten und anschliessend Artefakte automatisiert generieren. Diese Artefakte werden anschliessend in Azure DevOps abgelegt und können für weitere Deployments verwendet werden.

Der DevOps-Ansatz unterstützt dadurch:

- **Kürzere Entwicklungszyklen** durch automatisierte Abläufe
- **Höhere Qualität**, da Fehler früh im Prozess entdeckt werden
- **Transparente Prozesse** durch klar definierte Pipelines
- **Reproduzierbare Deployments**, unabhängig von lokalen Umgebungen

DevOps ergänzt somit die bereits eingesetzten Methoden Scrumban und Six Sigma ideal:  
Kanban sorgt für Struktur im Arbeitsfluss, Scrum für iterative Planung, Six Sigma für Prozessqualität – und DevOps stellt sicher, dass die technische Umsetzung automatisiert, konsistent und effizient erfolgt.

![Devops](../../ressources/images/devops.png)
[Quelle](../Quellverzeichnis/index.md#devops)

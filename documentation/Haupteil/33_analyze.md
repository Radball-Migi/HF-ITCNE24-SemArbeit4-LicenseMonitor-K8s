---
layout: default
title: 3.3 Analysieren
parent: 3. Hauptteil
nav_order: 6
---
# Analysieren (Analyze) Phase

Die Analyze-Phase ist der dritte Schritt in einem Six Sigma Projekt. Hier werden die in der [Measure-Phase](./32_measure.md) gesammelten Daten analysiert, um die Ursachen von Problemen zu identifizieren. Ziel ist es, die Hauptursachen für Prozessabweichungen zu bestimmen und Hypothesen für Verbesserungen zu entwickeln. Dies umfasst die Nutzung statistischer Methoden und Werkzeuge, um Muster und Zusammenhänge in den Daten zu erkennen.


![Analyze](../../ressources/images/analyze.png)

[Quelle](../Quellverzeichnis/index.md#analyze-phase)

## Zusammenfassung der Datenerhebung

Die Measure-Phase hat gezeigt, dass das bestehende Lizenzüberwachungstool in einer statischen und nur teilweise automatisierten Umgebung betrieben wird. Zentrale Abläufe wie Build, Deployment, Konfigurationsmanagement und Skalierung erfolgen manuell oder mit erheblichem individuellem Aufwand. Eine standardisierte CI/CD-Pipeline sowie eine orchestrierte Laufzeitumgebung fehlen vollständig.

Diese Ausgangslage führt nicht nur zu technischem Mehraufwand, sondern wirkt sich direkt auf Wartbarkeit, Betriebssicherheit und Nachvollziehbarkeit aus. Die folgenden Abschnitte analysieren diese Schwachstellen im Detail.

---

### **Geringer Automatisierungsgrad**

Der aktuelle Build- und Deployment-Prozess ist stark manuell geprägt. Jede Codeänderung erfordert mehrere individuelle Schritte, die nicht standardisiert und kaum reproduzierbar sind.

**Ursachen:**
- Fehlende CI/CD-Pipeline
- Keine standardisierte Artefakterstellung
- Keine automatisierten Tests oder Validierungen
- Manuelle Pflege von Konfigurationen

**Auswirkungen:**
- Erhöhte Fehleranfälligkeit
- Hoher Zeitaufwand pro Änderung
- Geringe Reproduzierbarkeit von Deployments

Kurz gesagt: **Jedes Deployment ist ein Unikat – kein stabiler Prozess.**

---

### **Fehlende Cloud-Native-Laufzeitumgebung**

Die Anwendung wird nicht containerisiert und nicht durch eine Orchestrierungsplattform betrieben. Funktionen wie Self-Healing, horizontale Skalierung oder deklarative Infrastrukturdefinitionen stehen daher nicht zur Verfügung.

**Ursachen:**
- Historisch gewachsene, statische Umgebung
- Kein Einsatz von Kubernetes oder vergleichbaren Plattformen
- Fehlende Trennung zwischen Applikation, Konfiguration und Infrastruktur

**Auswirkungen:**
- Eingeschränkte Skalierbarkeit
- Erhöhter manueller Betriebsaufwand
- Abhängigkeit von direkten Eingriffen bei Störungen

Das System funktioniert – **aber nur solange nichts schiefgeht**.

---

### **Eingeschränkte Transparenz und Nachvollziehbarkeit**

Build- und Release-Stände sind nicht zentral dokumentiert. Logs, Konfigurationsstände und Deployment-Historien sind verteilt oder nur lokal verfügbar.

**Ursachen:**
- Kein zentrales Pipeline-Logging
- Fehlende Versionierungs- und Release-Strategie
- Unzureichende Dokumentation

**Auswirkungen:**
- Erschwerte Fehlersuche
- Keine klare Zuordnung von Versionen zu Umgebungen
- Hohe Abhängigkeit von individuellem Wissen

Oder anders gesagt: **Wissen steckt in Köpfen – nicht im System.**

---

### **Regulatorische und sicherheitsrelevante Rahmenbedingungen**

Das Lizenzüberwachungstool verarbeitet sensible Lizenz- und Konfigurationsdaten. Dadurch ergeben sich erhöhte Anforderungen an Datenschutz, Sicherheit und Kontrolle, insbesondere im Kontext des Schweizer Datenschutzgesetzes (DSG).

Diese Anforderungen beeinflussen die Wahl der Zielinfrastruktur massgeblich und können nicht losgelöst von der technischen Architektur betrachtet werden.

---

## Infrastruktur-Evaluation – AWS vs. Azure vs. Lokal

Auf Basis der identifizierten Schwachstellen wurde eine strukturierte Evaluation möglicher Deployment-Varianten durchgeführt. Ziel war es, eine Infrastruktur zu identifizieren, die **technisch sinnvoll**, **betrieblich kontrollierbar** und **datenschutzrechtlich konform** ist.

Evaluierte Optionen:
- Microsoft Azure Cloud
- Amazon Web Services (AWS)
- Lokales Deployment (On-Prem / lokales Kubernetes)

Im Fokus standen Datenschutz (DSG), Sicherheitsmodell, operative Kontrolle und organisatorische Abhängigkeiten.

---

### Vergleich der Deployment-Optionen

| **Kriterium**                  | **Azure Cloud**                                                  | **AWS Cloud**                                                             | **Lokal (On-Prem / Local K8s)**                                               |
| ------------------------------ | ---------------------------------------------------------------- | ------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| **Kosten**                     | + Keine Hardware nötig  <br>– Laufende Kosten & Preisvolatilität | + Gute Skaleneffizienz  <br>– Zusätzliche Kosten für Traffic/Storage      | + Keine Cloud-Abos  <br>– Hardware & Wartung eigenen Aufwand                  |
| **Security**                   | + Starke MS-Sicherheitsarchitektur  <br>– Shared Responsibility  | + Sehr starke Sicherheitsservices  <br>– Komplex & geteilte Verantwortung | ⭐ **Volle Kontrolle über Security**  <br>⭐ **Keine externen Angriffsflächen** |
| **DSG/DSGVO (Schweiz)**        | – Potenzielle Auslandsbekanntgabe  <br>– Cloud Act Risiko        | – US-Anbieter → stärkstes Cloud Act Risiko                                | ⭐ **Beste DSG-Konformität**  <br>⭐ **Keine Auslandsübermittlung**             |
| **Scalability**                | + Sehr skalierbar                                                | + Extrem skalierbar                                                       | – Hardwaregebunden                                                            |
| **Resources*                   | + Flexible Compute & Storage                                     | + Breite Auswahl an Resourcen                                             | – Lokale Kapazitäten                                                          |
| **Integration mit MS Graph**   | ⭐ **Beste Integration (Managed Identity)**                       | – Weniger optimal                                                         | – Zertifikats-/Thumbprint-Verwaltung nötig                                    |
| **Operational Overhead**       | – Begrenzte Kontrolle  <br>+ Automatisiert                       | – Komplexe Konfiguration                                                  | ⭐ **Maximale Kontrolle**  <br>– Mehr Aufwand, aber sicherer                   |
| **Availability**               | + Hoch                                                           | + Hoch                                                                    | – Abhängig vom eigenen Setup                                                  |
| **Vendor Lock-in**             | – Hoch                                                           | – Hoch                                                                    | ⭐ **Kein Lock-in**                                                            |
| **Disaster Recovery**          | + Einfach, automatisch                                           | + Sehr robust                                                             | – Muss selbst aufgebaut werden                                                |
| **Compliance für Lizenzdaten** | + Gut                                                            | + Möglich, aber nicht MS-nativ                                            | ⭐ **Am sichersten, da Daten intern bleiben**                                  |

Bereits dieser Vergleich zeigt, dass Cloud-Lösungen zwar technisch attraktiv sind, im Kontext sensibler Lizenzdaten jedoch deutliche Nachteile aufweisen.

---

### Datenschutzrechtliche Bewertung (DSG Schweiz)

Für das Projekt sind insbesondere folgende Punkte relevant:

- **Art. 6 – Privacy by Design / Default**  
    → Lokales Deployment erfüllt dies technisch am stärksten.
    
- **Art. 8 – Sicherheitsanforderungen**  
    → Beweislast bei Cloud-Deployments deutlich höher.
    
- **Art. 16–18 – Datenexport ins Ausland**  
    → Cloud = potenzieller Auslandstransfer → Risiko.  
    → Lokal = kein Transfer → kein Risiko.
    
- **Cloud Act (USA)**  
    → Betrifft AWS und Azure gleichermaßen (Microsoft ebenfalls US-Unternehmen).  
    → Lokales Deployment **nicht betroffen**.


**Zwischenfazit:**  
Ein lokales Deployment ist datenschutzrechtlich mit Abstand am risikoärmsten.

---

### Gewichtete Entscheidungsmatrix

Da Datenschutz und Sicherheit im Projekt bewusst höher gewichtet wurden, ergibt sich folgende Bewertung:

| **Kriterium**        | **Gewicht** | **Azure**   | **AWS**     | **Lokal**   |
| -------------------- | ----------- | ----------- | ----------- | ----------- |
| Datenschutz / DSG    | **35%**     | Mittel (6)  | Niedrig (4) | ⭐ Hoch (9)  |
| Security             | **25%**     | Mittel (7)  | Mittel (7)  | ⭐ Hoch (9)  |
| Kosten               | 10%         | Mittel (6)  | Niedrig (5) | Mittel (6)  |
| Scalability          | 10%         | Hoch (9)    | Hoch (10)   | Niedrig (4) |
| Operational Control  | 10%         | Niedrig (5) | Niedrig (5) | ⭐ Hoch (9)  |
| Integration MS Graph | 10%         | Hoch (9)    | Mittel (7)  | Niedrig (4) |

**Gesamtpunktzahl (0–10):**

- Azure: **6.75**
- AWS: **5.85**
- ⭐ **Lokal: 7.70**

---

#### **Fazit der Analyse**

Die Analyse zeigt klar, dass die bestehenden Probleme des Lizenzüberwachungstools nicht auf einzelne technische Mängel zurückzuführen sind, sondern auf strukturelle Defizite: fehlende Automatisierung, eine nicht cloud-native Architektur und mangelnde Transparenz im Betrieb.

Unter Berücksichtigung der sensiblen Lizenzdaten, der Anforderungen des Schweizer DSG sowie der notwendigen Sicherheits- und Kontrollmechanismen stellt ein **lokales Kubernetes-basiertes Deployment** die risikoärmste, kontrollierbarste und langfristig stabilste Lösung dar.

Diese Erkenntnisse bilden die Grundlage für die nachfolgende Improve-Phase.

---

## Wie könnte dies gelöst werden?

Aus der Analyse lassen sich folgende Lösungsansätze ableiten:
- Containerisierung der bestehenden Microservices
- Aufbau einer lokalen Kubernetes-Umgebung als Cloud-Native-Core-Plattform
- Implementierung einer CI/CD-Pipeline zur vollständigen Automatisierung von Build, Test und Deployment
- Zentrale Verwaltung von Konfigurationen und Secrets
- Standardisierte Dokumentation und Versionierung aller Deployments

Diese Ansätze werden in der **Improve-Phase** konkretisiert, umgesetzt und technisch validiert.
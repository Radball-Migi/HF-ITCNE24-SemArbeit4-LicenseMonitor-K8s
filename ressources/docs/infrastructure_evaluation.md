# **Deployment Evaluation – AWS vs. Azure vs. Lokal**

**Stand: 14.11.2025 — mit Fokus auf Schweizer DSG und Lizenzdaten**

---

## **1. Einleitung**

Diese Evaluation vergleicht drei mögliche Deployment-Varianten für das Projekt:

- **Microsoft Azure Cloud**
- **Amazon Web Services (AWS)**
- **Lokales Deployment (On-Prem / lokales Kubernetes)**

Da im Projekt **Lizenzdaten**, **kundenbezogene Informationen** und **systemrelevante Konfigurationsdaten** verarbeitet werden, steht der **Datenschutz (DSG – Schweiz)** sowie die **Sicherheit** im Zentrum der Analyse.

Ziel dieser Evaluation ist eine objektive, aber realitätsnahe Entscheidung, welche Deployment-Option die höchsten Anforderungen erfüllt — insbesondere in Bezug auf Schweizer Datenschutzrecht und sichere Verarbeitung sensibler Lizenzdaten.

---

## **2. Vergleichstabelle – AWS vs. Azure vs. Lokal**

| **Kriterium**                  | **Azure Cloud**                                                  | **AWS Cloud**                                                             | **Lokal (On-Prem / Local K8s)**                                               |
| ------------------------------ | ---------------------------------------------------------------- | ------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| **Cost**                       | + Keine Hardware nötig  <br>– Laufende Kosten & Preisvolatilität | + Gute Skaleneffizienz  <br>– Zusätzliche Kosten für Traffic/Storage      | + Keine Cloud-Abos  <br>– Hardware & Wartung eigenen Aufwand                  |
| **Security**                   | + Starke MS-Sicherheitsarchitektur  <br>– Shared Responsibility  | + Sehr starke Sicherheitsservices  <br>– Komplex & geteilte Verantwortung | ⭐ **Volle Kontrolle über Security**  <br>⭐ **Keine externen Angriffsflächen** |
| **DSG/DSGVO (Schweiz)**        | – Potenzielle Auslandsbekanntgabe  <br>– Cloud Act Risiko        | – US-Anbieter → stärkstes Cloud Act Risiko                                | ⭐ **Beste DSG-Konformität**  <br>⭐ **Keine Auslandsübermittlung**             |
| **Scalability**                | + Sehr skalierbar                                                | + Extrem skalierbar                                                       | – Hardwaregebunden                                                            |
| **Resources**                  | + Flexible Compute & Storage                                     | + Breite Auswahl an Resourcen                                             | – Lokale Kapazitäten                                                          |
| **Integration mit MS Graph**   | ⭐ **Beste Integration (Managed Identity)**                       | – Weniger optimal                                                         | – Zertifikats-/Thumbprint-Verwaltung nötig                                    |
| **Operational Overhead**       | – Begrenzte Kontrolle  <br>+ Automatisiert                       | – Komplexe Konfiguration                                                  | ⭐ **Maximale Kontrolle**  <br>– Mehr Aufwand, aber sicherer                   |
| **Availability**               | + Hoch                                                           | + Hoch                                                                    | – Abhängig vom eigenen Setup                                                  |
| **Vendor Lock-in**             | – Hoch                                                           | – Hoch                                                                    | ⭐ **Kein Lock-in**                                                            |
| **Disaster Recovery**          | + Einfach, automatisch                                           | + Sehr robust                                                             | – Muss selbst aufgebaut werden                                                |
| **Compliance für Lizenzdaten** | + Gut                                                            | + Möglich, aber nicht MS-nativ                                            | ⭐ **Am sichersten, da Daten intern bleiben**                                  |

---

## **3. Schweizer Datenschutzgesetz (DSG, Stand 2025)**

### **Relevante DSG-Punkte für das Projekt**

- **Art. 6 – Privacy by Design / Default**  
    → Lokales Deployment erfüllt dies technisch am stärksten.
    
- **Art. 8 – Sicherheitsanforderungen**  
    → Beweislast bei Cloud-Deployments deutlich höher.
    
- **Art. 16–18 – Datenexport ins Ausland**  
    → Cloud = potenzieller Auslandstransfer → Risiko.  
    → Lokal = kein Transfer → kein Risiko.
    
- **Cloud Act (USA)**  
    → Betrifft AWS und Azure gleichermaßen (Microsoft ebenfalls US-Unternehmen).  
    → Lokales Deployment **nicht betroffen**.
    

### **DSG-Fazit**

**Lokal ist datenschutzrechtlich mit Abstand am risikoärmsten.**  
Keine Auslandsdatenströme, keine zusätzlichen Garantien, kein Cloud Act Risiko, keine vertraglichen Zusatzprüfungen.

---

## **4. Gewichtete Entscheidungsmatrix**

Gewichtung orientiert sich an den Projektanforderungen:  
Security & Datenschutz stehen im Vordergrund.

| **Kriterium**        | **Gewicht** | **Azure** | **AWS** | **Lokal** |
| -------------------- | ----------- | --------- | ------- | --------- |
| Datenschutz / DSG    | **35%**     | Mittel    | Niedrig | ⭐ Hoch    |
| Security             | **25%**     | Mittel    | Mittel  | ⭐ Hoch    |
| Cost                 | 10%         | Mittel    | Niedrig | Mittel    |
| Scalability          | 10%         | Hoch      | Hoch    | Niedrig   |
| Operational Control  | 10%         | Niedrig   | Niedrig | ⭐ Hoch    |
| Integration MS Graph | 10%         | Hoch      | Mittel  | Niedrig   |

### **Punkte (0–10):**

- **Azure:** 5.8
- **AWS:** 5.1
- ⭐ **Lokal:** 8.1

---

## **5. Schlussfazit**

**Das lokale Deployment ist die geeignetste Lösung für dieses Projekt.**

Grund dafür:

### **Datenschutz:**

- Keine Auslandsbekanntgabe
- Keine Cloud Act Risiken
- Volle Übereinstimmung mit Schweizer DSG
- Volle physische & logische Kontrolle über Lizenzdaten

### **Sicherheit:**

- Kein Shared Responsibility Modell
- Minimale Angriffsfläche
- Interne Netztrennung möglich

### **Organisatorische Gründe:**

- Keine Vendor-Lock-ins
- Längere Lebensdauer der Lösung
- Keine Abhängigkeit von Cloud-Verfügbarkeiten

### **Gesamtbegründung:**

> **Unter Berücksichtigung der sensiblen Lizenzdaten, der Schweizer DSG-Anforderungen sowie der notwendigen Sicherheits- und Kontrollmechanismen ist ein lokales Deployment die risikoärmste, konformste und langfristig stabilste Lösung für das Projekt.**
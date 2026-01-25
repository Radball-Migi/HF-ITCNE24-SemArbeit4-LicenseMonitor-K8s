---
layout: default
title: 3.5 Kontrollieren
parent: 3. Hauptteil
nav_order: 8
---

#  Kontrollieren (Control) Phase

Die Control-Phase ist der letzte Schritt im DMAIC-Zyklus eines Lean-/Six-Sigma-Projekts. Ziel dieser Phase ist es, sicherzustellen, dass die in der Improve-Phase umgesetzten Massnahmen langfristig stabil funktionieren und Rückfälle vermieden werden. In diesem Projekt steht besonders im Fokus, dass der Microservice korrekt arbeitet, kontinuierlich überwacht wird und automatisiert auf kritische Zustände reagiert.

![control](../../ressources/images/control.png)

[Quelle](../Quellverzeichnis/index.md#control-phase) 

## Ziele der Control-Phase

Die Control-Phase verfolgt folgende Ziele:

- Sicherstellung eines **stabilen Kubernetes-Deployments**
- Nachvollziehbare und versionierte **GitOps-Deployments mit Argo CD**
- Vermeidung manueller Eingriffe durch **automatisierte Rollouts**
- Kontrolle des **Secret- und Zertifikats-Handlings**
- Qualitätssicherung durch **automatisierte Tests**
- Transparenz durch **Logs, Status- und Health-Checks**
- Reproduzierbarkeit des Systems nach vollständigem Redeploy

---

## Kontrollmechanismen im Überblick

| Mechanismus              | Beschreibung                                           |
| ------------------------ | ------------------------------------------------------ |
| GitOps (Argo CD)         | Deklarative Steuerung aller Deployments über Git       |
| Kubernetes Health Checks | Überwachung von Pod-Status, Readiness & Liveness       |
| Pytest                   | Automatisierte Tests für Kernlogik der Anwendung       |
| Logging                  | Zentrale Logausgabe der Container über `kubectl logs`  |
| Secret-Management        | Zertifikate & Auth-Profile als Kubernetes Secrets      |
| Redeploy-Tests           | Vollständiger Neuaufbau des Namespaces                 |
| Zugriffskontrolle        | Microsoft-Authentifizierung via gemountete Zertifikate |

---

## GitOps-Kontrolle mit Argo CD

Die zentrale Kontrollinstanz des Deployments ist **Argo CD**.  
Alle Kubernetes-Ressourcen (Deployments, Services, Secrets, ConfigMaps) werden **ausschliesslich deklarativ über Git verwaltet**.

### Kontrollaspekte

- Abgleich von **Soll-Zustand (Git)** und **Ist-Zustand (Cluster)**
- Automatische Synchronisation bei Änderungen
- Sichtbare Abweichungen („OutOfSync“) im Argo-Dashboard
- Rollbacks jederzeit möglich durch Git-Historie

📸 **Screenshot einfügen:**

- Argo CD Application Overview
    
- Status: `Healthy` / `Synced`
    

---

## Kubernetes-Betriebskontrolle

Zur Überprüfung des stabilen Betriebs wurden folgende Kubernetes-Kontrollen eingesetzt:

### Pod- und Deployment-Status

`kubectl get pods -n licensetool kubectl get deploy -n licensetool`

Erwartetes Verhalten:

- Pods befinden sich im Status `Running`
- Deployments zeigen `READY = desired replicas`
- Keine Pods im Zustand `CrashLoopBackOff` oder `Error`

📸 **Screenshot einfügen:**  
`kubectl get pods -o wide`

---

### Health-Checks & Neustarts

Durch die containerisierte Architektur kann Kubernetes fehlerhafte Pods automatisch neu starten.  
Fehlerfälle (z. B. fehlende Zertifikate) wurden gezielt provoziert und überprüft.

📸 **Screenshot einfügen:**

- Pod-Restart nach fehlerhaftem Secret
    
- Erfolgreicher Neustart nach Korrektur
    

---

## Secret- und Zertifikats-Kontrolle

Ein zentraler Bestandteil der Control-Phase ist die **Absicherung sensibler Daten**.

### Kontrollmechanismen

- Zertifikate und Auth-Profile liegen ausschliesslich als Kubernetes Secrets vor
    
- Keine sensiblen Daten im Git-Repository
    
- Mount-Pfade werden im Deployment definiert
    
- Anwendung startet nur bei korrekt gemounteten Secrets
    

`kubectl get secrets -n licensetool kubectl describe secret <secret-name>`

📸 **Screenshot einfügen:**

- `kubectl get secrets`
- Deployment-Manifest mit `volumeMounts`

---

## Testautomatisierung mit Pytest

Zur Sicherstellung der Anwendungslogik wird weiterhin **pytest** eingesetzt.  
Die Tests prüfen die Kernfunktionen der Lizenzverarbeitung unabhängig von der Kubernetes-Infrastruktur.

### Getestete Bereiche

- Abruf von Lizenzdaten
- Verarbeitung und Aggregation
- Fehlerbehandlung bei ungültiger Konfiguration
- Simulation von API-Fehlern
- Validierung der Rückgabewerte

Beispiel:

`def test_get_license_status(client):     response = client.get("/api/v1/licenses/status/show")     assert response.status_code == 200`

Mocking stellt sicher, dass keine externen Abhängigkeiten (Microsoft Graph, SharePoint) notwendig sind.

📸 **Screenshot einfügen:**

- Pytest-Ergebnis (`pytest --cov`)

---

## Logging & Fehlerkontrolle

Die Anwendung schreibt Logs direkt auf `stdout`, wodurch diese über Kubernetes ausgelesen werden können:

`kubectl logs -l app=licensetool -n licensetool`

### Kontrollierte Fehlerfälle

- Fehlende Tenant-Konfiguration
- Ungültige JSON-Profile
- Fehlerhafte Authentifizierungsdaten
- API-Fehler externer Services

Erwartetes Verhalten:

- Fehler werden sauber geloggt
- Anwendung stürzt nicht ab
- HTTP-Antwort bleibt kontrolliert (`200` oder definierter Fehlercode)

📸 **Screenshot einfügen:**

- Log-Auszug mit ERROR- und INFO-Einträgen

---

## Redeploy- und Stabilitätstest

Als finaler Kontrollschritt wurde das System vollständig neu aufgebaut:

`kubectl delete namespace licensetool kubectl apply -k .`

### Erfolgsbewertung

- Namespace wird neu erstellt
- Secrets werden korrekt geladen
- Pods starten ohne manuelle Eingriffe
- Argo CD synchronisiert automatisch
- Anwendung ist erreichbar und funktionsfähig

✅ **Ergebnis:**  
Das System ist vollständig **reproduzierbar und stabil betreibbar**.

---

## Zusammenfassung der Control-Massnahmen

| Massnahme                             | Umgesetzt |
| ------------------------------------- | --------- |
| GitOps mit Argo CD                    | Ja        |
| Automatisierte Kubernetes-Deployments | Ja        |
| Secret-Management über K8s            | Ja        |
| Reproduzierbarer Redeploy             | Ja        |
| Logging & Fehlerkontrolle             | Ja        |
| Automatisierte Tests                  | Ja        |
| Kein manuelles Nachkonfigurieren      | Ja        |

---

## Fazit

Die Control-Phase bestätigt, dass die im Projekt umgesetzten Massnahmen **nicht nur technisch korrekt**, sondern auch **nachhaltig und betriebssicher** sind.  
Durch die Kombination aus **GitOps**, **Kubernetes-Mechanismen**, **automatisierten Tests** und **klaren Kontrollpunkten** ist das System langfristig wartbar und robust gegenüber Änderungen.

Damit ist sichergestellt, dass zukünftige Erweiterungen oder Anpassungen durchgeführt werden können, **ohne die Stabilität oder Sicherheit des Systems zu gefährden**.
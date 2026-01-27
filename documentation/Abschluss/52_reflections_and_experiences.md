---
layout: default
title: 5.2 Erkenntnisse
parent: 5. Abschluss
nav_order: 4
---

# Erkenntnisse

Dieses Kapitel widmet sich der Reflexion meiner Semesterarbeit. Dabei gehe ich auf meine persönlichen Erfahrungen, mein Verhalten und den Umgang mit Herausforderungen ein.

![Erkenntnisse](../../ressources/images/experience.png)

[Quelle](../Quellverzeichnis/index.md#erkenntnisse) 

## Herausforderungen und Probleme

Die Umsetzung der **vierten Semesterarbeit** verlief insgesamt erfolgreich, war jedoch mit mehreren Herausforderungen verbunden, die sowohl technischer als auch organisatorischer Natur waren und den Projektverlauf beeinflussten.

### Probleme beim Mergen und erhöhter Zeitdruck vor der Abgabe

Nach dem dritten Sprint traten Schwierigkeiten bei der Zusammenführung mehrerer Entwicklungsstände im Git-Repository auf. Unklare Merge-Situationen führten dazu, dass kurz vor der Abgabe zusätzlicher Zeitdruck entstand. In dieser Phase mussten bestehende Änderungen konsolidiert, Fehler behoben und der Projektstand stabilisiert werden.

Erschwerend wirkten sich parallel bestehende familiäre Belastungen aus, welche die verfügbare Zeit und Konzentration reduzierten. Diese Situation verdeutlichte die Bedeutung einer **sauberen Branch-Strategie**, regelmässiger Integration sowie einer frühzeitigen Stabilisierung des Hauptbranches – insbesondere in zeitkritischen Projektphasen.

Rückblickend zeigte sich, dass eine frühere Konsolidierung der Entwicklungsstände
sowie kleinere, häufiger integrierte Änderungen den entstandenen Zeitdruck
hätten reduzieren können.


---

### Hohe Lernkurve durch neue Technologien und Arbeitsweisen

Die vierte Semesterarbeit brachte eine hohe Dichte an neuen Technologien und Konzepten mit sich. Neben dem fachlichen Ausbau des bestehenden Projekts mussten insbesondere folgende Themen parallel erlernt und angewendet werden:

- Kubernetes und Cluster-Betrieb
- DevOps-Grundlagen
- CI-Pipelines
- GitOps mit Argo CD
- Strukturierter Repository-Aufbau
- Agiles Arbeiten mit Issues, Pull Requests und Sprints

Diese Vielzahl neuer Inhalte führte dazu, dass der Fokus bewusst auf **Stabilität und Funktionalität** gelegt wurde. Dies zeigte sich unter anderem darin, dass Commits, Issues und Pull Requests nicht in jedem Fall vollständig dem idealtypischen agilen oder DevOps-orientierten Vorgehen entsprachen. Diese Abweichungen wurden bewusst in Kauf genommen, um den Projekterfolg sicherzustellen.

Diese Priorisierung stellte sicher, dass zentrale Projektziele erreicht wurden,
auch wenn dabei nicht jeder Prozess in idealer Form umgesetzt werden konnte.

---

### Kubernetes-Komplexität und manuelle Schritte im Betrieb

Der erstmalige Aufbau eines eigenen Kubernetes-Clusters stellte eine zentrale technische Herausforderung dar. Das Cluster konnte erfolgreich erstellt und betrieben werden, erfordert aktuell jedoch noch mehrere manuelle Schritte:

- Start des Clusters
- Installation von Argo CD
- Manuelles Einspielen der Secrets
- Initiale Synchronisation der Applikation

Trotz dieser Einschränkungen stellt der aktuelle Stand einen wichtigen Lernerfolg dar. Der aktuelle Stand stellt einen wichtigen Lernerfolg dar und bildet eine solide Grundlage für weiterführende Automatisierungen, welche den manuellen Aufwand in zukünftigen Projekten weiter reduzieren können.


---

## Reflexion & Lessons Learned

Die vierte Semesterarbeit ermöglichte eine intensive Auseinandersetzung mit **Cloud-Native- und DevOps-Konzepten** und stellte einen wichtigen Entwicklungsschritt im bisherigen Studienverlauf dar.

Ein zentrales Learning war das **praktische Verständnis von Kubernetes** – nicht nur auf konzeptioneller Ebene, sondern auch im operativen Betrieb. Besonders in der Anfangsphase, beim Aufbau der CI-Pipeline sowie bei der späteren Einführung von GitOps, konnte ein tiefgehendes Verständnis für moderne Deployment- und Betriebsmodelle entwickelt werden.

Das Arbeiten nach dem **GitOps-Prinzip** erforderte ein Umdenken gegenüber klassischen Deployment-Ansätzen. Deployments erfolgen nicht mehr aktiv, sondern ergeben sich aus dem definierten Soll-Zustand im Repository. Diese Erkenntnis führte zu einem nachhaltigeren Verständnis von Betrieb und Wartbarkeit cloud-nativer Systeme.

---

### Agile Methoden und Retrospektiven

Im Bereich der agilen Methoden konnte die bestehende Erfahrung weiter vertieft werden. Erstmals wurde dabei die **Segelschiff-Methode** in den Sprint-Retrospektiven eingesetzt. Diese Methode half dabei, Fortschritte, Risiken und Hindernisse visuell darzustellen und strukturierter zu reflektieren.

Die Arbeit mit GitHub Projects, Issues und Sprints unterstützte die Organisation des Projekts. Gleichzeitig wurde deutlich, dass eine konsequentere Umsetzung der definierten Prozesse – insbesondere bei Commits, Pull Requests und Dokumentation – künftig angestrebt werden sollte.

---

### Dokumentation als persönlicher Entwicklungsbereich

Wie bereits in vorherigen Semesterarbeiten zeigte sich auch in dieser Arbeit, dass die technische Umsetzung häufig im Vordergrund stand. Obwohl die Dokumentation fachlich korrekt ist, hätte insbesondere der technische Teil teilweise früher und detaillierter erfolgen können.

Dieser Punkt wurde bewusst reflektiert und als persönlicher Entwicklungsbereich identifiziert. Ziel für kommende Semesterarbeiten ist es, technische Umsetzung und Dokumentation zeitlich enger zu verzahnen und geeignete Hilfsmittel zur Unterstützung dieses Prozesses zu etablieren.

---
## Fazit

Die vierte Semesterarbeit kann insgesamt als **erfolgreich** bewertet werden. Trotz zeitlicher, technischer und organisatorischer Herausforderungen konnten die gesetzten Ziele grösstenteils erreicht und eine praxisnahe, moderne Lösung umgesetzt werden.

Im Vergleich zu den vorherigen Semesterarbeiten zeigt sich eine klare **Weiterentwicklung im Bereich Architektur, Betriebskonzepte und methodisches Vorgehen**. Insbesondere das Verständnis für Kubernetes, GitOps und DevOps stellt einen wichtigen Meilenstein im bisherigen Studienverlauf dar.

Diese Arbeit bildet eine solide Grundlage für weiterführende Projekte und motiviert dazu, die identifizierten Verbesserungspotenziale in den kommenden Semestern gezielt anzugehen.

Die gewonnenen Erkenntnisse gehen dabei über die konkrete Umsetzung hinaus und stellen einen nachhaltigen Kompetenzgewinn für zukünftige berufliche und akademische Projekte dar.


---

## Dankbarkeit

Ich möchte mich herzlich bei meinen Fachdozenten bedanken, die mich während der vierten Semesterarbeit unterstützt haben. Ihre fachliche Kompetenz und Geduld haben wesentlich dazu beigetragen, dass Herausforderungen gemeistert und neue Kenntnisse aufgebaut werden konnten.





# Sprints

Im Rahmen meiner Semesterarbeit werde ich die Fortschritte anhand von Sprints evaluieren, um zu überprüfen, ob ich im Zeitplan liege.

Die Sprints ermöglichen es mir, Reflexionen zu erstellen, die aufzeigen, wie der Sprintzyklus verlaufen ist und welche Aspekte erfolgreich oder verbesserungswürdig waren.


![Sprint Review](../../ressources/images/sprint-review.png)

[Quelle](../Quellverzeichnis/index.md#sprint-review)




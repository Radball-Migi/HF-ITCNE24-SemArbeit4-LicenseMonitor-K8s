# Git-Workflow, Commit-Kultur, Branching & SemVer-Tagging

Dieses Dokument definiert meine einheitliche Arbeitsweise für Branches, Commits, Versionierung (SemVer) und Tags.

---

## 1) Branching-Strategie (GitFlow-lite)

**Hauptbranches**

- **`main`**: Produktionscode. Nur durch Merge von `release/*` oder `hotfix/*`.
    
- **`dev`**: Integrations-/Entwicklungszweig. Hier landen geprüfte Features; CI baut Artefakte für Tests.
    

**Kurz-Branches**

- **Feature**: `feat/<kurz-beschreibung>`  
    _Zweck_: neue Funktionalität
    
- **Bugfix**: `fix/<kurz-beschreibung>`
- **Refactoring**: `refactor/<kurz-beschreibung>`
- **Docs**: `docs/<kurz-beschreibung>`
- **Release** (Vorbereitung): `release/<version>`
- **Hotfix** (kritische Prod-Fixes): `hotfix/<kurz-beschreibung>`

**Ablauf**

1. Branch ab `dev` erstellen, z. B. `feat/add-login`.
2. Arbeiten & Commits nach Schema unten.
3. PR → Ziel `dev` (Feature), Review + Checks.
4. Für Release: `release/1.4.0` von `dev` abzweigen → Stabilisierung → Merge nach `main` **und** zurück nach `dev`. Tag `v1.4.0` auf `main`.
5. Hotfix: `hotfix/critical-crash` von `main` → nach Fix Merge nach `main` **und** `dev`. Tag `v1.4.1` auf `main`.

**CI/CD-Verhalten (Empfehlung)**

- Push auf `feat/*`, `fix/*`, etc.: **Tests** (keine Artefakte).
- Push/Merge auf `dev`: **Build + Artefakte** (z. B. Upload nach Azure DevOps).
- Merge nach `main` + Tag `v*`: **Release**, Deployment/Publish.

**Namensregeln (Regex)**
```arduino
^(feat|fix|refactor|docs|test|ci|build|perf|chore|release|hotfix|dev|main)\/[a-z0-9._-]+$
```

---

## 2) Commit-Kultur (Conventional Commits, kurz & deutsch)

**Format**

```php-template
<type>(<scope>)!?: <kurzer satz im imperativ> 
<LEERZEILE> 
<optionaler body – warum/wie, bullets ok> 
<LEERZEILE> 
<optionale footer – z. B. Breaking-Change, Issue-Refs>
```

**Zulässige `<type>`**
- `feat` – neue Funktion
- `fix` – Bugfix
- `refactor` – Code-Umbau ohne Feature/Fix
- `docs` – Dokumentation
- `test` – Tests
- `ci` / `build` – Pipeline/Buildsystem
- `perf` – Performance
- `chore` – Pflege/Meta

**Regeln**

- Betreff max. ~72 Zeichen, **kein Punkt am Ende**.
- **Deutsch, Imperativ**: „Füge Login hinzu“, „Behebe NPE in AuthService“.
- **Ein Commit = eine Änderungseinheit**.
- Breaking Change mit `!` im Header **oder** im Footer `BREAKING CHANGE: ...`.

**Beispiele**

```less
feat(auth): füge OAuth2-Login hinzu  

Erweitert den Auth-Flow um OAuth2 Authorization Code mit PKCE. Dokumentiert Redirect-URIs.  

Refs: #42
```

```less
fix(api): behebe NullPointer in Lizenz-Endpoint 

Ursache: fehlende Nullprüfung bei optionalem Header. Test ergänzt.  

Closes: #77
```

```less
refactor(core)!: entferne Legacy-Lizenzparser 

BREAKING CHANGE: Der alte Parser ist entfernt. Verwende ParserV2. 

Migration: config.lm.parser = "v2".
```

---

## 3) SemVer-Versionierung & Tagging

Wir nutzen **Semantic Versioning**: `MAJOR.MINOR.PATCH`  
Beispiele: `v1.4.0`, `v2.0.1`

**Wann bumpen?**

- **MAJOR** (`x.0.0`): Breaking Changes (API/CLI/Protokoll).
- **MINOR** (`1.x.0`): neue Features, rückwärtskompatibel.
- **PATCH** (`1.0.x`): Bugfixes, intern/Docs/Build ohne API-Änderung.

**Pre-Releases**

- Kandidaten während Stabilisierung auf `release/*`:  
    `v1.4.0-rc.1`, `v1.4.0-rc.2`, …  
    Optional Build-Metadata: `v1.4.0-rc.2+build.15` (nur Info, keine Sortierung).
    

**Tag-Typ**

- **Annotierte Tags** (mit Nachricht & GPG optional) sind Standard.

**Tag-Regeln**

- Tags auf **`main`** setzen.
- Format: `v<MAJOR>.<MINOR>.<PATCH>(-<preRelease>.<n>)(+<build>)`

**Beispiele (Befehle)**

```bash
# Patch-Release (Hotfix) nach Merge auf main: 
git checkout main 
git pull 
git tag -a v1.4.1 -m "v1.4.1: Hotfix für OAuth Redirect" 
git push origin v1.4.1  
# Minor-Release: 
git tag -a v1.5.0 -m "v1.5.0: Mehrmandanten-Support" 
git push origin v1.5.0  
# Release Candidate auf release-Branch: 
git checkout release/1.6.0 git tag -a v1.6.0-rc.1 -m "v1.6.0-rc.1" git push origin v1.6.0-rc.1
```

**Automatischer Versionsbump (Empfehlung)**

- Mapping der Commits → Version:

    - mind. ein `feat` ohne Breaking: **MINOR**
    - nur `fix`/`chore`/`docs`/`refactor` ohne Breaking: **PATCH**
    - `!` oder `BREAKING CHANGE`: **MAJOR**
- Kann via Release-Action (z. B. Conventional-Changelog) umgesetzt werden.

---

## 4) Praktische Spickzettel

**Neuen Feature-Branch starten**

```bash
git checkout dev 
git pull 
git checkout -b feat/add-license-check
```

**Committen nach Schema**

```bash
git add . 
git commit -m "feat(license): prüfe Ablaufdatum im CI" 
git push -u origin feat/add-license-check
```

**PR erstellen**

- Ziel: `dev`
- Checks müssen grün sein (Lint, Tests, Build dry-run).

**Release vorbereiten**

```bash
# in dev: alles stabil? dann: 
git checkout -b release/1.4.0 # Fixes hier; optional RC-Tags setzen
```

**Release abschliessen**

```bash
# Merge release/1.4.0 -> main 
# Tag setzen: 
git tag -a v1.4.0 -m "v1.4.0" 
git push origin v1.4.0 
# Merge main -> dev (oder release -> dev), um Versionsdateien zu synchronisieren
```

**Hotfix-Flow**

```bash
git checkout main 
git pull git checkout -b hotfix/fix-null-auth 
# Fix + Tests 
git commit -m "fix(auth): null-check für optionalen header" 
git push -u origin hotfix/fix-null-auth 
# PR -> main, danach Tag vX.Y.Z, und zurück nach dev mergen
```

---

## 5) Qualitäts- und Schutzregeln (Empfehlung)

- **Branch-Protection** 
    - `main`: 2 Reviews, Status-Checks Pflicht, kein Direkt-Push.
    - `dev`: 1 Review, Status-Checks Pflicht.
- **Status-Checks**
    - Lint, Unit-/Integrationstests, Security-Scan, Build.
- **Commit-Linting**
    - Durchsetzen des Commit-Formats per Hook/CI.
- **PR-Richtlinien**
    - Klein, fokusiert, klare Beschreibung, „Warum?“ inkl. Risks/Tests.

---

## 6) Beispiele für gute Commit-Nachrichten

`feat(api): füge Lizenz-Validierung für M365-Tenants hinzu  Validiert Tokens gegen Graph API und prüft Ablaufdaten. Dokumentiert neue Konfigurationsflags.  Closes: #123`

`fix(ci): setze Node-Version in Actions explizit  Verhindert Build-Fehler durch Major-Upgrade in runner images.`

`perf(scanner): reduziere API-Calls durch Caching`

`docs(readme): ergänze Badge für Release-Status`

`refactor(core)!: vereinheitliche Fehlerklassen  BREAKING CHANGE: Fehlerklassen wurden umbenannt (AuthError -> SecurityError).`
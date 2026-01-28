# merge-docs.ps1
$root = "C:\USERS\MIGUEL.SCHNEIDER\ONEDRIVE - TBZ\GITHUB_REPOS_HF\HF-ITCNE24-SEMARBEIT4-LICENSEMONITOR-K8S\DOCUMENTATION"
$out  = Join-Path $root "merged.md"

# Ordner-Reihenfolge (wie in deiner Struktur)
$folders = @("Einleitung", "Haupteil", "Sprints", "Abschluss", "Quellverzeichnis")

# Datei schreiben/überschreiben
"" | Set-Content -Encoding UTF8 $out

function Append-File($path) {
  $rel = $path.Substring($root.Length).TrimStart('\')
  Add-Content -Encoding UTF8 $out "`r`n`r`n---`r`n`r`n<!-- SOURCE: $rel -->`r`n"
  Get-Content -Encoding UTF8 $path | Add-Content -Encoding UTF8 $out
}

# 1) Root index.md zuerst
$rootIndex = Join-Path $root "index.md"
if (Test-Path $rootIndex) { Append-File $rootIndex 
Start-Sleep -Seconds 2 }

# 2) Pro Ordner: index.md zuerst, dann restliche .md (alphabetisch)
foreach ($folder in $folders) {
  $dir = Join-Path $root $folder
  if (!(Test-Path $dir)) { continue }

  $idx = Join-Path $dir "index.md"
  if (Test-Path $idx) { Append-File $idx }

  Get-ChildItem $dir -Filter *.md -File |
    Where-Object { $_.Name -ne "index.md" } |
    Sort-Object Name |
    ForEach-Object { Append-File $_.FullName }

    Start-Sleep -Seconds 2
}

Write-Host "Fertig: $out"

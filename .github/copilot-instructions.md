# Copilot Instructions (pq-devcon-minimal)

## Sprache & Kommunikation
- Antworte bevorzugt auf Deutsch.
- Sei kurz, direkt und umsetzungsorientiert.
- Wenn etwas unklar ist, stelle max. 1–2 gezielte Rückfragen; sonst handle proaktiv.

## Projekt-Kontext
- Dieses Repo ist ein *minimaler* DevCon/DevContainer-Test-Workspace. Änderungen sollen klein und nachvollziehbar bleiben.
- Bevorzugte Dokumentation in Markdown (README/info).

## Prioritäten
- Bestehende Skripte/Workflows respektieren.
- Pfade/Dateinamen exakt halten (Case-Sensitivity auf Linux beachten).
- Keine unnötigen Refactors oder großflächigen Formatierungsänderungen.

## Shell-Skripte
- Ziel-Shell ist `bash`.
- Wenn ein Skript angepasst wird: robust quoten (z.B. `"$var"`) und keine interaktiven Prompts hinzufügen.
- `set -euo pipefail` nur hinzufügen, wenn es das Skript nicht bricht.
- Wenn nötig: Repo-Root robust ermitteln (z.B. `git rev-parse --show-toplevel`).

## Coding/Editing-Regeln
- Mache nur die kleinsten Änderungen, die das Ziel erfüllen.
- Keine großflächigen Reformatierungen oder Umbenennungen ohne Grund.
- Keine Lizenz-/Copyright-Header hinzufügen.
- Neue Dateien nur, wenn nötig; klare Namen und einfache Struktur.

## Doku-Regeln
- Markdown sauber halten (Überschriften, Listen, Codeblöcke).
- Wenn du Schritte beschreibst, nenne konkrete Commands in Backticks.

## Git & Qualität
- Vor Abschluss: `git status` prüfen und kurz zusammenfassen.
- Wenn Git vorhanden: bei Änderungen kurz `git diff` sichten.
- Keine Commits/Branches erstellen, außer explizit angefordert.

## Sicherheit
- Keine Secrets in Dateien oder Outputs.
- Keine destruktiven Befehle (z. B. `rm -rf`) ohne explizite Freigabe.

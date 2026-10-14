# ARCHITECTURE.md

> Write this file in the person's language.

## In short
<What the system is, 2–3 sentences.>

## Parts
| Part | What it does | Where it lives |
|---|---|---|
| | | |

## Data
- Database: <SQLite / Postgres / ...>. Migrations (additive only): `<path>`.
- Backups: `backups/ok-N.*` (last 5) + weekly copy outside the project.

## External services
| Service | Why | Key in `.env` | Plan / limits |
|---|---|---|---|
| | | | |

## How it runs
- Locally: `start.bat` / `start.command`.
- Production: <where and how>.

## Known limitations
- 

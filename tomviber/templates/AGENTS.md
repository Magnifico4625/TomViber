<!-- tomviber v1 -->
# AGENTS.md — project rules (TomViber)

> Source of truth for any AI agent here. Read this file and `MEMORY.md` first.
> Talk to the person in their language (from their messages). Project docs in their language; commit messages in English.

## Project
- What it does: <one line>. For whom: <who>. Mode: <1 prototype / 2 MVP / 3 serious>.
- Stack: <...>. Run: `start.bat` / `start.command`. Main branch: `main`.

## Work loop
1. Before a step: commit `wip: <what I'm doing>`. One step the person can see or touch.
2. Honest report: "built", "ran the scenario", "couldn't verify". No embellishment.
   Plain words only: no git/terminal jargon to the person — describe the outcome (not "run `git log`" but "the project is back to how it was this morning").
3. Stop-crane — let the person check by hand, always with the expected result:
   EN: "Done: [piece]. I checked: [...]. Your turn: [action], you should see [result]. If not, send a screenshot or the error text. All good? Reply "ok"."
   RU: «Готово: [кусок]. Проверил я: [...]. Твоя очередь: [действие], должно [результат]. Иначе — скинь скриншот или текст ошибки. Всё ок — напиши "ок"».
   Mode 1: after a finished screen/feature, not every small change.
4. After "ok"/«ок»: update `MEMORY.md` → "Where we stopped" (3 lines), commit everything approved, THEN tag `ok-N` on that commit; local SQLite → dump `backups/ok-N.db` (keep last 5).
5. Person's correction: first a rule in `MEMORY.md` → "Pitfalls", then code. "Also let's…" → `MEMORY.md` → "Later".

## PANIC / undo / revert («ПАНИКА», «откат», «верни как было»; any case)
- Message is just that word → roll back now. Word inside a longer message → ask once:
  EN: "Looks like you want to roll back to the last working state. I'll save everything current separately. Roll back? (yes/no)"
  RU: «Похоже, тебе нужен откат к последнему рабочему состоянию. Всё текущее сохраню отдельно. Откатываем? (да/нет)»
- Run one command at a time, check each result, no `&&`. Delete nothing:
```
git branch --show-current
git switch -c rescue-YYYYMMDD-HHMM
git add -A
git commit --allow-empty -m "rescue: state before rollback"
git switch <main-branch>
git tag -l 'ok-*' --sort=-v:refname
git reset --hard <latest-ok-tag>
git clean -fd
```
- `git clean -fd` removes leftover junk (it's already saved in `rescue-*`). Never `-x`: ignored `.env`, `data/`, `backups/` must survive.
- No `ok-*` tags yet → never run reset with an empty tag: use the first commit (`git rev-list --max-parents=0 HEAD`); no commits at all → tell the person there are no saves yet.
- Start the project; report in one sentence: where you rolled back to, what's in `rescue-*`, whether the DB is affected.
- Code rollback doesn't touch the DB. DB restore: first save current DB to `backups/rescue-<time>`, then restore the dump. In an MVP with real users this is the ONLY case where PANIC asks first.

## Two-attempt rule
Bug not fixed on the 2nd try → no hacks, no silent rollback. Say:
EN: "Didn't work on the 2nd try. I recommend going back to the last working state (I'll save the current one separately). Reply "yes", or tell me what to try instead."
RU: «Со 2-й попытки не получилось. Рекомендую вернуться к последнему рабочему состоянию (текущее сохраню отдельно). Ответь "да", или напиши, что попробовать иначе».

## Data
- Never in git: `.env`, databases, `data/`, `backups/`, `uploads/`, `*.session`. In git: migrations and test data without personal info.
- SQLite dumps only via the language API (Python `sqlite3` `.backup`, better-sqlite3 `db.backup()`, or `VACUUM INTO`) — not file copy, not the sqlite3 CLI.
- Migrations are additive only (new columns/tables). Delete/rename = separate step: dump + person's consent.
- Cloud DB: dump before a migration; make sure the plan has backups.

## Keys
- Only in `.env` (+ `.env.example` without values). Never in code, commits, `MEMORY.md`.
- All keys entered via `set-key.bat` / `set-key.command` (`chmod +x`): window opens, paste key, script writes `.env`. When you need a key, offer set-key — never ask to paste it in chat.
- Key pasted in chat by the person → don't scold, insert it; for a paid key suggest reissuing later. Write it so the value never appears in command text (stdin, e.g. `python -c` reading `sys.stdin`) — never `printf`/`echo` with the value.
- After writing a key, check `.env` has a non-empty `NAME=` line (e.g. `grep -c '^NAME=.' .env`), never print the value. Never say a key is saved without this check.
- Never show raw run/log output that may contain a key (incl. API checks of the key): mask as `***`; filter output.

## Packages
Before installing a new package, check the registry (creation date, downloads, repo link). Suspiciously new or obscure → not without the person knowing.

## Audit gate (triggered by actions, not words)
Before deploy, public push, attaching a domain, launching a bot for other people → mini-audit from Phase 6 of the `tomviber` skill.
No skill available → minimum: no keys in code/history, RLS/access locked down, spend cap on paid APIs.
Anything paid or public — only after an explicit "yes" and a stated price.

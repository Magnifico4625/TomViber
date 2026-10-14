# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Versioning: [SemVer](https://semver.org/).

## [0.4.2] — 2026-10-14

### Fixed
- `ok-N` is tagged only after committing everything the person approved (memory update included), then the dump.
- Keys are written without the value in command text (set-key or stdin); never `printf`/`echo` with the value.
- The agent always offers set-key and never asks to paste a key in chat; a key in chat is accepted only if the person sends it.
- Key checks against external APIs stay allowed, with masked output.

## [0.4.1] — 2026-10-14

Findings from a Linux test (opencode + free model).

### Fixed
- Keys: after writing a key the agent checks `.env` has a non-empty `NAME=` line (value never printed) and never claims a key is saved without that check.
- Keys: raw run/log output that may contain a key is never shown; keys are masked as `***`.
- Plain language: no git/terminal jargon to the person; describe the outcome instead.
- A skill installed inside the project (e.g. `.agents/skills/tomviber/`) is added to `.gitignore`.

## [0.4.0] — 2026-10-14

Findings from a full manual test on **Windows 11** by Damir Damirov — thank you!

### Fixed
- `SKILL.md`: templates are copied from `<skill-path>/templates/`; the agent first locates where the skill is mounted (project or home `.agents` / `.claude` / `.cursor` / `.codex` skills folders).
- PANIC: after `reset --hard`, `git clean -fd` removes leftover untracked junk (already saved in `rescue-*`). Never `-x`, so ignored `.env`, `data/`, `backups/` survive.
- PANIC with no `ok-*` tags: roll back to the first commit, or tell the person there are no saves yet; never reset to an empty tag.
- `set-key.bat`: key name is escaped with `[regex]::Escape` when replacing an existing line.
- Line endings: `.gitattributes` forces LF for `*.command` / `*.sh` (CRLF for `.bat`/`.cmd`).

### Added
- `templates/gitattributes.template`, copied in Phase 4.

## [0.3.0] — 2026-10-14

### Changed
- English is now the primary language: `SKILL.md` and all templates rewritten in English; the agent talks to the person in their own language.
- User-facing canned phrases (Phase 1 retell, stop-crane report, PANIC question, two-attempt phrase, PANIC reminder, safety-belt prompt) ship in EN and RU.
- PANIC triggers in both languages: PANIC/ПАНИКА, undo/откат, revert/«верни как было».
- Files generated into the person's project are written in their language; commit messages in English.
- `set-key` scripts show bilingual prompts.
- README in English; Russian moved to `README.ru.md`; new `README.zh-CN.md`. CONTRIBUTING, CHANGELOG, issue templates and repo description in English.

### Added
- Frontmatter description includes Russian trigger phrases so the skill fires on Russian requests.

## [0.2.0] — 2026-10-14

### Changed
- Renamed to **TomViber** (repo `TomViber`, folder and `name`: `tomviber`, marker `<!-- tomviber v1 -->` in `AGENTS.md`).
- PANIC: a bare trigger word rolls back immediately; inside a longer message, one confirmation question. Rollback commands run one at a time, branch `rescue-YYYYMMDD-HHMM`, `--allow-empty`, latest `ok` tag lookup.
- Two-attempt rule: no silent rollback — a recommendation plus "yes".
- All keys via `set-key.bat` / `set-key.command`; the "bot token in chat is fine" exception removed.
- Dumps only after "ok" (`backups/ok-N.*`, last 5), no dump at startup; cloud DB — dump before migrations plus plan backups.
- Phase 6 is an audit gate triggered by actions (deploy, public push, domain, bot for other people).

### Added
- Marker in `AGENTS.md`; a foreign `AGENTS.md` is appended to, never overwritten.
- Branch 3: secret scan before snapshot (file+line only), `git rm --cached`, key reissue.
- Additive-only migrations; DB restore saves current DB to `backups/rescue-<time>` first.
- SQLite dumps via the language API (`backup` / `VACUUM INTO`).
- Package registry check before install.
- Phase 0: check git `user.name` / `user.email`.
- `.gitignore`: OAuth files, `uploads/`, `dist/`, `build/`, `.next/`; new `dockerignore.template`; `set-key` templates.
- README: before → after, one-phrase and ZIP install, first-message example, FAQ, honest status.

## [0.1.0] — 2026-10-14

### Added
- `SKILL.md`: phases 0–6, three modes, Branch 3 "code already exists", phase order.
- `templates/`: `AGENTS.md`, `MEMORY.md`, `ARCHITECTURE.md`, `belt-checklist.md`, `infra-notes.md`, `gitignore.template`.
- "Data never lives in git" rule; money-related keys entered via a terminal script.

### Changed
- Phase 5, PANIC and the two-attempt rule moved into `templates/AGENTS.md` (single source of truth).
- Description: exception for "show people / publish / make it serious"; trimmed.
- Branch 3: `.gitignore` first, then snapshot and `ok-0` tag.
- Licenses: MIT/Apache 2.0/BSD; GPL/AGPL only with explained consequences.

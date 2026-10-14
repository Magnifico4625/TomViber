# TomViber safety belt (mode 3)

> Show this to the person in their language. Everything is on by default. They reply "ok"/«ок» or list numbers to remove.

1. [x] **Saves (git + `ok-N` tags).** Why: rollback in seconds. If off: broken things can't be brought back.
2. [x] **`.gitignore` from the template.** Why: keys and data don't leak. If off: `.env` ends up on GitHub.
3. [x] **Project memory (`AGENTS.md`, `MEMORY.md`).** Why: tomorrow the agent continues where it stopped. If off: second-day syndrome.
4. [x] **Automated checks (tests for main scenarios).** Why: breakage shows immediately. If off: you learn from users.
5. [x] **Linter/formatter.** Why: code a real developer can read. If off: the mess grows.
6. [x] **Data backups** (at every `ok-N`, last 5; cloud — before migrations). If off: data loss is permanent.
7. [x] **Additive DB migrations in git.** Why: clear which schema matches which code; old code works on new schema. If off: rollback breaks the DB.
8. [x] **Mini security audit** (keys, RLS, spend cap). If off: an open database or a surprise API bill.
9. [x] **`Dockerfile` + `.dockerignore`.** Why: same everywhere, no keys baked into the image. If off: "works on my machine".
10. [x] **`ARCHITECTURE.md`.** Why: not embarrassing to show a developer. If off: nobody can figure it out.

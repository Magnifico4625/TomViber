# Infrastructure: options and pitfalls

> Plans change — check current terms before advising. Anything paid only after an explicit "yes" and a stated price.

## Frontend / static
- **Cloudflare Pages, Netlify, Vercel** — free start. Pitfall: Vercel's free plan is non-commercial only.

## Backend / bots
- **Render, Railway, Fly.io** — simple, but free instances sleep or are limited by hours/credits.
- **VPS** (cheap, full control) — needs care: updates, firewall, backups. Mode 3 only.

## Databases
- **SQLite** — mode 1 and small projects. DB file in `data/`, ignored by git. Dumps via the language API.
- **Supabase / Neon** — free Postgres. Pitfalls: in Supabase **always enable RLS**; free projects may pause; free plans often have no automatic backups — dump before migrations.

## LLM APIs
- Always set a **spend cap** in the provider dashboard. Key on the server only, never in the frontend.

## Telegram
- Bot token is a regular secret in `.env`.
- Userbot sessions (`*.session`) = full account access. Always ignored by git, never forward them.

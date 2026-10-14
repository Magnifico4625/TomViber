<div align="center">

# 🐱 vibe-architect

**Техлид-ментор для вайб-кодеров, которые не читают код.**
Agent Skill: страховка, память проекта и кнопка «ПАНИКА» — с первого коммита.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Agent Skills](https://img.shields.io/badge/Agent%20Skills-SKILL.md-blue)
![Lang](https://img.shields.io/badge/lang-RU-red)
![Version](https://img.shields.io/badge/version-0.1.0-informational)

</div>

## Что это

`vibe-architect` — навык (Agent Skill) для ИИ-агентов вроде Claude Code, Cursor и Codex. Он превращает агента в спокойного техлида, который:

- **пересказывает идею** и предлагает масштаб: прототип на вечер / живой MVP / всерьёз;
- **ставит страховку** сразу: git-сохранения, теги `ok-N`, `.gitignore`, который не пустит ключи и базы в историю;
- **ведёт короткими шагами** со стоп-краном и честным отчётом «что проверил я / что проверь ты»;
- **откатывает по слову «ПАНИКА»**, сохраняя текущее состояние в ветку `rescue-*` — ничего не пропадает;
- **оставляет память проекта** (`AGENTS.md`, `MEMORY.md`), чтобы завтра любой агент продолжил с того же места.

## Для кого

Для людей без опыта в программировании, которые делают проекты с ИИ: Telegram-боты, сайты, скрипты, MVP. И для тех, кто пришёл с уже готовой «кашей» — скилл наведёт порядок, ничего не сломав.

## Как работает

```
0 Осмотр → 1 Идея + режим → (2 Подбор библиотек) → (3 Защитный пояс) → 4 Сборка → 5 Автопилот
                                                                     ↘ 6 Перед показом людям
```

После первого запуска правила живут в `AGENTS.md` проекта — скилл больше не нужен для обычной работы. Он снова включается, когда вы хотите показать проект людям, выложить его или «сделать серьёзнее».

## Установка

Скопируйте папку `vibe-architect/` (с `SKILL.md` и `templates/`) в каталог навыков вашего агента.

| Агент | Глобально (для всех проектов) | Только для проекта |
|---|---|---|
| Claude Code | `~/.claude/skills/vibe-architect/` | `.claude/skills/vibe-architect/` |
| Cursor | `~/.cursor/skills/vibe-architect/` или `~/.agents/skills/…` | `.cursor/skills/…` или `.agents/skills/…` |
| Codex | `~/.agents/skills/vibe-architect/` | `.agents/skills/vibe-architect/` |
| Другие агенты со стандартом Agent Skills | обычно `~/.agents/skills/` | `.agents/skills/` |

```bash
git clone https://github.com/Magnifico4625/vibe-architect.git
# универсальный путь (Codex, Cursor, Copilot и др.)
mkdir -p ~/.agents/skills && cp -r vibe-architect/vibe-architect ~/.agents/skills/
# Claude Code
mkdir -p ~/.claude/skills && cp -r vibe-architect/vibe-architect ~/.claude/skills/
```

Windows (PowerShell):

```powershell
git clone https://github.com/Magnifico4625/vibe-architect.git
Copy-Item -Recurse vibe-architect\vibe-architect "$HOME\.agents\skills\vibe-architect"
```

Затем просто напишите агенту: «Хочу сделать бота, который…» — скилл подхватится сам.

## Структура

```
vibe-architect/
├── SKILL.md                 # инструкции для агента
└── templates/
    ├── AGENTS.md            # правила проекта: цикл, ПАНИКА, две попытки
    ├── MEMORY.md            # память: где остановились, грабли, потом
    ├── ARCHITECTURE.md      # для режимов 2–3
    ├── belt-checklist.md    # «защитный пояс» (режим 3)
    ├── infra-notes.md       # хостинг, базы и подводные камни
    └── gitignore.template   # → .gitignore при копировании
```

## Принципы

- **Данные не живут в git.** Базы, `data/`, `backups/`, `.env`, сессии — в `.gitignore`; в git только миграции.
- **Один источник правды.** Правила работы — в `AGENTS.md` проекта, а не в голове модели.
- **Деньги и публикация — только с явного «да»** и названной ценой.
- **Честность важнее красоты:** «проверить не смог» лучше, чем «всё работает».

## English summary

**vibe-architect** is a Russian-language [Agent Skill](https://agentskills.io) that turns your coding agent (Claude Code, Cursor, Codex, …) into a pragmatic tech lead for non-programmers. It restates the idea, picks a scope (prototype / MVP / serious), installs a safety net from the first commit (git snapshots with `ok-N` tags, a strict `.gitignore`, a "PANIC" rollback that preserves state in a `rescue-*` branch), and drives development in small verifiable steps with honest status reports. Project rules live in a generated `AGENTS.md`, so any agent can pick up tomorrow where you left off. Install by copying `vibe-architect/` into `~/.agents/skills/` or `~/.claude/skills/`.

## Лицензия

[MIT](LICENSE) © 2026 Дамир Дамиров ([@Magnifico4625](https://github.com/Magnifico4625))

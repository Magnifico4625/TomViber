#!/bin/bash
# TomViber: безопасный ввод ключа в .env. На Mac: chmod +x set-key.command
cd "$(dirname "$0")"
read -r -p "Название ключа (например BOT_TOKEN): " NAME
read -r -s -p "Вставь ключ и нажми Enter (символы не видны): " VALUE; echo
touch .env
grep -v "^${NAME}=" .env > .env.tmp; mv .env.tmp .env
printf '%s=%s\n' "$NAME" "$VALUE" >> .env
echo "Готово: $NAME записан в .env. Окно можно закрыть."

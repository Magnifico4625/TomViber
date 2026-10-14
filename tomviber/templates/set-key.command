#!/bin/bash
# TomViber: safe key entry into .env. On Mac: chmod +x set-key.command
cd "$(dirname "$0")"
read -r -p "Key name / Название ключа (e.g. BOT_TOKEN): " NAME
read -r -s -p "Paste the key, press Enter (hidden) / Вставь ключ и нажми Enter: " VALUE; echo
touch .env
grep -v "^${NAME}=" .env > .env.tmp; mv .env.tmp .env
printf '%s=%s\n' "$NAME" "$VALUE" >> .env
echo "Done / Готово: $NAME saved to .env. You can close this window."

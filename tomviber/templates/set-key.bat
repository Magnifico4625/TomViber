@echo off
rem TomViber: safe key entry into .env (double-click)
chcp 65001 >nul
cd /d "%~dp0"
set /p NAME=Key name / Название ключа (e.g. BOT_TOKEN): 
powershell -NoProfile -Command "$n=$env:NAME; $s=Read-Host -AsSecureString 'Paste the key, press Enter / Вставь ключ и нажми Enter'; $v=[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($s)); $p=Join-Path (Get-Location) '.env'; $l=@(); if(Test-Path $p){$l=@(Get-Content $p | Where-Object {$_ -notmatch ('^'+$n+'=')})}; $l+=($n+'='+$v); [IO.File]::WriteAllLines($p,[string[]]$l,(New-Object Text.UTF8Encoding $false))"
echo Done / Готово: %NAME% saved to .env.
pause

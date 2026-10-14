@echo off
rem TomViber: безопасный ввод ключа в .env (двойной клик)
chcp 65001 >nul
cd /d "%~dp0"
set /p NAME=Название ключа (например BOT_TOKEN): 
powershell -NoProfile -Command "$n=$env:NAME; $s=Read-Host -AsSecureString 'Вставь ключ и нажми Enter'; $v=[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($s)); $p=Join-Path (Get-Location) '.env'; $l=@(); if(Test-Path $p){$l=@(Get-Content $p | Where-Object {$_ -notmatch ('^'+$n+'=')})}; $l+=($n+'='+$v); [IO.File]::WriteAllLines($p,[string[]]$l,(New-Object Text.UTF8Encoding $false))"
echo Готово: %NAME% записан в .env.
pause

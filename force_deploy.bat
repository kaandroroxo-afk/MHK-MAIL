@echo off
chcp 65001 >nul
echo FORCE DEPLOY HELPER
echo This script will remove all tracked files from the git index and replace with current workspace content.
echo Use only if you understand this will overwrite remote repository content.
echo.
set /p CONFIRM=Type YES to continue: 
if /I not "%CONFIRM%"=="YES" (
  echo Aborting.
  exit /b 1
)

where git >nul 2>&1
if errorlevel 1 (
  echo Git nao encontrado no PATH. Instale Git antes de continuar.
  pause
  exit /b 1
)

echo Stashing uncommitted changes (if any)...
git stash --include-untracked

echo Removing all files from index (keeps working tree)...
git rm -r --cached . >nul 2>&1

echo Adding current workspace files...
git add -A

set /p MSG=Commit message (default: Replace repo with local workspace): 
if "%MSG%"=="" set MSG=Replace repo with local workspace

git commit -m "%MSG%"

echo Pushing to origin main (force)...
git push origin main --force

if errorlevel 1 (
  echo Push falhou. Verifique remotes e credenciais.
  pause
  exit /b 1
)

echo Push concluido. GitHub Actions deve disparar deploy.
pause
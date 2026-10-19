@echo off
setlocal

echo Starting OmniRoute...
start "OmniRoute" cmd /k omniroute

:wait_loop
curl -s http://localhost:20128 >nul 2>&1
if errorlevel 1 (
	echo Waiting for OmniRoute
	timeout /t 1 >nul
	goto wait_loop
)

:: === OmniRoute ===
set "ANTHROPIC_AUTH_TOKEN=sk-d20980d55225202f-3b3a81-984a4daa"
set "ANTHROPIC_BASE_URL=http://localhost:20128"
set "CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1"
set "ANTHROPIC_MODEL=auto"

echo Starting Claude Code via OmniRoute...

claude

endlocal
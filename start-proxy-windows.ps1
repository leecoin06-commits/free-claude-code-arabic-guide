# سكربت تشغيل البروكسي — Windows
# ضعه في مجلد free-claude-code

$proxyDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$python = "$proxyDir\.venv\Scripts\python.exe"

# أوقف أي بروكسي شغال على نفس البورت
$existing = Get-NetTCPConnection -LocalPort 8082 -ErrorAction SilentlyContinue
if ($existing) {
    $pid = $existing[0].OwningProcess
    Write-Host "Stopping existing proxy (PID $pid)..."
    Stop-Process -Id $pid -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
}

# ضبط متغيرات البيئة
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", "http://localhost:8082", "User")
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN", "freecc", "User")
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", "freecc", "User")

Write-Host "Starting Free Claude Code Proxy on port 8082..."
Set-Location $proxyDir
& $python -m uvicorn server:app --host 0.0.0.0 --port 8082
#!/bin/bash
# سكربت تشغيل البروكسي — Linux / macOS
# ضعه في مجلد free-claude-code

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# أوقف أي بروكسي شغال
pkill -f "uvicorn server:app" 2>/dev/null
sleep 1

# ضبط متغيرات البيئة
export ANTHROPIC_BASE_URL="http://localhost:8082"
export ANTHROPIC_AUTH_TOKEN="freecc"
export ANTHROPIC_API_KEY="freecc"

# أضفها بشكل دائم لو مش موجودة
grep -q "ANTHROPIC_BASE_URL" ~/.bashrc 2>/dev/null || {
    echo 'export ANTHROPIC_BASE_URL="http://localhost:8082"' >> ~/.bashrc
    echo 'export ANTHROPIC_AUTH_TOKEN="freecc"' >> ~/.bashrc
    echo 'export ANTHROPIC_API_KEY="freecc"' >> ~/.bashrc
    echo "Environment variables added to ~/.bashrc"
}

echo "Starting Free Claude Code Proxy on port 8082..."
uv run uvicorn server:app --host 0.0.0.0 --port 8082
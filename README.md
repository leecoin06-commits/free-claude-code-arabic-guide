# 🤖 Claude Code مجاناً — دليل عربي شامل

> استخدم Claude Code CLI و VSCode بدون اشتراك Anthropic — مجاناً 100%

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.14](https://img.shields.io/badge/python-3.14-3776ab.svg)](https://www.python.org/downloads/)
[![Ollama](https://img.shields.io/badge/Ollama-Cloud-000000?logo=ollama)](https://ollama.com)

---

## 📌 ما هو Claude Code؟

Claude Code هو أداة سطر أوامر (CLI) من Anthropic — مساعد برمجي ذكي يعمل مباشرة في تيرمينالك:
- 📖 يقرأ ويكتب ملفات مباشرة
- 🔧 يشغّل أوامر على جهازك
- 🔍 يراجع ويحسّن الكود
- 🏗️ ينشئ مشاريع كاملة من الصفر
- 🐛 يصلح الأخطاء تلقائياً

**النسخة الأصلية مدفوعة ($20/شهر). هذا الدليل يعلّمك تستخدمها مجاناً.**

---

## ⚡ كيف يشتغل؟

```
Claude Code CLI → بروكسي (localhost:8082) → Ollama → موديل سحابي
```

البروكسي يحاكي واجهة Anthropic API، فـ Claude Code يظن إنه يتكلم مع Anthropic، لكن البروكسي يحوّل الطلب لأي موديل مجاني نختاره.

---

## 🚀 التثبيت (3 خطوات فقط)

### الخطوة 1: ثبّت Claude Code CLI
```bash
npm install -g @anthropic-ai/claude-code
```

### الخطوة 2: ثبّت البروكسي (free-claude-code)
```bash
git clone https://github.com/Alishahryar1/free-claude-code.git
cd free-claude-code
pip install uv
uv sync
```

### الخطوة 3: إعداد `.env`
```bash
cp .env.example .env
```

عدّل `.env` بالموديل اللي تبي تستخدمه — اختر واحد:

<details>
<summary><b>🟢 Ollama Cloud (مجاني، موصى به)</b></summary>

ثبّت Ollama: [ollama.com](https://ollama.com)

```dotenv
OLLAMA_BASE_URL="http://localhost:11434"

MODEL_OPUS="ollama/glm-5.1:cloud"
MODEL_SONNET="ollama/glm-5.1:cloud"
MODEL_HAIKU="ollama/kimi-k2.5:cloud"
MODEL="ollama/glm-5.1:cloud"

ENABLE_MODEL_THINKING=false

ANTHROPIC_AUTH_TOKEN=freecc

MESSAGING_PLATFORM="none"
CLAUDE_WORKSPACE="./agent_workspace"
FAST_PREFIX_DETECTION=true
ENABLE_NETWORK_PROBE_MOCK=true
ENABLE_TITLE_GENERATION_SKIP=true
ENABLE_SUGGESTION_MODE_SKIP=true
ENABLE_FILEPATH_EXTRACTION_MOCK=true
ENABLE_WEB_SERVER_TOOLS=true
WEB_FETCH_ALLOWED_SCHEMES=http,https
WEB_FETCH_ALLOW_PRIVATE_NETWORKS=false
```

> **ملاحظة:** موديلات `:cloud` في Ollama مجانية وتشتغل بدون GPU — العقل في السحابة!

</details>

<details>
<summary><b>🔵 NVIDIA NIM (40 طلب/دقيقة مجاناً)</b></summary>

سجّل واحصل مفتاح: [build.nvidia.com/settings/api-keys](https://build.nvidia.com/settings/api-keys)

```dotenv
NVIDIA_NIM_API_KEY="nvapi-your-key-here"

MODEL="nvidia_nim/z-ai/glm4.7"
ENABLE_MODEL_THINKING=true
ANTHROPIC_AUTH_TOKEN=freecc
```

</details>

<details>
<summary><b>🟡 OpenRouter (مئات الموديلات المجانية)</b></summary>

سجّل: [openrouter.ai/keys](https://openrouter.ai/keys)

```dotenv
OPENROUTER_API_KEY="sk-or-your-key"

MODEL_OPUS="open_router/deepseek/deepseek-r1-0528:free"
MODEL_SONNET="open_router/openai/gpt-oss-120b:free"
MODEL_HAIKU="open_router/stepfun/step-3.5-flash:free"
MODEL="open_router/stepfun/step-3.5-flash:free"
ANTHROPIC_AUTH_TOKEN=freecc
```

</details>

<details>
<summary><b>🔴 DeepSeek (API مباشر)</b></summary>

```dotenv
DEEPSEEK_API_KEY="your-key"

MODEL_OPUS="deepseek/deepseek-reasoner"
MODEL_SONNET="deepseek/deepseek-chat"
MODEL_HAIKU="deepseek/deepseek-chat"
MODEL="deepseek/deepseek-chat"
ANTHROPIC_AUTH_TOKEN=freecc
```

</details>

<details>
<summary><b>🟣 Ollama محلي (بدون إنترنت)</b></summary>

```dotenv
OLLAMA_BASE_URL="http://localhost:11434"

MODEL="ollama/llama3.1"
ANTHROPIC_AUTH_TOKEN=freecc
```

```bash
ollama pull llama3.1
ollama serve
```

> يتطلب GPU بقوة أو RAM 8GB+

</details>

<details>
<summary><b>🟤 مزج مزوّدين مختلفين</b></summary>

```dotenv
NVIDIA_NIM_API_KEY="nvapi-..."
OPENROUTER_API_KEY="sk-or-..."

MODEL_OPUS="nvidia_nim/moonshotai/kimi-k2.5"
MODEL_SONNET="open_router/deepseek/deepseek-r1-0528:free"
MODEL_HAIKU="ollama/glm-5.1:cloud"
MODEL="nvidia_nim/z-ai/glm4.7"
ANTHROPIC_AUTH_TOKEN=freecc
```

</details>

---

## 🎯 التشغيل

### شغّل البروكسي (تيرمينال 1)
```bash
cd free-claude-code
uv run uvicorn server:app --host 0.0.0.0 --port 8082
```

### شغّل Claude Code (تيرمينال 2)

**Linux / macOS:**
```bash
export ANTHROPIC_BASE_URL="http://localhost:8082"
export ANTHROPIC_AUTH_TOKEN="freecc"
export ANTHROPIC_API_KEY="freecc"
claude
```

**PowerShell (Windows):**
```powershell
$env:ANTHROPIC_BASE_URL="http://localhost:8082"
$env:ANTHROPIC_AUTH_TOKEN="freecc"
$env:ANTHROPIC_API_KEY="freecc"
claude
```

**أو أضفها بشكل دائم:**

Linux/macOS:
```bash
echo 'export ANTHROPIC_BASE_URL="http://localhost:8082"' >> ~/.bashrc
echo 'export ANTHROPIC_AUTH_TOKEN="freecc"' >> ~/.bashrc
echo 'export ANTHROPIC_API_KEY="freecc"' >> ~/.bashrc
```

Windows (PowerShell كمسؤول):
```powershell
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", "http://localhost:8082", "User")
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN", "freecc", "User")
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", "freecc", "User")
```

---

## 💡 أمثلة استخدام

### محادثة تفاعلية
```bash
cd my-project
claude
```

### طلب واحد (one-shot)
```bash
claude -p "اشرح هذا الكود"
```

### إنشاء مشروع
```bash
mkdir new-project && cd new-project
claude -p "أنشئ API بـ FastAPI لإدارة المهام"
```

### مراجعة كود
```bash
claude -p "راجع main.py واقترح تحسينات"
```

### تصحيح خطأ
```bash
claude -p "هناك خطأ في app.py — اقرأه وصلحه"
```

### كتابة اختبارات
```bash
claude -p "اكتب pytest لكل الدوال في utils.py"
```

---

## 🔄 تشغيل تلقائي عند بدء التشغيل

### Linux / macOS (crontab)
```bash
cat > ~/start-claude-proxy.sh << 'EOF'
#!/bin/bash
cd ~/free-claude-code
~/.local/bin/uv run uvicorn server:app --host 0.0.0.0 --port 8082 &
EOF
chmod +x ~/start-claude-proxy.sh

(crontab -l 2>/dev/null; echo "@reboot ~/start-claude-proxy.sh") | crontab -
```

### Windows (مجلد Startup)
```powershell
$startupFolder = [Environment]::GetFolderPath("Startup")
$shortcutPath = "$startupFolder\Claude Proxy.lnk"
$ws = New-Object -ComObject WScript.Shell
$sc = $ws.CreateShortcut($shortcutPath)
$sc.TargetPath = "powershell.exe"
$sc.Arguments = "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$HOME\start-claude-proxy.ps1`""
$sc.Save()
```

---

## 🤝 الاستفادة مع وكلاء ذكاء اصطناعي آخرين

لو عندك وكيل AI آخر (مثل OpenClaw أو Hermes)، Claude Code يصير **أداة إضافية** قوية:

| الميزة | الوكيل العادي | Claude Code |
|---|---|---|
| كتابة كود | ✅ | ✅ أقوى في المشاريع الكبيرة |
| قراءة ملفات متعددة | ✅ | ✅ أسرع مع مشاريع كبيرة |
| تعديل مباشر للملفات | ✅ | ✅ يستخدم أدوات أكثر |
| تفاعل مستمر | ✅ محادثة | ❌ طلبة واحدة |
| فهم السياق التاريخي | ✅ | ❌ بلا ذاكرة بين الجلسات |

**النمط الأمثل:** الوكيل العادي ينسّق ويرسل مهام برمجية لـ Claude Code.

---

## 📊 المزوّدون المدعومون

| المزوّد | مجاني؟ | يحتاج مفتاح؟ | ملاحظات |
|---|---|---|---|
| **Ollama Cloud** | ✅ | ❌ | أبسط خيار |
| **NVIDIA NIM** | ✅ (40 req/min) | ✅ مجاني | أقوى خيار مجاني |
| **OpenRouter** | ✅ (موديلات free) | ✅ مجاني | أكبر اختيار |
| **DeepSeek** | 💰 مدفوع | ✅ | رخيص جداً |
| **Ollama محلي** | ✅ | ❌ | يحتاج GPU/RAM |
| **LM Studio** | ✅ | ❌ | محلي بالكامل |
| **llama.cpp** | ✅ | ❌ | محلي بالكامل |

---

## ⚠️ ملاحظات

- الموديل البديل (مثل GLM-5.1) مو بنفس ذكاء Claude الأصلي — لكنه يكفي لمعظم المهام
- مجاني بالكامل — لا اشتراك ولا API key (مع Ollama/NVIDIA NIM)
- البروكسي خفيف — ما يستهلك CPU أو RAM تقريباً
- Ollama لازم يكون شغال عشان الموديلات السحابية ترد
- للتفكير العميق فعّل: `ENABLE_MODEL_THINKING=true`

---

## 📁 هيكل الملفات

```
free-claude-code/
├── .env                    ← إعداداتك هنا
├── server.py               ← نقطة الدخول
├── api/                    ← واجهة API
│   ├── routes.py           ← مسارات /v1/messages
│   ├── services.py         ← الخدمات
│   └── optimization_handlers.py  ← تحسينات
├── providers/              ← المزوّدون
│   ├── anthropic_messages.py
│   ├── nvidia_nim/
│   ├── open_router/
│   ├── deepseek/
│   ├── ollama/
│   ├── lmstudio/
│   └── llamacpp/
├── core/                   ← النواة
├── messaging/              ← Discord/Telegram
└── cli/                    ← أدوات CLI
```

---

## 🙏 شكر

- [Alishahryar1/free-claude-code](https://github.com/Alishahryar1/free-claude-code) — البروكسي
- [Anthropic Claude Code](https://github.com/anthropics/claude-code) — CLI الأصلي
- [Ollama](https://ollama.com) — الموديلات السحابية والمحلية

---

## 📜 الرخصة

MIT License — استخدمه وشاركه بحرية

---

<div align="center">

**⭐ لو الدليل مفيد، أعط النجمة وشاركه مع أصحابك!**

</div>
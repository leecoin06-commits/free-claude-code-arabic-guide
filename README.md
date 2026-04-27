# 🤖 Claude Code مجاناً — دليل شامل | Free Claude Code — Complete Guide

> استخدم Claude Code CLI و VSCode بدون اشتراك Anthropic — مجاناً 100%
> 
> Use Claude Code CLI & VSCode without an Anthropic subscription — 100% free

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.14](https://img.shields.io/badge/python-3.14-3776ab.svg)](https://www.python.org/downloads/)
[![Ollama](https://img.shields.io/badge/Ollama-Cloud-000000?logo=ollama)](https://ollama.com)

---

## 📌 ما هو Claude Code؟ | What is Claude Code?

**🇸🇦 العربي:**

Claude Code هو أداة سطر أوامر (CLI) من Anthropic — مساعد برمجي ذكي يعمل مباشرة في تيرمينالك:
- 📖 يقرأ ويكتب ملفات مباشرة
- 🔧 يشغّل أوامر على جهازك
- 🔍 يراجع ويحسّن الكود
- 🏗️ ينشئ مشاريع كاملة من الصفر
- 🐛 يصلح الأخطاء تلقائياً

النسخة الأصلية مدفوعة ($20/شهر). هذا الدليل يعلّمك تستخدمها مجاناً.

**🇺🇸 English:**

Claude Code is a CLI tool from Anthropic — a smart coding assistant that works directly in your terminal:
- 📖 Reads and writes files directly
- 🔧 Runs commands on your machine
- 🔍 Reviews and improves code
- 🏗️ Creates complete projects from scratch
- 🐛 Fixes bugs automatically

The official version costs $20/month. This guide teaches you how to use it for free.

---

## ⚡ كيف يشتغل؟ | How does it work?

**🇸🇦 العربي:**

```
Claude Code CLI → بروكسي (localhost:8082) → Ollama → موديل سحابي
```

البروكسي يحاكي واجهة Anthropic API، فـ Claude Code يظن إنه يتكلم مع Anthropic، لكن البروكسي يحوّل الطلب لأي موديل مجاني نختاره.

**🇺🇸 English:**

```
Claude Code CLI → Proxy (localhost:8082) → Ollama → Cloud Model
```

The proxy emulates the Anthropic API, so Claude Code thinks it's talking to Anthropic, but the proxy routes requests to any free model you choose.

---

## 🚀 التثبيت (3 خطوات) | Installation (3 steps)

### الخطوة 1: ثبّت Claude Code CLI | Step 1: Install Claude Code CLI

```bash
npm install -g @anthropic-ai/claude-code
```

### الخطوة 2: ثبّت البروكسي | Step 2: Install the Proxy

```bash
git clone https://github.com/Alishahryar1/free-claude-code.git
cd free-claude-code
pip install uv
uv sync
```

### الخطوة 3: إعداد `.env` | Step 3: Configure `.env`

```bash
cp .env.example .env
```

اختر مزوّدك — انظر التفاصيل بالأسفل | Choose your provider — see details below:

<details>
<summary><b>🟢 Ollama Cloud (مجاني، موصى به | Free, recommended)</b></summary>

**🇸🇦 العربي:** ثبّت Ollama من [ollama.com](https://ollama.com)، ثم أضف في `.env`:

**🇺🇸 English:** Install Ollama from [ollama.com](https://ollama.com), then add to `.env`:

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

> **ملاحظة | Note:** موديلات `:cloud` في Ollama مجانية وتشتغل بدون GPU — العقل في السحابة!
> Cloud models in Ollama are free and run without a GPU — the brain is in the cloud!

</details>

<details>
<summary><b>🔵 NVIDIA NIM (40 طلب/دقيقة مجاناً | 40 req/min free)</b></summary>

**🇸🇦 العربي:** سجّل واحصل مفتاح مجاني من [build.nvidia.com/settings/api-keys](https://build.nvidia.com/settings/api-keys)

**🇺🇸 English:** Register and get a free API key from [build.nvidia.com/settings/api-keys](https://build.nvidia.com/settings/api-keys)

```dotenv
NVIDIA_NIM_API_KEY="nvapi-your-key-here"

MODEL="nvidia_nim/z-ai/glm4.7"
ENABLE_MODEL_THINKING=true
ANTHROPIC_AUTH_TOKEN=freecc
```

</details>

<details>
<summary><b>🟡 OpenRouter (مئات الموديلات المجانية | Hundreds of free models)</b></summary>

**🇸🇦 العربي:** سجّل من [openrouter.ai/keys](https://openrouter.ai/keys)

**🇺🇸 English:** Register at [openrouter.ai/keys](https://openrouter.ai/keys)

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
<summary><b>🔴 DeepSeek (API مباشر | Direct API)</b></summary>

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
<summary><b>🟣 Ollama محلي (بدون إنترنت | Fully local, no internet)</b></summary>

```dotenv
OLLAMA_BASE_URL="http://localhost:11434"
MODEL="ollama/llama3.1"
ANTHROPIC_AUTH_TOKEN=freecc
```

```bash
ollama pull llama3.1
ollama serve
```

> **ملاحظة | Note:** يتطلب GPU قوي أو RAM 8GB+ | Requires a strong GPU or 8GB+ RAM

</details>

<details>
<summary><b>🟤 مزج مزوّدين مختلفين | Mix providers</b></summary>

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

## 🎯 التشغيل | Running

**🇸🇦 العربي:** شغّل البروكسي في تيرمينال، ثم Claude Code في تيرمينال ثاني

**🇺🇸 English:** Start the proxy in one terminal, then Claude Code in another

### شغّل البروكسي | Start the proxy

```bash
cd free-claude-code
uv run uvicorn server:app --host 0.0.0.0 --port 8082
```

### شغّل Claude Code | Start Claude Code

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

### إعداد دائم | Permanent setup

**🇸🇦 العربي:** أضف متغيرات البيئة بشكل دائم عشان ما تكتبها كل مرة

**🇺🇸 English:** Add environment variables permanently so you don't type them every time

**Linux/macOS (~/.bashrc):**
```bash
echo 'export ANTHROPIC_BASE_URL="http://localhost:8082"' >> ~/.bashrc
echo 'export ANTHROPIC_AUTH_TOKEN="freecc"' >> ~/.bashrc
echo 'export ANTHROPIC_API_KEY="freecc"' >> ~/.bashrc
source ~/.bashrc
```

**Windows (PowerShell):**
```powershell
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", "http://localhost:8082", "User")
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN", "freecc", "User")
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", "freecc", "User")
```

---

## 💡 أمثلة استخدام | Usage Examples

**🇸🇦 العربي:** | **🇺🇸 English:**

### محادثة تفاعلية | Interactive session
```bash
cd my-project
claude
```

### طلب واحد | One-shot request
```bash
claude -p "Explain this code"       # اشرح هذا الكود
```

### إنشاء مشروع | Create a project
```bash
mkdir new-project && cd new-project
claude -p "Create a FastAPI API for task management"
# أنشئ API بـ FastAPI لإدارة المهام
```

### مراجعة كود | Code review
```bash
claude -p "Review main.py and suggest improvements"
# راجع main.py واقترح تحسينات
```

### تصحيح خطأ | Fix a bug
```bash
claude -p "There's a bug in app.py — read it and fix it"
# هناك خطأ في app.py — اقرأه وصلحه
```

### كتابة اختبارات | Write tests
```bash
claude -p "Write pytest tests for all functions in utils.py"
# اكتب pytest لكل الدوال في utils.py
```

---

## 🔄 تشغيل تلقائي عند بدء التشغيل | Auto-start on boot

**🇸🇦 العربي:** خلي البروكسي يشتغل تلقائياً مع تشغيل الجهاز

**🇺🇸 English:** Make the proxy start automatically when the machine boots

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

### Windows (Startup folder)
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

## 🤝 Claude Code مع وكلاء AI | Claude Code with AI Agents

**🇸🇦 العربي:**

لو عندك وكيل AI (مثل OpenClaw أو Hermes)، Claude Code يصير **أداة إضافية** قوية:

| الميزة | الوكيل العادي | Claude Code |
|---|---|---|
| كتابة كود | ✅ | ✅ أقوى في المشاريع الكبيرة |
| قراءة ملفات متعددة | ✅ | ✅ أسرع مع مشاريع كبيرة |
| تعديل مباشر للملفات | ✅ | ✅ يستخدم أدوات أكثر |
| تفاعل مستمر | ✅ محادثة | ❌ طلبة واحدة |
| فهم السياق التاريخي | ✅ | ❌ بلا ذاكرة بين الجلسات |

**النمط الأمثل:** الوكيل العادي ينسّق ويرسل مهام برمجية لـ Claude Code.

**🇺🇸 English:**

If you have an AI agent (like OpenClaw or Hermes), Claude Code becomes a **powerful additional tool**:

| Feature | Regular Agent | Claude Code |
|---|---|---|
| Writing code | ✅ | ✅ Stronger on large projects |
| Reading multiple files | ✅ | ✅ Faster with many files |
| Direct file editing | ✅ | ✅ Uses more tools |
| Continuous interaction | ✅ Conversation | ❌ One-shot |
| Historical context | ✅ | ❌ No memory between sessions |

**Optimal pattern:** The regular agent coordinates and sends coding tasks to Claude Code.

---

## 🔵🔴 تجربة حقيقية: OpenClaw + Hermes مع Claude Code

**🇸🇦 العربي:**

نحن نستخدم Claude Code فعلياً على سيرفرنا مع وكيلين ذكاء اصطناعي:

- 🔵 **سعيد (Saeed)** — وكيل OpenClaw على Windows (يخدم صاحبه أبو أحمد عبر Telegram)
- 🔴 **راشد (Hermes)** — وكيل آخر على WSL Linux (يخدم أبو أحمد أيضاً عبر Telegram)

### كيف ربطناهما بـ Claude Code:

**🔵 سعيد (Windows):**
1. ثبّت Claude Code CLI عبر `npm install -g @anthropic-ai/claude-code`
2. ثبّت البروكسي (free-claude-code) مع Ollama كمزوّد
3. وجّه المتغيرات: `ANTHROPIC_BASE_URL=http://localhost:8082`
4. أضاف اختصار في مجلد Startup لتشغيل البروكسي تلقائياً
5. الآن يرسل مهام برمجية مباشرة: `claude -p "اقرأ kronos_predict.py وحسّنه"`

**🔴 راشد (WSL Linux):**
1. نفس التثبيت على WSL مع crontab للتشغيل التلقائي
2. يستخدم نفس Ollama (عبر `localhost:11434` من WSL)
3. يرسل مهام خاصة به: `claude -p "حسّن معالجة الأخطاء في البوت"`

### كيف نتعاون معاً:

**الطريقة 1: مهام مستقلة**
- 🔵 سعيد يطلب من Claude Code تحسين مشروع Kronos (التنبؤات المالية)
- 🔴 راشد يطلب من Claude Code تحسين بوت التليجرام
- كل واحد يستخدم CLI الخاص به

**الطريقة 2: مشاريع مشتركة عبر Shared Vault**
- 🔵 سعيد: `claude -p "أضف مؤشر RSI في shared-vault/projects/kronos/"`
- 🔴 راشد: `claude -p "أضف مؤشر MACD لنفس المشروع واربطه بـ RSI"`
- 🔵 سعيد: يراجع النتيجة ويختبر
- يتواصلان عبر ملفات في مجلد مشترك (Shared Vault)

**الطريقة 3: سعيد ينسّق، Claude Code ينفّذ**
- أبو أحمد يطلب من سعيد: "حسّن أداء Kronos"
- سعيد يحلل المطلوب ويرسل لـ Claude Code: `claude -p "اقرأ kronos_predict.py واقترح 3 تحسينات للأداء"`
- سعيد يراجع الاقتراحات ويطبّقها أو يرسلها لراشد
- راشد يكمّل بـ Claude Code الخاص به

### مثال حقيقي تطبيقناه:

طلب أبو أحمد تحسين `kronos_predict.py`. سعيد أرسل لـ Claude Code:
```bash
claude -p "Read kronos_predict.py and suggest 3 improvements to make the prediction pipeline more efficient."
```

النتيجة — Claude Code اقترح 3 تحسينات وتم تطبيقها:
1. ✅ **تخزين الموديل مؤقتاً** — `load_models()` يستخدم lazy singleton
2. ✅ **إلغاء النسخ المزدوج** — حذف `.copy()` الزائد
3. ✅ **جلب متوازي** — `ThreadPoolExecutor` لجلب بيانات عدة رموز بالتوازي

**🇺🇸 English:**

We actively use Claude Code on our server with two AI agents:

- 🔵 **Saeed (OpenClaw)** — AI agent on Windows (serves Abu Ahmad via Telegram)
- 🔴 **Rashid (Hermes)** — Another AI agent on WSL Linux (also serves Abu Ahmad via Telegram)

### How we connected them to Claude Code:

**🔵 Saeed (Windows):**
1. Installed Claude Code CLI via `npm install -g @anthropic-ai/claude-code`
2. Installed the proxy (free-claude-code) with Ollama as provider
3. Pointed variables: `ANTHROPIC_BASE_URL=http://localhost:8082`
4. Added a shortcut in Startup folder to auto-start the proxy
5. Now sends coding tasks directly: `claude -p "Read kronos_predict.py and improve it"`

**🔴 Rashid (WSL Linux):**
1. Same installation on WSL with crontab for auto-start
2. Uses the same Ollama (via `localhost:11434` from WSL)
3. Sends his own tasks: `claude -p "Improve error handling in the bot"`

### How we collaborate:

**Method 1: Independent tasks**
- 🔵 Saeed asks Claude Code to improve the Kronos project (financial forecasting)
- 🔴 Rashid asks Claude Code to improve the Telegram bot
- Each uses their own CLI instance

**Method 2: Joint projects via Shared Vault**
- 🔵 Saeed: `claude -p "Add RSI indicator in shared-vault/projects/kronos/"`
- 🔴 Rashid: `claude -p "Add MACD indicator and link it with RSI"`
- 🔵 Saeed: reviews and tests the result
- They communicate via files in a shared directory (Shared Vault)

**Method 3: Saeed coordinates, Claude Code executes**
- Abu Ahmad asks Saeed: "Improve Kronos performance"
- Saeed analyzes the request and sends to Claude Code: `claude -p "Read kronos_predict.py and suggest 3 performance improvements"`
- Saeed reviews the suggestions, applies them, or forwards to Rashid
- Rashid continues with his own Claude Code instance

### Real example we implemented:

Abu Ahmad asked to improve `kronos_predict.py`. Saeed sent to Claude Code:
```bash
claude -p "Read kronos_predict.py and suggest 3 improvements to make the prediction pipeline more efficient."
```

Result — Claude Code suggested 3 improvements, all applied:
1. ✅ **Model caching** — `load_models()` uses a lazy singleton
2. ✅ **Remove double copy** — removed redundant `.copy()`
3. ✅ **Parallel fetching** — `ThreadPoolExecutor` for concurrent data fetching

---

## 📊 المزوّدون المدعومون | Supported Providers

| المزوّد | مجاني؟ | يحتاج مفتاح؟ | ملاحظات |
|---|---|---|---|
| Provider | Free? | Key needed? | Notes |
|---|---|---|---|
| **Ollama Cloud** | ✅ | ❌ | أبسط خيار | Simplest option |
| **NVIDIA NIM** | ✅ (40 req/min) | ✅ Free | أقوى خيار مجاني | Strongest free option |
| **OpenRouter** | ✅ (free models) | ✅ Free | أكبر اختيار | Largest selection |
| **DeepSeek** | 💰 Paid | ✅ | رخيص جداً | Very cheap |
| **Ollama Local** | ✅ | ❌ | يحتاج GPU/RAM | Needs GPU/RAM |
| **LM Studio** | ✅ | ❌ | محلي بالكامل | Fully local |
| **llama.cpp** | ✅ | ❌ | محلي بالكامل | Fully local |

---

## ⚠️ ملاحظات | Notes

**🇸🇦 العربي:**
- الموديل البديل (مثل GLM-5.1) مو بنفس ذكاء Claude الأصلي — لكنه يكفي لمعظم المهام
- مجاني بالكامل — لا اشتراك ولا API key (مع Ollama/NVIDIA NIM)
- البروكسي خفيف — ما يستهلك CPU أو RAM تقريباً
- Ollama لازم يكون شغال عشان الموديلات السحابية ترد
- للتفكير العميق فعّل: `ENABLE_MODEL_THINKING=true`

**🇺🇸 English:**
- The substitute model (e.g., GLM-5.1) isn't as smart as real Claude — but sufficient for most tasks
- Completely free — no subscription, no API key (with Ollama/NVIDIA NIM)
- The proxy is lightweight — nearly zero CPU/RAM usage
- Ollama must be running for cloud models to respond
- For deep thinking enable: `ENABLE_MODEL_THINKING=true`

---

## 📁 هيكل الملفات | File Structure

```
free-claude-code/
├── .env                    ← إعداداتك هنا | Your settings here
├── server.py               ← نقطة الدخول | Entry point
├── api/                    ← واجهة API | API interface
│   ├── routes.py           ← مسارات /v1/messages | /v1/messages routes
│   ├── services.py         ← الخدمات | Services
│   └── optimization_handlers.py  ← تحسينات | Optimizations
├── providers/              ← المزوّدون | Providers
│   ├── anthropic_messages.py
│   ├── nvidia_nim/
│   ├── open_router/
│   ├── deepseek/
│   ├── ollama/
│   ├── lmstudio/
│   └── llamacpp/
├── core/                   ← النواة | Core
├── messaging/              ← Discord/Telegram
└── cli/                    ← أدوات CLI | CLI tools
```

---

## 🙏 شكر | Credits

- [Alishahryar1/free-claude-code](https://github.com/Alishahryar1/free-claude-code) — البروكسي | The proxy
- [Anthropic Claude Code](https://github.com/anthropics/claude-code) — CLI الأصلي | Original CLI
- [Ollama](https://ollama.com) — الموديلات السحابية والمحلية | Cloud & local models

---

## 📜 الرخصة | License

MIT License — استخدمه وشاركه بحرية | Use and share freely

---

<div align="center">

**⭐ لو الدليل مفيد، أعط النجمة وشاركه مع أصحابك!**
**⭐ If this guide helped, give it a star and share with friends!**

</div>
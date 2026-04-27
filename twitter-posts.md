🇸🇦 المنشور العربي الأول — الشرح التقني

🤖 Claude Code مجاناً — كيف شغّلنا أداة Anthropic المدفوعة بدون اشتراك

كنت أبحث عن طريقة أستخدم فيها Claude Code CLI بدون ما أدفع $20/شهر، ولقيت مشروع مفتوح المصدر يسوي بروكسي يحاكي واجهة Anthropic API ويحوّل الطلبات لأي موديل مجاني تختاره.

الفكرة بسيطة: بدل ما Claude Code يتكلم مع سيرفرات Anthropic المدفوعة، البروكسي يستقبل الطلب ويبعته لمزوّد مجاني زي Ollama أو NVIDIA NIM أو OpenRouter. الموديل يرد، البروكسي يحوّل الرد لصيغة Claude، والنتيجة تطلع لك كأنك تستخدم Claude الحقيقي.

التثبيت 3 خطوات بس:
1️⃣ ثبّت Claude Code: npm install -g @anthropic-ai/claude-code
2️⃣ ثبّت البروكسي: git clone free-claude-code ثم uv sync
3️⃣ عدّل ملف .env بالمزوّد اللي تبيه

أنا اخترت Ollama كمزوّد لأنه مجاني بالكامل وما يحتاج مفتاح API. الموديلات السحابية في Ollama (:cloud) تشتغل بدون GPU لأن المعالجة تصير في سيرفراتهم.

بعد التثبيت، شغّل البروكسي على بورت 8082، ووجّه Claude Code عليه بمتغيرات البيئة:
ANTHROPIC_BASE_URL=http://localhost:8082
ANTHROPIC_AUTH_TOKEN=freecc

وجربته — اشتغل من أول مرة! أرسلتله طلب "اقرأ kronos_predict.py واقترح 3 تحسينات" وردّ علي بتحسينات عملية:
• تخزين الموديل مؤقتاً عشان ما يعيد تحميله كل مرة
• إلغاء نسخ بيانات مزدوجة
• جلب متوازي لبيانات عدة رموز مالية

طبعاً الموديل البديل (GLM-5.1) مو بنفس ذكاء Claude الأصلي، لكنه يكفي لمعظم المهام البرمجية. والجميل إنك تقدر تبدل بين المزوّدين بتعديل سطر واحد في .env.

المزوّدين المدعومين:
• Ollama Cloud — مجاني بدون مفتاح
• NVIDIA NIM — 40 طلب/دقيقة مجاناً
• OpenRouter — مئات الموديلات المجانية
• DeepSeek — API رخيص
• LM Studio و llama.cpp — تشغيل محلي بالكامل

كما خليت البروكسي يشتغل تلقائي مع تشغيل السيرفر عن طريق اختصار في مجلد Startup على Windows أو crontab على Linux.

التفاصيل الكاملة والأكواد في المستودع 👇

🔗 github.com/leecoin06-commits/free-claude-code-arabic-english-work-with-openclaw-and-hermes-guide

#ClaudeCode #AI #FreeAI #Ollama #OpenSource #برمجة #ذكاء_اصطناعي

---

🇸🇦 المنشور العربي الثاني — التجربة مع OpenClaw و Hermes

🤖 كيف يشتغل Claude Code مع وكيلين ذكاء اصطناعي؟ تجربة حقيقية

عندنا على السيرفر وكيلين AI:
🔵 سعيد (OpenClaw) — يشتغل على Windows ويخدمني عبر Telegram
🔴 راشد (Hermes) — يشتغل على WSL Linux ويخدمّني بعد

ركّبنا Claude Code على السيرفر وربطناه بالوكيلين. الفكرة إن كل وكيل يقدر يرسل مهام برمجية لـ Claude Code مباشرة ويستفيد من قدراته في كتابة ومراجعة الكود.

كيف ربطناهما:

🔵 سعيد على Windows:
ثبّت Claude Code CLI عبر npm، ثبّت البروكسي مع Ollama، وجّه المتغيرات للبروكسي على localhost:8082، وأضاف اختصار في Startup عشان البروكسي يشتغل تلقائياً. الآن سعيد يرسل مهام زي:
claude -p "اقرأ kronos_predict.py وحسّنه"

🔴 راشد على WSL Linux:
نفس التثبيت بس على Linux، مع crontab للتشغيل التلقائي. راشد يستخدم نفس Ollama لأن WSL يقدر يوصل localhost:11434 على Windows.

طرق التعاون بيننا:

1️⃣ مهام مستقلة — كل وكيل يرسل مهام برمجية مستقلة لـ Claude Code الخاص به. سعيد يحسّن مشروع Kronos، راشد يحسّن البوت.

2️⃣ مشاريع مشتركة عبر Shared Vault — مجلد مشترك بين الوكيلين. سعيد يطلب من Claude Code يضيف مؤشر RSI، راشد يضيف MACD ويربطه. يتواصلان عبر ملفات في المجلد المشترك.

3️⃣ سعيد ينسّق و Claude Code ينفّذ — أبو أحمد يطلب من سعيد "حسّن أداء Kronos"، سعيد يحلل المطلوب ويستخدم Claude Code كأداة إضافية، يراجع النتائج ويطبّقها.

مثال حقيقي:
طلب أبو أحمد تحسين kronos_predict.py. سعيد أرسل لـ Claude Code طلب تحليل الكود، وجاء بثلاثة اقتراحات عملية، وتم تطبيقها كلها:
• Model caching — تحميل الموديل مرة واحدة فقط
• إزالة نسخ البيانات المزدوج
• Parallel fetching — جلب بيانات عدة عملات بالتوازي

الخلاصة: Claude Code يصير أداة إضافية قوية لأي وكيل AI. الوكيل العادي ينسّق ويفهم السياق، و Claude Code ينفّذ المهام البرمجية المعقدة. الاثنين معاً أقوى من أي واحد منهما لوحده.

المستودع فيه كل التفاصيل والأكواد 👇

🔗 github.com/leecoin06-commits/free-claude-code-arabic-english-work-with-openclaw-and-hermes-guide

#OpenClaw #Hermes #AI #ClaudeCode #تداول #برمجة #ذكاء_اصطناعي

---

🇺🇸 English Post — Technical Deep Dive

🤖 How We Made Claude Code Free — And Connected It to Two AI Agents

I wanted to use Claude Code CLI without paying $20/month. Found an open-source project that creates a proxy emulating the Anthropic API and routing requests to free models. The concept is simple: instead of Claude Code talking to Anthropic's paid servers, the proxy intercepts requests and forwards them to a free provider like Ollama, NVIDIA NIM, or OpenRouter. The model responds, the proxy converts the response to Claude format, and you get results as if you're using real Claude.

3-step installation:
1️⃣ Install Claude Code: npm install -g @anthropic-ai/claude-code
2️⃣ Install proxy: git clone free-claude-code then uv sync
3️⃣ Configure .env with your preferred provider

I chose Ollama as provider — completely free, no API key needed. Cloud models (:cloud) in Ollama run without GPU since processing happens on their servers. After setup, start the proxy on port 8082 and point Claude Code to it:
ANTHROPIC_BASE_URL=http://localhost:8082
ANTHROPIC_AUTH_TOKEN=freecc

Tested it — worked on first try! Sent "Read kronos_predict.py and suggest 3 improvements" and got practical suggestions:
• Model caching with lazy singleton to avoid reloading
• Removing redundant DataFrame copies
• Parallel data fetching with ThreadPoolExecutor

The substitute model (GLM-5.1) isn't as smart as real Claude, but sufficient for most coding tasks. Best part? You can switch providers by changing one line in .env.

Supported providers:
• Ollama Cloud — free, no API key
• NVIDIA NIM — 40 req/min free
• OpenRouter — hundreds of free models
• DeepSeek — cheap API
• LM Studio & llama.cpp — fully local

But here's where it gets interesting. We have TWO AI agents running on our server:
🔵 Saeed (OpenClaw) on Windows — serves me via Telegram
🔴 Rashid (Hermes) on WSL Linux — also serves me via Telegram

Both connected to Claude Code. Saeed uses it on Windows (Startup shortcut for auto-start), Rashid uses it on WSL (crontab for auto-start). They share the same Ollama instance since WSL can reach localhost:11434 on Windows.

We collaborate in 3 ways:
1️⃣ Independent tasks — each agent sends coding tasks to their own Claude Code instance
2️⃣ Joint projects via Shared Vault — Saeed adds RSI indicator, Rashid adds MACD, both communicate through a shared directory
3️⃣ Saeed coordinates, Claude Code executes — I ask Saeed to improve Kronos, he uses Claude Code as an additional tool, reviews results and applies them

Real example: I asked to improve kronos_predict.py. Saeed sent it to Claude Code, got 3 practical suggestions, and we applied all of them. The code now loads models once, removes redundant copies, and fetches data in parallel.

Claude Code becomes a powerful additional tool for any AI agent. The regular agent handles context and coordination, while Claude Code handles complex coding tasks. Together, they're stronger than either alone.

Full repo with all code and setup guides 👇

🔗 github.com/leecoin06-commits/free-claude-code-arabic-english-work-with-openclaw-and-hermes-guide

#ClaudeCode #FreeAI #Ollama #OpenClaw #Hermes #AIAgents #OpenSource #Coding
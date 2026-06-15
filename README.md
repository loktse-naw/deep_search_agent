# 深度研究助手 (Deep Research Agent)

基于 HelloAgents 框架的深度研究助手，结合多轮智能检索与总结，实时呈现洞见与引用。

## 🎯 功能特性

- 🔍 多源搜索：支持 DuckDuckGo、Tavily、Perplexity、SearXNG
- 🤖 智能规划：自动分解研究任务
- 📝 实时总结：流式输出研究进展
- 📊 结构化报告：生成完整的研究报告
- 💾 笔记管理：自动保存研究过程和结果

## 🏗️ 技术栈

**后端:**
- FastAPI (Web框架)
- HelloAgents (LLM编排框架)
- Python 3.10+

**前端:**
- Vue 3 + TypeScript
- Vite
- Server-Sent Events (实时通信)

## 📋 环境要求

- Python 3.10+ (建议 3.11 或 3.12，避免使用 3.14 beta)
- Node.js 18+
- DeepSeek API Key 或其他兼容 OpenAI API 的 LLM 服务

## 🚀 快速开始

### 1. 后端安装

```powershell
cd backend

# 安装依赖
pip install fastapi uvicorn hello-agents tavily-python python-dotenv requests openai ddgs loguru

# 配置环境变量
# 编辑 .env 文件，设置你的 API 密钥
```

**重要提示**: 本项目已修复了 `.env` 文件加载问题，`config.py` 中已添加 `load_dotenv()`。

### 2. 前端安装

```powershell
cd frontend

# 安装依赖
npm install

# 修复安全漏洞（可选）
npm audit fix
```

### 3. 启动服务

**后端启动 (使用启动脚本):**
```powershell
cd backend
.\start.ps1
```

**或者手动启动:**
```powershell
cd backend
$env:HTTP_PROXY=''; $env:HTTPS_PROXY=''; $env:ALL_PROXY=''; $env:NO_PROXY='*'
$env:PYTHONIOENCODING='utf-8'
python src/main.py
```

**前端启动:**
```powershell
cd frontend
.\start.ps1
```

**或者:**
```powershell
cd frontend
npm run dev
```

### 4. 访问应用

- 前端界面: http://localhost:5173
- 后端API: http://localhost:8000
- API文档: http://localhost:8000/docs

## ⚙️ 配置说明

编辑 `backend/.env` 文件：

```env
# LLM 配置
LLM_PROVIDER=custom          # 选项: ollama, lmstudio, custom
LLM_MODEL_ID=deepseek-chat   # 模型名称
LLM_API_KEY=your-api-key     # API密钥
LLM_BASE_URL=https://api.deepseek.com/v1  # API地址

# 搜索配置
SEARCH_API=duckduckgo        # 选项: duckduckgo, tavily, perplexity, searxng

# 研究配置
MAX_WEB_RESEARCH_LOOPS=3     # 研究迭代次数
FETCH_FULL_PAGE=True         # 是否获取完整页面内容
```

## 🔧 已知问题及解决方案

### 问题1: Connection error - LLM调用失败

**原因**: Windows 系统代理干扰 Python 网络请求

**解决方案**:
1. 使用提供的 `start.ps1` 启动脚本（已自动清除代理）
2. 或手动清除代理环境变量:
```powershell
$env:HTTP_PROXY=''; $env:HTTPS_PROXY=''; $env:ALL_PROXY=''; $env:NO_PROXY='*'
```

### 问题2: UnicodeEncodeError - GBK编码错误

**原因**: Windows 控制台默认使用 GBK 编码

**解决方案**: 设置环境变量
```powershell
$env:PYTHONIOENCODING='utf-8'
```

### 问题3: .env 文件配置不生效

**状态**: ✅ 已修复

`config.py` 中已添加 `load_dotenv()`，现在可以正确加载 `.env` 文件。

### 问题4: FastAPI DeprecationWarning

**警告**: `@app.on_event("startup")` 已弃用

**影响**: 不影响功能，仅显示警告

**建议**: 未来版本可改用 `lifespan` 上下文管理器

### 问题5: 前端安全漏洞

**状态**: 可选修复

运行 `npm audit fix` 可修复大部分漏洞。

## 📁 项目结构

```
deep_search_agent/
├── backend/
│   ├── src/
│   │   ├── main.py          # FastAPI 入口
│   │   ├── config.py        # 配置管理 (已修复 dotenv)
│   │   ├── agent.py         # 研究协调器
│   │   ├── models.py        # 数据模型
│   │   ├── prompts.py       # 提示词模板
│   │   └── services/        # 服务模块
│   ├── .env                 # 环境配置
│   ├── .env.example         # 配置模板
│   ├── pyproject.toml       # 依赖定义
│   └── start.ps1            # 启动脚本 (新增)
└── frontend/
    ├── src/
    │   ├── App.vue          # 主组件
    │   ├── main.ts          # 入口文件
    │   └── services/
    │       └── api.ts       # API 客户端
    ├── package.json
    └── start.ps1            # 启动脚本 (新增)
```

## 🐛 故障排除

### 后端无法连接到 LLM

1. 检查 `.env` 文件是否存在且配置正确
2. 确认 API 密钥有效
3. 清除系统代理设置
4. 检查网络连接

### 前端无法连接后端

1. 确认后端已启动 (http://localhost:8000)
2. 检查 `frontend/.env.local` 中的 `VITE_API_BASE_URL`
3. 查看浏览器控制台错误信息

### Python 模块导入错误

```powershell
# 重新安装依赖
pip install --force-reinstall fastapi hello-agents uvicorn[standard]
```

## 🔒 安全建议

1. **不要提交 .env 文件到版本控制**
   - 将 `.env` 添加到 `.gitignore`
   
2. **定期更新 API 密钥**
   - 如果密钥泄露，立即撤销并重新生成

3. **修复前端漏洞**
   ```bash
   npm audit fix
   ```

4. **限制 CORS 来源** (生产环境)
   - 编辑 `backend/src/main.py`，将 `allow_origins=["*"]` 改为具体域名

## 📝 更新日志

### 2026-06-15
- ✅ 修复: 添加 `load_dotenv()` 到 `config.py`
- ✅ 新增: 后端和前端启动脚本 (`start.ps1`)
- ✅ 修复: 代理环境变量干扰问题
- ✅ 文档: 添加完整的 README

## 📄 许可证

MIT License

## 🙏 致谢

- [HelloAgents](https://github.com/helloagents/helloagents) - LLM 编排框架
- [FastAPI](https://fastapi.tiangolo.com/) - Web 框架
- [Vue.js](https://vuejs.org/) - 前端框架

---

如有问题或建议，欢迎提交 Issue。

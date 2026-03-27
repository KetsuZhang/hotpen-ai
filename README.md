# HotPen AI 🖊️

> AI 驱动的热点内容智能生产平台

## 功能特性

- 🔥 **多领域热点抓取** - 科技、财经、娱乐、社会、AI 五大领域
- 🔍 **深度研究** - 多轮检索 + 学术论文引用
- ✍️ **智能撰写** - 公众号长文 + 小红书文案
- 🚀 **一键发布** - 多平台发布支持

## 项目结构

```
hotpen-ai/
├── docs/                    # 项目文档
│   ├── HotPen-AI-需求分析.md
│   └── HotPen-AI-技术设计.md
│
├── agents/                   # Agent 配置 (14个)
│   ├── trackers/           # 热点抓取 (5个)
│   ├── aggregator/         # 聚合器
│   ├── researcher/         # 研究 Agent
│   ├── writer/             # 撰写 Agent
│   ├── publisher/          # 发布 Agent
│   ├── scheduler/          # 调度 Agent
│   ├── backend/            # 后端代码开发
│   ├── frontend/           # 前端代码开发
│   ├── testagent/           # 测试代码开发
│   └── qagent/             # 代码质检
│
├── code/                    # 源代码目录
│
└── README.md
```

## Agents 清单

| Agent | 职责 | Emoji |
|-------|------|-------|
| HotTracker-Tech | 科技热点抓取 | 🔥 |
| HotTracker-Finance | 财经热点抓取 | 💰 |
| HotTracker-Entertainment | 娱乐热点抓取 | 🎬 |
| HotTracker-Social | 社会热点抓取 | 📰 |
| HotTracker-AI | AI 热点抓取 | 🤖 |
| Aggregator | 热点聚合与评分 | 🔄 |
| Researcher | 深度研究 | 🔍 |
| Writer | 内容生成 | ✍️ |
| Publisher | 多平台发布 | 🚀 |
| Scheduler | 任务调度 | ⏰ |
| Backend | 后端代码开发 | 🐍 |
| Frontend | 前端代码开发 | 🎨 |
| TestAgent | 测试代码开发 | 🧪 |
| QAgent | 代码质检 | ✅ |

## 技术栈

- **Agent 编排**: OpenClaw
- **后端**: Python + FastAPI
- **前端**: Vue 3 + Element Plus
- **数据库**: SQLite (开发) / PostgreSQL (生产)

## 快速开始

```bash
# 克隆项目
git clone https://github.com/KetsuZhang/hotpen-ai.git

# 安装后端依赖
pip install -r code/backend/requirements.txt

# 启动服务
cd code/backend
python -m uvicorn app.main:app --reload
```

## 文档

- [需求分析](./docs/HotPen-AI-需求分析.md)
- [技术设计](./docs/HotPen-AI-技术设计.md)

---

MIT License - Made with ❤️ by OpenClaw

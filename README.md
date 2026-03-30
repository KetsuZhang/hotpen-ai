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
├── agents/                   # Agent 配置 (12个)
│   ├── pipeline/            # 内容生产线 (8个)
│   │   ├── hottracker-tech/        # 📱 科技热点
│   │   ├── hottracker-finance/    # 💹 财经热点
│   │   ├── hottracker-entertainment/ # 🎬 娱乐热点
│   │   ├── hottracker-social/    # 📰 社会热点
│   │   ├── hottracker-ai/        # 🤖 AI热点
│   │   ├── researcher/           # 🔬 深度研究
│   │   ├── writer/              # ✍️ 内容撰写
│   │   └── publisher/           # 📤 多平台发布
│   │
│   └── dev/                  # 开发团队 (4个)
│       ├── architect/              # 🏗️ 架构设计
│       ├── backend/               # ⚙️ 后端开发
│       ├── frontend/              # 🎨 前端开发
│       └── qa/                   # 🔍 代码质检
│
├── shared/                   # 共享资源
│   ├── config.yaml          # 配置文件
│   └── database.sql         # 数据库初始化
│
├── data/                    # 数据目录
│   ├── raw/                 # 原始热点
│   ├── researched/          # 研究报告
│   ├── drafts/             # 待发布草稿
│   └── published/          # 已发布
│
├── code/                    # 源代码目录
│   └── hotpen-ai/
│       ├── backend/         # Python + FastAPI
│       └── frontend/       # Vue 3 + Element Plus
│
├── docs/                    # 项目文档
│   ├── HotPen-AI-需求分析.md
│   └── HotPen-AI-技术设计.md
│
└── README.md
```

## Agents 清单

### 内容生产线 (8个)

| Agent | 职责 | Emoji | 运行方式 |
|-------|------|-------|----------|
| HotTracker-Tech | 科技热点抓取 | 📱 | Cron 定时 |
| HotTracker-Finance | 财经热点抓取 | 💹 | Cron 定时 |
| HotTracker-Entertainment | 娱乐热点抓取 | 🎬 | Cron 定时 |
| HotTracker-Social | 社会热点抓取 | 📰 | Cron 定时 |
| HotTracker-AI | AI 热点抓取 | 🤖 | Cron 定时 |
| Researcher | 深度研究 | 🔬 | Cron 定时 |
| Writer | 内容生成 | ✍️ | Cron 定时 |
| Publisher | 多平台发布 | 📤 | 触发/定时 |

### 开发团队 (4个)

| Agent | 职责 | Emoji | 技术栈 |
|-------|------|-------|--------|
| Architect | 架构设计 | 🏗️ | - |
| Backend | 后端开发 | ⚙️ | Python + FastAPI |
| Frontend | 前端开发 | 🎨 | Vue 3 + Element Plus |
| QA | 代码质检 | 🔍 | pytest, ruff |

## 技术栈

- **Agent 编排**: OpenClaw
- **数据库**: SQLite (开发) / PostgreSQL (生产)
- **后端**: Python + FastAPI
- **前端**: Vue 3 + Element Plus

## 数据流

```
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  HotTrackers │───▶│  Researcher  │───▶│    Writer    │
│  (Cron 定时) │    │  (Cron 定时) │    │  (Cron 定时) │
└──────────────┘    └──────────────┘    └──────────────┘
        │                   │                   │
        ▼                   ▼                   ▼
   status=raw      status=researched    status=written
                                              │
                                              ▼
                                       ┌──────────────┐
                                       │   Publisher  │
                                       │  (触发/定时) │
                                       └──────────────┘
                                              │
                                              ▼
                                       status=published
```

## 快速开始

```bash
# 克隆项目
git clone https://github.com/KetsuZhang/hotpen-ai.git

# 初始化数据库
sqlite3 shared/hotpen-ai.db < shared/database.sql

# 启动后端服务
cd code/hotpen-ai/backend
pip install -r requirements.txt
uvicorn app.main:app --reload
```

## 文档

- [需求分析](./docs/HotPen-AI-需求分析.md)
- [技术设计](./docs/HotPen-AI-技术设计.md)

---

MIT License - Made with ❤️ by OpenClaw

# HotPen AI - 技术设计文档

**项目名称**：HotPen AI (热点笔耕)

**版本**：v1.0

**日期**：2026-03-26

---

## 一、技术架构设计

### 1.1 整体架构

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              HotPen AI 技术架构                              │
├─────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                         调度层 (Scheduler)                          │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    │                                        │
│                                    ▼                                        │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                       Agent 编排层 (OpenClaw)                        │   │
│  │   ┌─────────────┐ ┌─────────────┐ ┌─────────────┐              │   │
│  │   │ HotTracker │ │ Researcher  │ │   Writer    │              │   │
│  │   │   Agents    │ │   Agent     │ │   Agent     │              │   │
│  │   └─────────────┘ └─────────────┘ └─────────────┘              │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    │                                        │
│                                    ▼                                        │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                         服务层 (Services)                            │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    │                                        │
│                                    ▼                                        │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                         数据层 (Data Layer)                          │   │
│  │   ┌─────────────┐  ┌─────────────┐                               │   │
│  │   │   SQLite    │  │   Redis     │                               │   │
│  │   └─────────────┘  └─────────────┘                               │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 1.2 技术栈选型

| 层级 | 技术选型 | 说明 |
|------|----------|------|
| **运行时** | OpenClaw | 多 Agent 编排与调度 |
| **语言** | Python | ≥3.10 |
| **数据库** | SQLite | 开发阶段数据存储 |
| **缓存** | Redis | 任务队列、热点缓存 |
| **后端框架** | FastAPI | 高性能 API |
| **前端框架** | Vue 3 | 管理后台 |

---

## 二、数据模型设计

### 2.1 核心表结构

```sql
-- 热点事件表
CREATE TABLE hot_events (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    summary TEXT,
    source TEXT NOT NULL,
    domain TEXT NOT NULL,
    hot_score INTEGER DEFAULT 0,
    status TEXT DEFAULT 'pending',
    discovered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 内容表
CREATE TABLE contents (
    id TEXT PRIMARY KEY,
    event_id TEXT NOT NULL,
    wechat_title TEXT,
    wechat_body TEXT,
    wechat_publish_status TEXT DEFAULT 'draft',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 发布记录表
CREATE TABLE publications (
    id TEXT PRIMARY KEY,
    content_id TEXT NOT NULL,
    platform TEXT NOT NULL,
    status TEXT DEFAULT 'pending'
);
```

---

## 三、Agent 清单

### 3.1 业务层 Agents

| Agent | 职责 | 位置 |
|-------|------|------|
| HotTracker-Tech | 科技热点抓取 | agents/trackers/tech/ |
| HotTracker-Finance | 财经热点抓取 | agents/trackers/finance/ |
| HotTracker-Entertainment | 娱乐热点抓取 | agents/trackers/entertainment/ |
| HotTracker-Social | 社会热点抓取 | agents/trackers/social/ |
| HotTracker-AI | AI 热点抓取 | agents/trackers/ai/ |
| Aggregator | 热点聚合与评分 | agents/aggregator/ |
| Researcher | 深度研究 + 论文引用 | agents/researcher/ |
| Writer | 内容生成 | agents/writer/ |
| Publisher | 多平台发布 | agents/publisher/ |
| Scheduler | 任务调度 | agents/scheduler/ |

### 3.2 代码层 Agents

| Agent | 职责 | 技术栈 |
|-------|------|--------|
| Backend | 后端代码开发 | Python + FastAPI |
| Frontend | 前端代码开发 | Vue 3 + Element Plus |
| TestAgent | 测试代码开发 | pytest |
| QAgent | 代码质检 | ruff + mypy |

---

## 四、工作流设计

```
Cron → HotTrackers (5个) → Aggregator → [分数≥70] → Researcher → Writer → Review → Publisher
```

---

## 五、开发计划

| 阶段 | 任务 |
|------|------|
| Phase 1 | 基础框架 + 热点抓取 |
| Phase 2 | 研究 Agent + 撰写 Agent |
| Phase 3 | 发布对接 + 审核工作流 |
| Phase 4 | 前端开发 + 测试 |

---

*本文档将根据开发进展持续更新*

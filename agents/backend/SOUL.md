# Backend Agent

你是后端开发 Agent，负责开发 HotPen AI 后端服务。

## 技术栈

- Python 3.10+
- FastAPI
- SQLAlchemy
- Pydantic
- SQLite (开发) / PostgreSQL (生产)

## 项目结构

```
code/backend/
├── app/
│   ├── __init__.py
│   ├── main.py          # FastAPI 应用入口
│   ├── config.py         # 配置
│   ├── models/           # SQLAlchemy 模型
│   ├── schemas/          # Pydantic 模型
│   ├── routers/          # API 路由
│   └── services/          # 业务逻辑
├── tests/                 # 测试
├── requirements.txt
└── .env.example
```

## 数据库模型

- HotEvent: 热点事件
- Content: 内容
- Review: 审核记录
- Publication: 发布记录
- Source: 数据源配置

## API 设计

| 方法 | 路由 | 说明 |
|------|------|------|
| GET | /api/events | 热点列表 |
| POST | /api/events | 创建热点 |
| POST | /api/events/{id}/research | 触发生成 |
| GET | /api/contents | 内容列表 |
| POST | /api/contents/{id}/review | 提交审核 |
| POST | /api/contents/{id}/publish | 发布内容 |

## 代码规范

- PEP 8
- 类型注解
- async/await
- 错误处理和日志

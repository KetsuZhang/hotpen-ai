# Frontend Agent

你是前端开发 Agent，负责开发 HotPen AI 管理后台。

## 技术栈

- Vue 3 + Vite
- Element Plus
- TypeScript
- Pinia
- Vue Router

## 项目结构

```
code/frontend/
├── src/
│   ├── api/              # API 请求
│   ├── components/       # 通用组件
│   ├── views/           # 页面
│   │   ├── Dashboard    # 首页
│   │   ├── Events       # 热点管理
│   │   ├── Contents     # 内容管理
│   │   ├── Reviews      # 审核管理
│   │   └── Settings     # 系统设置
│   ├── router/           # 路由
│   └── stores/          # 状态管理
├── package.json
└── vite.config.ts
```

## 页面设计

1. **Dashboard** - 统计面板、近期热点
2. **Events** - 热点列表、热度分数、触发状态
3. **Contents** - 文章列表、预览、编辑
4. **Reviews** - 审核操作（通过/驳回）
5. **Publish** - 发布状态、发布历史

## API 对接

- 热点事件 CRUD
- 内容管理
- 审核流程
- 发布管理
- 统计数据

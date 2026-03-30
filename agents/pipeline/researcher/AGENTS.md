# AGENTS.md

## Session Start

- Read `SOUL.md`
- 读取待研究热点：`SELECT * FROM hotspots WHERE status='raw' ORDER BY hot_score DESC LIMIT 5`

## 职责

1. 查询数据库中状态为 'raw' 的热点
2. 对每个热点进行深度研究：
   - 检索相关论文、报告、数据
   - 整理背景信息、关键数据
   - 列出引用来源
3. 写入研究结果到 `research` 表
4. 更新热点状态 `status='researched'`

## 工作流程

```
查询 status='raw' 热点 → 深度检索 → 写入 research 表 → 更新 status='researched'
```

## 输出格式

写入 research 表：
- event_id: 热点ID
- background: 背景信息
- key_data: 关键数据
- references: 引用来源 (JSON)
- status: 'completed'

## Safety

- 只做研究和写数据，不修改其他系统

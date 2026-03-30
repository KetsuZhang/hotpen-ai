# AGENTS.md

## Session Start

- Read `SOUL.md`

## 职责

1. 查询数据库中状态为 'researched' 的热点
2. 读取对应的研究结果
3. 撰写文章（公众号格式）
4. 写入 `drafts` 表
5. 更新热点状态 `status='written'`

## 工作流程

```
查询 status='researched' 热点 → 读取研究结果 → 撰写文章 → 写入 drafts 表 → 更新 status='written'
```

## 输出格式

写入 drafts 表：
- event_id: 热点ID
- title: 文章标题
- body: 文章正文
- platform: 'wechat'
- status: 'draft'

## Safety

- 只写内容到数据库，不直接发布

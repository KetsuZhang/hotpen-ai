# AGENTS.md

## Session Start

- Read `SOUL.md`
- 读取共享配置 `../../shared/config.yaml`

## 职责

1. 定时抓取科技领域热点
2. 解析标题、摘要、来源、URL
3. 写入数据库 `status='raw'`
4. 标记热点分数（hot_score 1-100）

## 工作流程

```
Cron 触发 → 抓取各科技媒体 → 解析内容 → 去重 → 写入 hotspots 表 → 设置 status='raw'
```

## 输出格式

写入数据库字段：
- title: 热点标题
- summary: 热点摘要
- source: 来源网站
- source_url: 原文链接
- category: 'tech'
- hot_score: 热度评分 (1-100)
- status: 'raw'
- discovered_at: 发现时间

## Safety

- 只读抓取，不执行任何写操作到外部系统
- 异常写入日志，不中断流程

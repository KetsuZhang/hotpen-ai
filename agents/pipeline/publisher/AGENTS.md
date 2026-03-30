# AGENTS.md

## Session Start

- Read `SOUL.md`
- 读取共享配置 `../../shared/config.yaml` 获取公众号API凭证

## 职责

1. 查询数据库中状态为 'written' 的草稿
2. 调用公众号API发布文章
3. 更新发布状态
4. 记录发布结果到 `publications` 表
5. 更新热点状态 `status='published'`

## 工作流程

```
查询 status='written' 草稿 → 调用公众号API发布 → 记录结果 → 更新 status='published'
```

## 输出格式

写入 publications 表：
- content_id: 草稿ID
- platform: 'wechat'
- status: 'published' / 'failed'
- published_at: 发布时间

## Safety

- 发布前确认内容已审核
- 失败重试不超过3次
- 异常写入日志并告警

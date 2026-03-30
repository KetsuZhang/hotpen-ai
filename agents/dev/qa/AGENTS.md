# AGENTS.md

## 职责

1. 接收 PR 通知
2. Code Review：代码规范、安全性、可维护性
3. 运行测试，确保通过
4. 输出 Review 意见
5. 标记代码评审状态

## 工作流程

```
接收 PR → Code Review → 运行测试 → 输出意见 → 标记状态
```

## 输出

- Review 意见写入数据库 `code_reviews` 表
- 问题标记：pending/approved/rejected

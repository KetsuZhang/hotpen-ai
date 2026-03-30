-- HotPen AI 数据库初始化脚本

-- 热点事件表
CREATE TABLE IF NOT EXISTS hotspots (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    summary TEXT,
    source TEXT,
    source_url TEXT,
    category TEXT NOT NULL,
    hot_score INTEGER DEFAULT 0,
    status TEXT DEFAULT 'raw',
    discovered_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 研究结果表
CREATE TABLE IF NOT EXISTS research (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    event_id INTEGER NOT NULL,
    background TEXT,
    key_data TEXT,
    references TEXT,
    status TEXT DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (event_id) REFERENCES hotspots(id)
);

-- 草稿表
CREATE TABLE IF NOT EXISTS drafts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    event_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    body TEXT,
    platform TEXT DEFAULT 'wechat',
    status TEXT DEFAULT 'draft',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (event_id) REFERENCES hotspots(id)
);

-- 发布记录表
CREATE TABLE IF NOT EXISTS publications (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content_id INTEGER NOT NULL,
    platform TEXT NOT NULL,
    status TEXT DEFAULT 'pending',
    published_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (content_id) REFERENCES drafts(id)
);

-- 代码评审表
CREATE TABLE IF NOT EXISTS code_reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    agent TEXT NOT NULL,
    pr_link TEXT,
    status TEXT DEFAULT 'pending',
    issues TEXT,
    reviewed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 索引
CREATE INDEX IF NOT EXISTS idx_hotspots_status ON hotspots(status);
CREATE INDEX IF NOT EXISTS idx_hotspots_category ON hotspots(category);
CREATE INDEX IF NOT EXISTS idx_drafts_status ON drafts(status);
CREATE INDEX IF NOT EXISTS idx_publications_status ON publications(status);

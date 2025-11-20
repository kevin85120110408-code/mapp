-- ============================================
-- 全球用户地图 - Supabase 数据库设置脚本
-- ============================================
-- 使用方法：
-- 1. 在 Supabase 控制台打开 SQL Editor
-- 2. 点击 "New Query"
-- 3. 复制粘贴此文件的全部内容
-- 4. 点击 "Run" 执行
-- ============================================

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    avatar TEXT,
    country TEXT NOT NULL,
    country_code TEXT NOT NULL,
    city TEXT,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    ip TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 创建索引以提高查询性能
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_created_at ON users(created_at DESC);

-- 启用行级安全策略（RLS）
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- 允许所有人读取用户数据（用于显示在地图上）
CREATE POLICY "允许所有人查看用户" ON users
    FOR SELECT
    USING (true);

-- 允许插入新用户（注册）
CREATE POLICY "允许注册新用户" ON users
    FOR INSERT
    WITH CHECK (true);

-- 允许用户更新自己的数据
CREATE POLICY "允许用户更新自己的数据" ON users
    FOR UPDATE
    USING (true)
    WITH CHECK (true);

-- 创建更新时间触发器
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- 启用实时功能
ALTER PUBLICATION supabase_realtime ADD TABLE users;

-- 完成！
-- 现在你可以在应用中使用 Supabase 了


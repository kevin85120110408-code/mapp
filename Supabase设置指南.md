# 🚀 Supabase 实时功能设置指南

## 📋 目录
1. [创建 Supabase 项目](#1-创建-supabase-项目)
2. [设置数据库](#2-设置数据库)
3. [配置应用](#3-配置应用)
4. [测试实时功能](#4-测试实时功能)

---

## 1. 创建 Supabase 项目

### 步骤 1.1：注册账号
1. 访问 https://supabase.com/
2. 点击 **"Start your project"**
3. 使用 GitHub 账号登录（推荐）或邮箱注册

### 步骤 1.2：创建新项目
1. 点击 **"New Project"**
2. 填写项目信息：
   - **Name**: `globe-users`（或任意名称）
   - **Database Password**: 设置一个强密码（保存好！）
   - **Region**: 选择 **Northeast Asia (Tokyo)** 或 **Southeast Asia (Singapore)**（离中国最近）
   - **Pricing Plan**: 选择 **Free**（免费版足够使用）
3. 点击 **"Create new project"**
4. 等待 1-2 分钟，项目创建完成

---

## 2. 设置数据库

### 步骤 2.1：运行 SQL 脚本
1. 在 Supabase 控制台，点击左侧菜单 **"SQL Editor"**
2. 点击 **"New Query"**
3. 打开项目中的 `setup-supabase.sql` 文件
4. **复制全部内容**，粘贴到 SQL Editor
5. 点击右下角 **"Run"** 按钮
6. 看到 ✅ **"Success. No rows returned"** 表示成功

### 步骤 2.2：验证表创建
1. 点击左侧菜单 **"Table Editor"**
2. 应该看到 `users` 表
3. 点击 `users` 表，查看列结构：
   - `id` (uuid)
   - `username` (text)
   - `email` (text)
   - `password_hash` (text)
   - `avatar` (text)
   - `country` (text)
   - `country_code` (text)
   - `city` (text)
   - `latitude` (float8)
   - `longitude` (float8)
   - `ip` (text)
   - `created_at` (timestamptz)
   - `updated_at` (timestamptz)

---

## 3. 配置应用

### 步骤 3.1：获取 API 密钥
1. 在 Supabase 控制台，点击左下角 **⚙️ Settings**
2. 点击 **"API"**
3. 找到以下信息：
   - **Project URL**: `https://xxxxx.supabase.co`
   - **anon public**: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`（很长的字符串）

### 步骤 3.2：更新配置文件
1. 打开项目中的 `supabase-config.js` 文件
2. 替换配置：

```javascript
const SUPABASE_CONFIG = {
    // 替换为你的 Project URL
    URL: 'https://xxxxx.supabase.co',
    
    // 替换为你的 anon public key
    ANON_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'
};
```

3. 保存文件

---

## 4. 测试实时功能

### 步骤 4.1：启动应用
1. 打开 `index.html`（双击或用浏览器打开）
2. 按 **F12** 打开开发者工具
3. 切换到 **Console** 标签
4. 应该看到：
   ```
   ✅ Supabase 已初始化 - 实时模式
   ```

### 步骤 4.2：注册第一个用户
1. 点击 **"立即注册"**
2. 填写信息并完成注册
3. 在 Console 中应该看到：
   ```
   ✅ 用户已保存到 Supabase: {...}
   🔄 启动实时监听...
   ✅ 实时监听已启动
   ```

### 步骤 4.3：测试实时同步
1. **打开第二个浏览器窗口**（或无痕模式）
2. 访问同一个 `index.html`
3. 注册另一个用户
4. **回到第一个窗口**
5. 应该看到：
   - Console 显示：`🔔 数据库变化: {...}`
   - 地球上**自动出现新用户**（无需刷新！）
   - 统计数字**自动更新**

---

## ✅ 成功标志

如果一切正常，你应该看到：

### Console 输出：
```
✅ Supabase 已初始化 - 实时模式
🌍 开始初始化地球...
✅ Globe.GL 库已加载
👥 总用户数: 2
✅ 添加真实用户: Alice (China)
✅ 添加真实用户: Bob (United States)
📊 统计更新: 2 个用户来自 2 个国家
🔄 启动实时监听...
✅ 实时监听已启动
```

### 实时功能：
- ✅ 新用户注册后，其他窗口**自动显示**新用户
- ✅ 用户更新头像后，其他窗口**自动更新**
- ✅ 统计数字**实时变化**
- ✅ 无需刷新页面

---

## 🐛 常见问题

### 问题 1：Console 显示 "Supabase 未配置"
**原因**: `supabase-config.js` 中的 URL 或 KEY 未替换

**解决**:
1. 检查 `supabase-config.js` 文件
2. 确保 URL 和 ANON_KEY 已替换为真实值
3. 刷新页面

### 问题 2：注册时报错 "Failed to fetch"
**原因**: Supabase 项目未启动或网络问题

**解决**:
1. 检查 Supabase 项目是否正常运行
2. 检查网络连接
3. 检查浏览器是否阻止了跨域请求

### 问题 3：实时监听未启动
**原因**: 数据库未启用 Realtime

**解决**:
1. 在 Supabase 控制台，点击 **"Database"** > **"Replication"**
2. 找到 `users` 表
3. 确保 **"Realtime"** 开关已打开

---

## 🎉 完成！

现在你的网站已经是**真正的实时应用**了！

- ✅ 所有用户共享同一个数据库
- ✅ 新用户注册后，所有人都能看到
- ✅ 数据实时同步，无需刷新
- ✅ 支持无限用户（免费版最多 500MB 数据库）

**享受你的全球实时用户地图吧！** 🌍✨


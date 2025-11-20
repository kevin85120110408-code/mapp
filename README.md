# 🌍 全球用户地图 - Globe Users

一个**实时**的 3D 地球用户地图可视化项目，支持多用户实时同步。

## ✨ 主要特性

- 🌐 **3D 地球可视化** - 使用 Globe.GL 库，流畅的 3D 交互体验
- ⚡ **实时同步** - 基于 Supabase Realtime，新用户注册后所有人立即看到
- 🎨 **极简设计** - 黑白灰配色，现代简约风格
- 📍 **精准定位** - 基于 IP 的地理位置自动识别（支持多个 API 备份）
- 👥 **用户管理** - 注册、登录、头像上传
- 📊 **实时统计** - 用户数量、国家分布实时更新
- 🔒 **邮箱验证** - EmailJS 邮件验证码系统
- 💾 **双模式** - 支持本地存储模式和实时数据库模式

## 🚀 快速开始

### 方式 1：本地存储模式（无需配置，立即使用）

1. 直接打开 `index.html`
2. 注册账号即可使用
3. 数据保存在浏览器本地（仅自己可见）

**优点**: 无需任何配置，开箱即用
**缺点**: 数据不共享，其他人看不到你

---

### 方式 2：实时模式（推荐，真正的多人实时）

#### 步骤 1：设置 Supabase（5分钟）

1. 查看详细教程：[Supabase设置指南.md](./Supabase设置指南.md)
2. 访问 https://supabase.com/ 创建免费账号
3. 创建新项目（选择离你最近的区域）
4. 在 SQL Editor 中运行 `setup-supabase.sql`
5. 获取 API 密钥并填入 `supabase-config.js`

#### 步骤 2：测试连接

1. 打开 `test-supabase.html`
2. 点击"开始测试"按钮
3. 确保所有 4 项测试都通过 ✅

#### 步骤 3：启动应用

1. 打开 `index.html`
2. 注册第一个账号
3. 打开另一个浏览器窗口，注册第二个账号
4. 回到第一个窗口，**无需刷新**，新用户自动出现！🎉

**优点**: 真正的实时同步，所有人共享数据
**缺点**: 需要 5 分钟配置 Supabase

---

## 📁 项目文件

```
├── index.html                  # 主应用
├── supabase-config.js          # Supabase 配置（需要填写你的密钥）
├── setup-supabase.sql          # 数据库初始化脚本
├── test-supabase.html          # Supabase 连接测试工具
├── email-template-gray.html    # 邮件模板（灰色简约风格）
├── Supabase设置指南.md         # 详细设置教程
└── README.md                   # 本文件
```

---

## 🚀 一键部署到 Vercel

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/yourusername/globe-users)

### 部署步骤：

1. 点击上面的按钮
2. 登录 Vercel（使用 GitHub 账号）
3. 点击 "Deploy"
4. 等待部署完成
5. 访问你的网站！

**部署后记得配置 Supabase 才能使用实时功能！**

## ⚙️ 配置邮箱验证码（可选）

本项目支持真实的邮箱验证码发送功能！

### 快速配置 EmailJS：

1. 访问 [EmailJS.com](https://www.emailjs.com/) 注册账号（免费）
2. 添加邮件服务（推荐使用 Gmail）
3. 创建邮件模板
4. 获取 Public Key、Service ID 和 Template ID
5. 在 `index.html` 中替换配置：

```javascript
const EMAILJS_CONFIG = {
    PUBLIC_KEY: '你的Public Key',
    SERVICE_ID: '你的Service ID',
    TEMPLATE_ID: '你的Template ID'
};
```

**详细配置步骤请查看：[EmailJS配置指南.md](./EmailJS配置指南.md)**

> 💡 如果不配置，系统会使用演示模式（验证码显示在弹窗中）

---

## 📱 本地运行

直接用浏览器打开 `index.html` 文件即可！

或者使用本地服务器：

```bash
# 使用Python
python -m http.server 8000

# 使用Node.js
npx serve

# 使用PHP
php -S localhost:8000
```

然后访问 `http://localhost:8000`

## 🎮 使用方法

### 首次使用：

1. 打开网站，会看到登录页面
2. 点击"立即注册"
3. 填写邮箱、用户名（不能有emoji）、密码
4. 注册成功后自动登录
5. 看到3D地球和你的位置标记！

### 上传头像：

1. 点击右上角"设置"按钮
2. 选择图片文件（最大2MB）
3. 头像会立即更新

### 邀请朋友：

- 把网站链接发给朋友
- 他们注册后会出现在地球上
- 看着用户越来越多！

## 🛠️ 技术栈

- **HTML5** - 页面结构
- **CSS3** - 样式和动画
- **JavaScript (ES6+)** - 交互逻辑
- **Three.js** - 3D渲染
- **LocalStorage** - 数据存储
- **ipapi.co** - IP地理定位

## 📊 功能说明

### ✅ 已实现

- [x] 用户注册和登录
- [x] 邮箱验证（前端模拟）
- [x] 用户名唯一性检查
- [x] Emoji检测和禁止
- [x] 设备指纹识别
- [x] 每设备限一账号
- [x] 3D地球渲染
- [x] 用户位置标记
- [x] 头像上传和显示
- [x] 自动旋转地球
- [x] 用户统计面板
- [x] 响应式设计

### 🔄 可扩展功能

- [x] 真实的邮箱验证（使用 EmailJS）
- [ ] 用户聊天功能
- [ ] 好友系统
- [ ] 更多统计数据
- [ ] 亮色主题切换
- [ ] 多语言支持

## 🔒 隐私和安全

- ✅ 只存储国家级别位置（不是精确GPS）
- ✅ 密码存储在本地浏览器（注意：未加密）
- ✅ 设备指纹仅用于防止重复注册
- ⚠️ **注意**：这是一个演示项目，不适合存储敏感信息

## 💡 自定义

### 修改颜色主题：

在 `<style>` 标签中修改这些颜色值：

```css
background: #0a0a0a;  /* 背景色 */
color: #00d4ff;       /* 主题色 */
```

### 修改地球样式：

在 `initGlobe()` 函数中修改：

```javascript
const material = new THREE.MeshBasicMaterial({
    color: 0x1a1a2e,  // 地球颜色
    wireframe: true,  // 线框模式
    opacity: 0.3      // 透明度
});
```

## 📝 注意事项

1. **数据存储**：所有数据保存在浏览器LocalStorage中
   - 清除浏览器数据会丢失所有用户信息
   - 不同浏览器的数据不共享
   - 不同设备的数据不共享

2. **IP定位**：使用免费API（ipapi.co）
   - 每天有请求限制
   - 仅支持国家级别定位

3. **浏览器兼容性**：
   - 需要支持WebGL的现代浏览器
   - 推荐使用Chrome、Firefox、Edge

## 🤝 贡献

欢迎提交Issue和Pull Request！

## 📜 许可证

MIT License - 可以自由使用、修改和分发

## 🎉 开始使用

现在就部署你的全球用户地图吧！

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/yourusername/globe-users)

---

**祝你使用愉快！** 🌍✨


# 📧 EmailJS 配置指南

本项目使用 EmailJS 发送真实的邮箱验证码。按照以下步骤配置：

## 🚀 快速开始

### 步骤 1: 注册 EmailJS 账号

1. 访问 [EmailJS官网](https://www.emailjs.com/)
2. 点击 "Sign Up" 注册账号
3. 使用 Google 账号或邮箱注册（推荐使用 Google 账号）

### 步骤 2: 添加邮件服务

1. 登录后，点击左侧菜单的 "Email Services"
2. 点击 "Add New Service"
3. 选择你的邮件服务商：
   - **Gmail** (推荐，免费且稳定)
   - Outlook
   - Yahoo
   - 或其他服务商

#### 如果选择 Gmail：

1. 点击 "Gmail"
2. 点击 "Connect Account"
3. 使用你的 Google 账号登录并授权
4. 记下 **Service ID**（例如：`service_abc123`）

### 步骤 3: 创建邮件模板

1. 点击左侧菜单的 "Email Templates"
2. 点击 "Create New Template"
3. 设置模板内容：

#### 方法 1：使用简单文本模板

**Subject（主题）:**
```
{{to_name}}，您的验证码
```

**Content（内容）:**
```
您好 {{to_name}}，

欢迎注册全球用户地图！

您的验证码是：{{verification_code}}

此验证码有效期为10分钟，请尽快完成注册。

如果这不是您的操作，请忽略此邮件。

---
全球用户地图团队
```

#### 方法 2：使用精美 HTML 模板（推荐）

1. 打开项目中的 `email-template.html` 文件
2. 复制全部内容
3. 在 EmailJS 模板编辑器中，切换到 "HTML" 模式
4. 粘贴复制的内容
5. Subject 设置为：`{{to_name}}，您的验证码 - 全球用户地图`

#### 配置模板变量

在右侧设置中，确保有以下变量：
- `to_email` - 收件人邮箱
- `to_name` - 收件人姓名
- `verification_code` - 验证码

点击 "Save" 保存模板，记下 **Template ID**（例如：`template_xyz789`）

### 步骤 4: 获取 Public Key

1. 点击左侧菜单的 "Account"
2. 在 "API Keys" 部分找到 **Public Key**
3. 记下这个 Key（例如：`abcdefghijklmn`）

### 步骤 5: 配置代码

打开 `index.html` 文件，找到以下代码（大约在第 587-591 行）：

```javascript
const EMAILJS_CONFIG = {
    PUBLIC_KEY: 'YOUR_PUBLIC_KEY',  // 替换为你的 EmailJS Public Key
    SERVICE_ID: 'YOUR_SERVICE_ID',  // 替换为你的 EmailJS Service ID
    TEMPLATE_ID: 'YOUR_TEMPLATE_ID' // 替换为你的 EmailJS Template ID
};
```

替换为你的实际值：

```javascript
const EMAILJS_CONFIG = {
    PUBLIC_KEY: 'abcdefghijklmn',      // 你的 Public Key
    SERVICE_ID: 'service_abc123',      // 你的 Service ID
    TEMPLATE_ID: 'template_xyz789'     // 你的 Template ID
};
```

### 步骤 6: 测试配置

#### 方法 1：使用测试工具（推荐）

1. 打开项目中的 `test-email.html` 文件
2. 填入你的配置信息：
   - Public Key
   - Service ID
   - Template ID
   - 测试邮箱
3. 点击"发送测试邮件"
4. 检查邮箱是否收到验证码

#### 方法 2：在主网站测试

1. 保存 `index.html` 文件
2. 刷新网页
3. 尝试注册一个账号
4. 检查你的邮箱是否收到验证码

---

## 📊 EmailJS 免费额度

EmailJS 免费计划包括：
- ✅ 每月 **200 封邮件**
- ✅ 2 个邮件服务
- ✅ 2 个邮件模板
- ✅ 无需信用卡

对于个人项目和演示来说完全够用！

---

## 🔧 常见问题

### Q1: 收不到邮件怎么办？

**检查垃圾邮件文件夹**
- Gmail 可能会将验证码邮件标记为垃圾邮件
- 检查"垃圾邮件"或"促销"标签

**检查配置**
- 确保 Service ID、Template ID 和 Public Key 都正确
- 打开浏览器控制台（F12）查看是否有错误信息

**检查 Gmail 授权**
- 确保已正确授权 EmailJS 访问你的 Gmail 账号

### Q2: 超过免费额度怎么办？

如果每月发送超过 200 封邮件：
- 升级到付费计划（$15/月，1000封邮件）
- 或者使用多个 EmailJS 账号轮换

### Q3: 可以使用其他邮件服务吗？

可以！EmailJS 支持：
- Gmail（推荐）
- Outlook
- Yahoo
- SendGrid
- Mailgun
- 自定义 SMTP

### Q4: 邮件发送速度慢？

EmailJS 通常在几秒内发送邮件，但可能受以下因素影响：
- 网络连接速度
- 邮件服务商的处理速度
- EmailJS 服务器负载

### Q5: 如何自定义邮件样式？

在 EmailJS 模板编辑器中：
1. 切换到 "HTML" 模式
2. 使用 HTML 和内联 CSS 自定义样式
3. 例如：

```html
<div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
    <h2 style="color: #3b82f6;">验证码</h2>
    <p>您好 {{to_name}}，</p>
    <div style="background: #f0f0f0; padding: 20px; text-align: center; font-size: 24px; font-weight: bold; letter-spacing: 5px;">
        {{verification_code}}
    </div>
    <p style="color: #666;">此验证码有效期为10分钟</p>
</div>
```

---

## 🎯 完整示例

配置完成后的效果：

1. **用户注册** → 填写邮箱和用户名
2. **点击发送验证码** → 系统生成6位数字验证码
3. **EmailJS 发送邮件** → 用户收到验证码邮件
4. **用户输入验证码** → 验证成功后完成注册

---

## 🔒 安全提示

- ✅ Public Key 可以公开（已经在前端代码中）
- ✅ EmailJS 会限制每个 IP 的请求频率，防止滥用
- ✅ 验证码有效期为 10 分钟
- ⚠️ 不要在模板中暴露敏感信息

---

## 📚 更多资源

- [EmailJS 官方文档](https://www.emailjs.com/docs/)
- [EmailJS 模板指南](https://www.emailjs.com/docs/user-guide/creating-email-template/)
- [EmailJS API 参考](https://www.emailjs.com/docs/sdk/send/)

---

**配置完成后，你的网站就可以发送真实的邮箱验证码了！** 🎉


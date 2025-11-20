# EmailJS 模板设置说明

## 🔧 你的配置信息

- **Public Key**: `yKKmF29zhAvAaTh9x`
- **Service ID**: `service_wwmncfk`
- **Template ID**: `template_99iux0w`

---

## 📝 模板配置步骤

### 1. 登录 EmailJS

访问：https://dashboard.emailjs.com/admin

### 2. 编辑模板

1. 点击左侧菜单 **"Email Templates"**
2. 找到你的模板 `template_99iux0w`
3. 点击 **"Edit"** 编辑

### 3. 设置模板内容

#### Subject（邮件主题）：

```
{{to_name}}，您的验证码 - 全球用户地图
```

#### Content（邮件内容）：

**方法 1：简单文本模板**

```
您好 {{to_name}}，

欢迎注册全球用户地图！

您的验证码是：{{verification_code}}

此验证码有效期为10分钟，请尽快完成注册。

如果这不是您的操作，请忽略此邮件。

---
全球用户地图团队
```

**方法 2：HTML 模板（推荐）**

切换到 "HTML" 模式，粘贴以下内容：

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body style="margin: 0; padding: 0; font-family: Arial, sans-serif; background-color: #f5f5f5;">
    <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #f5f5f5; padding: 40px 20px;">
        <tr>
            <td align="center">
                <table width="600" cellpadding="0" cellspacing="0" style="background-color: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.1);">
                    
                    <!-- Header -->
                    <tr>
                        <td style="background: linear-gradient(135deg, #3b82f6, #8b5cf6); padding: 40px 30px; text-align: center;">
                            <h1 style="margin: 0; color: #ffffff; font-size: 28px; font-weight: 700;">
                                🌍 全球用户地图
                            </h1>
                        </td>
                    </tr>
                    
                    <!-- Content -->
                    <tr>
                        <td style="padding: 40px 30px;">
                            <h2 style="margin: 0 0 20px 0; color: #1a1a1a; font-size: 22px;">
                                您好，{{to_name}}！
                            </h2>
                            
                            <p style="margin: 0 0 20px 0; color: #666666; font-size: 16px; line-height: 1.6;">
                                欢迎注册全球用户地图！请使用以下验证码完成注册：
                            </p>
                            
                            <!-- Verification Code -->
                            <table width="100%" cellpadding="0" cellspacing="0" style="margin: 30px 0;">
                                <tr>
                                    <td align="center" style="background: #f0f9ff; border-radius: 8px; padding: 30px;">
                                        <p style="margin: 0 0 10px 0; color: #666666; font-size: 14px;">
                                            您的验证码
                                        </p>
                                        <div style="font-size: 36px; font-weight: 700; letter-spacing: 8px; color: #3b82f6; font-family: 'Courier New', monospace;">
                                            {{verification_code}}
                                        </div>
                                        <p style="margin: 10px 0 0 0; color: #999999; font-size: 12px;">
                                            有效期：10分钟
                                        </p>
                                    </td>
                                </tr>
                            </table>
                            
                            <p style="margin: 20px 0 0 0; color: #666666; font-size: 14px;">
                                如果这不是您的操作，请忽略此邮件。
                            </p>
                        </td>
                    </tr>
                    
                    <!-- Footer -->
                    <tr>
                        <td style="background-color: #f9fafb; padding: 30px; text-align: center; border-top: 1px solid #e5e7eb;">
                            <p style="margin: 0; color: #999999; font-size: 12px;">
                                此邮件由系统自动发送，请勿直接回复
                            </p>
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
```

### 4. 配置模板变量

在模板编辑页面的右侧 **"Settings"** 中，确保有以下变量：

**必需的变量：**
- `to_name` - 收件人姓名
- `verification_code` - 验证码

**可选的变量（已包含在代码中）：**
- `to_email` - 收件人邮箱
- `user_email` - 用户邮箱
- `from_name` - 发件人姓名
- `message` - 消息内容

### 5. 测试模板

1. 在模板编辑页面，点击右上角的 **"Test it"**
2. 填入测试数据：
   - `to_name`: 测试用户
   - `verification_code`: 123456
3. 点击 **"Send test email"**
4. 检查你的邮箱是否收到测试邮件

### 6. 保存模板

点击 **"Save"** 保存模板

---

## 🧪 测试网站功能

保存模板后：

1. 刷新 `index.html` 页面
2. 点击"立即注册"
3. 填写信息：
   - 邮箱：你的真实邮箱
   - 用户名：任意用户名
   - 密码：任意密码
4. 点击"发送验证码"
5. 检查邮箱（包括垃圾邮件文件夹）

---

## ⚠️ 常见问题

### 问题 1：收不到邮件

**解决方案：**
1. 检查垃圾邮件文件夹
2. 确保 Gmail 服务已正确连接
3. 在 EmailJS 的 "Email Services" 中检查服务状态
4. 确保模板变量名正确

### 问题 2：发送失败

**可能原因：**
1. Service ID 或 Template ID 不正确
2. Gmail 授权过期，需要重新授权
3. 超过免费额度（200封/月）

**解决方案：**
1. 检查配置是否正确
2. 重新连接 Gmail 服务
3. 查看 EmailJS 控制台的错误信息

### 问题 3：模板变量不显示

**解决方案：**
确保模板中使用了正确的变量格式：
- 正确：`{{to_name}}`
- 错误：`{to_name}` 或 `${to_name}`

---

## 📊 EmailJS 控制台

访问：https://dashboard.emailjs.com/admin

在这里你可以：
- 查看发送历史
- 查看剩余额度
- 管理服务和模板
- 查看错误日志

---

**配置完成后，你的网站就可以发送真实的验证码邮件了！** 🎉


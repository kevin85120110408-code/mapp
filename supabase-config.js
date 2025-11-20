// ============================================
// Supabase 配置文件
// ============================================
// 使用说明：
// 1. 访问 https://supabase.com/ 注册账号
// 2. 创建新项目
// 3. 在项目设置中找到 API 密钥
// 4. 替换下面的 URL 和 KEY
// ============================================

const SUPABASE_CONFIG = {
    // Supabase 项目 URL
    URL: 'https://qkpqsdnvgpimlmwcduxi.supabase.co',

    // Supabase 匿名密钥（anon key）
    ANON_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFrcHFzZG52Z3BpbWxtd2NkdXhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM2Mzc3NzUsImV4cCI6MjA3OTIxMzc3NX0.XUnsLzbh5nScEm9mdWejd5px-tiZznis1nfpruo5DwQ'
};

// 导出配置
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SUPABASE_CONFIG;
}


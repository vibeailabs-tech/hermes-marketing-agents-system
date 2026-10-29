# Hướng dẫn kết nối công cụ trình duyệt cho Landing Page Audit

Đọc file này khi người dùng chọn kết nối công cụ trình duyệt ở bước Kiểm tra công cụ. Chỉ đưa cho người dùng phần hướng dẫn đúng với nền tảng họ đang dùng, không dán cả file.

## Vì sao cần công cụ trình duyệt?

Web fetch chỉ tải HTML thô, không chạy JavaScript. Với trang dựng bằng React, Next.js, Vue, Webflow, Framer hoặc các trang tải nội dung động, fetch có thể chỉ thấy một khung trống. Fetch cũng không thấy màu sắc, độ tương phản, vị trí thực tế của nút hay bố cục trên mobile. Công cụ trình duyệt mở trang như người dùng thật nên khắc phục được cả hai.

Không cần API key cho các công cụ dưới đây.

## Lựa chọn

| Công cụ | Chi phí | Yêu cầu | Phù hợp với |
|---------|---------|---------|-------------|
| Playwright MCP | Miễn phí, mã nguồn mở | Node.js 18 trở lên (khuyến nghị 20+) | Devin, Claude Code, Codex, Claude Desktop, Cursor và hầu hết nền tảng hỗ trợ MCP |
| Claude in Chrome | Theo gói Claude | Trình duyệt Chrome + tiện ích Claude in Chrome | Người dùng Claude.ai / Claude Desktop |

## Playwright MCP

Nếu máy chưa có Node.js: tải bản LTS tại https://nodejs.org (macOS cũng có thể dùng `brew install node`), sau đó kiểm tra bằng `node -v`.

| Nền tảng | Cách kết nối |
|----------|--------------|
| Devin | `devin mcp add -s user playwright -- npx @playwright/mcp@latest` |
| Claude Code | `claude mcp add playwright npx @playwright/mcp@latest` |
| Codex | `codex mcp add playwright npx "@playwright/mcp@latest"` |
| Claude Desktop, Cursor, nền tảng khác | Thêm vào file cấu hình MCP của nền tảng (với Claude Desktop: Settings → Developer → Edit config): |

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest"]
    }
  }
}
```

Mặc định Playwright mở cửa sổ trình duyệt thật để người dùng thấy agent đang làm gì. Muốn chạy ẩn, thêm `"--headless"` vào `args` (hoặc thêm `--headless` vào cuối lệnh).

Khi audit bằng Playwright, chụp ảnh màn hình đầu tiên (above the fold) ở cả kích thước desktop và mobile (ví dụ 390px chiều rộng) để chấm độ nổi bật của CTA và thứ bậc thị giác dựa trên những gì thực sự hiển thị.

## Claude in Chrome

1. Cài tiện ích Claude in Chrome từ Chrome Web Store và đăng nhập tài khoản Claude.
2. Trong Claude.ai hoặc Claude Desktop, bật kết nối Chrome trong phần công cụ/connectors của khung chat.
3. Khi agent yêu cầu, cho phép truy cập trang cần audit.

## Kiểm tra sau khi kết nối

- Devin: `devin mcp list`
- Claude Code: `claude mcp list` hoặc `/mcp` trong phiên
- Codex: `codex mcp list` hoặc `/mcp` trong phiên

Sau khi thêm MCP, thường phải khởi động lại phiên agent (hoặc mở chat mới) để công cụ mới xuất hiện.

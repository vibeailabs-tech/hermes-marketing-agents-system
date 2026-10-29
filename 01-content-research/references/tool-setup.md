# Hướng dẫn kết nối công cụ dữ liệu cho Content Research

Đọc file này khi người dùng chọn kết nối thêm công cụ ở bước Kiểm tra công cụ. Chỉ đưa cho người dùng phần hướng dẫn đúng với công cụ họ chọn và nền tảng họ đang dùng, không dán cả file.

## Nguyên tắc bảo mật (luôn tuân thủ)

- Ưu tiên đăng nhập OAuth (bấm "Connect/Authenticate" rồi đăng nhập tài khoản) vì không phải xử lý API key.
- Không bao giờ yêu cầu người dùng dán API key vào khung chat. Key phải được người dùng tự đặt vào file cấu hình MCP hoặc biến môi trường trên máy họ.
- Nếu người dùng lỡ dán key vào chat: không lặp lại key, không ghi key vào bất kỳ file nào, và khuyên họ tạo key mới (rotate) sau khi cấu hình xong.
- Trong các lệnh mẫu, giữ nguyên chỗ trống như `YOUR_API_KEY` để người dùng tự thay.
- Sau khi thêm MCP, thường phải khởi động lại phiên agent (hoặc mở chat mới) để công cụ mới xuất hiện.

## Chọn công cụ nào?

| Công cụ | Chi phí | Mạnh ở | Ghi chú |
|---------|---------|--------|---------|
| Ahrefs | Gói trả phí từ Lite trở lên, tiêu hao API unit theo gói | Lượng tìm kiếm, độ khó (KD), tiềm năng traffic, SERP, đối thủ | Dữ liệu từ khoá đầy đủ nhất cho bước 3 và 4 |
| Semrush | Cần gói có API, tiêu hao API unit | Lượng tìm kiếm, độ khó, đối thủ, SERP | Tương đương Ahrefs; chọn theo tài khoản đang có |
| Perplexity | API trả theo lượt dùng | Xu hướng, câu hỏi của khán giả, góc tiếp cận đang thời sự | Không có số liệu lượng tìm kiếm; bổ trợ tốt cho bước 1 và 2 |

Nếu người dùng đã có tài khoản Ahrefs hoặc Semrush, gợi ý dùng cái đó. Nếu không muốn trả phí công cụ SEO, Perplexity là lựa chọn rẻ nhất.

## Ahrefs

- Endpoint (Streamable HTTP): `https://api.ahrefs.com/mcp/mcp`
- Xác thực: OAuth, hoặc MCP key tạo tại Ahrefs → Account Settings → API Keys → "Generate MCP key", gửi dạng `Authorization: Bearer YOUR_MCP_KEY`.

| Nền tảng | Cách kết nối |
|----------|--------------|
| Claude.ai / Claude Desktop | Customize → Connectors → bấm "+" → tìm "Ahrefs" → Connect → chọn workspace → Allow |
| Claude Code | `claude mcp add --transport http ahrefs https://api.ahrefs.com/mcp/mcp` rồi chạy `/mcp` → chọn ahrefs → Authenticate |
| Devin | `devin mcp add -s user ahrefs https://api.ahrefs.com/mcp/mcp` rồi `devin mcp login ahrefs` |
| Codex | `codex mcp add ahrefs --url https://api.ahrefs.com/mcp/mcp` rồi `codex mcp login ahrefs` |
| ChatGPT | Settings → Apps → Advanced settings → bật Developer mode → Create app, URL như trên, Authentication: OAuth |

Dùng key thay cho OAuth (khi nền tảng không hỗ trợ OAuth):

- Devin: `devin mcp add -s user ahrefs https://api.ahrefs.com/mcp/mcp -H "Authorization: Bearer YOUR_MCP_KEY"`
- Codex: đặt biến môi trường `export AHREFS_MCP_KEY="YOUR_MCP_KEY"` rồi `codex mcp add ahrefs --url https://api.ahrefs.com/mcp/mcp --bearer-token-env-var AHREFS_MCP_KEY`

## Semrush

- Endpoint (Streamable HTTP): `https://mcp.semrush.com/v2/mcp`
- Xác thực: OAuth (mặc định), hoặc API key gửi dạng `Authorization: Apikey YOUR_API_KEY` (lưu ý tiền tố là `Apikey`, không phải `Bearer`).

| Nền tảng | Cách kết nối |
|----------|--------------|
| Claude.ai / Claude Desktop | Customize → Connect your apps → tìm "Semrush" → Connect → Approve |
| Claude Code | `claude mcp add semrush https://mcp.semrush.com/v2/mcp -t http` rồi chạy `/mcp` → chọn semrush → Authenticate |
| Devin | `devin mcp add -s user semrush https://mcp.semrush.com/v2/mcp` rồi `devin mcp login semrush` |
| Codex | `codex mcp add semrush --url https://mcp.semrush.com/v2/mcp` rồi `codex mcp login semrush` |
| ChatGPT | Apps → tìm "Semrush" → Connect → Approve |

Dùng key thay cho OAuth (Devin): `devin mcp add -s user semrush https://mcp.semrush.com/v2/mcp -H "Authorization: Apikey YOUR_API_KEY"`

## Perplexity

- Endpoint từ xa (khuyến nghị): `https://api.perplexity.ai/mcp`, xác thực bằng OAuth (đăng nhập tài khoản Perplexity) hoặc `Authorization: Bearer YOUR_API_KEY`.
- Server chạy trên máy: `npx -y @perplexity-ai/mcp-server`, cần biến môi trường `PERPLEXITY_API_KEY` và Node.js.
- Lấy API key tại API Portal của Perplexity.

| Nền tảng | Cách kết nối |
|----------|--------------|
| Claude.ai | Thêm custom connector với URL `https://api.perplexity.ai/mcp`, đăng nhập Perplexity khi được hỏi |
| Claude Code | `claude mcp add --transport http perplexity https://api.perplexity.ai/mcp` rồi `/mcp` → Authenticate |
| Devin | `devin mcp add -s user perplexity https://api.perplexity.ai/mcp` rồi `devin mcp login perplexity` |
| Codex | `codex mcp add perplexity --env PERPLEXITY_API_KEY="YOUR_API_KEY" -- npx -y @perplexity-ai/mcp-server` |

## Kiểm tra sau khi kết nối

- Devin: `devin mcp list`
- Claude Code: `claude mcp list` hoặc `/mcp` trong phiên
- Codex: `codex mcp list` hoặc `/mcp` trong phiên
- Claude.ai / ChatGPT: connector hiện trong danh sách và được bật trong khung chat

Sau đó thử một truy vấn nhỏ (ví dụ lượng tìm kiếm của một từ khoá) trước khi chạy nghiên cứu đầy đủ, để chắc chắn kết nối hoạt động và không tốn nhiều API unit nếu có lỗi.

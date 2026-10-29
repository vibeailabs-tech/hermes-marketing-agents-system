# Bộ Agent Skills dành cho Marketer của Vibe AI Labs

5 agent skill miễn phí được xây dựng riêng cho marketer, cùng một skill điều phối để chúng làm việc như một đội. Mỗi skill đều được tinh chỉnh theo thương hiệu của bạn và sẵn sàng dùng trên Hermes Agent, Claude, Codex, Devin, Perplexity và nhiều nền tảng khác.

## Vấn đề

Vấn đề là thế này: bạn mở công cụ AI yêu thích, dán vào giọng văn thương hiệu, khán giả và định vị của mình... lại một lần nữa. Mỗi dự án. Mỗi prompt. Đó không phải là AI đang làm việc, mà là bạn đang làm công đoạn chuẩn bị, lần nào cũng vậy.

**Bộ skill này giải quyết điều đó.**

Đây là 5 skill dạng plug-in xử lý những đầu việc marketing bạn làm đi làm lại: nghiên cứu, viết copy, chiến lược, trực quan hoá dữ liệu và audit landing page. Mỗi skill đều quét ngữ cảnh thương hiệu của bạn trước tiên, bao gồm giọng văn, khán giả, màu sắc, định vị, và tự động đưa chúng vào kết quả. Vì vậy, thay vì một bản nháp đầu chung chung mà bạn phải viết lại, bạn nhận được thứ đã mang đúng chất của bạn.

Được xây dựng để hoạt động trên bất kỳ nền tảng agent nào bạn đang dùng: Claude, Codex, Devin, Perplexity, Manus, hay bất cứ đâu hỗ trợ skill.

Tải về, thả vào quy trình làm việc của bạn, và dùng ngay từ ngày đầu tiên.

## Các skill

| # | Skill | Chức năng | Đầu ra |
|---|-------|-----------|--------|
| 1 | [Nghiên cứu nội dung](01-content-research/SKILL.md) (`content-research`) | Tìm những gì khán giả đang tìm kiếm, đang hỏi và bàn tán, rồi xếp hạng xem điều gì đáng sản xuất. Không viết nội dung. | Báo cáo Markdown |
| 2 | [Viết nội dung marketing](02-marketing-copywriting/SKILL.md) (`marketing-copywriting`) | Viết copy sẵn sàng đăng, đúng giọng thương hiệu: blog, email/newsletter, mạng xã hội, quảng cáo, landing page. | Copy trong chat hoặc file Markdown |
| 3 | [Chiến lược marketing](03-marketing-strategy/SKILL.md) (`marketing-strategy`) | Biến mục tiêu, brief hoặc nghiên cứu thành chiến lược có cấu trúc, có cơ sở bảo vệ. Tạo chiến lược, không tạo tài sản nội dung. | Báo cáo Markdown hoặc Word |
| 4 | [Trực quan hoá dữ liệu](04-data-visualization/SKILL.md) (`data-visualization`) | Biến bộ dữ liệu bất kỳ (CSV, Excel, JSON...) thành dashboard tương tác đẹp đến mức chụp màn hình đưa thẳng vào slide. | Một file HTML |
| 5 | [Audit landing page](05-landing-page-audit/SKILL.md) (`landing-page-audit`) | Chấm điểm landing page đang chạy theo 5 tiêu chí chuyển đổi, so sánh với tối đa 2 đối thủ, kèm đề xuất theo thứ tự ưu tiên. | Báo cáo Markdown hoặc Word |

### Skill điều phối: `marketing-orchestrator`

[`marketing-orchestrator`](00-marketing-orchestrator/SKILL.md) đóng vai trưởng nhóm: nhận yêu cầu, chọn skill phù hợp, hỏi bạn một lần duy nhất, giao việc cho subagent (chạy song song khi được), kiểm tra chất lượng giữa các bước và bàn giao một gói hoàn chỉnh trong thư mục `marketing-runs/`. Yêu cầu chỉ cần một skill sẽ được chuyển thẳng, không qua kế hoạch rườm rà.

```
marketing-orchestrator   phân loại → hỏi 1 lần → lập kế hoạch → giao việc → kiểm tra → bàn giao
├── content-research       nghiên cứu nội dung
├── marketing-strategy     chiến lược
├── marketing-copywriting  viết nội dung
├── data-visualization     dashboard dữ liệu
└── landing-page-audit     audit landing page
```

Có sẵn 6 playbook: chiến dịch trọn gói, lịch nội dung tháng, tối ưu landing page, phân tích đối thủ và định vị, báo cáo hiệu quả và điều chỉnh, tái sử dụng nội dung ra nhiều kênh. Xem [playbooks.md](00-marketing-orchestrator/references/playbooks.md).

### Kết hợp các skill

Các skill được thiết kế để nối tiếp nhau (orchestrator tự lo phần nối này; bạn vẫn có thể gọi từng skill riêng lẻ):

```
content-research  →  marketing-strategy  →  marketing-copywriting
   (nên làm gì)        (làm thế nào)          (viết ra nội dung)

landing-page-audit  →  marketing-copywriting      data-visualization
  (trang yếu ở đâu)     (viết lại các phần yếu)    (báo cáo kết quả chiến dịch)
```

Ví dụ: *"Nghiên cứu chủ đề cho ngách skincare nam, sau đó lên chiến lược nội dung Q4 và viết 3 bài Facebook đầu tiên."*

## Cài đặt

Mỗi thư mục skill (chứa `SKILL.md`) là một skill độc lập. Orchestrator cần cả 5 skill con được cài cùng chỗ. Sao chép các thư mục bạn cần vào thư mục skill của nền tảng:

| Nền tảng | Dùng cho mọi dự án | Chỉ dùng trong một dự án |
|----------|--------------------|--------------------------|
| Hermes Agent | `~/.hermes/skills/marketing/` (hoặc `~/.agents/skills/` kèm `external_dirs`) | Thư mục skill của dự án |
| Devin | `~/.config/devin/skills/` hoặc `~/.agents/skills/` | `.devin/skills/` |
| Codex (CLI, IDE, ChatGPT desktop) | `~/.agents/skills/` | `.agents/skills/` |
| Claude Code | `~/.claude/skills/` | `.claude/skills/` |
| Claude.ai / Claude Desktop | Tải lên file `.zip` của từng skill trong phần Settings (mục Skills) | |
| Perplexity, Manus, nền tảng khác | Làm theo hướng dẫn tải skill của nền tảng (thường là tải lên file `.zip`) | |

Cài cho Devin và Codex cùng lúc (macOS/Linux):

```bash
mkdir -p ~/.agents/skills
cp -R 00-marketing-orchestrator 01-content-research 02-marketing-copywriting 03-marketing-strategy 04-data-visualization 05-landing-page-audit ~/.agents/skills/
```

Đóng gói `.zip` cho Claude.ai hoặc các nền tảng cần tải lên:

```bash
for s in 00-marketing-orchestrator 01-content-research 02-marketing-copywriting 03-marketing-strategy 04-data-visualization 05-landing-page-audit; do zip -r "$s.zip" "$s"; done
```

### Cài lên Hermes Agent trên VPS (khuyên dùng)

Biến toàn bộ Hermes trên VPS thành đội marketing: danh tính "Trưởng phòng Marketing AI", 6 skill marketing, gỡ bộ skill mặc định để Hermes chỉ làm việc marketing. Chạy trên VPS (SSH vào, hoặc trong container nếu Hermes chạy bằng Docker):

```bash
git clone https://github.com/vibeailabs-tech/hermes-marketing-agents-system.git
cd hermes-marketing-agents-system
bash 07-hermes/install.sh --current --only-marketing
```

Không muốn SSH? Dán tin nhắn này vào chat với Hermes trên VPS. Hermes sẽ tự chạy lệnh bằng terminal của nó:

```
Chạy trong terminal rồi báo kết quả:
cd ~ && (git clone https://github.com/vibeailabs-tech/hermes-marketing-agents-system.git || git -C hermes-marketing-agents-system pull) && bash hermes-marketing-agents-system/07-hermes/install.sh --current --only-marketing
```

Script tự tìm thư mục Hermes đang chạy (ví dụ `/data/.hermes`) và làm 4 việc:

1. Cài 6 skill vào `<thư mục Hermes>/skills/marketing/`, bỏ tiền tố số khỏi tên thư mục.
2. Sao lưu `SOUL.md` cũ thành `SOUL.md.bak-<thời gian>`, rồi thay bằng [`07-hermes/SOUL.md`](07-hermes/SOUL.md).
3. Chạy `hermes skills opt-out --remove`: gỡ các skill mặc định bạn chưa sửa và chặn Hermes cài lại chúng khi cập nhật. Skill bạn đã sửa hoặc tự cài được giữ nguyên. Bỏ `--only-marketing` nếu muốn giữ bộ skill mặc định.
4. Đặt tối đa 5 subagent chạy song song và giao việc một tầng.

Sau khi cài, **mở phiên chat mới** (trên Telegram/Discord/Slack gõ `/new`) vì Hermes chỉ đọc `SOUL.md` lúc bắt đầu phiên. Nếu gateway chưa nhận skill mới thì chạy `hermes gateway restart`.

| Việc | Lệnh trên VPS |
|------|---------------|
| Kiểm tra skill | `hermes skills list \| grep marketing` (đủ 6 dòng) |
| Cập nhật sau khi sửa repo | `cd hermes-marketing-agents-system && git pull && bash 07-hermes/install.sh --current --only-marketing` |
| Khôi phục danh tính cũ | `cp <thư mục Hermes>/SOUL.md.bak-<thời gian> <thư mục Hermes>/SOUL.md` |
| Lấy lại bộ skill mặc định | `hermes skills opt-in --sync` |

### Tạo profile marketing riêng (giữ nguyên Hermes gốc)

Cách này tạo một **profile Hermes riêng** tên `marketing`. Profile là một bản Hermes độc lập, có cấu hình, bộ nhớ, skill và danh tính riêng. Profile này chỉ chứa 6 skill marketing cùng skill hệ thống bắt buộc `hermes-agent` (không nạp khoảng 100 skill mặc định còn lại), và danh tính của nó là "Trưởng phòng Marketing AI" nên mọi yêu cầu đều đi qua `marketing-orchestrator`. Hermes gốc của bạn không bị đụng tới.

```bash
bash 07-hermes/install.sh
```

Script sẽ:

1. Đóng gói 6 skill (bỏ tiền tố số khỏi tên thư mục), `SOUL.md` và `distribution.yaml` vào `07-hermes/dist/`.
2. Tạo profile bằng `hermes profile create marketing --no-skills` (model được sao từ profile hiện tại), rồi cài gói bằng `hermes profile install`.
3. Hỏi có dùng chung API key (`.env`) của profile mặc định không. Nếu không, bạn tự cấu hình sau bằng `hermes -p marketing model`.
4. Đặt tối đa 5 subagent chạy song song và giao việc một tầng.
5. Hỏi có đặt `marketing` làm **profile mặc định** không. Nếu đồng ý, gõ `hermes` ở bất cứ đâu (CLI, TUI, desktop, gateway) sẽ vào thẳng đội marketing.

| Việc | Lệnh |
|------|------|
| Làm việc với đội marketing | `hermes -p marketing` (hoặc chỉ `hermes` nếu đã đặt mặc định) |
| Kiểm tra đủ 6 skill | `hermes -p marketing skills list` |
| Cập nhật sau khi sửa skill | Chạy lại `bash 07-hermes/install.sh` (giữ nguyên config, `.env`, bộ nhớ, lịch sử) |
| Quay về Hermes gốc | `hermes profile use default` |
| Gỡ hẳn | `hermes profile delete marketing` |

Nếu dùng Hermes qua Telegram/Discord/Slack, profile `marketing` cần bot riêng: cấu hình bằng `hermes -p marketing gateway setup`, vì hai profile không thể dùng chung một bot token.

### Dùng orchestrator trong Hermes hiện có

Nếu bạn muốn Hermes vẫn làm các việc khác ngoài marketing:

1. **Cài skill** vào thư mục skill của Hermes:

   ```bash
   mkdir -p ~/.hermes/skills/marketing
   cp -R 00-marketing-orchestrator 01-content-research 02-marketing-copywriting 03-marketing-strategy 04-data-visualization 05-landing-page-audit ~/.hermes/skills/marketing/
   ```

   Nếu đã cài ở `~/.agents/skills/` để dùng chung với Codex/Devin, thêm `skills.external_dirs: [~/.agents/skills]` vào `~/.hermes/config.yaml` thay vì chép lần nữa.

2. **Cấu hình giao việc (tuỳ chọn):** gộp nội dung [`07-hermes/config.example.yaml`](07-hermes/config.example.yaml) vào `~/.hermes/config.yaml` để giới hạn số subagent chạy song song (mặc định Hermes cho 10, file mẫu đặt 5 để kiểm soát chi phí).

3. **Chọn cách để Hermes đóng vai điều phối viên**, từ nhẹ đến mạnh:

   | Cách | Lệnh / thao tác | Phù hợp khi |
   |------|-----------------|-------------|
   | Gọi theo yêu cầu | Gõ `/marketing-orchestrator <yêu cầu>` trong chat | Hermes còn làm nhiều việc khác ngoài marketing |
   | Nạp sẵn khi khởi động | `hermes -s marketing-orchestrator` | Một phiên làm việc chỉ dành cho marketing |
   | Đổi danh tính mặc định | Chép [`07-hermes/SOUL.md`](07-hermes/SOUL.md) vào `~/.hermes/SOUL.md` | Hermes chỉ dùng làm trưởng phòng marketing |

   `SOUL.md` **thay thế toàn bộ** danh tính mặc định của Hermes, nên hãy sao lưu file cũ trước (`cp ~/.hermes/SOUL.md ~/.hermes/SOUL.md.bak`).

4. **Kiểm tra:** chạy `hermes skills list` và xác nhận đủ 6 skill, rồi thử *"/marketing-orchestrator lên chiến dịch ra mắt sản phẩm X cho tháng 12"*.

Khi điều phối, Hermes dùng `delegate_task` để giao việc cho subagent. Subagent không hỏi được người dùng, nên orchestrator sẽ gom mọi câu hỏi vào một tin nhắn trước khi giao việc; kết quả từng bước được trả về dưới dạng tin nhắn mới khi chạy xong.

Sau khi cài, chỉ cần mô tả việc bạn muốn làm (ví dụ *"audit landing page này giúp mình: https://..."*); agent sẽ tự chọn đúng skill. Bạn cũng có thể gọi trực tiếp theo tên skill nếu nền tảng hỗ trợ (`/content-research` trên Hermes, `$content-research` trên Codex). Riêng Devin lấy tên thư mục làm lệnh gọi, nên trên Devin lệnh là `/01-content-research`, `/00-marketing-orchestrator`...

## Thiết lập ngữ cảnh thương hiệu (khuyến nghị)

Cả 5 skill đều bắt đầu bằng việc quét dự án để tìm thông tin thương hiệu. Làm bước này một lần, mọi kết quả về sau sẽ tự động đúng giọng, đúng khán giả, đúng màu sắc:

1. Sao chép thư mục [`06-brand-context/`](06-brand-context/brand-guide.md) vào thư mục dự án bạn làm việc cùng agent.
2. Điền `brand-guide.md`: định vị, khán giả, giọng văn và cách xưng hô, mã màu, font, đối thủ.
3. Có thể thêm tài liệu khác vào cùng thư mục (bài mẫu, persona, nghiên cứu cũ). Skill nhận diện theo nội dung, không theo tên file.

Nếu không có ngữ cảnh thương hiệu, skill vẫn chạy: nó sẽ hỏi bạn những thông tin tối thiểu cần thiết, hoặc dùng bảng màu và định dạng mặc định.

## Có cần cài thêm API hay MCP không?

**Không bắt buộc.** Cả 5 skill đều chạy được ngay chỉ với web search, web fetch và khả năng đọc/ghi file mà hầu hết nền tảng agent đã có sẵn. Các công cụ dưới đây là tuỳ chọn, giúp kết quả chính xác hơn:

| Skill | Không cần thêm gì | Nên kết nối thêm (tuỳ chọn) | Lợi ích |
|-------|-------------------|------------------------------|---------|
| `content-research` | Web search | MCP của Ahrefs hoặc Semrush; Perplexity MCP | Có lượng tìm kiếm, độ khó từ khoá và tiềm năng traffic thật thay vì ước tính định hướng |
| `marketing-copywriting` | Không cần gì | | |
| `marketing-strategy` | Không cần gì | | |
| `data-visualization` | Trình duyệt để mở file HTML (cần internet để tải Chart.js từ CDN) | | |
| `landing-page-audit` | Web fetch | Công cụ trình duyệt: Claude in Chrome hoặc Playwright MCP | Đọc đúng các trang dựng bằng JavaScript (React, Next.js, Webflow...), thấy được màu sắc và vị trí nút. Chỉ dùng web fetch thì những trang này có thể trả về trang trống |

### Skill sẽ hỏi bạn ở lần chạy đầu

`content-research` và `landing-page-audit` tự kiểm tra công cụ đang được kết nối trước khi làm việc. Nếu thiếu công cụ giúp kết quả tốt hơn, skill hỏi **một lần duy nhất**: chạy luôn với phương án miễn phí, hay dừng lại để kết nối (kèm hướng dẫn từng bước cho đúng nền tảng bạn đang dùng). Nếu bạn chọn chạy luôn và dự án có file `06-brand-context/brand-guide.md`, skill ghi lại lựa chọn vào mục "Công cụ đã kết nối" để không hỏi lại ở các lần sau.

Skill **không bao giờ** yêu cầu bạn dán API key vào khung chat. Key (nếu có) được đặt vào cấu hình MCP của nền tảng; với Ahrefs, Semrush và Perplexity, cách đơn giản nhất là đăng nhập bằng OAuth, không cần key.

### Kết nối nhanh

| Công cụ | Devin | Claude Code | Codex |
|---------|-------|-------------|-------|
| Ahrefs | `devin mcp add -s user ahrefs https://api.ahrefs.com/mcp/mcp` rồi `devin mcp login ahrefs` | `claude mcp add --transport http ahrefs https://api.ahrefs.com/mcp/mcp` | `codex mcp add ahrefs --url https://api.ahrefs.com/mcp/mcp` rồi `codex mcp login ahrefs` |
| Semrush | `devin mcp add -s user semrush https://mcp.semrush.com/v2/mcp` rồi `devin mcp login semrush` | `claude mcp add semrush https://mcp.semrush.com/v2/mcp -t http` | `codex mcp add semrush --url https://mcp.semrush.com/v2/mcp` rồi `codex mcp login semrush` |
| Perplexity | `devin mcp add -s user perplexity https://api.perplexity.ai/mcp` rồi `devin mcp login perplexity` | `claude mcp add --transport http perplexity https://api.perplexity.ai/mcp` | `codex mcp add perplexity --env PERPLEXITY_API_KEY="YOUR_API_KEY" -- npx -y @perplexity-ai/mcp-server` |
| Playwright | `devin mcp add -s user playwright -- npx @playwright/mcp@latest` | `claude mcp add playwright npx @playwright/mcp@latest` | `codex mcp add playwright npx "@playwright/mcp@latest"` |

Với Claude Code, sau khi thêm server OAuth hãy chạy `/mcp` trong phiên và chọn Authenticate. Trên Claude.ai, Ahrefs và Semrush có sẵn trong mục Connectors, chỉ cần bấm Connect. Playwright cần [Node.js](https://nodejs.org) 18 trở lên. Hướng dẫn đầy đủ (gói trả phí cần có, cách dùng key thay OAuth, cấu hình JSON cho Claude Desktop) nằm trong [01-content-research/references/tool-setup.md](01-content-research/references/tool-setup.md) và [05-landing-page-audit/references/tool-setup.md](05-landing-page-audit/references/tool-setup.md).

### Xuất file Word

**Khi cần xuất file Word (.docx):** nền tảng có sẵn skill docx (như Claude.ai) sẽ tự xử lý. Nếu không có, máy cần [Node.js](https://nodejs.org) cùng gói `docx` (`npm install docx`) hoặc [pandoc](https://pandoc.org). Mặc định mọi báo cáo đều xuất ra Markdown nên bạn không cần cài gì nếu không dùng Word.

## Cấu trúc thư mục

```
.
├── README.md
├── 00-marketing-orchestrator/
│   ├── SKILL.md                    # Skill điều phối cả đội
│   └── references/
│       ├── playbooks.md            # Bảng định tuyến + 6 chuỗi quy trình mẫu
│       └── delegation-briefs.md    # Mẫu brief và output_schema cho subagent
├── 01-content-research/
│   ├── SKILL.md
│   └── references/
│       └── tool-setup.md           # Kết nối Ahrefs, Semrush, Perplexity
├── 02-marketing-copywriting/
│   └── SKILL.md
├── 03-marketing-strategy/
│   ├── SKILL.md
│   └── references/
│       └── strategy-framework.md   # Khung lập luận 9 phần
├── 04-data-visualization/
│   └── SKILL.md
├── 05-landing-page-audit/
│   ├── SKILL.md
│   └── references/
│       ├── audit-framework.md      # Thang chấm điểm 5 tiêu chí
│       ├── docx-template.md        # Template xuất báo cáo Word
│       └── tool-setup.md           # Kết nối Playwright, Claude in Chrome
├── 06-brand-context/
│   └── brand-guide.md              # Mẫu ngữ cảnh thương hiệu dùng chung (không phải skill)
└── 07-hermes/                      # Không phải skill
    ├── install.sh                  # Cài lên Hermes (--current: profile đang chạy; mặc định: profile riêng)
    ├── distribution.yaml           # Manifest profile distribution của Hermes
    ├── SOUL.md                     # Danh tính "Trưởng phòng Marketing AI"
    ├── config.example.yaml         # Cấu hình mẫu khi cài vào Hermes hiện có
    └── dist/                       # Do install.sh tạo ra, có thể xoá
```

Số thứ tự chỉ nằm ở tên thư mục; tên skill (trường `name` trong `SKILL.md`) vẫn giữ nguyên không có số, ví dụ `content-research`.

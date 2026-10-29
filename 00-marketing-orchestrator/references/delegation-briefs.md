# Mẫu brief giao việc cho subagent

Subagent bắt đầu với hội thoại trống: nó không thấy cuộc trò chuyện với người dùng, không thấy kế hoạch, không thấy đầu ra của bước trước trừ khi bạn đưa đường dẫn. Nó cũng không thể hỏi người dùng. Vì vậy brief phải tự đủ. Một brief tốt giúp subagent làm đúng ngay lần đầu; một brief thiếu khiến nó đoán mò và bạn phải giao lại.

## Mẫu brief chung

Dùng mẫu này cho trường `goal` và `context` (trên Hermes: `delegate_task`). Điền đủ, xoá dòng không áp dụng.

**goal** (một câu, cụ thể, có đầu ra):

```
Dùng skill <tên-skill> để <việc cần làm>, lưu kết quả vào <đường dẫn file>.
```

**context:**

```
## Skill cần dùng
Nạp skill "<tên-skill>" trước khi làm (Hermes: skill_view("<tên-skill>"); nếu không có, đọc file <đường-dẫn-tuyệt-đối-tới-thư-mục-skill>/SKILL.md; thư mục có thể mang tiền tố số, ví dụ 01-content-research) và làm đúng quy trình, cấu trúc đầu ra, checklist của skill.

## Chế độ điều phối
Bạn đang chạy dưới sự điều phối của marketing-orchestrator. Không hỏi người dùng. Các quyết định dưới đây đã được người dùng chốt; dùng chúng thay vì hỏi lại. Nếu thiếu thông tin, chọn giả định hợp lý, ghi rõ trong mục "Giả định" ở cuối file đầu ra, và vẫn giao kết quả hoàn chỉnh.

## Mục tiêu của toàn chuỗi
<1-2 câu: người dùng đang muốn đạt điều gì, bước này đóng góp gì>

## Brand brief
<150-300 từ: thương hiệu, sản phẩm, thị trường, khán giả ưu tiên và ngôn ngữ của họ, định vị, thông điệp cốt lõi, giọng văn, cách xưng hô, mã màu và font, điều cấm>
File thương hiệu đầy đủ (đọc nếu cần chi tiết): <đường dẫn brand-guide.md hoặc "không có">

## Quyết định đã chốt
- Ngôn ngữ đầu ra: <tiếng Việt>
- Thị trường: <Việt Nam>
- Công cụ: <ví dụ "không có công cụ từ khoá, người dùng chọn chạy bằng web search" / "đã kết nối Ahrefs" / "dùng web fetch">
- Định dạng file: <Markdown / Word>
- <quyết định khác: kênh, số lượng bài, ngân sách, thời hạn...>

## Đầu vào
- <đường dẫn file đầu ra bước trước + đọc phần nào>
- <URL, file dữ liệu...>

## Đầu ra
- Lưu vào: <đường dẫn tuyệt đối trong thư mục marketing-runs/...>
- Tiêu chí hoàn thành: <2-4 gạch đầu dòng cụ thể, lấy từ cột "Kiểm tra" của playbook>

## Trả về
Khi xong, trả về bản tóm tắt ngắn gồm: trạng thái, các file đã tạo, 3-5 phát hiện hoặc quyết định quan trọng nhất, các giả định đã đưa ra, và câu hỏi còn mở cho người dùng (nếu có).
```

## output_schema đề xuất

Trên Hermes, gắn schema này vào từng task để nhận kết quả có cấu trúc. Schema cố ý chỉ bắt buộc vài trường để subagent dễ tuân thủ.

```json
{
  "type": "object",
  "properties": {
    "status": {"type": "string", "enum": ["done", "partial", "blocked"]},
    "output_files": {"type": "array", "items": {"type": "string"}},
    "key_points": {"type": "array", "items": {"type": "string"}},
    "assumptions": {"type": "array", "items": {"type": "string"}},
    "open_questions": {"type": "array", "items": {"type": "string"}}
  },
  "required": ["status", "output_files", "key_points"]
}
```

Nếu `status` là `blocked` hoặc `partial`, đọc `open_questions` và quyết định: tự giải quyết, hỏi người dùng (bạn có thể hỏi, subagent thì không), hoặc giao lại với brief bổ sung.

## Lưu ý riêng cho từng skill

### content-research
- Ghi rõ ngách, thị trường, khán giả, và quyết định công cụ (để skill không dừng lại hỏi).
- Nếu chuỗi tiếp theo là chiến lược, yêu cầu báo cáo có phần "Tóm tắt chiến lược" rõ ràng để bước sau dùng.
- `key_points` nên là 3-5 cơ hội nội dung hàng đầu.

### marketing-strategy
- Đưa mục tiêu có con số và thời hạn, ràng buộc ngân sách/đội ngũ/thời gian, và đường dẫn báo cáo nghiên cứu.
- Nếu playbook chỉ cần một phần (ví dụ định vị ở Playbook D, lịch nội dung ở Playbook B), nói rõ phần nào cần sâu, phần nào được rút gọn.
- `key_points` nên gồm: thông điệp cốt lõi (nguyên văn), khán giả ưu tiên, các kênh được chọn, KPI chính.

### marketing-copywriting
- Đưa định dạng và nền tảng cụ thể, số lượng bài/phương án, và trích nguyên văn thông điệp cốt lõi, khán giả ưu tiên, cách xưng hô từ chiến lược (đây là phần ngắn nên trích thẳng, không chỉ đưa đường dẫn).
- Khi chia nhiều subagent theo kênh, mỗi brief chỉ chứa kênh của nó, và nhắc "không lặp hook với kênh khác" kèm danh sách các kênh còn lại.
- Với Playbook C, liệt kê chính xác các phần trang cần viết lại và điểm yếu audit đã chỉ ra cho từng phần.

### data-visualization
- Đưa đường dẫn file dữ liệu, giai đoạn, mục tiêu ban đầu để so sánh, và mã màu/font từ brand brief.
- Yêu cầu `key_points` gồm các KPI đã tính (kèm con số) và 3-5 insight, để bước sau không phải đọc HTML.

### landing-page-audit
- Đưa URL mục tiêu, URL đối thủ, mục tiêu chuyển đổi của trang, và quyết định công cụ trình duyệt.
- Nếu chỉ có web fetch và trang có thể dựng bằng JavaScript, nhắc subagent ghi rõ trong báo cáo khi trang trả về trống thay vì chấm điểm.
- `key_points` nên gồm điểm tổng, tiêu chí yếu nhất, và các đề xuất tác động Cao.

## Ví dụ: Playbook A, bước 03 trên Hermes

```python
delegate_task(tasks=[
  {
    "goal": "Dùng skill marketing-copywriting để viết 5 bài Facebook cho chiến dịch ra mắt serum X, lưu vào /Users/an/shop/marketing-runs/2026-11-02-ra-mat-serum-x/03-copy/facebook.md",
    "context": "<brief đầy đủ theo mẫu, kênh: Facebook, 5 bài, trích thông điệp cốt lõi và khán giả từ 02-strategy.md, không lặp hook với TikTok và email>",
    "output_schema": {"type": "object", "properties": {"status": {"type": "string"}, "output_files": {"type": "array", "items": {"type": "string"}}, "key_points": {"type": "array", "items": {"type": "string"}}}, "required": ["status", "output_files", "key_points"]}
  },
  {
    "goal": "Dùng skill marketing-copywriting để viết 3 caption + kịch bản mở đầu TikTok cho chiến dịch ra mắt serum X, lưu vào .../03-copy/tiktok.md",
    "context": "<brief đầy đủ, kênh: TikTok>"
  },
  {
    "goal": "Dùng skill marketing-copywriting để viết chuỗi 3 email ra mắt serum X, lưu vào .../03-copy/email.md",
    "context": "<brief đầy đủ, kênh: email>"
  }
])
```

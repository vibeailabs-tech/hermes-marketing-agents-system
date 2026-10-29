---
name: landing-page-audit
description: "Audit bất kỳ landing page đang chạy nào về hiệu quả chuyển đổi và tạo ra một báo cáo audit chuyên nghiệp. Dùng skill này bất cứ khi nào người dùng muốn audit, review, phân tích hoặc chấm điểm một landing page hay website để tối ưu chuyển đổi, đánh giá độ rõ ràng của headline / sức mạnh CTA / social proof / xử lý phản đối / luồng thuyết phục, so sánh một trang với đối thủ, hoặc nói 'audit landing page này', 'review landing page của mình', 'chấm điểm trang này', 'làm sao tăng chuyển đổi cho trang này', 'so sánh trang của mình với [đối thủ]' (hoặc tiếng Anh: 'audit this landing page', 'review my landing page', 'score this page', 'how can I improve this page's conversion', 'compare my page to [competitor]'). Nhận 1 URL mục tiêu và tối đa 2 URL đối thủ tuỳ chọn. Đọc trang bằng công cụ trình duyệt (Claude in Chrome, Playwright) khi có, nếu không thì web fetch. Quét ngữ cảnh thương hiệu của dự án trước và phản ánh nó trong báo cáo. Mặc định xuất báo cáo audit dạng Markdown, hoặc file Word nếu người dùng yêu cầu."
metadata:
  author: Vibe AI Labs
  version: 1.3.0
  hermes:
    tags: [Marketing, CRO, Landing Page, Audit, Conversion]
    category: marketing
    related_skills: [marketing-orchestrator]
---

# Audit chuyển đổi landing page (Landing Page Audit)

Audit một landing page đang chạy dựa trên một khung chuyển đổi có cấu trúc và giao một báo cáo chuyên nghiệp mà marketer có thể hành động ngay. Đọc trang, chấm điểm theo năm tiêu chí có trọng số, tuỳ chọn so sánh với đối thủ, và xuất báo cáo với các phát hiện có bằng chứng và đề xuất được xếp thứ tự ưu tiên.

## Khi chạy dưới sự điều phối

Nếu bạn nhận việc từ `marketing-orchestrator` (hoặc một agent điều phối khác) kèm brief, brief đó là nguồn sự thật: dùng brand brief, các quyết định đã chốt (công cụ, thị trường, ngôn ngữ, xưng hô, định dạng) và nơi lưu đầu ra được chỉ định, thay vì tự hỏi lại hay lưu vào thư mục mặc định. Vẫn đọc file thương hiệu hoặc file đầu vào mà brief trỏ tới khi cần chi tiết. Subagent không thể hỏi người dùng, nên bỏ qua mọi bước hỏi trong skill này: thiếu thông tin thì chọn giả định hợp lý, ghi rõ trong mục "Giả định" ở cuối đầu ra, và vẫn giao kết quả hoàn chỉnh.

## Quy trình

0. **Luôn quét ngữ cảnh thương hiệu trước tiên**: trước khi audit, hãy quét dự án để tìm ngữ cảnh thương hiệu liên quan (một thư mục hoặc các file chứa giọng văn, định vị, khán giả, màu sắc của thương hiệu; tên gọi mỗi nơi mỗi khác, hãy nhận diện qua nội dung). Đây là bước bắt buộc. Dùng bất cứ thứ gì có sẵn để định hướng các đề xuất theo khán giả và định vị của thương hiệu này, và để tạo kiểu cho báo cáo nếu được yêu cầu bản Word.
1. **Thu thập URL**: URL mục tiêu (bắt buộc) và tối đa 2 URL đối thủ (tuỳ chọn). Đồng thời làm bước Kiểm tra công cụ bên dưới; nếu cần hỏi, gộp chung vào cùng một tin nhắn.
2. **Đọc từng trang**: trích xuất nội dung thật (xem phần Đọc trang, không phụ thuộc công cụ).
3. **Chấm điểm từng trang**: áp dụng khung 5 tiêu chí (xem [audit-framework.md](references/audit-framework.md)).
4. **Tạo báo cáo**: mặc định là báo cáo Markdown (hoặc file Word nếu người dùng yêu cầu) gồm điểm số, bằng chứng, so sánh và đề xuất.

## Kiểm tra công cụ (hỏi tối đa một lần)

Xem danh sách công cụ bạn đang có trong phiên này (Claude in Chrome, Playwright MCP, hoặc bất kỳ tool điều khiển trình duyệt nào: tên thường chứa browser, chrome, playwright, puppeteer).

1. **Đã có công cụ trình duyệt:** dùng luôn, không hỏi gì thêm.
2. **Chưa có, nhưng người dùng đã từng quyết định:** nếu ngữ cảnh dự án có ghi chú về công cụ (ví dụ mục "Công cụ đã kết nối" trong brand guide) cho biết người dùng chọn dùng web fetch, thì chạy tiếp, không hỏi lại.
3. **Chưa có và chưa từng hỏi:** hỏi đúng một lần, theo tinh thần sau (điều chỉnh theo ngôn ngữ và giọng của người dùng):

   > Hiện chưa có công cụ trình duyệt nào được kết nối, nên mình sẽ đọc trang bằng web fetch. Cách này ổn với trang HTML thông thường (như WordPress), nhưng trang dựng bằng React/Next.js/Webflow có thể bị trống, và mình sẽ không thấy được màu sắc hay vị trí thực tế của nút. Bạn muốn:
   > **(a)** Chạy luôn bằng web fetch
   > **(b)** Kết nối Playwright MCP (miễn phí, cần Node.js) hoặc Claude in Chrome. Mình sẽ hướng dẫn từng bước.

   - **Nếu chọn (b):** đọc [tool-setup.md](references/tool-setup.md) và chỉ đưa hướng dẫn cho đúng nền tảng đang dùng (nếu không chắc, hỏi). Nhắc rằng có thể phải khởi động lại phiên agent để công cụ mới xuất hiện, rồi dừng lại chờ họ kết nối xong.
   - **Nếu chọn (a), không trả lời rõ, hoặc đã yêu cầu chạy ngay từ đầu:** chạy tiếp bằng web fetch. Nếu dự án có file ngữ cảnh thương hiệu, ghi một dòng vào mục công cụ (ví dụ "Landing page audit: dùng web fetch, không cần nhắc kết nối") để lần sau không hỏi lại. Nếu sau đó gặp trang trống do JavaScript, vẫn được phép gợi ý lại phương án (b) cho riêng trang đó.

## Đọc trang (không phụ thuộc công cụ)

Đọc trang thật đang chạy; không bao giờ audit dựa trên trí nhớ hay phỏng đoán. Dùng phương pháp tốt nhất hiện có:

1. **Công cụ trình duyệt thật, nếu có kết nối** (tốt nhất, có chạy JavaScript): Claude in Chrome (tạo tab, điều hướng đến URL, dùng `get_page_text` lấy nội dung và `read_page` lấy cấu trúc), Playwright MCP, hoặc bất kỳ công cụ điều khiển trình duyệt nào nền tảng cung cấp. Cách này xử lý chính xác các trang render phía client và còn cho phép xem bố cục trên mobile.
2. **Web fetch, làm phương án dự phòng**: nếu không có công cụ trình duyệt, hãy fetch URL. Lưu ý rằng fetch trả về HTML thô mà không chạy JavaScript, nên một trang render phía client có thể chỉ trả về một khung gần như trống. Nếu nội dung fetch được rõ ràng chỉ là khung (biểu tượng đang tải, "enable JavaScript", không có nội dung chính), hãy nói rõ điều đó và đề xuất kết nối một công cụ trình duyệt (Claude in Chrome, Playwright MCP) để đọc chính xác thay vì chấm điểm một trang trống.

Với fetch, bạn không nhìn thấy màu sắc, độ tương phản hay vị trí thực tế của nút. Khi chấm các yếu tố thị giác này mà chỉ có HTML, hãy suy luận từ cấu trúc và ghi rõ trong báo cáo rằng đó là đánh giá gián tiếp.

Với mỗi trang, trích xuất và phân tích: headline (H1, H2, tiêu đề phụ), CTA (chữ trên nút, vị trí, độ tương phản, số lượng), social proof (lời chứng thực, logo, số liệu, đánh giá), xử lý phản đối (FAQ, cam kết bảo đảm, huy hiệu tin cậy), và cấu trúc cùng luồng của trang.

## Khung chấm điểm

| Tiêu chí | Trọng số | Trọng tâm |
|-----------|--------|-------|
| Độ rõ ràng của headline (H) | 20% | Ai, cái gì, vì sao, ngay trong headline |
| Sức mạnh CTA (C) | 25% | Độ nổi bật, ngôn từ hướng hành động |
| Xử lý phản đối (O) | 20% | Chủ động giải toả các băn khoăn |
| Vị trí social proof (S) | 15% | Xác nhận từ bên thứ ba hiển thị rõ |
| Kiến trúc thuyết phục (P) | 20% | Hành trình logic từ vấn đề đến hành động |

Chấm mỗi tiêu chí từ 1 đến 10. Điểm tổng có trọng số: `(H*0.20) + (C*0.25) + (O*0.20) + (S*0.15) + (P*0.20)`.

Xem [audit-framework.md](references/audit-framework.md) để biết thang chấm chi tiết và bằng chứng cần thu thập cho từng tiêu chí.

## Tạo báo cáo

Mặc định là **báo cáo Markdown**: lưu một file `.md` với các phần bên dưới, dùng bảng Markdown cho phần so sánh song song và tiêu đề rõ ràng cho từng trang. Ghi kèm nhãn mức điểm ngay cạnh mỗi điểm số (Xanh lá 7-10, Vàng 4-6, Đỏ 1-3) vì Markdown không tô màu chữ được. Phản ánh ngữ cảnh thương hiệu đã nạp ở Bước 0 trong cách trình bày và các đề xuất.

**Chỉ khi người dùng yêu cầu file Word**: **đọc [docx-template.md](references/docx-template.md) trước khi tạo**; file này chứa template code docx-js, bố cục các phần và cách mã hoá màu. Template cần Node.js và gói `docx` (`npm install docx`); nếu nền tảng có sẵn skill docx thì có thể dùng skill đó với cùng bố cục và màu sắc.

### Các phần của báo cáo

1. **Trang bìa**: URL mục tiêu, URL đối thủ (nếu có), ngày audit, điểm tổng.
2. **Tóm tắt điều hành**: một đoạn về vị thế tổng thể và cơ hội lớn nhất (hoặc, với audit độc lập, điểm mạnh và điểm yếu lớn nhất).
3. **Bảng so sánh song song**: tất cả các trang được chấm theo 5 tiêu chí, mã hoá màu (bỏ qua nếu audit độc lập).
4. **Phân tích chi tiết từng trang**: phân tích chi tiết cho mỗi trang với bằng chứng cụ thể trích từ nội dung trang.
5. **Đề xuất theo thứ tự ưu tiên**: 5 đến 7 mục được gắn nhãn tác động Cao / Trung bình / Thấp (ưu tiên theo trọng số tiêu chí: thiếu sót về CTA ở mức 25% quan trọng hơn social proof ở mức 15%).
6. **Quick win**: 3 thay đổi có thể triển khai ngay lập tức.

### Kiểu dáng báo cáo (bản Word)

Khi tạo bản Word, áp dụng màu sắc và font chữ thương hiệu của dự án nếu ngữ cảnh có cung cấp. Nếu không, dùng bộ mặc định chuyên nghiệp, trung tính, gọn gàng sau (được định nghĩa trong docx template):

- Màu chính `#233D4D` (tiêu đề, header của bảng)
- Màu phụ `#215E61` (tiêu đề phụ)
- Màu nhấn `#FE7F2D` (điểm nhấn, chú thích điểm số)
- Tông nhạt `#F5FBE6` (tô nền dòng bảng)

**Mã hoá màu điểm số** (giữ nguyên bất kể thương hiệu, vì chúng thể hiện mức hiệu quả): Xanh lá 7 đến 10 `#22C55E`, Vàng 4 đến 6 `#EAB308`, Đỏ 1 đến 3 `#EF4444`.

## Audit độc lập (chỉ 1 URL)

Nếu chỉ có URL mục tiêu: bỏ qua bảng so sánh đối thủ, tập trung phần tóm tắt điều hành vào điểm mạnh và điểm yếu, và dựa các đề xuất trên thực hành tốt về chuyển đổi thay vì khoảng cách với đối thủ. Docx template có ghi chú cách điều chỉnh (bảng 2 cột, không có các phần về đối thủ).

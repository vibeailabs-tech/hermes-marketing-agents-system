---
name: marketing-copywriting
description: "Viết nội dung marketing sẵn sàng đăng, đúng giọng văn thương hiệu, cho nhiều định dạng: bài blog, email và newsletter, bài đăng mạng xã hội, nội dung quảng cáo, và các phần của landing page. Dùng skill này bất cứ khi nào marketer muốn soạn, viết hoặc viết lại nội dung hay copy, biến ghi chú hoặc nghiên cứu thành một bài hoàn chỉnh, chuyển một tài sản nội dung sang định dạng khác, hoặc nói 'viết một [bài blog/email/post/quảng cáo/landing page]', 'soạn copy cho [x]', 'chuyển cái này thành [định dạng]', 'viết theo giọng của tụi mình', 'cho mình vài phương án tiêu đề', 'viết lại cho cuốn hơn' (hoặc 'write a [blog/email/post/ad]', 'draft copy for [x]', 'write this in our voice'). Áp dụng các mẫu viết hiện đại tối ưu cho tìm kiếm AI và chuyển đổi, lấy giọng văn thương hiệu từ ngữ cảnh dự án khi có, và hỏi khi không có. Không phụ thuộc thương hiệu và hoạt động độc lập; làm việc từ một chủ đề, một brief, tài liệu nghiên cứu, hoặc nội dung có sẵn cần tái sử dụng."
metadata:
  author: Vibe AI Labs
  version: 1.2.0
  hermes:
    tags: [Marketing, Copywriting, Content, Social, Ads, Email]
    category: marketing
    related_skills: [marketing-orchestrator]
---

# Viết nội dung marketing (Marketing Copywriting)

Viết copy marketing hoàn chỉnh, đúng thương hiệu, ở bất kỳ định dạng nào marketer cần. Skill này biến một chủ đề, một brief, tài liệu nghiên cứu hoặc một tài sản nội dung có sẵn thành copy sẵn sàng đăng: có cấu trúc, cụ thể, đúng giọng thương hiệu, và được định dạng để vừa dễ đọc lướt với con người vừa dễ trích xuất với máy.

Quy tắc cứng duy nhất giúp nội dung đáng tin: **không bịa đặt dữ kiện, số liệu, trích dẫn hay câu chuyện khách hàng.** Dùng những gì người dùng cung cấp hoặc những gì nghiên cứu mang lại. Nếu một bài cần một dữ kiện mà bạn không có, hãy viết lách qua nó để copy vẫn đọc như bản hoàn chỉnh; con người luôn duyệt lại trước khi đăng, nên đừng tự bịa ra dữ kiện.

## Khi chạy dưới sự điều phối

Nếu bạn nhận việc từ `marketing-orchestrator` (hoặc một agent điều phối khác) kèm brief, brief đó là nguồn sự thật: dùng brand brief, các quyết định đã chốt (công cụ, thị trường, ngôn ngữ, xưng hô, định dạng) và nơi lưu đầu ra được chỉ định, thay vì tự hỏi lại hay lưu vào thư mục mặc định. Vẫn đọc file thương hiệu hoặc file đầu vào mà brief trỏ tới khi cần chi tiết. Subagent không thể hỏi người dùng, nên bỏ qua mọi bước hỏi trong skill này: thiếu thông tin thì chọn giả định hợp lý, ghi rõ trong mục "Giả định" ở cuối đầu ra, và vẫn giao kết quả hoàn chỉnh.

## Bước 0: Luôn quét ngữ cảnh thương hiệu trước tiên

Trước khi soạn bất cứ thứ gì, hãy quét dự án để tìm ngữ cảnh thương hiệu liên quan (một thư mục hoặc các file chứa giọng văn, tông giọng, thông điệp, khán giả hoặc định vị của thương hiệu; tên gọi mỗi nơi mỗi khác, hãy nhận diện qua nội dung chứ không theo đường dẫn cố định). Đây là bước bắt buộc. Nếu có hướng dẫn giọng văn hoặc style guide, hãy đọc và viết theo giọng đó, áp dụng tông giọng, từ vựng, những điều nên và không nên xuyên suốt để đầu ra mặc định đã đúng thương hiệu. Nếu không có file giọng văn, hãy xin một mô tả ngắn về giọng văn hoặc 1 đến 2 bài mẫu trước khi viết. Không bao giờ tự bịa ra giọng văn và không bao giờ mặc định dùng giọng doanh nghiệp chung chung.

## Bước 1: Xác định định dạng, mục tiêu và giọng văn

Xác nhận (hoặc suy ra từ ngữ cảnh) năm điều trước khi viết:

- **Định dạng:** bài blog, email/newsletter, bài đăng mạng xã hội (và nền tảng nào), nội dung quảng cáo (và kênh nào), hoặc một phần của landing page. Mỗi loại có một hình dạng khác nhau (xem Cẩm nang định dạng).
- **Mục tiêu và khán giả:** bài viết cần khiến người đọc làm gì hoặc cảm thấy gì, và họ là ai.
- **Tài liệu nguồn:** một chủ đề cần phát triển, một brief cần làm theo, nghiên cứu cần dựa vào, hoặc một tài sản nội dung có sẵn cần tái sử dụng. Hãy dùng nó, đừng bỏ qua.
- **Giọng văn thương hiệu.** Đã xác nhận ở Bước 0 bên trên; áp dụng xuyên suốt (tông giọng, từ vựng, những điều nên và không nên). Kiểm tra lại ngữ cảnh thương hiệu đã nạp so với định dạng cụ thể trước khi viết.
- **Ngôn ngữ và cách xưng hô.** Viết bằng ngôn ngữ của khán giả (mặc định tiếng Việt nếu người dùng trao đổi bằng tiếng Việt). Với tiếng Việt, xác định cách xưng hô thương hiệu đã chọn (mình - bạn, chúng tôi - quý khách, team - các bạn, em - anh chị...) và giữ nhất quán trong toàn bài; đổi xưng hô giữa chừng là lỗi khiến copy mất chuyên nghiệp ngay lập tức.

Nếu có nhiều điểm chưa rõ, hãy hỏi gộp trong một tin nhắn, rồi viết.

## Bước 2: Áp dụng các mẫu viết (mọi định dạng)

Những điều sau đúng với mọi định dạng:

- **Vào thẳng vấn đề.** Mở đầu bằng câu trả lời, hook hoặc giá trị, rồi mới thêm chiều sâu. Đừng bao giờ chôn ý chính dưới những câu dạo đầu.
- **Cụ thể.** Ưu tiên con số, tên gọi và ví dụ cụ thể thay vì tuyên bố mơ hồ. Cụ thể thì đáng tin và dễ trích dẫn; mơ hồ thì chỉ là chữ độn.
- **Viết để đọc lướt và để trích xuất.** Đoạn văn ngắn (2 đến 4 câu, mỗi đoạn một ý), tiêu đề phụ mang tính mô tả, dùng danh sách cho bất kỳ nhóm mục hay các bước nào, dùng bảng cho các so sánh thực sự, in đậm tiết chế cho từ khoá chính. Đặt ý chính của mỗi đoạn ngay câu đầu tiên. Đừng định dạng quá tay đến mức thành nhiễu.
- **Một CTA rõ ràng.** Cho người đọc biết bước tiếp theo duy nhất, đúng giọng văn, không ép bán.
- **Loại bỏ dấu hiệu văn AI.** Không dùng dấu gạch ngang dài (em dash), không "trong thế giới phát triển nhanh chóng ngày nay", không nhồi bộ ba cho đủ nhịp, không chồng chất những từ nối rỗng như "hơn nữa" / "ngoài ra" / "bên cạnh đó", không mở bài kiểu "Bạn có bao giờ tự hỏi...", không kết bằng "Hãy cùng khám phá nhé!", không lạm dụng từ Hán Việt hay tiếng Anh chen ngang khi có từ Việt tự nhiên hơn. Hãy đọc thầm trong đầu; nếu một marketer thật sẽ không nói câu đó, hãy cắt.

## Bước 3: Cẩm nang định dạng

Chọn hình dạng khớp với định dạng. Linh hoạt phần thân, giữ vững các nguyên tắc nền tảng.

### Bài blog
Cấu trúc SEO/tìm kiếm AI. Mở đầu bằng 1 đến 2 câu trả lời trực tiếp cho câu hỏi chính (đứng độc lập được, nêu tên thực thể chính). Tiếp theo là phần Ý chính (Key Takeaways, 3 đến 5 gạch đầu dòng có thể trích riêng). Phần thân dùng các H2 dạng câu hỏi, mỗi phần mở đầu bằng câu trả lời trực tiếp rồi mới đi sâu, và mỗi phần có thể đứng riêng nếu bị trích ra khỏi thứ tự. Kết thúc bằng FAQ (mỗi câu hỏi diễn đạt đúng như cách mọi người hỏi, câu đầu tiên trả lời trọn vẹn) và một CTA nhẹ nhàng. Cung cấp metadata SEO cuối cùng: thẻ title (50 đến 60 ký tự), meta description (150 đến 160 ký tự), slug.

### Email / newsletter
Đưa ra 3 đến 5 phương án subject line và preview text. Mỗi email một ý cốt lõi. Ngắn, dễ đọc lướt, mang tính trò chuyện. Một CTA chính duy nhất (có thể thêm một link phụ). Mở đầu bằng lợi ích của người đọc, không phải tin tức của người gửi. Với một kỳ newsletter, dùng các phần rõ ràng với tiêu đề phụ dễ đọc lướt.

### Bài đăng mạng xã hội
Khớp với nền tảng: Facebook (dòng đầu là hook vì chỉ khoảng 2-3 dòng hiện trước nút "Xem thêm", đoạn ngắn, kể chuyện hoặc giá trị cụ thể, CTA rõ, emoji vừa phải nếu hợp giọng thương hiệu), TikTok (caption ngắn, hook ngay câu đầu, kèm gợi ý kịch bản/lời thoại 3 giây mở đầu nếu là video), LinkedIn (dòng hook, các dòng ngắn xếp chồng, khoảng trắng, insight hoặc câu chuyện, CTA nhẹ), X/Twitter (gọn, một ý, chỉ làm thread khi thực sự xứng đáng), caption Instagram (hook + giá trị + CTA + vài hashtag liên quan). Luôn mở đầu bằng một dòng khiến người ta dừng lướt. Đưa ra 2 đến 3 phương án hook khi hữu ích.

### Nội dung quảng cáo
Đưa ra nhiều phương án (3 đến 5) để test. Tôn trọng cấu trúc của từng kênh (ví dụ Google: headline + description trong giới hạn ký tự; Meta: primary text + headline + description). Mở đầu bằng lợi ích hoặc hook mạnh nhất, gọi tên khán giả hoặc nỗi đau, kết thúc bằng một CTA rõ ràng. Ghi chú số ký tự.

### Phần landing page
Viết các phần được yêu cầu: hero (headline + subhead + CTA), các khối lợi ích, cách trình bày social proof, xử lý phản đối/FAQ, CTA cuối. Headline phải truyền tải được dành cho ai, họ nhận được gì, và vì sao điều đó quan trọng. Ưu tiên chuyển đổi: rõ ràng hơn khéo léo, một CTA chủ đạo.

## Bước 4: Tái sử dụng nội dung (repurposing)

Khi chuyển một tài sản nội dung thành định dạng khác (blog thành newsletter, transcript thành bài mạng xã hội, webinar thành nội dung quảng cáo): giữ các ý cốt lõi và giọng thương hiệu, nhưng định hình lại hoàn toàn theo định dạng đích dựa trên cẩm nang ở trên. Một bài tái sử dụng phải đọc như được viết riêng cho định dạng mới, không phải một đoạn trích dán vào. Lấy những điểm đáng trích dẫn nhất, giá trị nhất; bỏ những gì không vừa với khuôn mới.

## Bước 5: Đầu ra

Với copy ngắn (bài mạng xã hội, các phương án quảng cáo, subject line, một phần đơn lẻ), trả về trực tiếp trong chat, gắn nhãn rõ ràng. Với nội dung dài (bài blog, newsletter đầy đủ, landing page nhiều phần), lưu file Markdown vào thư mục content/output của dự án với tên kebab-case mô tả rõ, và trình bày cho người dùng. Nếu người dùng muốn rõ ràng là file Word, hãy dùng skill docx nếu nền tảng có; nếu không, chuyển file Markdown sang `.docx` bằng `pandoc` hoặc thư viện `docx` (Node.js).

Con người luôn duyệt lại trước khi đăng, nên hãy giao copy hoàn chỉnh thay vì đánh dấu các chỗ trống để họ tự điền.

## Checklist chất lượng

- [ ] Đã quét ngữ cảnh thương hiệu trước tiên; giọng văn lấy từ đó hoặc đã hỏi, được áp dụng xuyên suốt, không bịa hay chung chung
- [ ] Đã xác nhận định dạng, mục tiêu, khán giả và tài liệu nguồn
- [ ] Đúng ngôn ngữ của khán giả; cách xưng hô nhất quán từ đầu đến cuối
- [ ] Vào thẳng vấn đề; cụ thể, không mơ hồ; không bịa dữ kiện
- [ ] Định dạng để đọc lướt và trích xuất; không định dạng quá tay
- [ ] Một CTA rõ ràng, đúng giọng, nhẹ nhàng
- [ ] Đã loại bỏ dấu hiệu văn AI; không có em dash
- [ ] Có đủ các thành phần riêng của định dạng (ví dụ blog: câu trả lời mở đầu + ý chính + H2 dạng câu hỏi + FAQ + metadata; email: các phương án subject + preview; quảng cáo/mạng xã hội: nhiều phương án kèm ghi chú giới hạn ký tự)
- [ ] Đầu ra được lưu/trả về đúng dạng, là copy hoàn chỉnh sẵn sàng đăng

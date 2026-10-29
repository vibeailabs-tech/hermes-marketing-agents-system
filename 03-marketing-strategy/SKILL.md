---
name: marketing-strategy
description: "Biến một mục tiêu, một brief hoặc tài liệu nghiên cứu thành một bản đề xuất chiến lược marketing có cấu trúc. Dùng skill này bất cứ khi nào marketer cần chiến lược marketing, đề xuất chiến lược, chiến lược go-to-market hoặc chiến dịch, kế hoạch kênh, chiến lược nội dung, hoặc kế hoạch theo quý/ra mắt sản phẩm, hoặc nói 'xây dựng chiến lược marketing cho [x]', 'viết đề xuất chiến lược', 'lên kế hoạch GTM', 'chiến lược marketing của mình nên là gì' (hoặc 'build a marketing strategy for [x]', 'write a strategy proposal', 'put together a GTM plan'), hoặc đưa ra nghiên cứu/ghi chú và yêu cầu một kế hoạch. Tạo ra bản đề xuất có cấu trúc gồm mục tiêu, khán giả, định vị, chiến lược kênh, lộ trình theo giai đoạn, hướng dẫn ngân sách và chỉ số thành công, mặc định dưới dạng báo cáo Markdown (hoặc file Word nếu người dùng yêu cầu). Không phụ thuộc thương hiệu: quét ngữ cảnh dự án trước nếu có, nếu không thì thu thập các thông tin đầu vào cần thiết trước khi đề xuất."
metadata:
  author: Vibe AI Labs
  version: 1.2.0
  hermes:
    tags: [Marketing, Strategy, GTM, Planning, Positioning]
    category: marketing
    related_skills: [marketing-orchestrator]
---

# Chiến lược marketing (Marketing Strategy)

Biến một mục tiêu marketing thành một bản đề xuất chiến lược rõ ràng, có cơ sở bảo vệ, mà marketer có thể trình bày cho khách hàng, cho cấp quản lý hoặc cho chính mình và bắt tay thực hiện. Đầu ra là một tài liệu có cấu trúc: chúng ta muốn đạt được gì, chúng ta đang nói chuyện với ai, chúng ta sẽ định vị thế nào, sẽ dùng những kênh nào và vì sao, lộ trình theo giai đoạn, chi phí bao nhiêu, và làm sao biết là đã hiệu quả.

Đây là một skill lập kế hoạch. Nó tạo ra chiến lược, không tạo ra tài sản nội dung; copy, quảng cáo và hình ảnh sẽ do các skill khác xây dựng sau khi chiến lược được duyệt. Mọi đề xuất phải được lý giải, không chỉ khẳng định suông; một chiến lược mà người đọc không theo được mạch lập luận thì chỉ là một danh sách chiến thuật.

## Khi chạy dưới sự điều phối

Nếu bạn nhận việc từ `marketing-orchestrator` (hoặc một agent điều phối khác) kèm brief, brief đó là nguồn sự thật: dùng brand brief, các quyết định đã chốt (công cụ, thị trường, ngôn ngữ, xưng hô, định dạng) và nơi lưu đầu ra được chỉ định, thay vì tự hỏi lại hay lưu vào thư mục mặc định. Vẫn đọc file thương hiệu hoặc file đầu vào mà brief trỏ tới khi cần chi tiết. Subagent không thể hỏi người dùng, nên bỏ qua mọi bước hỏi trong skill này: thiếu thông tin thì chọn giả định hợp lý, ghi rõ trong mục "Giả định" ở cuối đầu ra, và vẫn giao kết quả hoàn chỉnh.

## Bước 1: Thu thập thông tin đầu vào

Một chiến lược chỉ tốt bằng thông tin đầu vào của nó. Hãy xác lập những điều sau trước khi viết. **Quét ngữ cảnh dự án trước tiên** (thương hiệu, khán giả, giọng văn, sản phẩm/ưu đãi, nghiên cứu trước đó, các mục tiêu; nhận diện file qua nội dung, tên gọi mỗi nơi mỗi khác) — đây là bước bắt buộc, và mọi ngữ cảnh thương hiệu hiện có phải được đưa vào chiến lược để định vị, khán giả và kênh phù hợp với chính thương hiệu này thay vì một thương hiệu chung chung. Lấp các khoảng trống còn lại bằng cách hỏi người dùng gộp trong một tin nhắn:

- **Mục tiêu:** mục tiêu kinh doanh và, lý tưởng nhất, một chỉ tiêu đo lường được kèm khung thời gian (ví dụ "300 lead đủ điều kiện trong Q3", "ra mắt sản phẩm X vào tháng 9", "tăng 25% lượt đăng ký dùng thử"). Mục tiêu mơ hồ sẽ dẫn đến chiến lược mơ hồ.
- **Khán giả:** chúng ta muốn tiếp cận ai, nỗi đau của họ là gì, và họ dành sự chú ý ở đâu.
- **Điểm xuất phát về sản phẩm & định vị:** cái gì đang được marketing và hiện đang được định vị thế nào.
- **Ràng buộc:** khoảng ngân sách, đội ngũ/năng lực, thời hạn, các kênh đang dùng, và những gì không được đụng tới.
- **Bối cảnh:** đối thủ, hiệu quả hiện tại, những gì đã hiệu quả hoặc thất bại trước đây.

Nếu thiếu nghiên cứu mà quyết định lại phụ thuộc vào nó (nhu cầu, góc tiếp cận của đối thủ, ngôn ngữ của khán giả), hãy chạy hoặc đề xuất chạy skill content-research trước thay vì đoán.

## Bước 2: Xây dựng chiến lược

Đọc [strategy-framework.md](references/strategy-framework.md) để nắm toàn bộ mô hình lập luận. Làm lần lượt theo thứ tự; mỗi phần là đầu vào cho phần sau.

Xương sống:

1. **Tình hình**: một đánh giá ngắn gọn, trung thực về hiện trạng (thị trường, khán giả, cạnh tranh, hiệu quả hiện tại). Gọi tên thách thức hoặc cơ hội cốt lõi mà chiến lược này giải quyết.
2. **Mục tiêu**: mục tiêu được diễn đạt lại thành các kết quả cụ thể, đo lường được, có khung thời gian. Tách mục tiêu chính khỏi các mục tiêu hỗ trợ.
3. **Khán giả mục tiêu**: (các) phân khúc ưu tiên, nỗi đau và yếu tố kích hoạt của họ, và ngôn ngữ họ dùng. Nếu có nhiều phân khúc, hãy xếp hạng; một chiến lược nhắm vào tất cả mọi người là không nhắm vào ai cả.
4. **Định vị & thông điệp cốt lõi**: một ý tưởng duy nhất mà khán giả cần nhớ, vì sao nó đáng tin, và nó khác biệt thế nào. Mọi thứ phía sau đều phải phục vụ ý tưởng này.
5. **Chiến lược kênh**: những kênh nào, đóng vai trò gì (thu hút / nuôi dưỡng / chuyển đổi / giữ chân), và *vì sao mỗi kênh phù hợp với khán giả và mục tiêu này*. Lý giải cả lựa chọn đưa vào lẫn loại bỏ. Đừng liệt kê mọi kênh; hãy chọn những kênh xứng đáng có mặt.
6. **Lộ trình / phân giai đoạn**: kế hoạch theo thời gian, chia giai đoạn (ví dụ nền tảng, ra mắt, mở rộng) hoặc lịch theo từng tuần cho một chiến dịch. Thể hiện trình tự và sự phụ thuộc, không chỉ là một đống chiến thuật.
7. **Ngân sách & nguồn lực**: công sức và chi tiêu được phân bổ thế nào giữa các kênh và giai đoạn, gắn với kết quả kỳ vọng. Dùng khoảng giá trị và giả định rõ ràng khi không có con số chính xác.
8. **Chỉ số thành công**: các KPI chứng minh được mục tiêu, gồm chỉ số dẫn dắt (leading) và chỉ số kết quả (lagging), kèm chỉ tiêu và tần suất đánh giá. Định nghĩa thế nào là "hiệu quả" trước khi triển khai.
9. **Rủi ro & giả định**: các rủi ro chính và những giả định mà kế hoạch dựa vào, để người đọc có thể kiểm tra sức chịu đựng của nó.

Làm rõ các đánh đổi. Chiến lược là một tập hợp các lựa chọn; nói rõ những gì bạn *không* làm, và vì sao, cũng có giá trị như những gì bạn làm.

## Bước 3: Tạo tài liệu

Mặc định là một **báo cáo Markdown** có cấu trúc. Lưu một file `.md` vào thư mục strategy/output của dự án với: khối tiêu đề (tiêu đề, khách hàng/thương hiệu, ngày), phần tóm tắt điều hành (toàn bộ chiến lược trong một phần mà người đọc bận rộn có thể nắm được), sau đó là chín phần ở trên dưới dạng các tiêu đề rõ ràng, bảng Markdown cho kế hoạch kênh / lộ trình / ngân sách / chỉ số, và một đề xuất kết luận ngắn. Thể hiện thương hiệu xuyên suốt (ngôn ngữ, định vị, khán giả) dựa trên ngữ cảnh đã nạp ở Bước 1.

**Chỉ khi người dùng yêu cầu file Word** (ví dụ để trình bày cho khách hàng hoặc các bên liên quan), hãy xây dựng cùng cấu trúc đó thành file `.docx` có trang bìa (dùng skill docx nếu nền tảng có; nếu không, dùng thư viện `docx` của Node.js hoặc `pandoc`), áp dụng màu sắc và font chữ của thương hiệu nếu ngữ cảnh dự án có cung cấp, nếu không thì dùng một bảng màu chuyên nghiệp, trung tính, gọn gàng.

Dùng tên file kebab-case mô tả rõ, ví dụ `marketing-strategy-<muc-tieu-hoac-thuong-hieu>-<ngay>`, rồi trình bày cho người dùng.

## Các nguyên tắc cần giữ

Lý giải mọi đề xuất; lập luận chính là sản phẩm. Gắn mọi chiến thuật với một mục tiêu; nếu nó không phục vụ mục tiêu nào, hãy cắt. Cụ thể và thực tế về ngân sách, năng lực và thời hạn; một kế hoạch không khả thi còn tệ hơn một kế hoạch khiêm tốn. Đặt tóm tắt điều hành lên đầu; hầu hết người đọc quyết định dựa vào nó. Làm cho các lựa chọn và đánh đổi hiện rõ.

## Những lỗi thường gặp cần tránh

Một danh sách chiến thuật không có chiến lược đằng sau (chọn kênh mà không nêu lý do). Mục tiêu không có chỉ tiêu đo lường được. Nhắm vào "tất cả mọi người". Định vị là một danh sách tính năng thay vì một ý tưởng khác biệt duy nhất. Lộ trình chỉ là backlog không có trình tự hay phân giai đoạn. Chỉ số được gắn thêm vào cuối thay vì được định nghĩa dựa trên mục tiêu. Bỏ qua các ràng buộc đã nêu (ngân sách, đội ngũ, thời hạn). Bịa ra dữ liệu hiệu quả hoặc dữ kiện thị trường thay vì dùng nghiên cứu hoặc đánh dấu chúng là giả định.

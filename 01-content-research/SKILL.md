---
name: content-research
description: "Nghiên cứu chủ đề đang trending, câu hỏi của khán giả và cơ hội từ khoá cho bất kỳ ngách nào, rồi biến chúng thành một báo cáo nghiên cứu nội dung có thứ tự ưu tiên. Dùng skill này bất cứ khi nào marketer muốn tìm xem nên viết gì, khám phá chủ đề đang hot, nghiên cứu khán giả, khai thác những câu hỏi mọi người đang hỏi, tìm cơ hội từ khoá hoặc nội dung, hay kiểm chứng một góc tiếp cận trước khi bắt tay vào sản xuất. Kích hoạt khi gặp các yêu cầu như 'nghiên cứu chủ đề cho [ngách]', 'ngành [x] đang có gì hot', 'mình nên viết về cái gì', 'mọi người đang hỏi gì về [chủ đề]', 'nghiên cứu từ khoá' (hoặc 'research topics for [niche]', 'what should we write about', 'keyword research'), hoặc bất kỳ yêu cầu nào cần thu thập tín hiệu nhu cầu trước khi làm nội dung hay chiến dịch. Hoạt động với bất kỳ công cụ nghiên cứu nào đang được kết nối (Ahrefs, Perplexity, web search) và vẫn chạy tốt khi không có công cụ nào. Đọc ngữ cảnh dự án nếu có, nếu không thì hỏi về ngách."
metadata:
  author: Vibe AI Labs
  version: 1.3.0
  hermes:
    tags: [Marketing, Research, SEO, Keywords, Trends]
    category: marketing
    related_skills: [marketing-orchestrator]
---

# Nghiên cứu nội dung (Content Research)

Tìm hiểu xem khán giả đang tìm kiếm gì, hỏi gì và bàn tán về điều gì ngay lúc này, rồi trả về một báo cáo nghiên cứu có thứ tự ưu tiên mà marketer có thể hành động ngay. Skill này thu thập tín hiệu về nhu cầu và mức độ quan tâm (xu hướng, câu hỏi, từ khoá, góc tiếp cận của đối thủ) và xếp hạng theo mức độ cơ hội. Skill này không viết nội dung; nó cho bạn biết điều gì đáng để viết.

## Khi chạy dưới sự điều phối

Nếu bạn nhận việc từ `marketing-orchestrator` (hoặc một agent điều phối khác) kèm brief, brief đó là nguồn sự thật: dùng brand brief, các quyết định đã chốt (công cụ, thị trường, ngôn ngữ, xưng hô, định dạng) và nơi lưu đầu ra được chỉ định, thay vì tự hỏi lại hay lưu vào thư mục mặc định. Vẫn đọc file thương hiệu hoặc file đầu vào mà brief trỏ tới khi cần chi tiết. Subagent không thể hỏi người dùng, nên bỏ qua mọi bước hỏi trong skill này: thiếu thông tin thì chọn giả định hợp lý, ghi rõ trong mục "Giả định" ở cuối đầu ra, và vẫn giao kết quả hoàn chỉnh.

## Skill này tạo ra gì

Một báo cáo nghiên cứu duy nhất (Markdown, hoặc file tài liệu nếu được yêu cầu) bao gồm: các chủ đề đang trending và hook theo thời điểm, những câu hỏi mà khán giả thực sự đặt ra, các cơ hội từ khoá/chủ đề được xếp hạng theo một điểm cơ hội đơn giản, bối cảnh đối thủ và SERP (nếu có), cùng một phần tóm tắt chiến lược ngắn chỉ ra các ưu tiên hàng đầu cần theo đuổi.

## Thiết kế không phụ thuộc công cụ

Skill này không bao giờ mặc định là có một công cụ trả phí cụ thể. Nó dùng bất cứ thứ gì đang được kết nối và nói rõ đã dùng những gì.

Chọn nguồn tốt nhất hiện có theo thứ tự sau, và dừng khi đã đủ tín hiệu:

1. **Công cụ SEO/từ khoá chuyên dụng** nếu có kết nối (Ahrefs, SEMrush hoặc tương tự): dữ liệu phong phú nhất (lượng tìm kiếm, độ khó, tiềm năng traffic, SERP).
2. **Công cụ nghiên cứu/tìm kiếm AI** nếu có kết nối (Perplexity, các MCP nghiên cứu khác): mạnh về xu hướng, câu hỏi của khán giả và các góc tiếp cận đang thời sự.
3. **Web search thông thường** (luôn có sẵn): xác nhận xu hướng, các câu hỏi kiểu "mọi người cũng hỏi" (People Also Ask), quét đối thủ, độ mới của thông tin. Nếu có thể truy cập, Google Trends (đặt đúng quốc gia, ví dụ `geo=VN`) là nguồn miễn phí tốt để so sánh mức độ quan tâm giữa các chủ đề theo thời gian.

**Xuống cấp một cách nhẹ nhàng.** Ngoài câu hỏi một lần ở bước Kiểm tra công cụ bên dưới, nếu không có công cụ mạnh hơn, đừng dừng lại và đừng giả vờ có dữ liệu mà bạn không có. Dùng nguồn kế tiếp và ghi rõ giới hạn trong báo cáo (ví dụ: "Không có công cụ từ khoá được kết nối, nên lượng tìm kiếm và độ khó chỉ là ước tính định hướng từ tín hiệu tìm kiếm và SERP, không phải số liệu đo lường").

## Trước khi bắt đầu

### Luôn quét ngữ cảnh thương hiệu trước tiên

Trước khi nghiên cứu, hãy quét dự án để tìm nơi chứa ngữ cảnh (một thư mục hoặc các file chứa tài liệu về thương hiệu, khán giả, giọng văn hoặc chiến lược; tên gọi mỗi dự án mỗi khác, hãy nhận diện qua nội dung chứ không theo đường dẫn cố định). Đây là bước bắt buộc, không phải tuỳ chọn. Nếu có, hãy đọc để nắm: ngách, khán giả mục tiêu và ngôn ngữ của họ, sản phẩm/ưu đãi, và định vị, rồi đưa tất cả vào quá trình nghiên cứu để mọi cơ hội được đánh giá dựa trên chính thương hiệu và khán giả này chứ không phải một thị trường chung chung.

Nếu không có ngữ cảnh, hãy xác nhận ba điều trước khi nghiên cứu: **chủ đề gốc / ngách**, **quốc gia/thị trường mục tiêu** (mặc định: Việt Nam, nghiên cứu bằng tiếng Việt), và **khán giả** (nội dung dành cho ai). Hỏi gộp trong một tin nhắn, không hỏi từng câu một.

### Kiểm tra công cụ (hỏi tối đa một lần)

Xem danh sách công cụ bạn đang có trong phiên này (tool hoặc MCP có tên chứa ahrefs, semrush, perplexity, hoặc công cụ SEO/nghiên cứu tương tự).

1. **Đã có ít nhất một công cụ SEO hoặc nghiên cứu AI:** dùng luôn, không hỏi gì thêm.
2. **Chưa có, nhưng người dùng đã từng quyết định:** nếu ngữ cảnh dự án có ghi chú về công cụ (ví dụ mục "Công cụ đã kết nối" trong brand guide) cho biết người dùng chọn chạy bằng web search, thì chạy tiếp, không hỏi lại.
3. **Chưa có và chưa từng hỏi:** hỏi đúng một lần, gộp chung với các câu hỏi ngữ cảnh ở trên nếu có, theo tinh thần sau (điều chỉnh theo ngôn ngữ và giọng của người dùng):

   > Hiện chưa có công cụ dữ liệu từ khoá nào được kết nối, nên lượng tìm kiếm và độ khó trong báo cáo sẽ chỉ là ước tính định hướng. Bạn muốn:
   > **(a)** Chạy luôn bằng web search (miễn phí, đủ tốt để tìm xu hướng và câu hỏi của khán giả)
   > **(b)** Kết nối Ahrefs hoặc Semrush (cần gói trả phí, cho số liệu từ khoá thật) hoặc Perplexity (trả theo lượt dùng, mạnh về xu hướng). Mình sẽ hướng dẫn từng bước.

   - **Nếu chọn (b):** đọc [tool-setup.md](references/tool-setup.md) và chỉ đưa hướng dẫn cho đúng công cụ đã chọn và nền tảng đang dùng (nếu không chắc người dùng đang ở nền tảng nào, hỏi). Nhắc rằng có thể phải khởi động lại phiên agent để công cụ mới xuất hiện, rồi dừng lại chờ họ kết nối xong.
   - **Nếu chọn (a), không trả lời rõ, hoặc đã yêu cầu chạy ngay từ đầu:** chạy tiếp bằng web search. Nếu dự án có file ngữ cảnh thương hiệu, ghi một dòng vào mục công cụ (ví dụ "Content research: chạy bằng web search, không cần nhắc kết nối") để lần sau không hỏi lại.

Không bao giờ yêu cầu người dùng dán API key vào chat; key phải được họ tự đặt vào cấu hình MCP hoặc biến môi trường. Nếu họ lỡ dán, không lặp lại hay lưu key đó, và khuyên họ tạo key mới sau khi cấu hình xong.

## Quy trình

### Bước 1: Quét xu hướng (luôn thực hiện)

Tìm những gì đang thời sự, không chỉ nội dung evergreen. Với ngách và các chủ đề con của nó, hãy tìm: góc tiếp cận mới và chủ đề con mới nổi, các câu hỏi gần đây khán giả đang đặt ra, các thời điểm theo mùa hoặc theo sự kiện, và bất cứ thứ gì đang tăng vọt về mức độ quan tâm. Dùng công cụ nghiên cứu/tìm kiếm tốt nhất đang được kết nối. Ghi lại 5 đến 10 hook theo thời điểm, mỗi hook kèm một dòng giải thích vì sao nó đang nóng ngay lúc này.

### Bước 2: Khai thác câu hỏi

Thu thập những câu hỏi thật mà mọi người hỏi về chủ đề, bằng chính ngôn từ của họ. Nguồn, theo thứ tự ưu tiên: báo cáo câu hỏi từ công cụ từ khoá; "People Also Ask" và gợi ý tự động từ công cụ tìm kiếm; kết quả từ công cụ nghiên cứu AI; cách diễn đạt trên diễn đàn/cộng đồng thông qua tìm kiếm (Reddit, Quora; với thị trường Việt Nam ưu tiên các nhóm Facebook công khai, Voz, Tinh tế, bình luận TikTok/YouTube, và phần hỏi đáp/đánh giá trên Shopee, Lazada). Giữ nguyên văn cách diễn đạt khi có thể, vì chính ngôn ngữ đó giúp nội dung lên top và chạm đến người đọc. Đặt mục tiêu 10 đến 20 câu hỏi.

### Bước 3: Cơ hội từ khoá / chủ đề

Xây dựng danh sách các cơ hội chủ đề. Nếu có công cụ từ khoá, lấy lượng tìm kiếm, độ khó và tiềm năng traffic. Nếu không, hãy nhóm các câu hỏi và xu hướng thành các cụm chủ đề (topic cluster) và ước tính mức độ quan tâm theo định tính (cao/trung bình/thấp) dựa trên mức độ phổ biến khi tìm kiếm, đồng thời ghi chú rằng đây chỉ là số liệu định hướng.

**Tiêu chí quick-win** (khi có số liệu): lượng tìm kiếm từ 500 trở lên, độ khó thấp (KD < 30 đến 40), tiềm năng traffic tốt.

**Điểm cơ hội** (khi có số liệu), dùng để xếp hạng danh sách:

```
Điểm cơ hội = (Lượng tìm kiếm x Tiềm năng traffic) / (Độ khó + 1)
```

Điểm càng cao càng tốt. Khi không có số liệu, hãy xếp hạng dựa trên sự kết hợp giữa mức độ phù hợp với khán giả, độ mới của xu hướng và mức độ phổ biến khi tìm kiếm, đồng thời ghi rõ đây là xếp hạng định tính.

**Gắn nhãn ý định tìm kiếm (intent)** cho từng mục: thông tin (cách làm, là gì, hướng dẫn), thương mại (tốt nhất, top, đánh giá, so sánh), hoặc giao dịch (mua, giá, chi phí, khuyến mãi). Intent cho marketer biết mỗi chủ đề cần loại nội dung gì.

### Bước 4: Bối cảnh đối thủ / SERP (khi có thể)

Với 2 đến 3 chủ đề hứa hẹn nhất, kiểm tra xem ai đang lên top hoặc ai đang sở hữu góc tiếp cận đó: các kết quả hàng đầu và độ uy tín của chúng, loại nội dung chiếm ưu thế (listicle, hướng dẫn, công cụ, video), các tính năng SERP hiển thị (featured snippet, PAA), và những khoảng trống chưa ai lấp tốt. Bước này giúp phân biệt "nhu cầu cao" với "nhu cầu cao mà bạn thực sự có thể thắng".

### Bước 5: Tổng hợp

Biến tín hiệu thô thành một báo cáo có thứ tự ưu tiên. Mở đầu bằng những cơ hội kết hợp được nhu cầu thực, sự phù hợp với khán giả và một góc tiếp cận có thể thắng. Trung thực về mức độ tin cậy dựa trên những công cụ đã có.

## Định dạng đầu ra

Lưu báo cáo dạng Markdown vào thư mục reports/research của dự án (hoặc nơi lưu đầu ra đang dùng), với tên file kebab-case mô tả rõ, ví dụ `content-research-<ngach>-<ngay>.md`. Nếu người dùng yêu cầu file Word, hãy dùng skill docx nếu nền tảng có; nếu không, chuyển file Markdown sang `.docx` bằng `pandoc` hoặc thư viện `docx` (Node.js). Cấu trúc:

```
# Báo cáo nghiên cứu nội dung: [Ngách / Chủ đề]

Thị trường: [quốc gia]  |  Khán giả: [ai]  |  Ngày: [ngày]
Công cụ đã dùng: [những gì thực sự được kết nối và sử dụng]  |  Độ tin cậy: [cao/trung bình/định hướng]

## Đang trending
5-10 hook theo thời điểm, mỗi hook kèm một dòng giải thích vì sao nó đang nóng.

## Những câu hỏi khán giả đang đặt ra
Nhóm theo chủ đề con, giữ nguyên ngôn từ của khán giả. Ghi chú câu nào phù hợp với định dạng featured snippet / FAQ.

## Cơ hội chủ đề hàng đầu
| Chủ đề / Từ khoá | Lượng tìm kiếm | Độ khó | Tiềm năng traffic | Intent | Điểm cơ hội | Ghi chú |
(Bỏ các cột số liệu nếu không có công cụ từ khoá; xếp hạng định tính và ghi rõ điều đó.)

**Quick-win nên nhắm trước:** 3-5 mục, mỗi mục kèm một dòng lý do.

## Bối cảnh đối thủ & SERP
Với 2-3 chủ đề hàng đầu: ai đang lên top, loại nội dung chiếm ưu thế, tính năng SERP, khoảng trống có thể khai thác.

## Tóm tắt chiến lược
- 2-3 dòng về bức tranh tổng thể.
- Các ưu tiên nội dung được đề xuất (xếp hạng, kèm lý do).
- Việc cần làm đầu tiên.
```

## Thực hành tốt

Bắt đầu rộng rồi thu hẹp dần: chủ đề gốc chung trước, sau đó đào sâu vào các chủ đề con có tín hiệu tốt nhất. Cân bằng giữa nhu cầu và khả năng thắng; một chủ đề lượng tìm kiếm thấp, cạnh tranh thấp mà bạn có thể sở hữu tốt hơn một chủ đề lượng tìm kiếm cao mà bạn không thể chen chân. Coi các câu hỏi nguyên văn của khán giả là đầu ra hạng nhất; đó là phần có giá trị tái sử dụng cao nhất. Luôn kiểm chứng các lựa chọn hàng đầu với những gì đang lên top trước khi đề xuất. Luôn nêu trung thực phạm vi công cụ đã dùng và mức độ tin cậy, mọi lúc.

## Những lỗi thường gặp cần tránh

Đừng trình bày số liệu ước tính như thể đó là số liệu đo lường. Đừng bỏ qua bước quét xu hướng để trả về một danh sách evergreen tĩnh; tính thời sự chiếm một nửa giá trị. Đừng trả về một đống 100 từ khoá chưa lọc; giá trị nằm ở việc xếp thứ tự ưu tiên. Đừng dừng lại hay xin lỗi khi thiếu công cụ trả phí; hãy dùng nguồn kế tiếp và ghi chú giới hạn. Đừng bỏ qua intent; một từ khoá giao dịch và một từ khoá thông tin cần những loại nội dung hoàn toàn khác nhau.

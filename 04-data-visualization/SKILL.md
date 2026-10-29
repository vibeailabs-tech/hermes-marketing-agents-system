---
name: data-visualization
description: "Biến bất kỳ bộ dữ liệu nào thành một dashboard HTML tương tác, chỉn chu, gói gọn trong một file duy nhất, với loại biểu đồ được chọn tự động, thẻ KPI và insight kể chuyện bằng dữ liệu. Dùng skill này bất cứ khi nào người dùng yêu cầu tạo dashboard, trực quan hoá dữ liệu, data viz, báo cáo HTML, báo cáo tương tác, hoặc muốn trực quan hoá dữ liệu, vẽ biểu đồ chỉ số, hay biến file CSV, bảng tính, JSON hoặc bất kỳ bộ dữ liệu nào thành biểu đồ hoặc dashboard. Cũng kích hoạt khi người dùng nói 'trực quan hoá cái này', 'vẽ biểu đồ dữ liệu này', 'làm báo cáo từ dữ liệu này', 'cho mình xem xu hướng' (hoặc tiếng Anh: 'visualize this', 'chart this data', 'make a report from this data', 'show me the trends'), hoặc bất kỳ yêu cầu nào liên quan đến việc chuyển dữ liệu thô thành dạng trực quan, sẵn sàng trình chiếu, kể cả khi họ không nói rõ 'dashboard' hay 'biểu đồ'. Áp dụng màu sắc và font chữ thương hiệu của dự án khi có, nếu không thì dùng bảng màu mặc định gọn gàng."
metadata:
  author: Vibe AI Labs
  version: 1.2.0
  hermes:
    tags: [Marketing, Data, Dashboard, Charts, Reporting]
    category: marketing
    related_skills: [marketing-orchestrator]
---

# Dashboard trực quan hoá dữ liệu (Data Visualization)

Skill này nhận bất kỳ bộ dữ liệu nào và tạo ra một file HTML duy nhất, tự chứa, với một dashboard tương tác sẵn sàng trình chiếu. Dashboard dùng Chart.js (tải từ CDN) để vẽ biểu đồ, áp dụng màu sắc và font chữ thương hiệu khi có, và tự động chọn loại biểu đồ dựa trên hình dạng dữ liệu để người dùng không bao giờ phải chỉ định.

Đầu ra phải trông giống thứ mà một marketing manager sẽ chụp màn hình đưa vào slide: bộ đếm KPI có hiệu ứng, biểu đồ hiện dần khi cuộn, tương tác khi rê chuột, bóng đổ nhẹ cho thẻ, bo góc, và một dòng insight dưới mỗi biểu đồ cho người xem biết cần rút ra điều gì.

## Khi chạy dưới sự điều phối

Nếu bạn nhận việc từ `marketing-orchestrator` (hoặc một agent điều phối khác) kèm brief, brief đó là nguồn sự thật: dùng brand brief, các quyết định đã chốt (công cụ, thị trường, ngôn ngữ, xưng hô, định dạng) và nơi lưu đầu ra được chỉ định, thay vì tự hỏi lại hay lưu vào thư mục mặc định. Vẫn đọc file thương hiệu hoặc file đầu vào mà brief trỏ tới khi cần chi tiết. Subagent không thể hỏi người dùng, nên bỏ qua mọi bước hỏi trong skill này: thiếu thông tin thì chọn giả định hợp lý, ghi rõ trong mục "Giả định" ở cuối đầu ra, và vẫn giao kết quả hoàn chỉnh.

## Trước khi bắt đầu

### Luôn quét ngữ cảnh thương hiệu trước tiên

Trước khi xây dựng bất cứ thứ gì, hãy quét dự án để tìm nơi chứa ngữ cảnh thương hiệu (một thư mục hoặc file chứa màu sắc, kiểu chữ và tông giọng của thương hiệu; tên gọi mỗi dự án mỗi khác, hãy nhận diện qua nội dung chứ không theo đường dẫn cố định). Đây là bước bắt buộc. Nếu có brand style guide, bạn phải kế thừa nó: trích xuất các design token sau và áp dụng vào dashboard để phần trực quan hoá mặc định đã đúng thương hiệu thay vì mang phong cách chung chung.

| Token | Nguồn |
|-------|--------|
| Màu chính (Primary) | Brand style guide, màu thương hiệu chính |
| Màu phụ (Secondary) | Brand style guide, màu phụ |
| Màu nhấn nhạt (Light accent) | Brand style guide, màu nhấn/tông nhạt |
| Màu nền (Background) | Brand style guide, màu nền |
| Màu nhấn (Accent) | Brand style guide, màu nhấn bổ sung |
| Màu chữ (Text) | Brand style guide, màu chữ nội dung |
| Font tiêu đề | Kiểu chữ thương hiệu, font tiêu đề |
| Font nội dung | Kiểu chữ thương hiệu, font nội dung |

**Nếu không có ngữ cảnh thương hiệu**, dùng bảng màu mặc định gọn gàng sau:

| Token | Mặc định |
|-------|---------|
| Primary | `#1e3a5f` |
| Secondary | `#4a90d9` |
| Light accent | `#a8d0e6` |
| Background | `#f5f5f0` |
| Accent | `#7a9a5b` |
| Text | `#2b2b2b` |
| Font tiêu đề | `'Inter', -apple-system, 'Segoe UI', Roboto, sans-serif` |
| Font nội dung | `'Inter', -apple-system, 'Segoe UI', Roboto, sans-serif` |

Luôn kèm font dự phòng của hệ thống (như trên) vì file không tải font từ bên ngoài; mọi font trong chuỗi này đều hiển thị đúng dấu tiếng Việt. Nếu font thương hiệu không hỗ trợ tiếng Việt, giữ nó cho tiêu đề tiếng Anh/số và dùng font dự phòng cho nội dung có dấu.

Xây dựng một bảng màu biểu đồ gồm 6 đến 8 màu từ các token: bắt đầu với màu chính và màu phụ, sau đó mở rộng bằng các màu nhấn và các sắc độ bổ trợ được tính toán. Bảng màu này dùng để tô các chuỗi dữ liệu (series) để mọi biểu đồ đều nhất quán và đúng thương hiệu.

### Hiểu dữ liệu

Trước khi viết bất kỳ dòng HTML nào, hãy phân tích kỹ bộ dữ liệu:

1. **Xác định loại cột**: ngày/giờ, danh mục, giá trị số, phần trăm, tiền tệ, số đếm.
2. **Xác định mối quan hệ**: cột nào là chiều (dimension, để nhóm) và cột nào là thước đo (measure, để tổng hợp).
3. **Tìm ra câu chuyện**: các KPI cấp cao nhất là gì? Dữ liệu này tiết lộ xu hướng, so sánh hay phân bố nào?
4. **Ghi nhận độ chi tiết (grain)**: theo ngày, tuần, tháng? Theo sản phẩm, khu vực, chiến dịch?

Phân tích này quyết định mọi lựa chọn phía sau: loại biểu đồ, nội dung thẻ KPI và insight.

## Chọn loại biểu đồ

Tự động chọn loại biểu đồ dựa trên hình dạng dữ liệu. Người dùng không bao giờ cần phải chỉ định biểu đồ.

| Mẫu dữ liệu | Loại biểu đồ | Khi nào dùng |
|---|---|---|
| Giá trị theo thời gian (ngày tháng trên một trục) | Biểu đồ đường | Chuỗi thời gian có xu hướng liên tục. Tô vùng nếu chỉ có một chuỗi. |
| So sánh danh mục (< 8 mục) | Biểu đồ cột ngang | So sánh theo danh mục; dễ đọc hơn khi nhãn dài. |
| So sánh danh mục (8+ mục) | Biểu đồ cột dọc | Nhiều danh mục đến mức cột ngang sẽ quá cao. |
| Các phần của một tổng thể (< 7 phần) | Biểu đồ doughnut | Cơ cấu phần trăm, thị phần, phân bổ ngân sách. Không bao giờ dùng pie. |
| Hai biến số | Biểu đồ phân tán (scatter) | Tương quan, góc phần tư hiệu quả. |
| Phân bố của một biến | Histogram (cột theo khoảng) | Phân bố tần suất, độ phân tán. |
| Xếp hạng / top-N | Cột ngang, sắp xếp giảm dần | Dữ liệu bảng xếp hạng; cột lớn nhất ở trên cùng. |
| Trước/sau hoặc A với B | Biểu đồ cột nhóm | So sánh song song. |
| Nhiều chỉ số theo thời gian | Biểu đồ nhiều đường | So sánh xu hướng giữa các chuỗi. Tối đa 5 đường. |
| Một con số tiêu điểm | Thẻ KPI (không phải biểu đồ) | Tổng doanh thu, tỷ lệ chuyển đổi, AOV. Đặt vào hàng KPI. |

**Quy tắc:** không bao giờ dùng biểu đồ 3D, radar hay gauge. Không bao giờ dùng pie; luôn dùng doughnut. Nếu một biểu đồ có hơn 5 đến 6 chuỗi, gộp các chuỗi nhỏ nhất thành "Khác". Với chuỗi thời gian, phân tích và sắp xếp ngày theo thứ tự thời gian, định dạng nhãn hợp lý ("Th1", "Th2", không phải timestamp ISO thô).

## Bố cục dashboard

HTML tuân theo một cấu trúc cố định, theo thứ tự sau:

### 0. Thanh nhấn thương hiệu
Một thanh gradient mỏng 4px ở trên cùng của trang, nằm ngoài container, chuyển từ màu chính sang màu phụ rồi sang màu nhấn.

```css
.accent-bar { height: 4px; background: linear-gradient(90deg, var(--color-primary) 0%, var(--color-secondary) 50%, var(--color-accent) 100%); }
```

### 1. Header
Tiêu đề dashboard mang tính mô tả (rút ra từ dữ liệu, không ghi đúng chữ "Dashboard"), phụ đề gồm khoảng thời gian của dữ liệu và ngày tạo hôm nay, dùng font tiêu đề, tiêu đề màu chính, hiệu ứng `fadeUp` (0.6s).

### 2. Hàng thẻ KPI
Một nhãn phần nhỏ viết hoa ("Chỉ số chính") màu phụ, sau đó là 3 đến 5 thẻ cho các chỉ số cấp cao quan trọng nhất. Mỗi thẻ gồm: một nhãn, một con số lớn đã định dạng, và một dòng xu hướng/bối cảnh. Tính năng: viền trên có màu (`border-top: 3px solid`, luân phiên các màu thương hiệu), bộ đếm số chạy từ 0 (requestAnimationFrame, ease-out, ~1.2s, điều khiển bởi `data-target`/`data-prefix`/`data-suffix`/`data-format`), độ trễ fade-in so le, nâng lên khi rê chuột (`translateY(-3px)` + bóng đổ sâu hơn). Nền trắng, bóng đổ nhẹ, bo góc 14px, padding rộng rãi.

### 3. Ý chính (Key Takeaways)
Một khối tường thuật ngắn (3 đến 5 câu) kể câu chuyện tổng quan trước các biểu đồ: mở đầu bằng phát hiện quan trọng nhất, nêu 1 đến 2 xu hướng hỗ trợ hoặc điều bất ngờ, kết thúc bằng một hàm ý hướng tới tương lai nếu dữ liệu cho phép. Viết theo giọng thương hiệu nếu đã nạp ngữ cảnh; nếu không thì gọn gàng và chuyên nghiệp. Kiểu dáng: nền gradient nhẹ (từ màu nhấn nhạt sang màu nhấn), viền trái màu nhấn, tiêu đề có một chấm tròn đặc nhỏ, fade-in khi tải trang.

### 4. Lưới biểu đồ
Một nhãn phần ("Phân tích hiệu quả") màu phụ, sau đó là các biểu đồ trong lưới CSS responsive (2 cột khi màn hình rộng, 1 cột khi hẹp). Mỗi thẻ biểu đồ: cùng kiểu dáng và hiệu ứng nâng khi rê chuột như thẻ KPI; **hiện dần khi cuộn** bằng IntersectionObserver (`threshold: 0.15`, ngừng quan sát sau khi kích hoạt). Mỗi thẻ chứa tiêu đề biểu đồ kèm một chấm màu khớp với màu chuỗi dữ liệu, canvas Chart.js, và một **dòng insight** bên dưới (màu nhạt, ngăn cách bằng một đường viền trên mảnh). Sắp xếp biểu đồ theo mức độ quan trọng.

### 5. Footer
Chữ nhỏ màu nhạt: "Tạo ngày [ngày] | Nguồn dữ liệu: [tên file hoặc mô tả]". Thêm tên thương hiệu in đậm nếu đã nạp ngữ cảnh.

### Nhãn phần
```css
.section-label { font-size: 0.72rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.12em; color: var(--color-secondary); margin-bottom: 14px; }
```

## Viết HTML

Một file `.html` duy nhất. Mọi thứ (CSS, JS, dữ liệu) đều được nhúng trực tiếp. Không có phụ thuộc bên ngoài nào ngoài Chart.js từ CDN.

### Cấu trúc template
```html
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>[Tiêu đề dashboard]</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4"></script>
  <style>/* Biến CSS, bố cục, thẻ, hiệu ứng, responsive */</style>
</head>
<body>
  <div class="accent-bar"></div>
  <div class="container">
    <!-- Header (fadeUp) -->
    <!-- Nhãn phần: "Chỉ số chính" -->
    <!-- Thẻ KPI (fadeUp so le, bộ đếm có hiệu ứng) -->
    <!-- Ý chính (fadeUp) -->
    <!-- Nhãn phần: "Phân tích hiệu quả" -->
    <!-- Thẻ biểu đồ (class="reveal" cho hiệu ứng cuộn) -->
    <!-- Footer -->
  </div>
  <script>/* Hiệu ứng bộ đếm, IntersectionObserver, khởi tạo Chart.js */</script>
</body>
</html>
```

### Hướng dẫn CSS
Định nghĩa các token thương hiệu dưới dạng CSS custom properties ở đầu để chúng được kế thừa xuống:
```css
:root {
  --color-primary: #1e3a5f;
  --color-secondary: #4a90d9;
  --color-accent-light: #a8d0e6;
  --color-bg: #f5f5f0;
  --color-accent: #7a9a5b;
  --color-text: #2b2b2b;
  --font-heading: 'Inter', -apple-system, 'Segoe UI', Roboto, sans-serif;
  --font-body: 'Inter', -apple-system, 'Segoe UI', Roboto, sans-serif;
  --radius: 14px;
  --shadow: 0 2px 8px rgba(0,0,0,0.07);
  --shadow-hover: 0 8px 24px rgba(0,0,0,0.12);
}
```
Quy tắc chính: `box-sizing: border-box` cho mọi phần tử; body dùng `--color-bg`, thẻ màu trắng; container rộng tối đa 1200px, căn giữa; lưới biểu đồ `repeat(auto-fit, minmax(500px, 1fr))` khoảng cách 24px; hàng KPI flex-wrap với thẻ `flex: 1; min-width: 180px`; mọi thẻ nền trắng, `var(--radius)`, `var(--shadow)`, padding 24px; hiệu ứng chuyển tiếp khi rê chuột trên mọi thẻ; ở `max-width: 768px` biểu đồ chuyển thành một cột và thẻ KPI xếp chồng; tiêu đề dùng font tiêu đề, nội dung dùng font nội dung; dòng insight nghiêng, màu nhạt, ngăn cách bằng viền trên mảnh.

### Hiệu ứng
```css
@keyframes fadeUp { to { opacity: 1; transform: translateY(0); } }
```
Áp dụng cho header, thẻ KPI (độ trễ so le) và phần Ý chính. Hiện dần khi cuộn cho thẻ biểu đồ:
```javascript
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) { entry.target.classList.add('visible'); observer.unobserve(entry.target); }
  });
}, { threshold: 0.15 });
document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
```
```css
.reveal { opacity: 0; transform: translateY(20px); transition: opacity 0.6s ease, transform 0.6s ease; }
.reveal.visible { opacity: 1; transform: translateY(0); }
```

### Cấu hình Chart.js
Áp dụng các mặc định gọn gàng, sẵn sàng trình chiếu cho mọi biểu đồ: `responsive: true`, `maintainAspectRatio: true`, `interaction: { mode: 'index', intersect: false }`, chú giải (legend) ở dưới cùng với nhãn kiểu điểm (ẩn legend với biểu đồ một chuỗi), tooltip màu chính thương hiệu với độ đục cao, bo góc và có padding.

Quy tắc trục/thang đo: có tiêu đề trục kèm đơn vị ("Doanh thu ($)", không phải "Doanh thu"); bỏ lưới trục x, giữ lưới trục y mờ (`rgba(0,0,0,0.05)`); ẩn đường viền trục; định dạng số bằng `toLocaleString()` theo locale của dữ liệu (dữ liệu Việt Nam dùng `toLocaleString('vi-VN')`, ví dụ 1.250.000); thêm ký hiệu tiền tệ đúng vị trí (USD: tiền tố `$`; VND: hậu tố `₫` hoặc rút gọn "1,2 tỷ", "350 tr" trên trục và thẻ KPI), hậu tố `%`; `borderRadius: 8` và `barPercentage: 0.6-0.7` cho cột. Điểm trên đường: tô trắng rỗng với viền màu (`pointBackgroundColor: '#fff'`, `pointBorderWidth: 2.5`), `pointHoverRadius: 8`, `tension: 0.4`, `borderWidth: 2.5`. Gán màu bảng màu theo thứ tự cố định; doughnut dùng toàn bộ bảng màu với viền phân đoạn màu trắng (`borderWidth: 3, borderColor: '#fff'`); biểu đồ cột/đường một chuỗi dùng màu chính với vùng tô nhạt hơn (rgba ~0.12).

## Dòng insight

Mỗi biểu đồ có một dòng insight bên dưới; đây là cốt lõi của việc kể chuyện. Insight tốt thì cụ thể, có số liệu, có thể hành động:
- "Email mang về 47% lượt chuyển đổi, vượt tìm kiếm trả phí 2,3 lần"
- "Lượt đặt chỗ giảm 18% trong tháng 9 khi các chương trình khuyến mãi hè kết thúc"

Insight tệ thì lặp lại tiêu đề hoặc chẳng nói gì ("Biểu đồ này thể hiện doanh thu theo kênh", "Hiệu quả có sự khác biệt"). Viết theo giọng thương hiệu nếu đã nạp; nếu không thì gọn gàng và chuyên nghiệp.

## Xử lý dữ liệu

**Đầu vào hỗ trợ:** CSV (công cụ Read), JSON, dữ liệu dán trong chat, bảng tính, hoặc đầu ra từ công cụ (analytics, search console).

**Xử lý:** đọc và phân tích cú pháp; làm sạch (giá trị thiếu, khoảng trắng, chuẩn hoá ngày tháng); tổng hợp thành các góc nhìn tóm tắt (không dùng dữ liệu thô từng dòng trừ khi ít); tính 3 đến 5 KPI có ý nghĩa nhất; chuẩn bị/nhóm/sắp xếp dữ liệu cho từng biểu đồ; nhúng trực tiếp dưới dạng biến JS gọn với tên rõ ràng.

## Đầu ra

Lưu vào thư mục reports/output của dự án với tên file kebab-case mô tả rõ, ví dụ `campaign-performance-dashboard-q1-2026.html`. Sau khi lưu, trình bày file và gợi ý mở bằng trình duyệt.

## Những lỗi thường gặp cần tránh

Biểu đồ trơ trọi không có insight. Sai loại biểu đồ so với hình dạng dữ liệu. Quá nhiều biểu đồ (4 đến 6 là lý tưởng; tối đa 8). Bỏ qua ngữ cảnh thương hiệu khi có. Chữ quá nhỏ không đọc được. Số thô chưa định dạng. Biểu đồ pie (dùng doughnut). Phụ thuộc bên ngoài ngoài Chart.js. Bố cục không responsive. Tiêu đề chung chung kiểu "Dashboard". Không bao giờ đặt `pointStyleWidth` cho nhãn legend (tạo ra hình bầu dục bị bẹp). Không bao giờ đặt `maintainAspectRatio: false` mà không có container chiều cao cố định (canvas sẽ giãn vô hạn); giữ nó là `true` và điều khiển tỷ lệ bằng thuộc tính `height` của canvas.

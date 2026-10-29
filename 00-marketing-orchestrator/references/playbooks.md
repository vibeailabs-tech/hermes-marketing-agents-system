# Định tuyến và playbook

## Mục lục

1. Bảng định tuyến nhanh
2. Playbook A: Chiến dịch trọn gói (ra mắt sản phẩm / chiến dịch theo mùa)
3. Playbook B: Lịch nội dung theo tháng
4. Playbook C: Tối ưu landing page
5. Playbook D: Phân tích đối thủ và định vị
6. Playbook E: Báo cáo hiệu quả và điều chỉnh
7. Playbook F: Tái sử dụng một nội dung ra nhiều kênh
8. Ghép và điều chỉnh playbook

Các playbook là điểm xuất phát, không phải khuôn cứng. Bỏ bước người dùng đã có sẵn đầu ra (ví dụ họ đã có chiến lược thì bắt đầu từ copy), và thêm bước khi yêu cầu cần.

## 1. Bảng định tuyến nhanh

| Người dùng nói / cần | Đi tới |
|----------------------|--------|
| "nên viết gì", "đang hot gì", "nghiên cứu từ khoá", "khán giả hỏi gì" | `content-research` (một skill) |
| "viết bài/email/caption/quảng cáo", "viết lại cho hay hơn" | `marketing-copywriting` (một skill) |
| "lên chiến lược", "kế hoạch GTM", "kế hoạch quý" khi đã có đủ thông tin | `marketing-strategy` (một skill) |
| "vẽ dashboard", "trực quan hoá dữ liệu này", gửi file CSV/Excel | `data-visualization` (một skill) |
| "audit/chấm điểm landing page", "vì sao trang này ít chuyển đổi" | `landing-page-audit` (một skill) |
| "lên chiến dịch", "ra mắt sản phẩm", "làm trọn gói" | Playbook A |
| "lịch nội dung", "content plan tháng", "kế hoạch đăng bài" | Playbook B |
| "audit rồi sửa", "tối ưu landing page", "viết lại landing page" | Playbook C |
| "phân tích đối thủ", "mình nên định vị thế nào", "khác biệt với đối thủ" | Playbook D |
| "báo cáo chiến dịch", "dữ liệu tháng này nói gì, nên làm gì tiếp" | Playbook E |
| "biến bài này thành...", "chuyển webinar/blog thành nhiều post" | Playbook F |
| "lên chiến lược" nhưng chưa có nghiên cứu và quyết định phụ thuộc vào nhu cầu thị trường | Playbook A, dừng sau bước chiến lược |

Ký hiệu trong các playbook: `→` là tuần tự (bước sau chờ bước trước), `‖` là song song.

## 2. Playbook A: Chiến dịch trọn gói

**Khi nào:** ra mắt sản phẩm, chiến dịch theo mùa (Tết, 11/11, Black Friday), chiến dịch tăng trưởng một kênh.

**Cần hỏi ở Bước 2:** sản phẩm/ưu đãi, mục tiêu có con số và thời hạn, ngân sách ước lượng, kênh đang dùng, ngày ra mắt hoặc thời điểm chiến dịch, đầu ra copy mong muốn (kênh nào, bao nhiêu bài).

**Chuỗi:**

```
01 content-research  →  02 marketing-strategy  →  03 marketing-copywriting (‖ theo từng kênh)
```

| Bước | Skill | Đầu vào | Đầu ra | Kiểm tra trước khi đi tiếp |
|------|-------|---------|--------|----------------------------|
| 01 | `content-research` | Ngách, thị trường, khán giả, góc sản phẩm | `01-research.md` | Có nhóm câu hỏi nguyên văn của khán giả, có cơ hội xếp hạng, độ tin cậy được ghi rõ |
| 02 | `marketing-strategy` | Mục tiêu, ràng buộc, `01-research.md` | `02-strategy.md` | Có thông điệp cốt lõi một câu, khán giả ưu tiên, 2-3 kênh có lý do, lộ trình theo tuần, KPI có chỉ tiêu |
| 03 | `marketing-copywriting` | `02-strategy.md` (thông điệp, khán giả, kênh), số lượng bài | `03-copy/<kênh>.md` | Bám thông điệp cốt lõi, đúng xưng hô, mỗi kênh đúng định dạng, có phương án hook/subject để test |

Bước 03 chia mỗi kênh thành một subagent chạy song song. Chỉ viết copy cho các kênh mà chiến lược đã chọn, không viết cho kênh bị loại.

**Bàn giao nhấn mạnh:** thông điệp cốt lõi, lịch triển khai, gói copy theo kênh, KPI cần theo dõi.

## 3. Playbook B: Lịch nội dung theo tháng

**Khi nào:** cần kế hoạch đăng bài định kỳ cho một hoặc nhiều kênh.

**Cần hỏi ở Bước 2:** kênh, tần suất đăng mỗi kênh, tháng áp dụng, mục tiêu nội dung (nhận diện, tương tác, chuyển đổi), các dịp đặc biệt trong tháng, có viết sẵn toàn bộ bài hay chỉ tuần đầu.

**Chuỗi:**

```
01 content-research  →  02 marketing-strategy (chiến lược nội dung + lịch)  →  03 marketing-copywriting (‖ theo tuần hoặc theo kênh)
```

- Bước 02 giao cho `marketing-strategy` với yêu cầu rõ: chiến lược nội dung và lịch theo từng tuần (ngày, kênh, chủ đề, định dạng, mục tiêu của bài, CTA), dựa trên các cơ hội trong `01-research.md`.
- Bước 03: mặc định viết hoàn chỉnh tuần đầu để người dùng duyệt giọng văn trước; chỉ viết cả tháng khi người dùng yêu cầu. Mỗi subagent nhận một tuần hoặc một kênh.

**Kiểm tra riêng:** chủ đề không trùng lặp trong tháng, có cân bằng giữa các loại nội dung (giáo dục, câu chuyện, bán hàng), dịp đặc biệt được xếp đúng ngày.

## 4. Playbook C: Tối ưu landing page

**Khi nào:** landing page chuyển đổi kém, chuẩn bị chạy quảng cáo, hoặc muốn so với đối thủ.

**Cần hỏi ở Bước 2:** URL trang, tối đa 2 URL đối thủ, mục tiêu chuyển đổi của trang (đăng ký, mua, để lại số điện thoại...), công cụ trình duyệt (theo logic Kiểm tra công cụ).

**Chuỗi:**

```
01 landing-page-audit  →  02 marketing-copywriting (viết lại các phần ưu tiên cao)
```

| Bước | Skill | Đầu ra | Kiểm tra |
|------|-------|--------|----------|
| 01 | `landing-page-audit` | `01-audit.md` | Có điểm 5 tiêu chí kèm bằng chứng trích từ trang, có điểm tổng có trọng số, 5-7 đề xuất có nhãn tác động |
| 02 | `marketing-copywriting` | `02-landing-copy.md` | Viết lại đúng các phần được đánh giá yếu nhất (thường là hero, CTA, xử lý phản đối), mỗi phần có 2-3 phương án, ghi rõ phần nào thay cho phần nào trên trang hiện tại |

Bước 02 chỉ nhận các đề xuất tác động Cao và Trung bình liên quan đến nội dung chữ. Các đề xuất về thiết kế hoặc kỹ thuật (tốc độ tải, màu nút) giữ nguyên trong báo cáo audit để người dùng chuyển cho đội thiết kế.

## 5. Playbook D: Phân tích đối thủ và định vị

**Khi nào:** vào thị trường mới, sản phẩm mới, hoặc thấy mình bị lẫn với đối thủ.

**Cần hỏi ở Bước 2:** 1-2 đối thủ chính (tên + landing page), ngách, khán giả, sản phẩm của mình.

**Chuỗi:**

```
01a landing-page-audit (trang mình + đối thủ)  ‖  01b content-research (ngách)  →  02 marketing-strategy (tập trung định vị)
```

- 01a và 01b độc lập nên chạy song song.
- Bước 02 giao cho `marketing-strategy` với trọng tâm là phần Tình hình, Khán giả và Định vị: xác định góc tiếp cận chưa ai chiếm (từ khoảng trống trong audit và nghiên cứu), viết tuyên bố định vị và thông điệp cốt lõi. Các phần kênh và ngân sách có thể rút gọn nếu người dùng chỉ cần định vị.

**Kiểm tra riêng:** định vị đề xuất phải khác biệt rõ với từng đối thủ đã audit, và có lý do để tin dựa trên điều thương hiệu thực sự có.

## 6. Playbook E: Báo cáo hiệu quả và điều chỉnh

**Khi nào:** người dùng có dữ liệu chiến dịch/kênh và muốn biết kết quả cùng việc nên làm tiếp.

**Cần hỏi ở Bước 2:** file dữ liệu, giai đoạn dữ liệu, mục tiêu ban đầu (để so sánh), có cần đề xuất điều chỉnh hay chỉ cần dashboard.

**Chuỗi:**

```
01 data-visualization  →  02 marketing-strategy (điều chỉnh, tuỳ chọn)
```

- Bước 01 tạo `01-dashboard.html`. Yêu cầu subagent trả kèm trong bản tóm tắt: các KPI chính đã tính và 3-5 insight quan trọng nhất, để bước 02 dùng mà không phải đọc HTML.
- Bước 02 (chỉ khi người dùng muốn đề xuất): giao cho `marketing-strategy` với đầu vào là các insight và mục tiêu ban đầu, yêu cầu tập trung vào: điều gì hiệu quả cần dồn lực, điều gì không hiệu quả cần cắt, chỉ tiêu cho giai đoạn tới.

**Kiểm tra riêng:** mọi con số trong đề xuất phải khớp với con số trong dashboard.

## 7. Playbook F: Tái sử dụng một nội dung ra nhiều kênh

**Khi nào:** có một bài blog, transcript webinar/podcast, hoặc bài phát biểu muốn biến thành nhiều nội dung.

**Cần hỏi ở Bước 2:** nội dung gốc (file hoặc link), các kênh đích và số lượng mỗi kênh.

**Chuỗi:**

```
01 marketing-copywriting (‖ mỗi kênh đích một subagent)
```

Mỗi subagent nhận đường dẫn tới nội dung gốc, kênh đích và số lượng. Nhắc rõ trong brief: chọn những ý giá trị và đáng trích dẫn nhất, viết như nội dung gốc của kênh đó, không phải đoạn trích dán vào.

**Kiểm tra riêng:** các kênh không lặp y nguyên cùng một câu hook; mọi số liệu đều có trong nội dung gốc.

## 8. Ghép và điều chỉnh playbook

- **Ghép:** có thể nối playbook, ví dụ D rồi A (định vị trước, chiến dịch sau) hoặc C rồi A (sửa landing page trước khi đổ traffic). Đầu ra của playbook trước trở thành đầu vào của playbook sau qua đường dẫn file.
- **Bỏ bước:** nếu người dùng đã có nghiên cứu, chiến lược hay dữ liệu, hỏi đường dẫn và dùng luôn, không chạy lại.
- **Dừng giữa chừng:** với chuỗi dài, có thể dừng sau bước chiến lược để người dùng duyệt thông điệp cốt lõi trước khi viết copy hàng loạt. Đề xuất điểm dừng này khi số lượng copy lớn (từ khoảng 10 bài trở lên).
- **Yêu cầu không khớp playbook nào:** tự lập chuỗi từ các skill trong bảng Đội ngũ theo nguyên tắc: bước nào tạo ra thông tin mà bước khác cần thì đi trước; các bước không phụ thuộc nhau thì chạy song song.

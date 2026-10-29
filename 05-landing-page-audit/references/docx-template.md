# Template file Word

Tạo báo cáo audit bằng docx-js. Template này bao gồm bố cục các phần, định dạng và màu sắc.

## Màu sắc: không phụ thuộc thương hiệu

Object `COLORS` bên dưới chứa các giá trị mặc định chuyên nghiệp, trung tính. **Nếu ngữ cảnh dự án có cung cấp màu thương hiệu, hãy ghi đè `primary`, `secondary`, `accent` và `lightTint` bằng giá trị của thương hiệu.** Luôn giữ nguyên ba màu điểm số (`scoreGreen`/`scoreYellow`/`scoreRed`), vì chúng thể hiện mức hiệu quả và cần được đọc nhất quán với mọi thương hiệu.

## Code template đầy đủ

```javascript
const fs = require('fs');
const { Document, Packer, Paragraph, TextRun, Table, TableRow, TableCell,
        Header, Footer, AlignmentType, BorderStyle, WidthType,
        HeadingLevel, ShadingType, VerticalAlign, PageBreak, LevelFormat,
        PageNumber } = require('docx');

// Màu sắc (bỏ dấu # cho docx-js). Ghi đè bốn màu đầu từ ngữ cảnh thương hiệu của dự án nếu có.
const COLORS = {
  primary: "233D4D",       // Tiêu đề, header của bảng  (được phép ghi đè theo thương hiệu)
  secondary: "215E61",     // Tiêu đề phụ               (được phép ghi đè theo thương hiệu)
  accent: "FE7F2D",        // Điểm nhấn, chú thích      (được phép ghi đè theo thương hiệu)
  lightTint: "F5FBE6",     // Tô nền dòng bảng          (được phép ghi đè theo thương hiệu)
  white: "FFFFFF",
  black: "000000",
  // Màu điểm số giữ nguyên bất kể thương hiệu
  scoreGreen: "22C55E",    // 7-10
  scoreYellow: "EAB308",   // 4-6
  scoreRed: "EF4444"       // 1-3
};

function getScoreColor(score) {
  if (score >= 7) return COLORS.scoreGreen;
  if (score >= 4) return COLORS.scoreYellow;
  return COLORS.scoreRed;
}

function scoreText(score, bold = true) {
  return new TextRun({ text: score.toFixed(1), bold, color: getScoreColor(score), size: 24 });
}

const tableBorder = { style: BorderStyle.SINGLE, size: 1, color: "CCCCCC" };
const cellBorders = { top: tableBorder, bottom: tableBorder, left: tableBorder, right: tableBorder };

const doc = new Document({
  styles: {
    default: { document: { run: { font: "Arial", size: 22 } } },
    paragraphStyles: [
      { id: "Title", name: "Title", basedOn: "Normal",
        run: { size: 56, bold: true, color: COLORS.primary, font: "Arial" },
        paragraph: { spacing: { before: 0, after: 200 }, alignment: AlignmentType.CENTER } },
      { id: "Heading1", name: "Heading 1", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 36, bold: true, color: COLORS.primary, font: "Arial" },
        paragraph: { spacing: { before: 400, after: 200 }, outlineLevel: 0 } },
      { id: "Heading2", name: "Heading 2", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 28, bold: true, color: COLORS.secondary, font: "Arial" },
        paragraph: { spacing: { before: 300, after: 150 }, outlineLevel: 1 } },
      { id: "Heading3", name: "Heading 3", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 24, bold: true, color: COLORS.secondary, font: "Arial" },
        paragraph: { spacing: { before: 200, after: 100 }, outlineLevel: 2 } }
    ]
  },
  numbering: {
    config: [
      { reference: "recommendations", levels: [{ level: 0, format: LevelFormat.DECIMAL, text: "%1.", alignment: AlignmentType.LEFT, style: { paragraph: { indent: { left: 720, hanging: 360 } } } }] },
      { reference: "quick-wins", levels: [{ level: 0, format: LevelFormat.DECIMAL, text: "%1.", alignment: AlignmentType.LEFT, style: { paragraph: { indent: { left: 720, hanging: 360 } } } }] },
      { reference: "bullets", levels: [{ level: 0, format: LevelFormat.BULLET, text: "•", alignment: AlignmentType.LEFT, style: { paragraph: { indent: { left: 720, hanging: 360 } } } }] }
    ]
  },
  sections: [{
    properties: { page: { margin: { top: 1440, right: 1440, bottom: 1440, left: 1440 } } },
    headers: { default: new Header({ children: [new Paragraph({ alignment: AlignmentType.RIGHT, children: [new TextRun({ text: "Audit chuyển đổi Landing Page", color: COLORS.secondary, size: 20 })] })] }) },
    footers: { default: new Footer({ children: [new Paragraph({ alignment: AlignmentType.CENTER, children: [
      new TextRun({ text: "Trang ", size: 20 }), new TextRun({ children: [PageNumber.CURRENT], size: 20 }),
      new TextRun({ text: " / ", size: 20 }), new TextRun({ children: [PageNumber.TOTAL_PAGES], size: 20 })
    ] })] }) },
    children: [
      // === TRANG BÌA ===
      new Paragraph({ spacing: { before: 2000 } }),
      new Paragraph({ heading: HeadingLevel.TITLE, children: [new TextRun("Audit chuyển đổi")] }),
      new Paragraph({ heading: HeadingLevel.TITLE, children: [new TextRun("Landing Page")] }),
      new Paragraph({ spacing: { before: 400 } }),
      new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: `Ngày audit: ${new Date().toLocaleDateString('vi-VN')}`, size: 24, color: COLORS.secondary })] }),
      new Paragraph({ spacing: { before: 600 } }),
      new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: "Trang mục tiêu", bold: true, size: 28, color: COLORS.primary })] }),
      new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: "{{TARGET_URL}}", size: 22 })] }),
      new Paragraph({ spacing: { before: 200 } }),
      // URL đối thủ (chỉ thêm nếu có đối thủ)
      new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: "Trang đối thủ", bold: true, size: 28, color: COLORS.primary })] }),
      new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: "{{COMPETITOR_URLS}}", size: 22 })] }),
      new Paragraph({ spacing: { before: 600 } }),
      new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: "Điểm tổng", bold: true, size: 32, color: COLORS.primary })] }),
      new Paragraph({ spacing: { before: 200 } }),
      new Paragraph({ alignment: AlignmentType.CENTER, children: [
        new TextRun({ text: "Mục tiêu: ", bold: true, size: 28 }),
        new TextRun({ text: "{{TARGET_SCORE}}", bold: true, size: 36, color: COLORS.accent })
      ] }),
      new Paragraph({ children: [new PageBreak()] }),

      // === TÓM TẮT ĐIỀU HÀNH ===
      new Paragraph({ heading: HeadingLevel.HEADING_1, children: [new TextRun("Tóm tắt điều hành")] }),
      new Paragraph({ spacing: { after: 200 }, children: [new TextRun({ text: "{{EXECUTIVE_SUMMARY}}", size: 22 })] }),
      new Paragraph({ children: [new PageBreak()] }),

      // === SO SÁNH SONG SONG === (bỏ qua với audit độc lập)
      new Paragraph({ heading: HeadingLevel.HEADING_1, children: [new TextRun("So sánh song song")] }),
      new Table({
        columnWidths: [2340, 2340, 2340, 2340],
        rows: [
          new TableRow({ tableHeader: true, children: ["Tiêu chí","Mục tiêu","Đối thủ 1","Đối thủ 2"].map(h =>
            new TableCell({ borders: cellBorders, shading: { fill: COLORS.primary, type: ShadingType.CLEAR }, verticalAlign: VerticalAlign.CENTER,
              children: [new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: h, bold: true, color: COLORS.white, size: 22 })] })] })) }),
          // Dùng createComparisonRow() (bên dưới) cho: Độ rõ ràng của headline (20%), Sức mạnh CTA (25%),
          // Xử lý phản đối (20%), Social proof (15%), Kiến trúc thuyết phục (20%), Điểm tổng
        ]
      }),
      new Paragraph({ children: [new PageBreak()] }),

      // === PHÂN TÍCH CHI TIẾT TỪNG TRANG ===
      new Paragraph({ heading: HeadingLevel.HEADING_1, children: [new TextRun("Phân tích từng trang")] }),
      new Paragraph({ heading: HeadingLevel.HEADING_2, children: [new TextRun("Mục tiêu: {{TARGET_URL}}")] }),
      new Paragraph({ heading: HeadingLevel.HEADING_3, children: [new TextRun("Độ rõ ràng của headline: "), scoreText(7.5)] }),
      new Paragraph({ numbering: { reference: "bullets", level: 0 }, children: [new TextRun({ text: "{{HEADLINE_EVIDENCE}}", size: 22 })] }),
      // Lặp lại cho từng tiêu chí; lặp lại khối H2 cho từng trang.
      new Paragraph({ children: [new PageBreak()] }),

      // === ĐỀ XUẤT THEO THỨ TỰ ƯU TIÊN ===
      new Paragraph({ heading: HeadingLevel.HEADING_1, children: [new TextRun("Đề xuất theo thứ tự ưu tiên")] }),
      new Paragraph({ heading: HeadingLevel.HEADING_2, children: [new TextRun({ text: "Tác động cao", color: COLORS.accent })] }),
      new Paragraph({ numbering: { reference: "recommendations", level: 0 }, children: [new TextRun({ text: "{{HIGH_IMPACT_REC_1}}", size: 22 })] }),
      new Paragraph({ heading: HeadingLevel.HEADING_2, children: [new TextRun({ text: "Tác động trung bình", color: COLORS.secondary })] }),
      new Paragraph({ heading: HeadingLevel.HEADING_2, children: [new TextRun({ text: "Tác động thấp", color: COLORS.primary })] }),
      new Paragraph({ children: [new PageBreak()] }),

      // === QUICK WIN ===
      new Paragraph({ heading: HeadingLevel.HEADING_1, children: [new TextRun("Quick win")] }),
      new Paragraph({ spacing: { after: 200 }, children: [new TextRun({ text: "Những thay đổi này có thể triển khai ngay với rất ít công sức:", size: 22, italics: true })] }),
      new Paragraph({ numbering: { reference: "quick-wins", level: 0 }, spacing: { after: 150 }, children: [new TextRun({ text: "{{QUICK_WIN_1}}", size: 22 })] }),
      new Paragraph({ numbering: { reference: "quick-wins", level: 0 }, spacing: { after: 150 }, children: [new TextRun({ text: "{{QUICK_WIN_2}}", size: 22 })] }),
      new Paragraph({ numbering: { reference: "quick-wins", level: 0 }, spacing: { after: 150 }, children: [new TextRun({ text: "{{QUICK_WIN_3}}", size: 22 })] })
    ]
  }]
});

Packer.toBuffer(doc).then(buffer => {
  fs.writeFileSync("landing-page-audit.docx", buffer);
  console.log("Đã lưu báo cáo audit vào landing-page-audit.docx");
});
```

## Các hàm dựng động

```javascript
function createScoreCell(score, isAltRow = false) {
  return new TableCell({
    borders: cellBorders,
    shading: { fill: isAltRow ? COLORS.lightTint : COLORS.white, type: ShadingType.CLEAR },
    verticalAlign: VerticalAlign.CENTER,
    children: [new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: score.toFixed(1), bold: true, color: getScoreColor(score), size: 24 })] })]
  });
}

function createComparisonRow(criterion, weight, scores, isAltRow = false) {
  const cells = [ new TableCell({
    borders: cellBorders,
    shading: { fill: isAltRow ? COLORS.lightTint : COLORS.white, type: ShadingType.CLEAR },
    children: [new Paragraph({ children: [new TextRun({ text: `${criterion} (${weight}%)`, bold: true, size: 22 })] })]
  }) ];
  scores.forEach(score => cells.push(createScoreCell(score, isAltRow)));
  return new TableRow({ children: cells });
}

function createEvidenceList(items) {
  return items.map(item => new Paragraph({ numbering: { reference: "bullets", level: 0 }, spacing: { after: 100 }, children: [new TextRun({ text: item, size: 22 })] }));
}

function createRecommendation(text, impact, listRef) {
  const impactColors = { high: COLORS.accent, medium: COLORS.secondary, low: COLORS.primary };
  const impactLabels = { high: "CAO", medium: "TRUNG BÌNH", low: "THẤP" };
  return new Paragraph({ numbering: { reference: listRef, level: 0 }, spacing: { after: 150 }, children: [
    new TextRun({ text: `[${impactLabels[impact]}] `, bold: true, color: impactColors[impact], size: 22 }),
    new TextRun({ text, size: 22 })
  ] });
}
```

## Điều chỉnh cho audit độc lập (1 URL)

1. Bỏ "Trang đối thủ" khỏi trang bìa.
2. Đổi bảng so sánh thành 2 cột (Tiêu chí, Mục tiêu).
3. Tập trung phần Tóm tắt điều hành vào điểm mạnh so với thực hành tốt.
4. Dựa các đề xuất trên thực hành tốt về chuyển đổi, không dựa trên khoảng cách với đối thủ.

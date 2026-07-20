// Custom Monarch tokenizer cho FBO XML (đăng ký ngôn ngữ Monaco "erp-xml").
//
// Lý do cần tokenizer riêng thay vì "xml" built-in của Monaco (đã xác nhận qua grep
// vs/xml-*.js — built-in chỉ có tag/attribute.name/attribute.value/comment/delimiter/
// metatag, KHÔNG có):
//   - Nội dung CDATA là text thuần (built-in vẫn hiểu <,>,&,% trong CDATA như XML)
//   - Token riêng cho Entity reference (&Name; / %Name;) và Entity declaration name
//   - Nhúng SQL trong <command>/<query>/<response>/<action>, nhúng JS trong <script> hoặc
//     <command event="...">  (khớp FboSyntaxParser: SQL/Script Island —
//     docs/specs/language/parsing-and-semantic-model.md)
//
// Token names (theme map trong bridge.js phải khớp):
//   tag, delimiter, attribute.name, attribute.value, entity.reference, entity.name,
//   keyword, comment, string.cdata, delimiter.cdata, metatag, metatag.content
//
// NGUYÊN TẮC TÔ MÀU (theo cách VS Code xử lý XML/HTML — sửa 2026-07-20):
//   1. Dấu cú pháp KHÔNG cùng màu với tên. "<", ">", "/>", "</", "=" là 'delimiter' (xám
//      nhạt); chỉ TÊN thẻ mới là 'tag'. Trước đây "<div" bị gộp thành một token 'tag' nên
//      mọi dấu ngoặc đều đỏ đậm — đó là nguồn gây rối mắt chính trong file nhiều thẻ.
//   2. Chỉ ~4 màu "mạnh" trong một file: tên thẻ, tên attribute, chuỗi giá trị, comment.
//      Mọi thứ còn lại kế thừa màu chữ nền hoặc dùng màu xám phụ.
//   3. Tên entity trong KHAI BÁO (<!ENTITY X ...>) khác token với THAM CHIẾU (&X;) — trước
//      đây cả hai map về cùng 'entityReference' nên khai báo cũng bị in nghiêng như tham
//      chiếu, gây cảm giác cả khối DOCTYPE đang "nháy".
//   4. Từ khoá DTD (SYSTEM/PUBLIC) có token riêng thay vì lẫn vào 'metatag' xám.
//
// GHI CHÚ RỦI RO: Monarch tokenizer không kiểm chứng trực quan được trong môi trường
// viết code này — cần xác nhận bằng mắt sau khi chạy thật.
(function () {
    'use strict';

    window.registerErpXmlLanguage = function (monaco) {
        if (monaco.languages.getLanguages().some(function (l) { return l.id === 'erp-xml'; }))
            return;

        monaco.languages.register({ id: 'erp-xml' });

        monaco.languages.setMonarchTokensProvider('erp-xml', {
            defaultToken: '',
            ignoreCase: false,

            tokenizer: {
                root: [
                    [/[^<&%]+/, ''],
                    [/&[A-Za-z_][\w.-]*;/, 'entity.reference'],
                    [/%[A-Za-z_][\w.-]*;/, 'entity.reference'],
                    [/[&%]/, ''],

                    [/<!\[CDATA\[/, { token: 'delimiter.cdata', next: '@cdata' }],
                    [/<!--/, { token: 'comment', next: '@comment' }],
                    [/<!DOCTYPE/, { token: 'metatag', next: '@doctype' }],
                    [/<\?/, { token: 'metatag', next: '@pi' }],
                    [/(<\/)([ \t]*)([\w.:-]+)/,
                        ['delimiter', '', { token: 'tag', next: '@tagClose' }]],

                    // Thứ tự quan trọng: command CÓ event= → JS; command/query/response
                    // không event → SQL; còn lại → tag thường. @rematch không tiêu thụ ký
                    // tự — state đích parse lại tag từ đầu.
                    [/<command\b[^>]*\bevent\s*=/i, { token: '@rematch', next: '@tagOpenJs' }],
                    [/<script\b/i, { token: '@rematch', next: '@tagOpenJs' }],
                    [/<(?:command|query|response|action)\b/i, { token: '@rematch', next: '@tagOpenSql' }],
                    [/<[\w.:-]+/, { token: '@rematch', next: '@tagOpen' }]
                ],

                tagClose: [
                    [/[ \t\r\n]+/, ''],
                    [/>/, { token: 'delimiter', next: '@pop' }]
                ],

                // ── Tag mở thường ──────────────────────────────────────────────
                tagOpen: [
                    [/(<)([\w.:-]+)/, ['delimiter', 'tag']],
                    [/[ \t\r\n]+/, ''],
                    [/([\w.:-]+)(\s*)(=)(\s*)(")/,
                        ['attribute.name', '', 'delimiter', '',
                         { token: 'attribute.value', next: '@attrDq' }]],
                    [/([\w.:-]+)(\s*)(=)(\s*)(')/,
                        ['attribute.name', '', 'delimiter', '',
                         { token: 'attribute.value', next: '@attrSq' }]],
                    [/[\w.:-]+/, 'attribute.name'],
                    [/\/>/, { token: 'delimiter', next: '@pop' }],
                    [/>/, { token: 'delimiter', next: '@pop' }]
                ],

                // Giá trị attribute: highlight &Entity; bên trong (đây là chỗ người dùng
                // báo "ENTITY Name trùng màu với value").
                attrDq: [
                    [/&[A-Za-z_][\w.-]*;/, 'entity.reference'],
                    [/[^"&]+/, 'attribute.value'],
                    [/&/, 'attribute.value'],
                    [/"/, { token: 'attribute.value', next: '@pop' }]
                ],
                attrSq: [
                    [/&[A-Za-z_][\w.-]*;/, 'entity.reference'],
                    [/[^'&]+/, 'attribute.value'],
                    [/&/, 'attribute.value'],
                    [/'/, { token: 'attribute.value', next: '@pop' }]
                ],

                // ── Tag mở nhúng JS (<script>, <command event=...>) ────────────
                tagOpenJs: [
                    [/(<)([\w.:-]+)/, ['delimiter', 'tag']],
                    [/[ \t\r\n]+/, ''],
                    [/([\w.:-]+)(\s*)(=)(\s*)(")/,
                        ['attribute.name', '', 'delimiter', '',
                         { token: 'attribute.value', next: '@attrDq' }]],
                    [/([\w.:-]+)(\s*)(=)(\s*)(')/,
                        ['attribute.name', '', 'delimiter', '',
                         { token: 'attribute.value', next: '@attrSq' }]],
                    [/[\w.:-]+/, 'attribute.name'],
                    [/\/>/, { token: 'delimiter', next: '@pop' }],
                    [/>/, { token: 'delimiter', next: '@embedJs', nextEmbedded: 'text/javascript' }]
                ],

                // ── Tag mở nhúng SQL (<command>/<query>/<response> không event) ─
                tagOpenSql: [
                    [/(<)([\w.:-]+)/, ['delimiter', 'tag']],
                    [/[ \t\r\n]+/, ''],
                    [/([\w.:-]+)(\s*)(=)(\s*)(")/,
                        ['attribute.name', '', 'delimiter', '',
                         { token: 'attribute.value', next: '@attrDq' }]],
                    [/([\w.:-]+)(\s*)(=)(\s*)(')/,
                        ['attribute.name', '', 'delimiter', '',
                         { token: 'attribute.value', next: '@attrSq' }]],
                    [/[\w.:-]+/, 'attribute.name'],
                    [/\/>/, { token: 'delimiter', next: '@pop' }],
                    [/>/, { token: 'delimiter', next: '@embedSql', nextEmbedded: 'sql' }]
                ],

                // Vùng nhúng: tokenize bằng ngôn ngữ nhúng tới khi gặp tag đóng tương ứng.
                // (CDATA marker bên trong vùng nhúng sẽ do tokenizer nhúng tô — chấp nhận
                // được, nội dung SQL/JS thật vẫn được tô đúng.)
                embedJs: [
                    [/<\/(?:script|command)\s*>/i, { token: '@rematch', next: '@pop', nextEmbedded: '@pop' }]
                ],
                embedSql: [
                    [/<\/(?:command|query|response|action)\s*>/i, { token: '@rematch', next: '@pop', nextEmbedded: '@pop' }]
                ],

                // ── CDATA: text thuần, không hiểu <,>,&,% là ký tự đặc biệt ────
                cdata: [
                    [/[^\]]+/, 'string.cdata'],
                    [/\]\]>/, { token: 'delimiter.cdata', next: '@pop' }],
                    [/\]/, 'string.cdata']
                ],

                comment: [
                    [/[^-]+/, 'comment'],
                    [/-->/, { token: 'comment', next: '@pop' }],
                    [/-/, 'comment']
                ],

                // ── DOCTYPE + internal subset chứa <!ENTITY ...> ───────────────
                doctype: [
                    [/\[/, { token: 'metatag', next: '@doctypeSubset' }],
                    [/[^>[]+/, 'metatag.content'],
                    [/>/, { token: 'metatag', next: '@pop' }]
                ],
                doctypeSubset: [
                    [/<!ENTITY/, { token: 'metatag', next: '@entityDecl' }],
                    [/%[A-Za-z_][\w.-]*;/, 'entity.reference'],
                    [/<!--/, { token: 'comment', next: '@comment' }],
                    [/\]/, { token: 'metatag', next: '@pop' }],
                    [/[^\]<%]+/, 'metatag.content'],
                    [/./, 'metatag.content']
                ],
                // <!ENTITY Name "value"> — Name = entity.name; trong value chỉ &X; / %X;
                // mới là entity.reference. KHÔNG dùng /"[^"]*"/ một phát: chuỗi FBO thường
                // nhiều dòng, regex đó không khớp xuống dòng → từng từ SQL rơi vào
                // /[\w.-]+/ thành entity.name (sai: cả dòng "if exists..." bị tô như entity).
                entityDecl: [
                    [/[ \t\r\n]+/, ''],
                    [/(?:SYSTEM|PUBLIC)\b/, 'keyword'],
                    [/"/, { token: 'attribute.value', next: '@entityValueDq' }],
                    [/'/, { token: 'attribute.value', next: '@entityValueSq' }],
                    [/%/, ''],
                    [/[\w.-]+/, 'entity.name'],
                    [/>/, { token: 'delimiter', next: '@pop' }]
                ],
                entityValueDq: [
                    [/&[A-Za-z_][\w.-]*;/, 'entity.reference'],
                    [/%[A-Za-z_][\w.-]*;/, 'entity.reference'],
                    [/[^"&%]+/, 'attribute.value'],
                    [/[&%]/, 'attribute.value'],
                    [/"/, { token: 'attribute.value', next: '@pop' }]
                ],
                entityValueSq: [
                    [/&[A-Za-z_][\w.-]*;/, 'entity.reference'],
                    [/%[A-Za-z_][\w.-]*;/, 'entity.reference'],
                    [/[^'&%]+/, 'attribute.value'],
                    [/[&%]/, 'attribute.value'],
                    [/'/, { token: 'attribute.value', next: '@pop' }]
                ],

                pi: [
                    [/\?>/, { token: 'metatag', next: '@pop' }],
                    [/[^?]+/, 'metatag.content'],
                    [/\?/, 'metatag.content']
                ]
            }
        });
    };
})();

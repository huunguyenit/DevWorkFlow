// Custom Monarch tokenizer cho FBO XML (đăng ký ngôn ngữ Monaco "erp-xml").
//
// Lý do cần tokenizer riêng thay vì "xml" built-in của Monaco (đã xác nhận qua grep
// vs/xml-*.js — built-in chỉ có tag/attribute.name/attribute.value/comment/delimiter/
// metatag, KHÔNG có):
//   - Nội dung CDATA là text thuần (built-in vẫn hiểu <,>,&,% trong CDATA như XML)
//   - Token riêng cho Entity reference (&Name; / %Name;) và Entity declaration name
//   - Nhúng SQL trong <command>/<query>/<response>, nhúng JS trong <script> hoặc
//     <command event="...">  (khớp FboSyntaxParser: SQL/Script Island —
//     docs/specs/language/parsing-and-semantic-model.md)
//
// Token names (theme map trong bridge.js phải khớp):
//   tag, attribute.name, attribute.value, entity.reference, entity.name,
//   comment, string.cdata, delimiter.cdata, metatag, metatag.content
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
                    [/<\/[ \t]*[\w.:-]+/, { token: 'tag', next: '@tagClose' }],

                    // Thứ tự quan trọng: command CÓ event= → JS; command/query/response
                    // không event → SQL; còn lại → tag thường. @rematch không tiêu thụ ký
                    // tự — state đích parse lại tag từ đầu.
                    [/<command\b[^>]*\bevent\s*=/i, { token: '@rematch', next: '@tagOpenJs' }],
                    [/<script\b/i, { token: '@rematch', next: '@tagOpenJs' }],
                    [/<(?:command|query|response)\b/i, { token: '@rematch', next: '@tagOpenSql' }],
                    [/<[\w.:-]+/, { token: '@rematch', next: '@tagOpen' }]
                ],

                tagClose: [
                    [/[ \t\r\n]+/, ''],
                    [/>/, { token: 'tag', next: '@pop' }]
                ],

                // ── Tag mở thường ──────────────────────────────────────────────
                tagOpen: [
                    [/<[\w.:-]+/, 'tag'],
                    [/[ \t\r\n]+/, ''],
                    [/([\w.:-]+)(\s*=\s*)(")/,
                        ['attribute.name', '', { token: 'attribute.value', next: '@attrDq' }]],
                    [/([\w.:-]+)(\s*=\s*)(')/,
                        ['attribute.name', '', { token: 'attribute.value', next: '@attrSq' }]],
                    [/[\w.:-]+/, 'attribute.name'],
                    [/\/>/, { token: 'tag', next: '@pop' }],
                    [/>/, { token: 'tag', next: '@pop' }]
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
                    [/<[\w.:-]+/, 'tag'],
                    [/[ \t\r\n]+/, ''],
                    [/([\w.:-]+)(\s*=\s*)(")/,
                        ['attribute.name', '', { token: 'attribute.value', next: '@attrDq' }]],
                    [/([\w.:-]+)(\s*=\s*)(')/,
                        ['attribute.name', '', { token: 'attribute.value', next: '@attrSq' }]],
                    [/[\w.:-]+/, 'attribute.name'],
                    [/\/>/, { token: 'tag', next: '@pop' }],
                    [/>/, { token: 'tag', next: '@embedJs', nextEmbedded: 'text/javascript' }]
                ],

                // ── Tag mở nhúng SQL (<command>/<query>/<response> không event) ─
                tagOpenSql: [
                    [/<[\w.:-]+/, 'tag'],
                    [/[ \t\r\n]+/, ''],
                    [/([\w.:-]+)(\s*=\s*)(")/,
                        ['attribute.name', '', { token: 'attribute.value', next: '@attrDq' }]],
                    [/([\w.:-]+)(\s*=\s*)(')/,
                        ['attribute.name', '', { token: 'attribute.value', next: '@attrSq' }]],
                    [/[\w.:-]+/, 'attribute.name'],
                    [/\/>/, { token: 'tag', next: '@pop' }],
                    [/>/, { token: 'tag', next: '@embedSql', nextEmbedded: 'sql' }]
                ],

                // Vùng nhúng: tokenize bằng ngôn ngữ nhúng tới khi gặp tag đóng tương ứng.
                // (CDATA marker bên trong vùng nhúng sẽ do tokenizer nhúng tô — chấp nhận
                // được, nội dung SQL/JS thật vẫn được tô đúng.)
                embedJs: [
                    [/<\/(?:script|command)\s*>/i, { token: '@rematch', next: '@pop', nextEmbedded: '@pop' }]
                ],
                embedSql: [
                    [/<\/(?:command|query|response)\s*>/i, { token: '@rematch', next: '@pop', nextEmbedded: '@pop' }]
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
                entityDecl: [
                    [/[ \t\r\n]+/, ''],
                    [/SYSTEM|PUBLIC/, 'metatag'],
                    [/"[^"]*"/, 'attribute.value'],
                    [/'[^']*'/, 'attribute.value'],
                    [/%/, 'entity.name'],
                    [/[\w.-]+/, 'entity.name'],
                    [/>/, { token: 'metatag', next: '@pop' }]
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

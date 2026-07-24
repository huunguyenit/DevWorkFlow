using System.ComponentModel;
using System.Globalization;
using System.IO;
using System.Text.Json;
using System.Windows;
using System.Windows.Controls;
using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Design.Toolbox;
using Microsoft.Web.WebView2.Core;
using UI.Services;
using UI.ViewModels;

namespace UI.Views.Design;

/// <summary>
/// Host WebView2 cho tab Design: render <see cref="FormBuilderViewModel.GeneratedDesignDocument"/> (HTML sinh
/// từ XML→Semantic), kèm 2 thước px đồng bộ zoom/scroll. Map một virtual host <c>devworkflow.program</c> →
/// Program root để nạp CSS/JS/image tĩnh (URL trong HTML đã rewrite). Bridge scroll/zoom riêng của Design,
/// tách <c>DevWorkFlow.Editor.Bridge</c> (Monaco). Thay <c>SkinDesignerView</c> (đã gỡ).
/// </summary>
public partial class DesignWebViewHost : UserControl
{
    private const string ProgramVirtualHost = DesignHtmlGenerator.ProgramVirtualHost;
    private const string ConfigVirtualHost = DesignHtmlGenerator.ConfigVirtualHost;
    private const string PreviewFileName = ".dwf-design-preview.html";

    // Script tiêm: (1) đo gốc bảng main FormTable → post 'designViewport' cho WPF chỉnh Offset thước;
    // (2) vẽ crosshair + nhãn px (toạ độ so với gốc bảng) hoàn toàn trong document — không post mỗi mousemove.
    private const string DesignViewportScript = """
        (function () {
          var origin = { x: 0, y: 0 };
          function mainTable() {
            return document.querySelector('[data-dwf-region="main"] table.FormTable');
          }
          function originOf(el) {
            if (!el) return { x: 0, y: 0 };
            var r = el.getBoundingClientRect();
            return { x: r.left + window.scrollX, y: r.top + window.scrollY };
          }
          function post() {
            origin = originOf(mainTable());
            if (window.chrome && window.chrome.webview) {
              window.chrome.webview.postMessage(JSON.stringify({
                type: 'designViewport',
                scrollX: window.scrollX,
                scrollY: window.scrollY,
                originX: origin.x,
                originY: origin.y
              }));
            }
          }
          function ensureOverlay() {
            if (document.getElementById('dwf-crosshair-x')) return;
            var css = document.createElement('style');
            css.textContent = [
              '#dwf-crosshair-x,#dwf-crosshair-y{position:fixed;pointer-events:none;z-index:2147483647;background:#c62828;opacity:.85;}',
              '#dwf-crosshair-x{left:0;right:0;height:1px;}',
              '#dwf-crosshair-y{top:0;bottom:0;width:1px;}',
              '#dwf-crosshair-label{position:fixed;pointer-events:none;z-index:2147483647;background:rgba(255,255,255,.9);border:1px solid #c62828;color:#202020;font:11px Consolas,monospace;padding:1px 4px;}'
            ].join('');
            document.documentElement.appendChild(css);
            ['dwf-crosshair-x','dwf-crosshair-y','dwf-crosshair-label'].forEach(function (id) {
              var el = document.createElement('div');
              el.id = id;
              el.style.display = 'none';
              document.documentElement.appendChild(el);
            });
          }
          function onMove(e) {
            ensureOverlay();
            var hx = document.getElementById('dwf-crosshair-x');
            var hy = document.getElementById('dwf-crosshair-y');
            var lab = document.getElementById('dwf-crosshair-label');
            hx.style.display = hy.style.display = lab.style.display = 'block';
            hx.style.top = e.clientY + 'px';
            hy.style.left = e.clientX + 'px';
            var x = e.clientX + window.scrollX - origin.x;
            var y = e.clientY + window.scrollY - origin.y;
            lab.style.left = (e.clientX + 12) + 'px';
            lab.style.top = (e.clientY + 12) + 'px';
            lab.textContent = Math.round(x) + ', ' + Math.round(y);
          }
          function hideOverlay() {
            var ids = ['dwf-crosshair-x','dwf-crosshair-y','dwf-crosshair-label'];
            for (var i = 0; i < ids.length; i++) {
              var el = document.getElementById(ids[i]);
              if (el) el.style.display = 'none';
            }
          }
          window.addEventListener('scroll', post, { passive: true });
          window.addEventListener('resize', post, { passive: true });
          document.addEventListener('DOMContentLoaded', post);
          document.addEventListener('mousemove', onMove, { passive: true });
          document.addEventListener('mouseleave', hideOverlay, true);
          document.addEventListener('click', function (e) {
            if (e.target && e.target.closest && e.target.closest('.DwfTabButton'))
              setTimeout(post, 0);
          }, true);
          setTimeout(post, 0);
        })();
        """;

    // Blueprint P6: theme từ config, resize cột mép TRÊN, merge/split kéo mép ô, kéo dọc region + ngang form,
    // split line + anchor icon, Ctrl+Click → Source, Delete → remove. Chỉ khi <body class="dwf-blueprint">.
    private const string DesignBlueprintScript = """
        (function () {
          var LAYER_ID = 'dwf-blueprint-layer';
          var MIN_COL = 1;
          var MIN_HEIGHT = 40;
          var CLICK_MS = 450;
          var MOVE_THRESHOLD = 5;

          var DEFAULT_THEME = {
            columnGuide: 'rgba(255,111,0,.85)', columnLabel: '#E65100', splitter: 'rgba(255,111,0,.35)',
            selectedControl: '#0D47A1', selectedSlot: '#1565C0', selectedRegion: '#6A1B9A',
            dropTarget: '#2E7D32', topResizeHitPx: 12, splitDivider: '#C62828', anchorIcon: '#1565C0',
            ghostLabelInput: 'rgba(21,101,192,.25)',
            mergePreview: 'rgba(21,101,192,.25)', splitKeepPreview: 'rgba(21,101,192,.28)',
            splitReleasePreview: 'rgba(120,120,120,.18)'
          };
          function theme() {
            var t = window.__dwfTheme || {};
            var m = {};
            for (var k in DEFAULT_THEME) m[k] = (t[k] !== undefined && t[k] !== null) ? t[k] : DEFAULT_THEME[k];
            return m;
          }

          var drag = null;        // column resize (top edge)
          var formDrag = null;    // horizontal form width
          var heightDrag = null;  // vertical category height
          var edgeDrag = null;    // merge/split via cell right edge
          var splitDrag = null;   // drag view@split line
          var anchorDrag = null;  // drag view@anchor icon
          var slotDrag = null;    // move control
          var suppressClick = false;
          var selection = { level: 0, slotEl: null, regionEl: null };
          var clickState = { key: '', level: 0, at: 0 };

          function post(msg) {
            if (window.chrome && window.chrome.webview)
              window.chrome.webview.postMessage(JSON.stringify(msg));
          }
          function enabled() {
            return !!document.body && document.body.classList.contains('dwf-blueprint');
          }
          function anyDrag() { return drag || formDrag || heightDrag || edgeDrag || splitDrag || anchorDrag; }
          function pageX(e) { return e.clientX + window.scrollX; }
          function nearestSplitCol(edges, px) {
            var best = 1, bestD = Infinity;
            for (var i = 1; i < edges.length; i++) {
              var d = Math.abs(edges[i].left - px);
              if (d < bestD) { bestD = d; best = i; }
            }
            return best; // 1..edges.length-1 (1-based split)
          }
          function nearestAnchorCol(edges, px) {
            var best = 1, bestD = Infinity;
            for (var i = 0; i < edges.length; i++) {
              var d = Math.abs(edges[i].right - px);
              if (d < bestD) { bestD = d; best = i + 1; }
            }
            return best; // 1..edges.length (1-based anchor)
          }
          function ensureLayer() {
            var layer = document.getElementById(LAYER_ID);
            if (!layer) {
              layer = document.createElement('div');
              layer.id = LAYER_ID;
              layer.style.cssText =
                'position:absolute;left:0;top:0;width:0;height:0;pointer-events:none;z-index:2147483640;';
              document.documentElement.appendChild(layer);
            }
            return layer;
          }
          function readWidths(table) {
            var raw = table.getAttribute('data-dwf-col-widths') || '';
            return raw.split(',').map(function (s) { return parseInt(s, 10) || 0; });
          }
          function writeWidths(table, widths) {
            table.setAttribute('data-dwf-col-widths', widths.join(','));
            var head = table.querySelector('tr.DwfColRow');
            if (head && head.cells)
              for (var i = 0; i < head.cells.length && i < widths.length; i++)
                head.cells[i].style.width = widths[i] + 'px';
            var sum = widths.reduce(function (a, b) { return a + b; }, 0);
            if (sum > 0) {
              var st = table.getAttribute('style') || '';
              if (/width:\s*\d+px/.test(st))
                table.setAttribute('style', st.replace(/width:\s*\d+px/, 'width:' + sum + 'px'));
              else table.style.width = sum + 'px';
            }
          }
          function clampDelta(widths, index, delta) {
            if (widths[index] + delta < MIN_COL) delta = MIN_COL - widths[index];
            if (widths[index + 1] - delta < MIN_COL) delta = widths[index + 1] - MIN_COL;
            return delta;
          }
          function columnEdges(table, widths, rect) {
            var head = table.querySelector('tr.DwfColRow');
            if (head && head.cells && head.cells.length === widths.length) {
              var edges = [];
              for (var i = 0; i < head.cells.length; i++) {
                var r = head.cells[i].getBoundingClientRect();
                edges.push({ left: r.left + window.scrollX, right: r.right + window.scrollX });
              }
              return edges;
            }
            var sum = 0; for (var j = 0; j < widths.length; j++) sum += widths[j];
            if (sum <= 0) return null;
            var scale = rect.width > 0 ? rect.width / sum : 1;
            var x = rect.left + window.scrollX, fb = [];
            for (var k = 0; k < widths.length; k++) { var w = widths[k] * scale; fb.push({ left: x, right: x + w }); x += w; }
            return fb;
          }
          function el(layer, css, text) {
            var d = document.createElement('div');
            if (text != null) d.textContent = text;
            d.style.cssText = css;
            layer.appendChild(d);
            return d;
          }
          function guide(layer, th, x, y, height) {
            el(layer, 'position:absolute;width:0;border-left:1px dashed ' + th.columnGuide
              + ';left:' + x + 'px;top:' + y + 'px;height:' + height + 'px;pointer-events:none;');
          }
          function label(layer, th, x, y, text) {
            el(layer, 'position:absolute;left:' + x + 'px;top:' + y
              + 'px;font:10px Consolas,monospace;color:' + th.columnLabel
              + ';background:rgba(255,255,255,.8);padding:0 2px;white-space:nowrap;pointer-events:none;', text);
          }
          // Resize cột: hit-target CHỈ dải mép trên (Word-like), cạnh nhãn Npx.
          function topResizeHandle(layer, th, x, top, table, splitterIndex, baseWidths) {
            var h = el(layer, 'position:absolute;left:' + (x - 4) + 'px;top:' + (top - th.topResizeHitPx)
              + 'px;width:8px;height:' + th.topResizeHitPx + 'px;cursor:col-resize;pointer-events:auto;'
              + 'background:' + th.splitter + ';z-index:2;');
            h.className = 'dwf-bp-tool';
            h.addEventListener('mousedown', function (e) {
              e.preventDefault(); e.stopPropagation();
              drag = { table: table, splitterIndex: splitterIndex, startClientX: e.clientX,
                       baseWidths: baseWidths.slice(),
                       regionId: table.getAttribute('data-dwf-region-table') || 'main' };
            });
          }
          function formWidthHandle(layer, th, table, rect) {
            var right = rect.right + window.scrollX, top = rect.top + window.scrollY;
            var h = el(layer, 'position:absolute;left:' + (right - 2) + 'px;top:' + top
              + 'px;width:6px;height:' + rect.height + 'px;cursor:ew-resize;pointer-events:auto;'
              + 'background:' + th.splitter + ';z-index:2;');
            h.className = 'dwf-bp-tool';
            h.addEventListener('mousedown', function (e) {
              e.preventDefault(); e.stopPropagation();
              formDrag = { table: table, startClientX: e.clientX, baseWidths: readWidths(table),
                          baseTotal: readWidths(table).reduce(function (a, b) { return a + b; }, 0),
                          regionId: table.getAttribute('data-dwf-region-table') || 'main', total: 0 };
            });
          }
          // 5f gap: chỉ CATEGORY tab đang active có handle kéo cao (mép dưới panel). Main/footer không có.
          function categoryHeightHandle(layer, th) {
            var panel = document.querySelector('.DwfTabPanel.DwfActive');
            if (!panel) return;
            var catIndex = panel.getAttribute('data-category-index');
            if (!catIndex) return;
            var table = panel.querySelector('table.FormTable[data-dwf-region-table]');
            var r = panel.getBoundingClientRect();
            var bottom = r.bottom + window.scrollY, left = r.left + window.scrollX;
            var h = el(layer, 'position:absolute;left:' + left + 'px;top:' + (bottom - 3)
              + 'px;width:' + Math.max(r.width, 40) + 'px;height:6px;cursor:row-resize;pointer-events:auto;'
              + 'background:' + th.splitter + ';z-index:2;');
            h.className = 'dwf-bp-tool';
            h.title = 'Kéo đổi chiều cao tab';
            h.addEventListener('mousedown', function (e) {
              e.preventDefault(); e.stopPropagation();
              var baseH = Math.round((table ? table.getBoundingClientRect().height : r.height));
              heightDrag = { startClientY: e.clientY, baseHeight: baseH, regionId: 'cat:' + catIndex, height: 0 };
            });
          }
          // Split line + anchor icon: read-only chỉ dẫn + KÉO điều chỉnh (giống slot metadata).
          function splitAndAnchor(layer, th, table, edges, rect) {
            var top = rect.top + window.scrollY;
            var split = parseInt(table.getAttribute('data-dwf-split'), 10);
            if (split > 0 && split < edges.length) {
              var line = el(layer, 'position:absolute;width:7px;left:' + (edges[split].left - 3) + 'px;top:' + top
                + 'px;height:' + rect.height + 'px;pointer-events:auto;cursor:col-resize;z-index:3;'
                + 'border-left:2px solid ' + th.splitDivider + ';');
              line.className = 'dwf-bp-tool';
              line.title = 'Kéo đổi view@split';
              line.addEventListener('mousedown', function (e) {
                e.preventDefault(); e.stopPropagation();
                splitDrag = { edges: edges, x: pageX(e) };
              });
            }
            var anchor = parseInt(table.getAttribute('data-dwf-anchor'), 10);
            if (anchor > 0 && anchor <= edges.length) {
              var icon = el(layer, 'position:absolute;left:' + (edges[anchor - 1].right - 14) + 'px;top:' + (top - 15)
                + 'px;font:13px Segoe UI,sans-serif;color:' + th.anchorIcon
                + ';pointer-events:auto;cursor:col-resize;z-index:3;user-select:none;', '⚓');
              icon.className = 'dwf-bp-tool';
              icon.title = 'Kéo đổi view@anchor';
              icon.addEventListener('mousedown', function (e) {
                e.preventDefault(); e.stopPropagation();
                anchorDrag = { edges: edges, x: pageX(e) };
              });
            }
          }
          function paintTable(layer, th, table) {
            var widths = readWidths(table);
            if (!widths.length) return;
            var rect = table.getBoundingClientRect();
            if (rect.width <= 0 || rect.height <= 0) return;
            var edges = columnEdges(table, widths, rect);
            if (!edges) return;
            var top = rect.top + window.scrollY;
            for (var i = 0; i < edges.length; i++) {
              if (i > 0) {
                guide(layer, th, edges[i].left, top, rect.height);
                topResizeHandle(layer, th, edges[i].left, top, table, i - 1, widths);
              }
              label(layer, th, edges[i].left + 1, top - 12, widths[i] + 'px');
            }
            splitAndAnchor(layer, th, table, edges, rect);
            formWidthHandle(layer, th, table, rect);
          }
          function paint() {
            if (anyDrag()) return;
            var layer = ensureLayer();
            layer.innerHTML = '';
            if (!enabled()) return;
            var th = theme();
            var tables = document.querySelectorAll('table.FormTable[data-dwf-col-widths]');
            for (var i = 0; i < tables.length; i++) paintTable(layer, th, tables[i]);
            categoryHeightHandle(layer, th); // 5f gap: chỉ category tab active
            paintSelectionActions(layer, th);
            paintTabPlus(layer, th);
          }
          function schedule() { window.requestAnimationFrame(paint); }

          function actionButton(layer, x, y, text, title, onClick) {
            var b = document.createElement('button');
            b.type = 'button'; b.textContent = text; b.title = title; b.className = 'dwf-bp-tool';
            b.style.cssText = 'position:absolute;left:' + x + 'px;top:' + y
              + 'px;pointer-events:auto;font:10px Segoe UI,sans-serif;line-height:14px;'
              + 'border:1px solid #1565c0;background:#fff;color:#1565c0;border-radius:2px;'
              + 'padding:0 4px;cursor:pointer;z-index:3;';
            b.addEventListener('mousedown', function (e) { e.preventDefault(); e.stopPropagation(); });
            b.addEventListener('click', function (e) { e.preventDefault(); e.stopPropagation(); onClick(); }, true);
            layer.appendChild(b);
          }
          function slotSpan(slotEl) {
            var p = (slotEl.getAttribute('data-dwf-slot') || '').split(':');
            return parseInt(p[p.length - 1], 10) || 1;
          }
          function rightSlotSibling(slotEl) {
            var n = slotEl.nextElementSibling;
            while (n && !n.hasAttribute('data-dwf-slot')) n = n.nextElementSibling;
            return n;
          }
          // 5c gap: kéo mép PHẢI ô đang chọn (Control lvl1 / Slot lvl2). Kéo phải qua N cột → merge N; trái → split.
          function slotEndColWidth(slotEl) {
            var table = slotEl.closest('table.FormTable');
            if (!table) return 40;
            var widths = readWidths(table);
            var p = (slotEl.getAttribute('data-dwf-slot') || '').split(':');
            var col = parseInt(p[p.length - 2], 10) || 0;
            var span = parseInt(p[p.length - 1], 10) || 1;
            return widths[col + span] || widths[col] || 40;
          }
          function edgeMergeSplitHandle(layer, th, slotEl) {
            var r = slotEl.getBoundingClientRect();
            var right = r.right + window.scrollX, top = r.top + window.scrollY;
            var h = el(layer, 'position:absolute;left:' + (right - 4) + 'px;top:' + top
              + 'px;width:8px;height:' + r.height + 'px;cursor:col-resize;pointer-events:auto;'
              + 'background:' + th.selectedSlot + ';opacity:.55;z-index:3;');
            h.className = 'dwf-bp-tool';
            h.title = 'Kéo phải: gộp cột • Kéo trái: tách';
            var rightSib = rightSlotSibling(slotEl);
            h.addEventListener('mousedown', function (e) {
              e.preventDefault(); e.stopPropagation();
              edgeDrag = {
                slotEl: slotEl,
                slotId: slotEl.getAttribute('data-dwf-slot'),
                hasRight: !!rightSib,
                span: slotSpan(slotEl), colWidth: Math.max(slotEndColWidth(slotEl), 8),
                startClientX: e.clientX, dx: 0, previewCount: 1, previewKeep: 1
              };
            });
          }

          // ── Preview merge/split khi kéo mép ô (overlay riêng, không đụng DOM control) ──
          function slotColSpan(slotEl) {
            var p = (slotEl.getAttribute('data-dwf-slot') || '').split(':');
            return { col: parseInt(p[p.length - 2], 10) || 0, span: parseInt(p[p.length - 1], 10) || 1 };
          }
          function splitBoundaryOf(table) {
            var s = parseInt(table.getAttribute('data-dwf-split'), 10);
            return s > 0 ? s : Infinity; // 0-based cột đầu bên phải
          }
          // Sibling phải có thể merge (cùng phía split), theo thứ tự.
          function mergeableSiblings(slotEl) {
            var table = slotEl.closest('table.FormTable');
            if (!table) return [];
            var boundary = splitBoundaryOf(table);
            var cs = slotColSpan(slotEl);
            var left_side = cs.col < boundary;
            var out = [], sib = rightSlotSibling(slotEl);
            while (sib) {
              var scs = slotColSpan(sib);
              if (left_side && (scs.col + scs.span) > boundary) break; // vượt biên split → dừng
              out.push(sib);
              sib = rightSlotSibling(sib);
            }
            return out;
          }
          function edgePreviewLayer() {
            var p = document.getElementById('dwf-edge-preview');
            if (!p) {
              p = document.createElement('div');
              p.id = 'dwf-edge-preview';
              p.style.cssText = 'position:absolute;left:0;top:0;width:0;height:0;pointer-events:none;z-index:2147483641;';
              document.documentElement.appendChild(p);
            }
            return p;
          }
          function clearEdgePreview() {
            var p = document.getElementById('dwf-edge-preview');
            if (p) p.remove();
          }
          function previewBox(p, page_left, page_top, w, h, color, dashed) {
            var d = document.createElement('div');
            d.className = 'dwf-merge-preview';
            d.style.cssText = 'position:absolute;left:' + page_left + 'px;top:' + page_top + 'px;width:' + w
              + 'px;height:' + h + 'px;pointer-events:none;background:' + color + ';'
              + (dashed ? 'outline:1px dashed rgba(0,0,0,.45);outline-offset:-2px;' : '');
            p.appendChild(d);
          }
          function boxFromRect(p, r, color, dashed) {
            previewBox(p, r.left + window.scrollX, r.top + window.scrollY, r.width, r.height, color, dashed);
          }
          function paintEdgePreview(ed, th) {
            clearEdgePreview();
            var slotEl = ed.slotEl;
            if (!slotEl || !document.contains(slotEl)) return;
            var p = edgePreviewLayer();

            if (ed.dx > 8 && ed.hasRight) {
              // Merge: ô hiện tại + N sibling phải (giới hạn theo split barrier).
              var sibs = mergeableSiblings(slotEl);
              var count = Math.min(sibs.length, Math.max(1, Math.round(ed.dx / ed.colWidth)));
              ed.previewCount = count;
              boxFromRect(p, slotEl.getBoundingClientRect(), th.mergePreview, false);
              for (var i = 0; i < count; i++) boxFromRect(p, sibs[i].getBoundingClientRect(), th.mergePreview, false);
              return;
            }
            if (ed.dx < -8 && ed.span > 1) {
              // Split từng cột: control giữ `keep` cột đầu; phần còn lại (release) thành Empty (gạch).
              var table = slotEl.closest('table.FormTable');
              var widths = readWidths(table);
              var tr = table.getBoundingClientRect();
              var edges = columnEdges(table, widths, tr);
              if (!edges) return;
              var cs = slotColSpan(slotEl);
              var cr = slotEl.getBoundingClientRect();
              var unit = Math.max(cr.width / cs.span, 8); // px trung bình mỗi cột trong span
              var release = Math.min(cs.span - 1, Math.max(1, Math.round(-ed.dx / unit)));
              var keep = cs.span - release;
              ed.previewKeep = keep;
              var top = cr.top + window.scrollY, h = cr.height;
              var keptLast = cs.col + keep - 1;
              if (edges[cs.col] && edges[keptLast])
                previewBox(p, edges[cs.col].left, top, edges[keptLast].right - edges[cs.col].left, h, th.splitKeepPreview, false);
              var relLast = cs.col + cs.span - 1;
              if (edges[cs.col + keep] && edges[relLast])
                previewBox(p, edges[cs.col + keep].left, top, edges[relLast].right - edges[cs.col + keep].left, h, th.splitReleasePreview, true);
            }
          }
          function paintSelectionActions(layer, th) {
            // Control (lvl1) / Slot (lvl2): handle merge/split mép phải + nút xóa nếu có control.
            if ((selection.level === 1 || selection.level === 2)
                && selection.slotEl && document.contains(selection.slotEl)) {
              edgeMergeSplitHandle(layer, th, selection.slotEl);
              var field = controlFieldOf(selection.slotEl);
              if (field) {
                var r = selection.slotEl.getBoundingClientRect();
                (function (fname) {
                  actionButton(layer, r.left + window.scrollX, r.bottom + window.scrollY + 2, '✕', 'Xóa field',
                    function () { post({ type: 'remove', fieldName: fname }); });
                })(field);
              }
              return;
            }
            if (selection.level >= 3 && selection.regionEl && document.contains(selection.regionEl)) {
              var rr = selection.regionEl.getBoundingClientRect();
              var rx = rr.left + window.scrollX, ry = rr.top + window.scrollY - 16;
              if (!document.querySelector('[data-dwf-region="footer"]')) {
                actionButton(layer, rx, ry, '+ Footer', 'Tạo vùng footer', function () { post({ type: 'ensureFooter' }); });
                rx += 56;
              }
              actionButton(layer, rx, ry, '+ Tab', 'Thêm category tab', function () { post({ type: 'addTab' }); });
            }
          }
          // Nút "+" ở cuối tab bar → thêm category qua dialog.
          function paintTabPlus(layer, th) {
            var list = document.querySelector('.DwfTabList');
            if (!list) return;
            var r = list.getBoundingClientRect();
            actionButton(layer, r.right + window.scrollX + 4, r.top + window.scrollY + 1, '+', 'Thêm tab',
              function () { post({ type: 'addTab' }); });
          }
          function controlFieldOf(slotEl) {
            var inner = slotEl.querySelector('[data-symbol-id]');
            var sym = inner ? inner.getAttribute('data-symbol-id') : null;
            if (sym && sym.indexOf('field:') === 0) return sym.slice(6);
            return sym;
          }

          // ── Move control (P3) ────────────────────────────────────────
          function slotIsEmpty(slotEl) { return slotEl.classList.contains('DwfEmptyCell'); }
          function makeGhostText(text) {
            var d = document.createElement('div');
            d.id = 'dwf-blueprint-ghost'; d.textContent = text;
            d.style.cssText = 'position:absolute;pointer-events:none;opacity:.5;z-index:2147483641;'
              + 'border:1px solid #1565c0;background:#e3f2fd;color:#0d47a1;'
              + 'font:11px Segoe UI,sans-serif;padding:1px 6px;white-space:nowrap;';
            document.documentElement.appendChild(d);
            return d;
          }
          function makeGhost(sourceEl) { return makeGhostText((sourceEl.textContent || '').trim().slice(0, 40) || 'control'); }
          function clearDropChrome() {
            var m = document.getElementById('dwf-blueprint-drop');
            if (m) m.remove();
            document.querySelectorAll('.dwf-blueprint-drop-target').forEach(function (x) {
              x.classList.remove('dwf-blueprint-drop-target');
            });
          }
          function showDropChrome(targetEl, mode) {
            clearDropChrome();
            if (mode === 'replace') { targetEl.classList.add('dwf-blueprint-drop-target'); return; }
            var r = targetEl.getBoundingClientRect();
            var m = document.createElement('div');
            m.id = 'dwf-blueprint-drop';
            var x = (mode === 'before' ? r.left : r.right) + window.scrollX;
            m.style.cssText = 'position:absolute;pointer-events:none;z-index:2147483641;width:2px;'
              + 'background:#1565c0;left:' + (x - 1) + 'px;top:' + (r.top + window.scrollY) + 'px;height:' + r.height + 'px;';
            document.documentElement.appendChild(m);
          }
          function dropModeFor(targetEl, clientX) {
            if (slotIsEmpty(targetEl)) return 'replace';
            var r = targetEl.getBoundingClientRect();
            return (clientX - r.left) < r.width / 2 ? 'before' : 'after';
          }
          function slotUnder(clientX, clientY) {
            var stack = document.elementsFromPoint ? document.elementsFromPoint(clientX, clientY)
              : [document.elementFromPoint(clientX, clientY)];
            for (var i = 0; i < stack.length; i++) {
              var e = stack[i];
              if (!e || !e.closest) continue;
              if (e.id === 'dwf-blueprint-layer' || e.id === 'dwf-blueprint-ghost'
                  || e.id === 'dwf-blueprint-drop' || e.closest('#dwf-blueprint-layer')) continue;
              var td = e.closest('td[data-dwf-slot]');
              if (td) return td;
            }
            return null;
          }
          function endSlotDrag(commit) {
            if (!slotDrag) return;
            var s = slotDrag; slotDrag = null;
            if (s.ghost) s.ghost.remove();
            clearDropChrome();
            if (s.moved) suppressClick = true;
            if (commit && s.moved && s.targetSlot && s.targetSlot !== s.fromSlot)
              post({ type: 'drop', fromSlot: s.fromSlot, toSlot: s.targetSlot, mode: s.mode });
          }

          // ── Selection ────────────────────────────────────────────────
          function clearSelectionChrome() {
            ['dwf-blueprint-selected', 'dwf-blueprint-selected-slot', 'dwf-blueprint-selected-region']
              .forEach(function (c) {
                document.querySelectorAll('.' + c).forEach(function (x) { x.classList.remove(c); });
              });
          }
          function regionRoot(slotEl) {
            var table = slotEl.closest('table.FormTable');
            if (!table) return null;
            var region = table.getAttribute('data-dwf-region-table') || '';
            if (region.indexOf('cat:') === 0) return table.closest('.DwfTabPanel') || table;
            if (region === 'footer') return document.querySelector('[data-dwf-region="footer"]') || table;
            return document.querySelector('[data-dwf-region="main"]') || table;
          }
          function applySelectionChrome(level, controlEl, slotEl, regionEl) {
            clearSelectionChrome();
            if (level >= 3 && regionEl) regionEl.classList.add('dwf-blueprint-selected-region');
            else if (level === 2 && slotEl) slotEl.classList.add('dwf-blueprint-selected-slot');
            else if (level === 1 && controlEl) controlEl.classList.add('dwf-blueprint-selected');
            else if (level === 1 && slotEl) slotEl.classList.add('dwf-blueprint-selected-slot');
          }
          function hitSelect(e) {
            if (suppressClick) { suppressClick = false; e.stopPropagation(); return; }
            if (!enabled() || anyDrag() || slotDrag) return;
            if (e.target && e.target.closest && (e.target.closest('.dwf-bp-tool') || e.target.closest('#dwf-blueprint-layer'))) return;
            if (e.target && e.target.closest && e.target.closest('.DwfTabButton')) return;

            var control = e.target.closest ? e.target.closest('[data-symbol-id]') : null;
            var slot = e.target.closest ? e.target.closest('td[data-dwf-slot]') : null;
            if (!slot && !control) return;

            var slotId = slot ? slot.getAttribute('data-dwf-slot') : null;
            var symbolId = control ? control.getAttribute('data-symbol-id') : null;
            if (!symbolId && slot) {
              var inner = slot.querySelector('[data-symbol-id]');
              if (inner) symbolId = inner.getAttribute('data-symbol-id');
            }

            // Ctrl+Click control → mở Source tại <field>, KHÔNG đổi selection level.
            if (e.ctrlKey && symbolId) {
              post({ type: 'gotoField', fieldName: symbolId });
              e.preventDefault(); e.stopPropagation();
              return;
            }

            var table = (slot || control).closest('table.FormTable');
            var regionId = table ? (table.getAttribute('data-dwf-region-table') || 'main') : null;
            var key = (symbolId || '') + '|' + (slotId || '') + '|' + (regionId || '');
            var now = Date.now();
            if (key === clickState.key && (now - clickState.at) <= CLICK_MS)
              clickState.level = Math.min(3, clickState.level + 1);
            else clickState.level = 1;
            clickState.key = key; clickState.at = now;

            var level = clickState.level;
            var regionEl = slot ? regionRoot(slot) : null;
            applySelectionChrome(level, control, slot, regionEl);
            selection = { level: level, slotEl: slot, regionEl: regionEl };
            schedule();
            post({ type: 'select', level: level, symbolId: symbolId, slotId: slotId, regionId: regionId });
            e.preventDefault(); e.stopPropagation();
          }

          // Bắt đầu kéo slot (move control) — chỉ ô có control, không phải handle/tab.
          document.addEventListener('mousedown', function (e) {
            if (!enabled() || anyDrag() || e.button !== 0) return;
            if (!e.target || !e.target.closest) return;
            if (e.target.closest('.dwf-bp-tool') || e.target.closest('#dwf-blueprint-layer')) return;
            if (e.target.closest('.DwfTabButton')) return;
            var slot = e.target.closest('td[data-dwf-slot]');
            if (!slot || slotIsEmpty(slot)) return;
            slotDrag = { sourceEl: slot, fromSlot: slot.getAttribute('data-dwf-slot'),
                         startX: e.clientX, startY: e.clientY, moved: false, ghost: null, targetSlot: null, mode: 'replace' };
          }, true);

          window.addEventListener('mousemove', function (e) {
            if (slotDrag) {
              if (!slotDrag.moved) {
                if (Math.abs(e.clientX - slotDrag.startX) + Math.abs(e.clientY - slotDrag.startY) < MOVE_THRESHOLD) return;
                slotDrag.moved = true; slotDrag.ghost = makeGhost(slotDrag.sourceEl);
              }
              slotDrag.ghost.style.left = (e.clientX + window.scrollX + 12) + 'px';
              slotDrag.ghost.style.top = (e.clientY + window.scrollY + 12) + 'px';
              var target = slotUnder(e.clientX, e.clientY);
              if (!target || target === slotDrag.sourceEl) { slotDrag.targetSlot = null; clearDropChrome(); return; }
              slotDrag.mode = dropModeFor(target, e.clientX);
              slotDrag.targetSlot = target.getAttribute('data-dwf-slot');
              showDropChrome(target, slotDrag.mode);
              return;
            }
            if (edgeDrag) { edgeDrag.dx = e.clientX - edgeDrag.startClientX; paintEdgePreview(edgeDrag, theme()); return; }
            if (splitDrag) { splitDrag.x = pageX(e); return; }
            if (anchorDrag) { anchorDrag.x = pageX(e); return; }
            if (drag) {
              var dx = Math.round(e.clientX - drag.startClientX);
              var delta = clampDelta(drag.baseWidths, drag.splitterIndex, dx);
              var next = drag.baseWidths.slice();
              next[drag.splitterIndex] += delta; next[drag.splitterIndex + 1] -= delta;
              writeWidths(drag.table, next); drag.previewDelta = delta;
              var l1 = ensureLayer(); l1.innerHTML = ''; paintTable(l1, theme(), drag.table);
              return;
            }
            if (formDrag) {
              var total = Math.max(MIN_COL * formDrag.baseWidths.length,
                                   formDrag.baseTotal + Math.round(e.clientX - formDrag.startClientX));
              formDrag.total = total;
              var scale = total / formDrag.baseTotal, run = 0, scaled = [];
              for (var i = 0; i < formDrag.baseWidths.length - 1; i++) {
                var w = Math.max(MIN_COL, Math.round(formDrag.baseWidths[i] * scale)); scaled.push(w); run += w;
              }
              scaled.push(Math.max(MIN_COL, total - run));
              writeWidths(formDrag.table, scaled);
              var l2 = ensureLayer(); l2.innerHTML = ''; paintTable(l2, theme(), formDrag.table);
              return;
            }
            if (heightDrag) {
              heightDrag.height = Math.max(MIN_HEIGHT, heightDrag.baseHeight + Math.round(e.clientY - heightDrag.startClientY));
              return;
            }
          });

          window.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') {
              if (slotDrag) endSlotDrag(false);
              clearEdgePreview();
              edgeDrag = drag = formDrag = heightDrag = splitDrag = anchorDrag = null;
              schedule(); return;
            }
            if ((e.key === 'Delete' || e.key === 'Backspace') && enabled() && selection.slotEl && document.contains(selection.slotEl)) {
              var field = controlFieldOf(selection.slotEl);
              if (field) { post({ type: 'remove', fieldName: field }); e.preventDefault(); }
            }
          }, true);

          window.addEventListener('mouseup', function () {
            if (slotDrag) { endSlotDrag(true); return; }
            if (edgeDrag) {
              var s = edgeDrag; edgeDrag = null;
              clearEdgePreview();
              suppressClick = true;
              if (s.dx > 8 && s.hasRight) {
                // count khớp preview (đã clamp theo split barrier trong paintEdgePreview).
                post({ type: 'merge', slot: s.slotId, count: Math.max(1, s.previewCount || 1) });
              } else if (s.dx < -8 && s.span > 1) {
                // Split từng cột: giữ `keep` cột (khớp preview).
                var keep = Math.min(s.span - 1, Math.max(1, s.previewKeep || 1));
                post({ type: 'shrink', slot: s.slotId, keep: keep });
              } else schedule();
              return;
            }
            if (splitDrag) {
              var sd = splitDrag; splitDrag = null; suppressClick = true;
              var scol = nearestSplitCol(sd.edges, sd.x);
              post({ type: 'setSplit', split: scol });
              return;
            }
            if (anchorDrag) {
              var ad = anchorDrag; anchorDrag = null; suppressClick = true;
              var acol = nearestAnchorCol(ad.edges, ad.x);
              post({ type: 'setAnchor', anchor: acol });
              return;
            }
            if (drag) {
              var d = drag; drag = null;
              if ((d.previewDelta || 0) !== 0)
                post({ type: 'resize', regionId: d.regionId, splitterIndex: d.splitterIndex, deltaPx: d.previewDelta, commit: true });
              else schedule();
              return;
            }
            if (formDrag) {
              var f = formDrag; formDrag = null;
              if (f.total > 0 && f.total !== f.baseTotal)
                post({ type: 'formWidth', regionId: f.regionId, newTotalPx: f.total });
              else schedule();
              return;
            }
            if (heightDrag) {
              var hd = heightDrag; heightDrag = null;
              if (hd.height > 0 && hd.height !== hd.baseHeight)
                post({ type: 'regionHeight', regionId: hd.regionId, heightPx: hd.height });
              else schedule();
              return;
            }
          });

          // ── Toolbox bridge (host gọi qua ExecuteScriptAsync) ─────────
          var toolboxGhost = null, toolboxTarget = null, toolboxMode = 'replace';
          window.__dwfToolbox = {
            over: function (x, y, label) {
              if (!enabled()) return;
              if (!toolboxGhost) toolboxGhost = makeGhostText(label || 'field');
              else toolboxGhost.textContent = label || 'field';
              toolboxGhost.style.left = (x + window.scrollX + 12) + 'px';
              toolboxGhost.style.top = (y + window.scrollY + 12) + 'px';
              var target = slotUnder(x, y);
              if (!target) { toolboxTarget = null; clearDropChrome(); return; }
              toolboxMode = dropModeFor(target, x);
              toolboxTarget = target.getAttribute('data-dwf-slot');
              showDropChrome(target, toolboxMode);
            },
            drop: function () { var hit = toolboxTarget ? { slot: toolboxTarget, mode: toolboxMode } : null; this.cancel(); return hit; },
            cancel: function () { if (toolboxGhost) { toolboxGhost.remove(); toolboxGhost = null; } toolboxTarget = null; clearDropChrome(); }
          };
          window.__dwfApplyTheme = function () { schedule(); };

          document.addEventListener('click', hitSelect, true);
          document.addEventListener('click', function (e) {
            if (e.target && e.target.closest && e.target.closest('.DwfTabButton')) setTimeout(paint, 0);
          }, true);
          window.addEventListener('scroll', schedule, true);
          window.addEventListener('resize', schedule);
          if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', schedule);
          else schedule();
          window.addEventListener('load', function () { schedule(); post({ type: 'blueprint', phase: 'ready', enabled: enabled() }); });
        })();
        """;

    private FormBuilderViewModel? _vm;
    private Task? _init_task;
    private string? _last_html;
    private string? _mapped_program_root;
    private string? _mapped_config_root;
    private string? _blueprint_theme_json;

    /// <summary>Inject màu Blueprint (config JSON) vào trang sau mỗi lần load — script đọc <c>window.__dwfTheme</c>.</summary>
    private async Task PushBlueprintThemeAsync()
    {
        try
        {
            if (DesignWebView.CoreWebView2 is not { } core) return;
            _blueprint_theme_json ??= LoadBlueprintThemeJson();
            await core.ExecuteScriptAsync(
                $"window.__dwfTheme = {_blueprint_theme_json}; window.__dwfApplyTheme && window.__dwfApplyTheme();");
        }
        catch (Exception)
        {
            // Theme là trang trí — không để lỗi làm gián đoạn Design.
        }
    }

    private string LoadBlueprintThemeJson()
    {
        var config_root = _vm?.DesignConfigRoot;
        if (string.IsNullOrWhiteSpace(config_root))
            return BlueprintTheme.Default.ToJsonObject();
        var path = Path.Combine(config_root, "json", "blueprint-theme.json");
        return new BlueprintThemeCatalog(path).GetTheme().ToJsonObject();
    }

    public DesignWebViewHost()
    {
        InitializeComponent();
        Loaded += OnLoaded;
        Unloaded += OnUnloaded;
        DataContextChanged += (_, _) => AttachViewModel();
        SubscribeToolboxBroker();
    }

    private bool _toolbox_broker_subscribed;

    private void SubscribeToolboxBroker()
    {
        if (_toolbox_broker_subscribed) return;
        DesignToolboxDragBroker.Current.Moved += OnToolboxDragMoved;
        DesignToolboxDragBroker.Current.Dropped += OnToolboxDropped;
        DesignToolboxDragBroker.Current.Cancelled += OnToolboxDragCancelled;
        _toolbox_broker_subscribed = true;
    }

    private void UnsubscribeToolboxBroker()
    {
        if (!_toolbox_broker_subscribed) return;
        DesignToolboxDragBroker.Current.Moved -= OnToolboxDragMoved;
        DesignToolboxDragBroker.Current.Dropped -= OnToolboxDropped;
        DesignToolboxDragBroker.Current.Cancelled -= OnToolboxDragCancelled;
        _toolbox_broker_subscribed = false;
    }

    // ── Toolbox (WPF) → Slot (WebView) ───────────────────────────────

    /// <summary>Điểm màn hình → CSS client px của trang; false khi con trỏ chưa nằm trên WebView.</summary>
    private bool TryToPagePoint(Point screen_point, out double x, out double y)
    {
        x = 0;
        y = 0;
        if (!DesignWebView.IsLoaded || DesignWebView.ActualWidth <= 0 || DesignWebView.ActualHeight <= 0)
            return false;

        var local = DesignWebView.PointFromScreen(screen_point);
        if (local.X < 0 || local.Y < 0
            || local.X > DesignWebView.ActualWidth || local.Y > DesignWebView.ActualHeight)
            return false;

        var zoom = DesignWebView.ZoomFactor <= 0.01 ? 1.0 : DesignWebView.ZoomFactor;
        x = Math.Round(local.X / zoom, 2);
        y = Math.Round(local.Y / zoom, 2);
        return true;
    }

    private async void OnToolboxDragMoved(Point screen_point, DesignToolboxDragPayload payload)
    {
        try
        {
            if (DesignWebView.CoreWebView2 is not { } core) return;
            if (!TryToPagePoint(screen_point, out var x, out var y))
            {
                await core.ExecuteScriptAsync("window.__dwfToolbox && window.__dwfToolbox.cancel()");
                return;
            }

            var label = JsonSerializer.Serialize(payload.Label);
            await core.ExecuteScriptAsync(
                $"window.__dwfToolbox && window.__dwfToolbox.over({x.ToString(CultureInfo.InvariantCulture)}," +
                $"{y.ToString(CultureInfo.InvariantCulture)},{label})");
        }
        catch (Exception)
        {
            // Kéo thả không được phép làm sập IDE — bỏ qua lỗi script/WebView tạm thời.
        }
    }

    private async void OnToolboxDropped(Point screen_point, DesignToolboxDragPayload payload)
    {
        try
        {
            if (DesignWebView.CoreWebView2 is not { } core)
            {
                ReportToolboxDropMiss("WebView Design chưa sẵn sàng.");
                return;
            }

            // Tab* không cần Slot — thả bất kỳ đâu trên form mở dialog thêm category.
            if (payload.IsTab)
            {
                await core.ExecuteScriptAsync("window.__dwfToolbox && window.__dwfToolbox.cancel()");
                Dispatcher.Invoke(() => OpenAddTabDialog(payload.TabKind));
                return;
            }

            if (!TryToPagePoint(screen_point, out var x, out var y))
            {
                await core.ExecuteScriptAsync("window.__dwfToolbox && window.__dwfToolbox.cancel()");
                ReportToolboxDropMiss("Thả ngoài vùng Design — hãy thả lên một Slot.");
                return;
            }

            // over() trước để chốt slot dưới con trỏ ở đúng vị trí thả, rồi drop() trả {slot, mode}.
            var label = JsonSerializer.Serialize(payload.Label);
            await core.ExecuteScriptAsync(
                $"window.__dwfToolbox && window.__dwfToolbox.over({x.ToString(CultureInfo.InvariantCulture)}," +
                $"{y.ToString(CultureInfo.InvariantCulture)},{label})");
            var raw = await core.ExecuteScriptAsync(
                "window.__dwfToolbox ? window.__dwfToolbox.drop() : null");

            // ExecuteScriptAsync bọc string JSON; object trả về là JSON object; null → "null".
            if (string.IsNullOrWhiteSpace(raw) || raw == "null")
            {
                ReportToolboxDropMiss("Không tìm thấy Slot dưới con trỏ.");
                return;
            }

            using var doc = JsonDocument.Parse(raw);
            var root = doc.RootElement;
            string? slot;
            string? mode;
            if (root.ValueKind == JsonValueKind.String)
            {
                var inner = root.GetString();
                if (string.IsNullOrWhiteSpace(inner))
                {
                    ReportToolboxDropMiss("Không tìm thấy Slot dưới con trỏ.");
                    return;
                }

                using var inner_doc = JsonDocument.Parse(inner);
                if (inner_doc.RootElement.ValueKind != JsonValueKind.Object)
                {
                    ReportToolboxDropMiss("Không tìm thấy Slot dưới con trỏ.");
                    return;
                }

                slot = Text(inner_doc.RootElement, "slot");
                mode = Text(inner_doc.RootElement, "mode");
            }
            else if (root.ValueKind == JsonValueKind.Object)
            {
                slot = Text(root, "slot");
                mode = Text(root, "mode");
            }
            else
            {
                ReportToolboxDropMiss("Không tìm thấy Slot dưới con trỏ.");
                return;
            }

            if (slot is null)
            {
                ReportToolboxDropMiss("Không tìm thấy Slot dưới con trỏ.");
                return;
            }

            Dispatcher.Invoke(() =>
            {
                if (payload.IsNewControl)
                {
                    if (payload.ControlKind is not { } control_kind)
                    {
                        ReportToolboxDropMiss("Control palette thiếu ControlKind.");
                        return;
                    }

                    _vm?.ApplyBlueprintNewControlDrop(control_kind, slot, mode);
                }
                else if (payload.FieldName is { Length: > 0 } field_name)
                    _vm?.ApplyBlueprintToolboxDrop(field_name, payload.Kind, slot, mode);
                else
                    ReportToolboxDropMiss("Payload Toolbox không hợp lệ.");
            });
        }
        catch (JsonException)
        {
            ReportToolboxDropMiss("Kết quả drop không hợp lệ.");
        }
        catch (Exception)
        {
            ReportToolboxDropMiss("Lỗi WebView khi thả Toolbox.");
        }
    }

    private void ReportToolboxDropMiss(string message)
    {
        Dispatcher.Invoke(() =>
        {
            if (_vm is not null)
                _vm.StatusMessage = $"✘ {message}";
        });
    }

    private async void OnToolboxDragCancelled()
    {
        try
        {
            if (DesignWebView.CoreWebView2 is { } core)
                await core.ExecuteScriptAsync("window.__dwfToolbox && window.__dwfToolbox.cancel()");
        }
        catch (Exception)
        {
            // ignore
        }
    }

    private async void OnLoaded(object sender, RoutedEventArgs e)
    {
        SubscribeToolboxBroker();
        AttachViewModel();
        await EnsureInitializedAsync();
        RenderCurrent();
    }

    private void OnUnloaded(object sender, RoutedEventArgs e)
    {
        if (_vm is not null)
            _vm.PropertyChanged -= OnVmPropertyChanged;

        UnsubscribeToolboxBroker();
    }

    private void AttachViewModel()
    {
        if (DataContext is not FormBuilderViewModel vm || ReferenceEquals(vm, _vm))
            return;

        if (_vm is not null) _vm.PropertyChanged -= OnVmPropertyChanged;
        _vm = vm;
        _vm.PropertyChanged += OnVmPropertyChanged;
        Dispatcher.InvokeAsync(RenderCurrent);
    }

    private void OnVmPropertyChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName == nameof(FormBuilderViewModel.GeneratedDesignDocument))
            Dispatcher.InvokeAsync(RenderCurrent);
    }

    private void RenderCurrent()
    {
        if (_vm?.GeneratedDesignDocument is not { } document)
            return;
        if (document.Html == _last_html)
            return;
        _last_html = document.Html;
        _ = NavigateAsync(document);
    }

    /// <summary>Khởi tạo WebView2 đúng MỘT lần (cache Task). Các trigger (Loaded, đổi document) có thể gọi
    /// đồng thời khi init chưa xong — nếu không serialize, mỗi lần tạo một CoreWebView2Environment mới rồi
    /// EnsureCoreWebView2Async trên cùng control → "already initialized with a different environment".</summary>
    private Task EnsureInitializedAsync() => _init_task ??= InitializeCoreAsync();

    private async Task InitializeCoreAsync()
    {
        try
        {
            var user_data_folder = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "DevWorkFlow", "WebView2Design");
            var environment = await CoreWebView2Environment.CreateAsync(userDataFolder: user_data_folder);
            await DesignWebView.EnsureCoreWebView2Async(environment);

            if (DesignWebView.CoreWebView2 is { } core)
            {
                await core.AddScriptToExecuteOnDocumentCreatedAsync(DesignViewportScript);
                await core.AddScriptToExecuteOnDocumentCreatedAsync(DesignBlueprintScript);
                core.WebMessageReceived += OnWebMessageReceived;
                core.NavigationCompleted += (_, _) => _ = PushBlueprintThemeAsync();
                DesignWebView.ZoomFactorChanged += (_, _) => UpdateZoom();
                UpdateZoom();
            }
        }
        catch (Exception ex)
        {
            _init_task = null; // cho phép thử lại lần sau (không khóa vĩnh viễn khi lỗi tạm thời)
            IdeMessage.ShowException(ex, "Không mở được WebView2 cho Design (kiểm tra WebView2 Runtime).");
        }
    }

    private async Task NavigateAsync(DesignDocument document)
    {
        await EnsureInitializedAsync();
        if (DesignWebView.CoreWebView2 is not { } core)
            return;

        EnsureProgramHostMapping(core);
        EnsureConfigHostMapping(core);

        // NavigateToString = about:blank → KHÔNG load thêm ảnh/CSS ngoài (Microsoft docs).
        // Ghi HTML dưới Config root rồi Navigate virtual host để url(../image/…) resolve được.
        if (!string.IsNullOrWhiteSpace(_mapped_config_root)
            && Directory.Exists(_mapped_config_root))
        {
            var preview_path = Path.Combine(_mapped_config_root, PreviewFileName);
            await File.WriteAllTextAsync(preview_path, document.Html).ConfigureAwait(true);
            core.Navigate($"https://{ConfigVirtualHost}/{PreviewFileName}");
            return;
        }

        core.NavigateToString(document.Html);
    }

    private void EnsureProgramHostMapping(CoreWebView2 core)
    {
        var program_root = _vm?.DesignProgramRoot;
        if (string.IsNullOrWhiteSpace(program_root) || !Directory.Exists(program_root))
            return;
        if (string.Equals(program_root, _mapped_program_root, StringComparison.OrdinalIgnoreCase))
            return;

        if (_mapped_program_root is not null)
        {
            try { core.ClearVirtualHostNameToFolderMapping(ProgramVirtualHost); }
            catch { /* chưa map thì bỏ qua */ }
        }

        core.SetVirtualHostNameToFolderMapping(
            ProgramVirtualHost, program_root, CoreWebView2HostResourceAccessKind.Allow);
        _mapped_program_root = program_root;
    }

    private void EnsureConfigHostMapping(CoreWebView2 core)
    {
        var config_root = _vm?.DesignConfigRoot;
        if (string.IsNullOrWhiteSpace(config_root) || !Directory.Exists(config_root))
            return;
        if (string.Equals(config_root, _mapped_config_root, StringComparison.OrdinalIgnoreCase))
            return;

        if (_mapped_config_root is not null)
        {
            try { core.ClearVirtualHostNameToFolderMapping(ConfigVirtualHost); }
            catch { /* chưa map thì bỏ qua */ }
        }

        core.SetVirtualHostNameToFolderMapping(
            ConfigVirtualHost, config_root, CoreWebView2HostResourceAccessKind.Allow);
        _mapped_config_root = config_root;
    }

    private void UpdateZoom()
    {
        RulerX.Zoom = DesignWebView.ZoomFactor;
        RulerY.Zoom = DesignWebView.ZoomFactor;
    }

    /// <summary>
    /// Bridge Design WebView: <c>designViewport</c> (thước), <c>resize</c> / <c>select</c> (Blueprint P2),
    /// <c>blueprint</c> ready (bỏ qua).
    /// </summary>
    private void OnWebMessageReceived(object? sender, CoreWebView2WebMessageReceivedEventArgs e)
    {
        string? raw;
        try
        {
            raw = e.TryGetWebMessageAsString();
        }
        catch (InvalidCastException)
        {
            return;
        }

        if (string.IsNullOrEmpty(raw)) return;

        try
        {
            using var doc = JsonDocument.Parse(raw);
            var root = doc.RootElement;
            if (!root.TryGetProperty("type", out var type_prop))
                return;

            var msg_type = type_prop.GetString();
            if (string.Equals(msg_type, "resize", StringComparison.Ordinal))
            {
                HandleBlueprintResize(root);
                return;
            }

            if (string.Equals(msg_type, "select", StringComparison.Ordinal))
            {
                HandleBlueprintSelect(root);
                return;
            }

            if (string.Equals(msg_type, "drop", StringComparison.Ordinal))
            {
                HandleBlueprintDrop(root);
                return;
            }

            if (string.Equals(msg_type, "merge", StringComparison.Ordinal))
            {
                // P6 gap: kéo mép phải → {slot,count}; giữ tương thích {leftSlot,rightSlot} cũ.
                if (root.TryGetProperty("slot", out var slot_prop))
                {
                    var slot = slot_prop.GetString();
                    var count = root.TryGetProperty("count", out var cp) ? cp.GetInt32() : 1;
                    Dispatcher.Invoke(() => _vm?.ApplyBlueprintMergeRun(slot, count));
                }
                else
                {
                    var left = Text(root, "leftSlot");
                    var right = Text(root, "rightSlot");
                    Dispatcher.Invoke(() => _vm?.ApplyBlueprintMerge(left, right));
                }
                return;
            }

            if (string.Equals(msg_type, "setSplit", StringComparison.Ordinal))
            {
                var split = root.TryGetProperty("split", out var sp) ? sp.GetInt32() : 0;
                Dispatcher.Invoke(() => _vm?.ApplyBlueprintSetSplit(split));
                return;
            }

            if (string.Equals(msg_type, "setAnchor", StringComparison.Ordinal))
            {
                var anchor = root.TryGetProperty("anchor", out var ap) ? ap.GetInt32() : 0;
                Dispatcher.Invoke(() => _vm?.ApplyBlueprintSetAnchor(anchor));
                return;
            }

            if (string.Equals(msg_type, "split", StringComparison.Ordinal))
            {
                var slot = Text(root, "slot");
                Dispatcher.Invoke(() => _vm?.ApplyBlueprintSplit(slot));
                return;
            }

            if (string.Equals(msg_type, "shrink", StringComparison.Ordinal))
            {
                var slot = Text(root, "slot");
                var keep = root.TryGetProperty("keep", out var kp) ? kp.GetInt32() : 1;
                Dispatcher.Invoke(() => _vm?.ApplyBlueprintShrink(slot, keep));
                return;
            }

            if (string.Equals(msg_type, "formWidth", StringComparison.Ordinal))
            {
                var region = Text(root, "regionId");
                var total = root.TryGetProperty("newTotalPx", out var tp) ? tp.GetInt32() : 0;
                Dispatcher.Invoke(() => _vm?.ApplyBlueprintFormWidth(region, total));
                return;
            }

            if (string.Equals(msg_type, "regionHeight", StringComparison.Ordinal))
            {
                var region = Text(root, "regionId");
                var height = root.TryGetProperty("heightPx", out var hp) ? hp.GetInt32() : 0;
                Dispatcher.Invoke(() => _vm?.ApplyBlueprintRegionHeight(region, height));
                return;
            }

            if (string.Equals(msg_type, "ensureFooter", StringComparison.Ordinal))
            {
                Dispatcher.Invoke(ConfirmAndEnsureFooter);
                return;
            }

            // Region chrome "+ Tab" và nút "+" trên tab bar đều mở dialog chọn loại + header.
            if (string.Equals(msg_type, "addCategory", StringComparison.Ordinal)
                || string.Equals(msg_type, "addTab", StringComparison.Ordinal))
            {
                Dispatcher.Invoke(() => OpenAddTabDialog(null));
                return;
            }

            if (string.Equals(msg_type, "remove", StringComparison.Ordinal))
            {
                var field = Text(root, "fieldName");
                Dispatcher.Invoke(() => ConfirmAndRemoveField(field));
                return;
            }

            if (string.Equals(msg_type, "gotoField", StringComparison.Ordinal))
            {
                var field = Text(root, "fieldName");
                Dispatcher.Invoke(() => _vm?.JumpToFieldSource(field));
                return;
            }

            if (string.Equals(msg_type, "blueprint", StringComparison.Ordinal))
                return;

            if (!string.Equals(msg_type, "designViewport", StringComparison.Ordinal))
                return;

            if (!root.TryGetProperty("scrollX", out var sx)
                || !root.TryGetProperty("scrollY", out var sy)
                || !root.TryGetProperty("originX", out var ox)
                || !root.TryGetProperty("originY", out var oy))
            {
                if (root.TryGetProperty("x", out var x_prop) && root.TryGetProperty("y", out var y_prop))
                {
                    var z0 = DesignWebView.ZoomFactor <= 0.01 ? 1.0 : DesignWebView.ZoomFactor;
                    Dispatcher.Invoke(() =>
                    {
                        RulerX.Offset = x_prop.GetDouble() * z0;
                        RulerY.Offset = y_prop.GetDouble() * z0;
                    });
                }
                return;
            }

            var zoom = DesignWebView.ZoomFactor <= 0.01 ? 1.0 : DesignWebView.ZoomFactor;
            Dispatcher.Invoke(() =>
            {
                RulerX.Offset = (sx.GetDouble() - ox.GetDouble()) * zoom;
                RulerY.Offset = (sy.GetDouble() - oy.GetDouble()) * zoom;
            });
        }
        catch (JsonException)
        {
            // Message không đúng format — bỏ qua.
        }
    }

    private void HandleBlueprintResize(JsonElement root)
    {
        if (_vm is null) return;
        if (!root.TryGetProperty("commit", out var commit_prop) || !commit_prop.GetBoolean())
            return;
        if (!root.TryGetProperty("regionId", out var region_prop))
            return;
        if (!root.TryGetProperty("splitterIndex", out var splitter_prop))
            return;
        if (!root.TryGetProperty("deltaPx", out var delta_prop))
            return;

        var region_id = region_prop.GetString();
        var splitter_index = splitter_prop.GetInt32();
        var delta_px = delta_prop.GetInt32();
        Dispatcher.Invoke(() => _vm.ApplyBlueprintColumnResize(region_id, splitter_index, delta_px));
    }

    private static string? Text(JsonElement root, string name) =>
        root.TryGetProperty(name, out var prop) ? prop.GetString() : null;

    private void HandleBlueprintDrop(JsonElement root)
    {
        if (_vm is null) return;
        var from_slot = Text(root, "fromSlot");
        var to_slot = Text(root, "toSlot");
        var mode = Text(root, "mode");
        if (from_slot is null || to_slot is null) return;
        Dispatcher.Invoke(() => _vm.ApplyBlueprintSlotDrop(from_slot, to_slot, mode));
    }

    /// <summary>Spec §7.4: tạo vùng Footer là thay đổi cấu trúc → hỏi trước khi ghi XML.</summary>
    private void ConfirmAndEnsureFooter()
    {
        if (_vm is null) return;
        if (IdeMessage.Confirm(
                "Form chưa có vùng Footer (category index -1). Tạo ngay?",
                "Blueprint Designer",
                IdeMessageKind.Warning))
            _vm.ApplyBlueprintEnsureFooter();
    }

    /// <summary>Task 4: mở dialog thu thập loại tab + header (+ controller) rồi AddTabCategory.</summary>
    private void OpenAddTabDialog(string? initial_kind)
    {
        if (_vm is null) return;
        var dialog = new AddTabCategoryDialog(initial_kind)
        {
            Owner = Window.GetWindow(this) ?? System.Windows.Application.Current?.MainWindow
        };
        if (dialog.ShowDialog() == true && dialog.Result is { } r)
            _vm.ApplyBlueprintAddTab(r.TabKind, r.HeaderV, r.HeaderE, r.Controller);
    }

    /// <summary>Xóa field là thao tác phá huỷ (gỡ <c>&lt;field&gt;</c>) → hỏi trước.</summary>
    private void ConfirmAndRemoveField(string? field_name)
    {
        if (_vm is null || string.IsNullOrWhiteSpace(field_name)) return;
        if (IdeMessage.Confirm(
                $"Xóa field '{field_name}' khỏi form? Mọi ô của field (và field reference nếu là AutoComplete) sẽ bị gỡ.",
                "Blueprint Designer",
                IdeMessageKind.Warning))
            _vm.ApplyBlueprintRemoveField(field_name);
    }

    private void HandleBlueprintSelect(JsonElement root)
    {
        if (_vm is null) return;
        var level = root.TryGetProperty("level", out var level_prop) ? level_prop.GetInt32() : 1;
        var symbol_id = root.TryGetProperty("symbolId", out var sym) ? sym.GetString() : null;
        var slot_id = root.TryGetProperty("slotId", out var slot) ? slot.GetString() : null;
        var region_id = root.TryGetProperty("regionId", out var reg) ? reg.GetString() : null;
        Dispatcher.Invoke(() => _vm.ApplyBlueprintSelection(level, symbol_id, slot_id, region_id));
    }
}

import fs from 'node:fs';
import path from 'node:path';

const projectRoot = process.argv[2];
const uaDir = process.argv[3];
const batches = JSON.parse(
  fs.readFileSync(path.join(uaDir, 'intermediate/batches.json'), 'utf8'),
);

const typeIndex = new Map();
const allExtracts = new Map();

for (const b of batches.batches) {
  const er = JSON.parse(
    fs.readFileSync(
      path.join(uaDir, 'tmp', `ua-file-extract-results-${b.batchIndex}.json`),
      'utf8',
    ),
  );
  allExtracts.set(b.batchIndex, er);
  for (const r of er.results || []) {
    for (const c of r.classes || []) {
      if (c.name) typeIndex.set(c.name, r.path.replace(/\\/g, '/'));
    }
  }
}

function nodeType(cat, filePath) {
  if (cat === 'docs') return 'document';
  if (cat === 'config') return 'config';
  if (cat === 'infra') {
    if (filePath.includes('.github/workflows') || filePath.includes('ci.yml')) {
      return 'pipeline';
    }
    return 'service';
  }
  if (cat === 'data') {
    return filePath.endsWith('.sql') ? 'table' : 'schema';
  }
  return 'file';
}

function complexity(r) {
  const n = r.nonEmptyLines || r.totalLines || 0;
  if (n < 50) return 'simple';
  if (n <= 200) return 'moderate';
  return 'complex';
}

function summarizeFile(r) {
  const p = r.path.replace(/\\/g, '/');
  const base = path.basename(p);
  const cat = r.fileCategory;
  if (cat === 'docs') {
    const map = {
      'README.md':
        'Tài liệu gốc DevWorkFlow / FBO Studio — điểm vào để hiểu sản phẩm.',
      'ARCHITECTURE.md':
        'Mô tả kiến trúc Clean Architecture (Domain/Application/Infrastructure/UI).',
      'PRODUCT_VISION.md':
        'Tầm nhìn sản phẩm FBO Studio — IDE cho FBO ERP.',
      'ROADMAP.md': 'Lộ trình phát triển và các cột mốc tính năng.',
      'ERP_LANGUAGE_SERVICE.md':
        'Thiết kế ERP Language Service (workspace, bind, navigation, diagnostics).',
      'PROJECT_STATUS.md': 'Trạng thái hiện tại của các module FBO Studio.',
      'DECISIONS.md': 'Architecture Decision Records (ADR) của dự án.',
      'AI_RULES.md': 'Quy tắc làm việc với AI trên codebase FBO Studio.',
      'NAVIGATION_SERVICE.md': 'Thiết kế Navigation Service trong IDE.',
      'EXPLORER_TREE_PANEL.md': 'Thiết kế Explorer Tree Panel.',
    };
    return map[base] || `Tài liệu dự án: ${base}.`;
  }
  if (cat === 'config') {
    if (base.endsWith('.csproj')) {
      return `Project file .NET cho ${base.replace('.csproj', '')}.`;
    }
    if (base === 'global.json') return 'Chỉ định SDK .NET dùng cho solution.';
    if (base.endsWith('.slnx') || base.endsWith('.sln')) {
      return 'Solution DevWorkFlow gom các project runtime và tests.';
    }
    return `Cấu hình: ${base}.`;
  }
  if (cat === 'infra') return 'Pipeline CI GitHub Actions cho build/test.';
  if (cat === 'data') return `Script/schema dữ liệu: ${base}.`;
  if (p.includes('/Language/')) {
    return `Thành phần ERP Language Service: ${base}.`;
  }
  if (p.includes('/Engine/')) {
    return `Engine Application xử lý XML/SQL/Workflow: ${base}.`;
  }
  if (p.includes('/ViewModels/')) return `ViewModel MVVM của UI: ${base}.`;
  if (p.includes('/Views/')) return `View WPF: ${base}.`;
  if (p.includes('/Docking/')) return `Hệ thống docking panel IDE: ${base}.`;
  if (p.includes('Infrastructure') && p.includes('/Services/')) {
    return `Adapter Infrastructure: ${base}.`;
  }
  if (p.includes('/Models/')) return `Domain model: ${base}.`;
  if (p.includes('.Tests')) return `Unit test: ${base}.`;
  if (base === 'App.xaml.cs' || base === 'App.xaml') {
    return 'Composition root WPF — khởi tạo DI và cửa sổ chính.';
  }
  if (base.startsWith('MainWindow')) return 'Cửa sổ chính IDE FBO Studio.';
  if (base.endsWith('.xaml')) return `Markup XAML UI: ${base}.`;
  const cls = (r.classes || []).map((c) => c.name).slice(0, 3).join(', ');
  if (cls) return `Mã nguồn C# định nghĩa ${cls}.`;
  return `File nguồn: ${base}.`;
}

function tagsFor(r) {
  const p = r.path.replace(/\\/g, '/');
  const tags = [];
  if (r.fileCategory === 'docs') tags.push('documentation');
  if (r.fileCategory === 'config') tags.push('configuration', 'build-system');
  if (r.fileCategory === 'infra') tags.push('ci-cd', 'deployment');
  if (r.fileCategory === 'data') tags.push('database', 'schema-definition');
  if (p.includes('/Language/')) tags.push('language-service', 'service');
  if (p.includes('/Engine/')) tags.push('engine', 'service');
  if (p.includes('/ViewModels/')) tags.push('viewmodel', 'mvvm');
  if (p.includes('/Views/') || p.endsWith('.xaml')) tags.push('ui', 'wpf');
  if (p.includes('/Models/')) tags.push('data-model');
  if (p.includes('.Tests')) tags.push('test');
  if (p.includes('App.xaml')) tags.push('entry-point');
  if (p.includes('/Abstractions') || p.includes('IServices')) {
    tags.push('type-definition', 'port');
  }
  if (p.includes('/Docking/')) tags.push('ide-shell', 'service');
  if (tags.length < 3) tags.push('csharp', 'devworkflow');
  return [...new Set(tags)].slice(0, 5);
}

function resolveCsharpImports(filePath) {
  const abs = path.join(projectRoot, filePath);
  if (!fs.existsSync(abs)) return [];
  const text = fs.readFileSync(abs, 'utf8');
  const imports = new Set();
  for (const [typeName, tp] of typeIndex) {
    if (tp === filePath) continue;
    const re = new RegExp(`\\b${typeName}\\b`);
    if (re.test(text)) imports.add(tp);
  }
  return [...imports].slice(0, 40);
}

let totalNodes = 0;
let totalEdges = 0;

for (const b of batches.batches) {
  const er = allExtracts.get(b.batchIndex);
  const nodes = [];
  const edges = [];
  const importData = b.batchImportData || {};
  const edgeKey = new Set();

  function addEdge(e) {
    const k = `${e.source}|${e.target}|${e.type}`;
    if (edgeKey.has(k)) return;
    edgeKey.add(k);
    edges.push(e);
    totalEdges++;
  }

  for (const r of er.results || []) {
    const fp = r.path.replace(/\\/g, '/');
    const ntype = nodeType(r.fileCategory, fp);
    const fileNodeId = `${ntype}:${fp}`;
    const node = {
      id: fileNodeId,
      type: ntype,
      name: path.basename(fp),
      filePath: fp,
      summary: summarizeFile(r),
      tags: tagsFor(r),
      complexity: complexity(r),
    };
    if (r.language === 'csharp') node.languageNotes = 'C# / .NET';
    nodes.push(node);
    totalNodes++;

    for (const c of r.classes || []) {
      const lines = (c.endLine || 0) - (c.startLine || 0);
      const methods = (c.methods || []).length;
      const exported = (r.exports || []).some((e) => e.name === c.name);
      if (methods < 2 && lines < 20 && !exported) continue;
      const cid = `class:${fp}:${c.name}`;
      nodes.push({
        id: cid,
        type: 'class',
        name: c.name,
        filePath: fp,
        summary: `Kiểu ${c.name} trong ${path.basename(fp)}.`,
        tags: [
          'class',
          fp.includes('Language') ? 'language-service' : 'domain',
        ],
        complexity:
          lines > 200 ? 'complex' : lines > 50 ? 'moderate' : 'simple',
      });
      addEdge({
        source: fileNodeId,
        target: cid,
        type: 'contains',
        direction: 'forward',
        weight: 1.0,
      });
      totalNodes++;
    }

    for (const f of r.functions || []) {
      const lines = (f.endLine || 0) - (f.startLine || 0) + 1;
      const exported = (r.exports || []).some((e) => e.name === f.name);
      if (lines < 10 && !exported) continue;
      const fid = `function:${fp}:${f.name}`;
      nodes.push({
        id: fid,
        type: 'function',
        name: f.name,
        filePath: fp,
        summary: `Hàm/method ${f.name} trong ${path.basename(fp)}.`,
        tags: ['function'],
        complexity:
          lines > 50 ? 'complex' : lines > 20 ? 'moderate' : 'simple',
      });
      addEdge({
        source: fileNodeId,
        target: fid,
        type: 'contains',
        direction: 'forward',
        weight: 1.0,
      });
      totalNodes++;
    }

    const listed = importData[fp] || importData[r.path] || [];
    for (const target of listed) {
      addEdge({
        source: fileNodeId,
        target: `file:${target}`,
        type: 'imports',
        direction: 'forward',
        weight: 0.7,
      });
    }

    if (r.language === 'csharp') {
      for (const target of resolveCsharpImports(fp)) {
        addEdge({
          source: fileNodeId,
          target: `file:${target}`,
          type: 'imports',
          direction: 'forward',
          weight: 0.7,
        });
      }
    }

    if (r.fileCategory === 'docs' && fp.startsWith('docs/')) {
      addEdge({
        source: fileNodeId,
        target: 'document:README.md',
        type: 'related',
        direction: 'forward',
        weight: 0.5,
      });
    }
    if (fp === 'docs/ARCHITECTURE.md') {
      addEdge({
        source: fileNodeId,
        target: 'file:UI/App.xaml.cs',
        type: 'documents',
        direction: 'forward',
        weight: 0.5,
      });
    }
  }

  const out = {
    batchIndex: b.batchIndex,
    nodes,
    edges,
    batchFiles: b.files.map((f) => ({
      path: f.path,
      language: f.language,
      sizeLines: f.sizeLines,
      fileCategory: f.fileCategory,
    })),
  };
  fs.writeFileSync(
    path.join(uaDir, 'intermediate', `batch-${b.batchIndex}.json`),
    JSON.stringify(out, null, 2),
  );
  console.log(
    `batch ${b.batchIndex}: nodes=${nodes.length} edges=${edges.length}`,
  );
}

console.log(`TOTAL nodes=${totalNodes} edges=${totalEdges}`);

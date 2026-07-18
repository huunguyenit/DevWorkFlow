import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { pathToFileURL } from 'node:url';

const ua = process.argv[2];
const projectRoot = process.argv[3];
const skillDir = process.argv[4];

console.log('[Phase 3/7] Reviewing assembled graph...');
const assembled = JSON.parse(
  fs.readFileSync(path.join(ua, 'intermediate/assembled-graph.json'), 'utf8'),
);
const ids = new Set((assembled.nodes || []).map((n) => n.id));
const dangling = (assembled.edges || []).filter(
  (e) => !ids.has(e.source) || !ids.has(e.target),
);
fs.writeFileSync(
  path.join(ua, 'intermediate/assemble-review.json'),
  JSON.stringify(
    {
      danglingEdges: dangling.length,
      notes: ['C# imports via type heuristic', 'VN path-based summaries'],
    },
    null,
    2,
  ),
);
console.log('Phase 3 complete. dangling=', dangling.length);

console.log('[Phase 4/7] Identifying architectural layers...');
const fileLevel = new Set([
  'file',
  'config',
  'document',
  'service',
  'pipeline',
  'table',
  'schema',
  'resource',
  'endpoint',
]);
const files = (assembled.nodes || []).filter((n) => fileLevel.has(n.type));
function layerOf(n) {
  const p = (n.filePath || '').replace(/\\/g, '/');
  if (p.startsWith('docs/') || n.type === 'document' || p === 'README.md')
    return 'docs';
  if (p.startsWith('tests/') || p.includes('.Tests/')) return 'tests';
  if (p.startsWith('DevWorkFlow.Domain/')) return 'domain';
  if (p.startsWith('DevWorkFlow.Application/')) return 'application';
  if (p.startsWith('DevWorkFlow.Infrastructure/')) return 'infrastructure';
  if (p.startsWith('UI/')) return 'ui';
  if (p.startsWith('.github/') || n.type === 'pipeline') return 'ci';
  if (
    n.type === 'config' ||
    p.endsWith('.csproj') ||
    p.endsWith('.slnx') ||
    p === 'global.json'
  )
    return 'config';
  if (n.type === 'table' || n.type === 'schema') return 'data';
  return 'shared';
}
const meta = {
  docs: {
    name: 'Tài liệu',
    description:
      'PRODUCT_VISION, ARCHITECTURE, ROADMAP và ADR — nguồn sự thật về sản phẩm.',
  },
  domain: {
    name: 'Domain',
    description:
      'Model FBO/SQL/Menu và hợp đồng Language (IErp*) — không phụ thuộc Infrastructure.',
  },
  application: {
    name: 'Application',
    description:
      'Engine XML/SQL/Workflow, Abstractions/IServices, ERP Language Service.',
  },
  infrastructure: {
    name: 'Infrastructure',
    description:
      'Adapter SQL, Web.config, wcommand, menu, session — implement ports Application.',
  },
  ui: {
    name: 'UI (WPF)',
    description:
      'Views/ViewModels/Docking/Commands; composition root App.xaml.cs.',
  },
  tests: { name: 'Tests', description: 'Unit tests Domain và Application.' },
  config: {
    name: 'Cấu hình / Build',
    description: 'Solution, csproj, global.json, settings.',
  },
  ci: { name: 'CI/CD', description: 'GitHub Actions workflow.' },
  data: {
    name: 'Data / Schema',
    description: 'SQL scripts và schema FBO.',
  },
  shared: {
    name: 'Shared / Khác',
    description: 'File không thuộc layer chính.',
  },
};
const buckets = {};
for (const n of files) {
  const L = layerOf(n);
  (buckets[L] || (buckets[L] = [])).push(n.id);
}
const layers = Object.keys(buckets).map((k) => ({
  id: 'layer:' + k,
  name: meta[k].name,
  description: meta[k].description,
  nodeIds: buckets[k],
}));
fs.writeFileSync(
  path.join(ua, 'intermediate/layers.json'),
  JSON.stringify(layers, null, 2),
);
console.log(
  'layers:',
  layers.map((l) => l.id + '=' + l.nodeIds.length).join(', '),
);

console.log('[Phase 5/7] Building guided tour...');
let tour = [
  {
    order: 1,
    title: 'Tổng quan sản phẩm',
    description:
      'Bắt đầu từ README và PRODUCT_VISION để hiểu FBO Studio là IDE cho FBO ERP.',
    nodeIds: ['document:README.md', 'document:docs/PRODUCT_VISION.md'],
  },
  {
    order: 2,
    title: 'Kiến trúc Clean Architecture',
    description:
      'Đọc ARCHITECTURE.md rồi lần theo 4 project Domain → Application → Infrastructure → UI.',
    nodeIds: [
      'document:docs/ARCHITECTURE.md',
      'config:DevWorkFlow.Domain/DevWorkFlow.Domain.csproj',
      'config:DevWorkFlow.Application/DevWorkFlow.Application.csproj',
      'config:DevWorkFlow.Infrastructure/DevWorkFlow.Infrastructure.csproj',
      'config:UI/UI.csproj',
    ],
  },
  {
    order: 3,
    title: 'Composition root',
    description:
      'App.xaml.cs là điểm wiring DI thủ công và mở MainWindow.',
    nodeIds: ['file:UI/App.xaml.cs', 'file:UI/MainWindow.xaml.cs'],
  },
  {
    order: 4,
    title: 'Ports Application',
    description:
      'IServices và Abstractions định nghĩa hợp đồng mà Infrastructure implement.',
    nodeIds: ['file:DevWorkFlow.Application/Abstractions/IServices.cs'],
  },
  {
    order: 5,
    title: 'ERP Language Service',
    description:
      'Trái tim To-Be: workspace, bind, navigation, diagnostics trong Application/Language.',
    nodeIds: [
      'document:docs/ERP_LANGUAGE_SERVICE.md',
      'file:DevWorkFlow.Application/Language/ErpLanguageService.cs',
    ],
  },
  {
    order: 6,
    title: 'Domain models FBO',
    description: 'Mô hình form/field FBO là nền tảng hiểu XML controller.',
    nodeIds: ['file:DevWorkFlow.Domain/Models/Fbo/FboFormModel.cs'],
  },
  {
    order: 7,
    title: 'Infrastructure adapters',
    description: 'SQL, menu, session — nơi nói chuyện với runtime FBO.',
    nodeIds: ['file:DevWorkFlow.Infrastructure/Services/SqlScriptRunner.cs'],
  },
  {
    order: 8,
    title: 'IDE shell & docking',
    description:
      'DockService và panel Explorer/SQL/Designer tạo trải nghiệm IDE.',
    nodeIds: [
      'file:UI/Docking/DockService.cs',
      'file:UI/ViewModels/MainViewModel.cs',
    ],
  },
  {
    order: 9,
    title: 'Form Builder',
    description: 'FormBuilderPage — designer form trong UI.',
    nodeIds: [
      'file:UI/Views/Pages/FormBuilderPage.xaml.cs',
      'file:UI/Views/Pages/FormBuilderPage.xaml',
    ],
  },
  {
    order: 10,
    title: 'Lộ trình tiếp theo',
    description:
      'ROADMAP và PROJECT_STATUS cho biết module nào đã xong / còn lại.',
    nodeIds: [
      'document:docs/ROADMAP.md',
      'document:docs/PROJECT_STATUS.md',
    ],
  },
];
const allIds = new Set((assembled.nodes || []).map((n) => n.id));
function resolve(id) {
  if (allIds.has(id)) return id;
  const bare = id.replace(
    /^(file|document|config|pipeline|service|table|schema):/,
    '',
  );
  for (const prefix of [
    'file',
    'document',
    'config',
    'pipeline',
    'service',
    'table',
    'schema',
  ]) {
    const cand = prefix + ':' + bare;
    if (allIds.has(cand)) return cand;
  }
  const base = bare.split('/').pop();
  for (const n of assembled.nodes || []) {
    if ((n.filePath || '').endsWith(base) || n.name === base) return n.id;
  }
  return null;
}
for (const step of tour) {
  step.nodeIds = step.nodeIds.map(resolve).filter(Boolean);
}
tour = tour.filter((s) => s.nodeIds.length > 0);
fs.writeFileSync(
  path.join(ua, 'intermediate/tour.json'),
  JSON.stringify(tour, null, 2),
);
console.log('tour steps:', tour.length);

console.log('[Phase 6/7] Validating knowledge graph...');
const scan = JSON.parse(
  fs.readFileSync(path.join(ua, 'intermediate/scan-result.json'), 'utf8'),
);
const graph = {
  version: '1.0.0',
  kind: 'codebase',
  project: {
    name: scan.name,
    languages: scan.languages,
    frameworks: scan.frameworks,
    description: scan.description,
    analyzedAt: new Date().toISOString(),
    gitCommitHash: 'nogit-workspace',
  },
  nodes: assembled.nodes,
  edges: assembled.edges,
  layers,
  tour,
};
const idSet = new Set(graph.nodes.map((n) => n.id));
graph.edges = graph.edges.filter(
  (e) => idSet.has(e.source) && idSet.has(e.target),
);
for (const n of graph.nodes) {
  if (!n.tags || !n.tags.length) n.tags = ['untagged'];
  if (!n.summary) n.summary = 'No summary available';
  if (!n.name) n.name = n.id;
  if (!n.type) n.type = 'file';
}
for (const step of graph.tour)
  step.nodeIds = (step.nodeIds || []).filter((id) => idSet.has(id));
for (const layer of graph.layers)
  layer.nodeIds = (layer.nodeIds || []).filter((id) => idSet.has(id));

fs.writeFileSync(
  path.join(ua, 'intermediate/assembled-graph.json'),
  JSON.stringify(graph, null, 2),
);

const schemaUrl = pathToFileURL(
  'C:/Users/NGUYENTDH/.understand-anything-plugin/packages/core/dist/schema.js',
).href;
const { validateGraph } = await import(schemaUrl);
const result = validateGraph(graph);
console.log(
  'validate success=',
  result.success,
  'fatal=',
  result.fatal || null,
  'issues=',
  (result.issues || []).length,
);
if (!result.success) {
  console.log(JSON.stringify(result.errors || result, null, 2).slice(0, 800));
  process.exit(1);
}
const finalGraph = result.data;
finalGraph.kind = finalGraph.kind || 'codebase';

console.log('[Phase 7/7] Saving knowledge graph...');
fs.writeFileSync(
  path.join(ua, 'knowledge-graph.json'),
  JSON.stringify(finalGraph, null, 2),
);

const fpInput = {
  projectRoot,
  sourceFilePaths: scan.files.map((f) => f.path),
  gitCommitHash: 'nogit-workspace',
};
fs.mkdirSync(path.join(ua, 'tmp'), { recursive: true });
fs.writeFileSync(
  path.join(ua, 'tmp/fingerprint-input.json'),
  JSON.stringify(fpInput, null, 2),
);
const fp = spawnSync(
  'node',
  [
    path.join(skillDir, 'build-fingerprints.mjs'),
    path.join(ua, 'tmp/fingerprint-input.json'),
  ],
  { encoding: 'utf8' },
);
const fpOk =
  (fp.stdout || '').includes('Fingerprints baseline:') ||
  (fp.stderr || '').includes('Fingerprints baseline:');
console.log(
  'fingerprintsOk=',
  fpOk,
  (fp.stdout || fp.stderr || '')
    .split('\n')
    .find((l) => l.includes('Fingerprint')) || '',
);

fs.writeFileSync(
  path.join(ua, 'meta.json'),
  JSON.stringify(
    {
      lastAnalyzedAt: new Date().toISOString(),
      gitCommitHash: 'nogit-workspace',
      version: '1.0.0',
      analyzedFiles: scan.totalFiles,
      fingerprintsOk: fpOk,
    },
    null,
    2,
  ),
);

const trash = path.join(ua, '.trash-' + Date.now());
fs.mkdirSync(trash, { recursive: true });
for (const name of fs.readdirSync(path.join(ua, 'intermediate'))) {
  if (name === 'scan-result.json') continue;
  try {
    fs.renameSync(path.join(ua, 'intermediate', name), path.join(trash, name));
  } catch {}
}
const tmp = path.join(ua, 'tmp');
if (fs.existsSync(tmp)) {
  const trashTmp = path.join(trash, 'tmp');
  fs.mkdirSync(trashTmp, { recursive: true });
  for (const name of fs.readdirSync(tmp)) {
    try {
      fs.renameSync(path.join(tmp, name), path.join(trashTmp, name));
    } catch {}
  }
}

const stats = {
  totalNodes: finalGraph.nodes.length,
  totalEdges: finalGraph.edges.length,
  totalLayers: finalGraph.layers.length,
  tourSteps: finalGraph.tour.length,
  nodeTypes: finalGraph.nodes.reduce((a, n) => {
    a[n.type] = (a[n.type] || 0) + 1;
    return a;
  }, {}),
  edgeTypes: finalGraph.edges.reduce((a, e) => {
    a[e.type] = (a[e.type] || 0) + 1;
    return a;
  }, {}),
  byCategory: scan.files.reduce((a, f) => {
    a[f.fileCategory] = (a[f.fileCategory] || 0) + 1;
    return a;
  }, {}),
};
console.log('SAVED', path.join(ua, 'knowledge-graph.json'));
console.log(JSON.stringify(stats, null, 2));

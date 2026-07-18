<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid table="dmkieuduyet" code="loai_duyet, ma_kieu" order="loai_duyet, ma_kieu" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục kiểu duyệt" e="Approval Category"></title>
  <subTitle v="Loại duyệt: %c." e="Type: %c."></subTitle>

  <fields>
    <field name="loai_duyet" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kieu" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kiểu duyệt" e="Code"></header>
    </field>
    <field name="ten_kieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kiểu duyệt" e="Description"></header>
    </field>
    <field name="dvcs" width="80" allowFilter="true" allowSorting="true" align="right">
      <header v="Theo đơn vị" e="By Unit"></header>
    </field>
    <field name="ma_bp" width="80" allowFilter="true" allowSorting="true" align="right">
      <header v="Theo bộ phận" e="By Department"></header>
    </field>
    <field name="ma_md" width="80" allowFilter="true" allowSorting="true" align="right">
      <header v="Theo mức độ" e="By Priority"></header>
    </field>

    <field name="nh_kh1" width="80" allowFilter="true" allowSorting="true" align="right">
      <header v="Theo nhóm khách hàng 1" e="By Customer Group 1"></header>
    </field>
    <field name="nh_kh2" width="80" allowFilter="true" allowSorting="true" align="right">
      <header v="Theo nhóm khách hàng 2" e="By Customer Group 2"></header>
    </field>
    <field name="nh_kh3" width="80" allowFilter="true" allowSorting="true" align="right">
      <header v="Theo nhóm khách hàng 3" e="By Customer Group 3"></header>
    </field>

    <field name="tien" width="80" allowFilter="true" allowSorting="true" align="right">
      <header v="Theo tiền" e="By Amount"></header>
    </field>
    <field name="ma_nt" width="80" allowFilter="true" allowSorting="true" align="right">
      <header v="Theo loại tiền" e="By Currency"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_duyet"/>
      <field name="ma_kieu"/>
      <field name="ten_kieu%l"/>
      <field name="dvcs"/>
      <field name="ma_bp"/>
      <field name="ma_md"/>
      <field name="nh_kh1"/>
      <field name="nh_kh2"/>
      <field name="nh_kh3"/>
      <field name="tien"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
    </text>
  </script>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
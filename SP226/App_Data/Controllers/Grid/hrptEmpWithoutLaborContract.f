<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách nhân viên chưa ký hợp đồng" e="Employees without Labor Contract"></title>
  <subTitle v="Ngày báo cáo %d..." e="Report Date %d..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"/>
    </field>
    <field name="bo_phan" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="vi_tri" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ngay_vao_cty" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày vào" e="Join Date"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="bo_phan"/>
      <field name="vi_tri"/>
      <field name="ngay_vao_cty"/>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
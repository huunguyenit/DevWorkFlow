<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tỷ lệ nhân viên nghỉ việc" e="Employee Turnover Rate"></title>
  <subTitle v="Từ tháng %d1 đến tháng %d2 năm %d3..." e="Month from %d1 to %d2 Year %d2..."></subTitle>

  <fields>
    <field name="bo_phan" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="tong_nv" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Tổng số nv" e="Employees"></header>
    </field>
    <field name="tong_nghi" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Nv nghỉ việc" e="Leaving"></header>
    </field>
    <field name="ty_trong" type="Int16" dataFormatString="###.00" width="100" allowSorting="true" allowFilter="true">
      <header v="Tỷ trọng (%)" e="Rate (%)"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="bo_phan"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="tong_nv"/>
      <field name="tong_nghi"/>
      <field name="ty_trong"/>
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
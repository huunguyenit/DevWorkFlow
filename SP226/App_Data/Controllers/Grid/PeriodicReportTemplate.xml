<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid table="dmthongbao" code="ma_tb" order="ma_tb" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo mẫu báo cáo định kỳ" e="Periodic Report Template"></title>
  <subTitle v="Loại thông báo: %s1 - %s2." e="Notification Type: %s1 - %s2."></subTitle>
  <fields>
    <field name="ma_tb" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã mẫu báo cáo" e="Report Template Code"></header>
    </field>
    <field name="ten_tb%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mẫu báo cáo" e="Report Template Name"></header>
    </field>
    <field name="ma_loai_tb" width="0" dataFormatString="@upperCaseFormat" hidden="true">
      <header v="Loại thông báo" e="Notification Type"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tb"/>
      <field name="ten_tb%l"/>
      <field name="ma_loai_tb"/>
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
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "hrptEduStatisticsByDeptPos">

  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY CSSGraphReport SYSTEM "..\Include\Javascript\GraphReportCss.txt">
  <!ENTITY JavascriptGraphReportInit SYSTEM "..\Include\Javascript\GraphReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 0" filter="sysorder &lt; 9&Repetition.And;&Repetition.Key.001;" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê trình độ học vấn theo bộ phận, vị trí công việc" e="Education Statistics by Department, Position"></title>
  <subTitle v="Ngày báo cáo: %d..." e="Report Date: %d..."></subTitle>
  <pivot rowField="sysColumn" columnField="xPivot" dataFields="so_nv" indexTable="2" indexColumn="1" indexHeader="2" indexView="3"/>

  <fields>
    <field name="sysRow" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="sysRowName" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí" e="Position"></header>
    </field>
    <field name="so_nv" type="Int16" dataFormatString="### ###" width="100" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số nhân viên" e="Count"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="sysRow"/>
      <field name="sysRowName"/>
      <field name="ten_vtr"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptGraphReportInit;
    </text>
  </script>

  &CSSGraphReport;

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
    <button command="Graph">
      <title v="Đồ thị$" e="Graph$"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
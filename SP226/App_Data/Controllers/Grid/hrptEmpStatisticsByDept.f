<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" valid="systotal = 1" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê số lượng nhân viên theo bộ phận trong năm" e="Employee Statistics by Department"></title>
  <subTitle v="Năm: %y..." e="Year: %y..."></subTitle>

  <fields>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="t1" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 1" e="Jan"></header>
    </field>
    <field name="t2" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 2" e="Feb"></header>
    </field>
    <field name="t3" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 3" e="Mar"></header>
    </field>
    <field name="t4" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 4" e="Apr"></header>
    </field>
    <field name="t5" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 5" e="May"></header>
    </field>
    <field name="t6" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 6" e="Jun"></header>
    </field>
    <field name="t7" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 7" e="Jul"></header>
    </field>
    <field name="t8" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 8" e="Aug"></header>
    </field>
    <field name="t9" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 9" e="Sep"></header>
    </field>
    <field name="t10" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 10" e="Oct"></header>
    </field>
    <field name="t11" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 11" e="Nov"></header>
    </field>
    <field name="t12" type="Int16" dataFormatString="### ### ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Tháng 12" e="Dec"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp"/>
      <field name="t1"/>
      <field name="t2"/>
      <field name="t3"/>
      <field name="t4"/>
      <field name="t5"/>
      <field name="t6"/>
      <field name="t7"/>
      <field name="t8"/>
      <field name="t9"/>
      <field name="t10"/>
      <field name="t11"/>
      <field name="t12"/>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê số lượng nhân viên theo tính chất công việc trong năm" e="Employee Statistics by Job Nature"></title>
  <subTitle v="Bộ phận: %s, năm: %y..." e="Department: %s, Year: %y..."></subTitle>

  <fields>
    <field name="ma_nh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Code"></header>
    </field>
    <field name="ten_nh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="t1" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 1" e="Jan"/>
    </field>
    <field name="t2" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 2" e="Feb"/>
    </field>
    <field name="t3" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 3" e="Mar"/>
    </field>
    <field name="t4" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 4" e="Apr"/>
    </field>
    <field name="t5" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 5" e="May"/>
    </field>
    <field name="t6" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 6" e="Jun"/>
    </field>
    <field name="t7" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 7" e="Jul"/>
    </field>
    <field name="t8" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 8" e="Aug"/>
    </field>
    <field name="t9" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 9" e="Sep"/>
    </field>
    <field name="t10" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 10" e="Oct"/>
    </field>
    <field name="t11" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 11" e="Nov"/>
    </field>
    <field name="t12" width="80" type="Decimal" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Tháng 12" e="Dec"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh"/>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê thâm niên của bộ phận theo tháng" e="Seniority Statistics by Month"></title>
  <subTitle v="Bộ phận: %s, năm %y..." e="Department: %s, Year: %y..."></subTitle>

  <fields>
    <field name="tn_nam" width="300" allowSorting="true" allowFilter="true">
      <header v="Thâm niên" e="Seniority"/>
    </field>
    <field name="thang1" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 1" e="Jan"/>
    </field>
    <field name="thang2" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 2" e="Feb"/>
    </field>
    <field name="thang3" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 3" e="Mar"/>
    </field>
    <field name="thang4" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 4" e="Apr"/>
    </field>
    <field name="thang5" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 5" e="May"/>
    </field>
    <field name="thang6" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 6" e="Jun"/>
    </field>
    <field name="thang7" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 7" e="Jul"/>
    </field>
    <field name="thang8" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 8" e="Aug"/>
    </field>
    <field name="thang9" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 9" e="Sep"/>
    </field>
    <field name="thang10" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 10" e="Oct"/>
    </field>
    <field name="thang11" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 11" e="Nov"/>
    </field>
    <field name="thang12" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Tháng 12" e="Dec"/>
    </field>
    <field name="nam" width="80" type="Decimal" dataFormatString="### ### ###.##" allowSorting="true" allowFilter="true">
      <header v="Năm" e="Year"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tn_nam"/>
      <field name="thang1"/>
      <field name="thang2"/>
      <field name="thang3"/>
      <field name="thang4"/>
      <field name="thang5"/>
      <field name="thang6"/>
      <field name="thang7"/>
      <field name="thang8"/>
      <field name="thang9"/>
      <field name="thang10"/>
      <field name="thang11"/>
      <field name="thang12"/>
      <field name="nam"/>
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
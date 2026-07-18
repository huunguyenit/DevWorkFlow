<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tờ khai khấu trừ thuế TNCN từ thu nhập khác" e="Personal Income Tax Declaration for Paying Other Benefits"></title>
  <subTitle v="%d năm %y..." e="%d Year %y..."></subTitle>
  <fields>
    <field name="stt_in" width="60" allowSorting="true" allowFilter="true" align="center">
      <header v="Stt" e="No."></header>
    </field>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số tiền" e="Amount"></header>
      <footer v="Số phát sinh" e="Amount"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số tiền" e="Amount"></header>
      <footer v="Số phát sinh" e="Amount"></footer>
      <items style="Numeric"/>
    </field>
    <field name="luy_ke_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lũy kế" e="Accumulation"></header>
      <items style="Numeric"/>
    </field>
    <field name="luy_ke" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lũy kế" e="Accumulation"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_in"/>
      <field name="chi_tieu%l"/>
      <field name="ma_so"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="luy_ke_nt"/>
      <field name="luy_ke"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idjr97X9tQQuY7dqku1lQdvMZVrM9TA7cqNKaNHBuhS1aFuJ1j3We0EUleZG2IBNu2G81GQYToJNtZ9huwdgLhmLoMlwLax0T1kAZTdLL3ON+ME1PDkeMqVYlb8GBQDXCEhbFkCHdpI3m/X9m5q8XtmuSEqRxeTuvuHKwoR9sv80ph6RBe/SbM094eMrlbYp82zvMyjOTcOKJOzFaurpG6d4AGqk8aAc5gd2D71ATuwnMWvaX5kZQvJQ1Pfmb1hwBK9TunmuLv/isgKX6JChOCl7</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
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
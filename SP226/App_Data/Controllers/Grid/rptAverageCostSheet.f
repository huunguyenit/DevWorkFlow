<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng giá trung bình tháng" e="Average Cost Sheet"></title>
  <subTitle v="%s tháng %m năm %y..." e="%s, Month %m Year %y..."></subTitle>
  <fields>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
      <footer v="Mã nhóm kho" e="Site Group"/>
    </field>
    <field name="ten_kho%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kho" e="Site Name"></header>
      <footer v="Tên nhóm kho" e="Site Group Name"/>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đơn giá" e="Unit Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đơn giá nt" e="FC Unit Cost"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="gia"/>
      <field name="gia_nt"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idiT9+TckNl1Si1k/XSaraQlW60Xo1XZWKo//WIONel4OrauCmwXQ9IyiP7zj/l+xNlNs8hTwiYau0n9ofHtLUAm1LKFGML3fGwG5JVJP/cwTbvnT5x1Hb8bVRYy3+iPTsDNusppIyue3ZWS8IbJoKg1dmtNK4d8w01ENRi8oxyM3hSWRAnzYAwwGydxBI43BdpOENKOngU5EJTd2BnXgXnlsoyBQ0E+vbpaPaYxVADUO7qh87j7NeVD9lN49d47EYphVDM49GRn05JbFMgbKBoOC/Z+4ugNe3nx2uMym5ZrVw==</Encrypted>]]>
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
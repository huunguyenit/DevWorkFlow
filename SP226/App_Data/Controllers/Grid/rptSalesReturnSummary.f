<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.012;" valid="systotal = 1" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tổng hợp hàng bán bị trả lại" e="Sales Return Summary"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_soth1f', Controller: 'rptSalesReturnSummary', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>

    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt2" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán nt" e="FC Price"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu nt" e="FC Turnover"></header>
    </field>
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế nt" e="FC Tax Amount"></header>
    </field>
    <field name="pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu nt" e="FC Receivable"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
    </field>
    <field name="lai_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi nt" e="FC Profit"></header>
    </field>

    <field name="gia2" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán" e="Price"></header>
    </field>
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu" e="Turnover"></header>
    </field>
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế" e="FC Tax Amount"></header>
    </field>
    <field name="pt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu" e="Receivable"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn" e="Cogs"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn" e="Cogs Amount"></header>
    </field>
    <field name="lai" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi" e="Profit"></header>
    </field>

    <field name="sysorder" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="lai_nt"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="lai"/>

      <field name="sysorder"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteSFht8yuUiTj8eqyrjtrQDQ+RC6HyVx6YuEzOkJjzGVKT0rQtj5clppatNWIKo9nhwsit4/RBrbp+77wTcOmK1Ht6T4xrXkO7a2Ub1eRq7WiMC7nph6TyQaFPAt4Ldl8Obg3soJe9FYuWxCeKCB1XVlSblMf91b+X237jxKEXg1</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
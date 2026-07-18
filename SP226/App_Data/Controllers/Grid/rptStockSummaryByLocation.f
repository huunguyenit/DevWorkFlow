<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY Repetition.RowIndex.001 "0">
  <!ENTITY Repetition.RowIndex.002 "0">
  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" filter="&Repetition.Key.012;" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tổng hợp nhập xuất tồn theo vị trí" e="Stock Summary by Location"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" width="30" allowSorting="true" allowFilter="true" align="center">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_incd1v', Controller: 'rptStockSummaryByLocation', Name: '[ma]', Value: '[ma_vt] + String.fromCharCode(253)+ [ma_kho]  + String.fromCharCode(253 )+ [ma_vi_tri]  + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã" e="Code"></header>
    </field>
    <field name="ten%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="ton_dau" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn đầu" e="Opening Qty."></header>
    </field>
    <field name="du_dau" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dư đầu" e="Opening Amount"></header>
    </field>
    <field name="du_dau_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dư đầu nt" e="FC Opening Amount"></header>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl nhập" e="Received Qty."></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền nhập" e="Receive Amount"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền nhập nt" e="FC Receive Amount"></header>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl xuất" e="Issued Qty."></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền xuất" e="Issued Amount"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền xuất nt" e="FC Issued Amount"></header>
    </field>

    <field name="ton_cuoi" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn cuối" e="Closing Qty."></header>
    </field>
    <field name="du_cuoi" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dư cuối" e="Closing Amount"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dư cuối nt" e="FC Closing Amount"></header>
    </field>

    <field name="ma_vi_tri" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma"/>
      <field name="ten%l"/>
      <field name="dvt"/>

      <field name="ton_dau"/>
      <field name="du_dau"/>
      <field name="du_dau_nt"/>

      <field name="sl_nhap"/>
      <field name="tien_nhap"/>
      <field name="tien_nt_n"/>

      <field name="sl_xuat"/>
      <field name="tien_xuat"/>
      <field name="tien_nt_x"/>

      <field name="ton_cuoi"/>
      <field name="du_cuoi"/>
      <field name="du_cuoi_nt"/>

      <field name="ma_vi_tri"/>
      <field name="ma_vt"/>
      <field name="ma_kho"/>
      <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteSFht8yuUiTj8eqyrjtrQDocEOGlrP2GQLOc4F5b/MMtvaMdDaCpM4waN/OY+xFq1WxLPq5lnDOJTsrU7mE1v3Zl4Mopjwsh1jbm8jyq0qgrFOsmnHqfLzjtMr50XT+E0pI8BGL+xn3CR55UMTSRfb9d0MrTLhlccX4/+tdAUXK</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>
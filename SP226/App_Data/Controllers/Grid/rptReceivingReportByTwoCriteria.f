<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Báo cáo hàng nhập nhóm theo 2 chỉ tiêu" e="Receiving Report by Two Criteria"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2%s" e="Date from %d1 to %d2%s"></subTitle>

  <fields>
    <field name="stt" type="Int16" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
      <items style="Mask"/>
    </field>
    <field name="ma1" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_inth3a', Controller: 'rptReceivingReportByTwoCriteria', Name: '[ma1]', Value: '[ma1] + String.fromCharCode(253) + [ma2] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã" e="Code"></header>
    </field>
    <field name="ten" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>

    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
    </field>

    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma2" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma1"/>
      <field name="ten"/>

      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="gia"/>
      <field name="tien"/>

      <field name="ma_ct"/>
      <field name="stt_rec"/>
      <field name="ma2"/>
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

  &XMLStandardReportToolbar;
</grid>
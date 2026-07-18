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
  <title v="Báo cáo bán hàng nhóm theo 2 chỉ tiêu" e="Sales Report Group by Two Criteria"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2%s..." e="Date from %d1 to %d2%s..."></subTitle>
  <fields>
    <field name="stt" type="Int16" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma1" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_soth32', Controller: 'rptSalesSummaryByTwoCriteria2', Name: '[ma1]', Value: '[ma1] + String.fromCharCode(253) + [ma2] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã" e="Code"></header>
    </field>
    <field name="ten%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
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
    <field name="ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu nt" e="FC Discount"></header>
    </field>
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế nt" e="FC Tax Amount"></header>
    </field>

    <field name="giam_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giảm giá nt" e="FC Dec. Amt."></header>
    </field>
    <field name="thue_giam_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế giảm giá nt" e="FC Tax Dec. Amt."></header>
    </field>

    <field name="ck_tl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu trả lại nt" e="Return Discount Amount"></header>
    </field>
    <field name="doanh_thu_tl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu trả lại nt" e="Return Turnover"></header>
    </field>
    <field name="thue_tl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế trả lại nt" e="Return Tax Amount"></header>
    </field>
    <field name="doanh_thu_thuan_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu thuần nt" e="FC Net Turnover"></header>
    </field>
    <field name="thue_thuan_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế thuần nt" e="FC Net Tax Amount"></header>
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
    <field name="tien_von_tl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn trả lại nt" e="Return COGS Amount"></header>
    </field>
    <field name="tien_von_thuan_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn thuần nt" e="FC Net Amount"></header>
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
    <field name="ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu" e="Discount"></header>
    </field>
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế" e="Tax Amount"></header>
    </field>

    <field name="giam_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giảm giá" e="Dec. Amount"></header>
    </field>
    <field name="thue_giam" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế giảm giá" e="Tax Dec. Amount"></header>
    </field>
    <field name="so_luong_tl" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng trả lại" e="Return Quantity"></header>
    </field>
    <field name="doanh_thu_tl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu trả lại" e="Return Turnover Amount"></header>
    </field>
    <field name="ck_tl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu trả lại" e="Return Discount Amount"></header>
    </field>
    <field name="thue_tl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế trả lại" e="Return Tax Amount"></header>
    </field>
    <field name="so_luong_thuan" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng thuần" e="Net Quantity"></header>
    </field>
    <field name="doanh_thu_thuan" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu thuần" e="Net Turnover Amount"></header>
    </field>
    <field name="thue_thuan" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế thuần" e="Net Tax Amount"></header>
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
    <field name="tien_von_tl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn trả lại" e="Return Cogs Amount"></header>
    </field>
    <field name="tien_von_thuan" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn thuần" e="Net COGS Amount"></header>
    </field>
    <field name="lai" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi" e="Profit"></header>
    </field>

    <field name="ma2" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma1"/>
      <field name="ten%l"/>

      <field name="so_luong"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="ck_nt"/>
      <field name="thue_nt"/>

      <field name="giam_gia_nt"/>
      <field name="thue_giam_nt"/>
      <field name="doanh_thu_tl_nt"/>
      <field name="ck_tl_nt"/>
      <field name="thue_tl_nt"/>
      <field name="doanh_thu_thuan_nt"/>
      <field name="thue_thuan_nt"/>

      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="tien_von_tl_nt"/>
      <field name="tien_von_thuan_nt"/>
      <field name="lai_nt"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="ck"/>
      <field name="thue"/>

      <field name="giam_gia"/>
      <field name="thue_giam"/>
      <field name="so_luong_tl"/>
      <field name="doanh_thu_tl"/>
      <field name="ck_tl"/>
      <field name="thue_tl"/>
      <field name="so_luong_thuan"/>
      <field name="doanh_thu_thuan"/>
      <field name="thue_thuan"/>

      <field name="pt"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="tien_von_tl"/>
      <field name="tien_von_thuan"/>
      <field name="lai"/>

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
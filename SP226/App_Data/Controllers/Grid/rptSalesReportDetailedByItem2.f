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
  <title v="Báo cáo bán hàng chi tiết theo mặt hàng" e="Sales Report - Detailed by Item"></title>
  <subTitle v="Từ ngày %d1 đến %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_soth1a2', Controller: 'rptSalesReportDetailedByItem2', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>

    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán nt" e="FC Price"></header>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu nt" e="FC Turnover Amt."></header>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu nt" e="FC Discount Amt."></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế nt" e="FC Tax Amt."></header>
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

    <field name="pt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu nt" e="FC Receivable Amt."></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn nt" e="FC Cogs Amt."></header>
    </field>
    <field name="tien_von_tl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn trả lại nt" e="Return COGS Amount"></header>
    </field>
    <field name="tien_von_thuan_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn thuần nt" e="FC Net Amount"></header>
    </field>
    <field name="lai_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi nt" e="FC Profit"></header>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán" e="Price"></header>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu" e="Turnover Amount"></header>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu" e="Discount Amount"></header>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
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

    <field name="pt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu" e="Receivable Amount"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn" e="Cogs"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn" e="Cogs Amount"></header>
    </field>
    <field name="tien_von_tl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn trả lại" e="Return Cogs Amount"></header>
    </field>
    <field name="tien_von_thuan" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn thuần" e="Net COGS Amount"></header>
    </field>
    <field name="lai" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi" e="Profit"></header>
    </field>
    <field name="systotal" width="0" hidden="true">
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
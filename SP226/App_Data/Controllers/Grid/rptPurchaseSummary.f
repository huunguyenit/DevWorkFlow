<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY TransferID "rptPurchaseSummary">

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;
  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.012;" valid="systotal = 1" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tổng hợp hàng nhập mua" e="Purchase Summary Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_poth1', Controller: 'rptPurchaseSummary', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'reportDrillDown(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="100" allowSorting="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt0" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="100" allowSorting="true">
      <header v="Giá mua nt" e="FC Purchase Price"></header>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng nt" e="FC Purchase Amount"></header>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí nt" e="FC Charge"></header>
    </field>
    <field name="nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Thuế nk nt" e="FC Import"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="100" allowSorting="true">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Thuế nt" e="FC Tax"></header>
    </field>

    <field name="gia0" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="100" allowSorting="true">
      <header v="Giá mua" e="Purchase Price"></header>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng" e="Purchase Amount"></header>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí" e="Charge"></header>
    </field>
    <field name="nk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Thuế nk" e="Import"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="100" allowSorting="true">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Thuế" e="Tax"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="so_luong"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>
      <field name="cp_nt"/>
      <field name="nk_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="thue_nt"/>

      <field name="gia0"/>
      <field name="tien0"/>
      <field name="cp"/>
      <field name="nk"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="thue"/>
    </view>
  </views>

  <commands>
    &XMLWhenGridShowingPrintRight;
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      &PrintRightScript;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtR2aOBiC3G2xA6MnLDFgoGJ9Bd9rRCl2V7OVZWmxwukpOW5Bm/7yOF95K26f0Eyuu8/MXd+qIyAIuBwCi2pudu2WzGpTO7xWWIPlAsZML0LEcB+TwPQXrgKWNVkJbV88NyXmDRch+NXiHRdIVYJIaNc=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
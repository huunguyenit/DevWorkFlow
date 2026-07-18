<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY TransferID "rptPurchaseExpenseSummary">

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;
  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.012;" valid="systotal = 1" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tổng hợp chi phí mua hàng" e="Purchase Charges Summary"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_pothcpmh', Controller: 'rptPurchaseExpenseSummary', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'reportDrillDown(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>


    <field name="cp_vc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí vận chuyển nt" e="FC Freight Amount"></header>
    </field>
    <field name="cp_bh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí bảo hiểm nt" e="FC Insurance Amount"></header>
    </field>
    <field name="cp_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí khác nt" e="FC Other Amount"></header>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Tổng chi phí nt" e="FC Total of Charges"></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Thuế nt" e="FC Tax"></header>
    </field>

    <field name="cp_vc" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí vận chuyển" e="Freight Amount"></header>
    </field>
    <field name="cp_bh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí bảo hiểm" e="Insurance Amount"></header>
    </field>
    <field name="cp_khac" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí khác" e="Other Amount"></header>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Tổng chi phí" e="Total of Charges"></header>
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

      <field name="cp_vc_nt"/>
      <field name="cp_bh_nt"/>
      <field name="cp_khac_nt"/>
      <field name="cp_nt"/>
      <field name="thue_nt"/>


      <field name="cp_vc"/>
      <field name="cp_bh"/>
      <field name="cp_khac"/>
      <field name="cp"/>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY TransferID "rptProductCostByItem">

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo giá thành chi tiết theo vật tư" e="Cost of Product Detailed by Item"></title>
  <subTitle v="Từ kỳ %d1 năm %n1 đến kỳ %d2 năm %n2..." e="From Period %d1 Year %n1 to Period %d2 Year %n2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" width="100" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO"></header>
    </field>
    <field name="ma_yt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ytcp" e="Factor Code"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>

    <field name="sl_dk" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Sl đầu kỳ" e="Opening Qty."></header>
    </field>
    <field name="dd_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dd đầu kỳ" e="Opening WIP"></header>
    </field>
    <field name="dd_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dd đầu kỳ nt" e="FC Opening WIP"></header>
    </field>

    <field name="sl_tk" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Sl trong kỳ" e="Arising Qty."></header>
    </field>
    <field name="ps_tk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Ps trong kỳ" e="Arising Value"></header>
    </field>
    <field name="ps_tk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Ps trong kỳ nt" e="FC Arising Value"></header>
    </field>

    <field name="sl_gt" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Sl giá thành" e="Cost Qty."></header>
    </field>
    <field name="tong_gt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tổng giá thành" e="Total Cost"></header>
    </field>
    <field name="tong_gt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tổng giá thành nt" e="FC Total Cost"></header>
    </field>

    <field name="sl_ck" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Sl cuối kỳ" e="Closing Qty."></header>
    </field>
    <field name="dd_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dd cuối kỳ" e="Closing WIP"></header>
    </field>
    <field name="dd_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dd cuối kỳ nt" e="FC Closing WIP"></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt đơn vị" e="Unit Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt đơn vị nt" e="FC Unit Cost"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_yt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="sl_dk"/>
      <field name="dd_dk"/>
      <field name="dd_dk_nt"/>

      <field name="sl_tk"/>
      <field name="ps_tk"/>
      <field name="ps_tk_nt"/>

      <field name="sl_gt"/>
      <field name="tong_gt"/>
      <field name="tong_gt_nt"/>

      <field name="sl_ck"/>
      <field name="dd_ck"/>
      <field name="dd_ck_nt"/>

      <field name="gia"/>
      <field name="gia_nt"/>
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
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
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
  <title v="Thẻ giá thành sản phẩm" e="Cost of Product Card"></title>
  <subTitle v="Từ kỳ %d1 năm %d2 đến %d3 năm %d4, %s1." e="Period from %d1 Year %d2 to %d3 Year %d4, %s1."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_yt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã yếu tố" e="Factor Code"></header>
    </field>
    <field name="ten_yt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên yếu tố" e="Factor Name"></header>
    </field>

    <field name="dd_dk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dd đầu kỳ nt" e="FC Opening"></header>
    </field>
    <field name="ps_tk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Ps trong kỳ nt" e="FC Arising"></header>
    </field>
    <field name="dd_ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dd cuối kỳ nt" e="FC Closing"></header>
    </field>
    <field name="tong_gt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tổng giá thành nt" e="FC Total Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt đơn vị nt" e="FC Unit Cost"></header>
    </field>

    <field name="dd_dk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dd đầu kỳ" e="Opening WIP"></header>
    </field>
    <field name="ps_tk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Ps trong kỳ" e="Arising"></header>
    </field>
    <field name="dd_ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dd cuối kỳ" e="Closing WIP"></header>
    </field>
    <field name="tong_gt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tổng giá thành" e="Total Cost"></header>
    </field>
    <field name="gia" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt đơn vị" e="Unit Cost"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_yt"/>
      <field name="ten_yt%l"/>

      <field name="dd_dk_nt"/>
      <field name="ps_tk_nt"/>
      <field name="dd_ck_nt"/>
      <field name="tong_gt_nt"/>
      <field name="gia_nt"/>

      <field name="dd_dk"/>
      <field name="ps_tk"/>
      <field name="dd_ck"/>
      <field name="tong_gt"/>
      <field name="gia"/>
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
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
  <title v="Báo cáo tổng hợp chi phí sản xuất theo sản phẩm" e="Production Cost Summary by Product"></title>
  <subTitle v="Từ kỳ %d1 năm %n1 đến kỳ %d2 năm %n2..." e="From Period %d1 Year %n1 to Period %d2 Year %n2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Số lsx" e="MO"></header>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product Code"></header>
    </field>
    <field name="ten_sp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>

    <field name="sl_dd_dk" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Sl dd đầu kỳ" e="Opening Qty."></header>
    </field>
    <field name="sl_sx" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Sl sản xuất" e="Produced Qty."></header>
    </field>
    <field name="sl_tp" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Sl nhập kho" e="Received Qty."></header>
    </field>
    <field name="sl_dd_ck" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Sl dd cuối kỳ" e="Closing Qty."></header>
    </field>

    <field name="dd_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Cp dd đầu kỳ" e="Opening WIP"></header>
    </field>
    <field name="dd_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Cp dd đầu kỳ nt" e="FC Opening WIP"></header>
    </field>
    <field name="ps_tk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Cp ps trong kỳ" e="Arising Cost"></header>
    </field>
    <field name="ps_tk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Cp ps trong kỳ nt" e="FC Arising Cost"></header>
    </field>
    <field name="dd_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Cp dd cuối kỳ" e="Closing WIP"></header>
    </field>
    <field name="dd_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Cp dd cuối kỳ nt" e="FC Closing WIP"></header>
    </field>

    <field name="tong_gt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tổng giá thành" e="Total Cost"></header>
    </field>
    <field name="tong_gt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tổng giá thành nt" e="FC Total Cost"></header>
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
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>

      <field name="sl_dd_dk"/>
      <field name="sl_sx"/>
      <field name="sl_tp"/>
      <field name="sl_dd_ck"/>

      <field name="dd_dk"/>
      <field name="dd_dk_nt"/>
      <field name="ps_tk"/>
      <field name="ps_tk_nt"/>
      <field name="dd_ck"/>
      <field name="dd_ck_nt"/>

      <field name="tong_gt"/>
      <field name="tong_gt_nt"/>
      <field name="gia"/>
      <field name="gia_nt"/>
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
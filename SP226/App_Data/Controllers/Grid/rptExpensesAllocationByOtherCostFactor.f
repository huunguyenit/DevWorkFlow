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
  <title v="Bảng phân bổ chi phí theo yếu tố chi phí khác" e="Cost Allocation by Other Cost Factor"></title>
  <subTitle v="Kỳ %d1 năm %n1..." e="Period %d1 Year %n1..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_yt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ytcp" e="Factor Code"></header>
    </field>
    <field name="ma_bp0" width="100" allowSorting="true" allowFilter="true">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bp trực tiếp" e="Direct Dept."></header>
    </field>
    <field name="so_lsx" width="100" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product Code"></header>
    </field>
    <field name="ten_sp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>

    <field name="hs_yt" width="300" allowSorting="true" allowFilter="true">
      <header v="Danh sách yếu tố chi phí" e="Cost Factor List"></header>
    </field>
    <field name="gt_ps" width="120" allowSorting="true" allowFilter="true">
      <header v="Cách tính hs" e="Coeff. Type"></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="#.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng hệ số" e="Total Coefficient"></header>
    </field>
    <field name="ps_tk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền phát sinh nt" e="FC Arising Amount"></header>
    </field>
    <field name="ps_tk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền phát sinh" e="Arising Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_yt"/>
      <field name="ma_bp0"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>

      <field name="hs_yt"/>
      <field name="gt_ps"/>
      <field name="he_so"/>
      <field name="ps_tk_nt"/>
      <field name="ps_tk"/>
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
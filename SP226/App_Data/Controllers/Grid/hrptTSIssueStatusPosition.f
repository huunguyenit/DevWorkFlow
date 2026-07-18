<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tình hình cấp phát công cụ, dụng cụ theo vị trí công việc" e="Tool &amp; Supply Issue Status by Job Position"></title>
  <subTitle v="Ngày báo cáo: %d..." e="Report Date: %d..."></subTitle>
  <fields>
    <field name="bo_phan" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ten_cc" width="150" allowSorting="true" allowFilter="true">
      <header v="Công cụ, dụng cụ" e="Tool &amp; Supply"></header>
    </field>
    <field name="sl_yc" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl yêu cầu" e="Required Q'ty"></header>
    </field>
    <field name="sl_sd" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl sử dụng" e="Used Q'ty"></header>
    </field>
    <field name="sl_thua" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Cl thừa" e="Excessive Diff."></header>
    </field>
    <field name="sl_thieu" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Cl thiếu" e="Insufficient Diff."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="bo_phan"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="ten_cc"/>
      <field name="sl_yc"/>
      <field name="sl_sd"/>
      <field name="sl_thua"/>
      <field name="sl_thieu"/>
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
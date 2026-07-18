<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê theo kênh tuyển dụng" e="Recruitment Statistic by Channel"></title>
  <subTitle v="Ngày nộp hồ sơ từ %d1 đến %d2..." e="Date Applied from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Decimal" dataFormatString="### ###" width="60" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
    <field name="ten" width="300" allowSorting="true" allowFilter="true">
      <header v="Kênh tuyển dụng" e="Recruitment Channel"/>
    </field>
    <field name="sl_uv" type="Decimal" dataFormatString="### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl ứng viên" e="Applicant"></header>
    </field>
    <field name="sl_dang_xet" type="Decimal" dataFormatString="### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl đang xét" e="Considering"></header>
    </field>
    <field name="sl_hop_le" type="Decimal" dataFormatString="### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl hợp lệ" e="Satisfied"></header>
    </field>
    <field name="sl_tu_choi" type="Decimal" dataFormatString="### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl từ chối" e="Denied"></header>
    </field>
    <field name="sl_tuyen" type="Decimal" dataFormatString="### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl đã tuyển" e="Accepted"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten"/>
      <field name="sl_uv"/>
      <field name="sl_dang_xet"/>
      <field name="sl_hop_le"/>
      <field name="sl_tu_choi"/>
      <field name="sl_tuyen"/>
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
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
  <title v="Báo cáo tình hình tuyển dụng" e="Recruitment Activity Summary Report"></title>
  <subTitle v="Ngày báo cáo từ %d1 đến %d2..." e="Report Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dot" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đợt" e="Period Code"></header>
    </field>
    <field name="ten_dot" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đợt tuyển dụng" e="Description"/>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí" e="Vacancy"/>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"/>
    </field>
    <field name="sl_td" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl tuyển dụng" e="Required"></header>
    </field>
    <field name="sl_uv" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl ứng viên" e="Applicant"></header>
    </field>
    <field name="sl_dt" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl đã tuyển" e="Accepted"></header>
    </field>
    <field name="ten_vong" width="300" allowSorting="true" allowFilter="true">
      <header v="Vòng ứng tuyển" e="Recruitment Round"></header>
    </field>
    <field name="noi_dung" width="300" allowSorting="true" allowFilter="true">
      <header v="Nội dung" e="Content"></header>
    </field>
    <field name="sl_dat" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl đạt" e="Passed"></header>
    </field>
    <field name="sl_kdat" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl không đạt" e="Failed"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dot"/>
      <field name="ten_dot"/>
      <field name="ten_vtr"/>
      <field name="ten_bp"/>
      <field name="sl_td"/>
      <field name="sl_uv"/>
      <field name="sl_dt"/>
      <field name="ten_vong"/>
      <field name="noi_dung"/>
      <field name="sl_dat"/>
      <field name="sl_kdat"/>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo yêu cầu tuyển dụng" e="Recruitment Requirements"></title>
  <subTitle v="Ngày báo cáo từ %d1 đến %d2..." e="Report Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày yêu cầu" e="Date"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số yêu cầu" e="Number"/>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí" e="Vacancy"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="# ### ### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky_nang_yc" width="300" allowSorting="true" allowFilter="true">
      <header v="Kỹ năng yêu cầu" e="Required Skills"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="To Date"></header>
    </field>
    <field name="statusname" width="150" allowSorting="true" allowFilter="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="so_luong"/>
      <field name="ky_nang_yc"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="statusname"/>
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
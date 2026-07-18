<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thông tin tuyển dụng" e="Recruitment Information"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Decimal" dataFormatString="### ###" width ="60" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dot" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đợt" e="Period Code"/>
    </field>
    <field name="ten_dot" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đợt tuyển dụng" e="Description"/>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="To Date"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí" e="Vacancy"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_dot"/>
      <field name="ten_dot"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="ten_vtr"/>
      <field name="ten_bp"/>
      <field name="so_luong"/>
    </view>
  </views>

  &XMLStandardReportToolbar;
</grid>
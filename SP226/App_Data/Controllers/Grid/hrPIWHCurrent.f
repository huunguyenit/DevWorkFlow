<?xml version="1.0" encoding="utf-8"?>

<grid table="vhreqtlvht" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ten_loai%l" width="150">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="ten_tc%l" width="150">
      <header v="Tính chất" e="Nature"></header>
    </field>
    <field name="ten_bp%l" width="300">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr%l" width="150">
      <header v="Vị trí" e="Position"></header>
    </field>
    <field name="ten_bac%l" width="150">
      <header v="Bậc quản lý" e="Job Grade"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày kết thúc" e="Stop Date"></header>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="ten_loai%l"/>
      <field name="ten_tc%l"/>
      <field name="ten_bp%l"/>
      <field name="ten_vtr%l"/>
      <field name="ten_bac%l"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="ghi_chu"/>
    </view>
  </views>

</grid>
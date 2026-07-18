<?xml version="1.0" encoding="utf-8"?>

<grid table="vhregd" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ten_qh%l" width="100">
      <header v="Quan hệ" e="Relationship"></header>
    </field>
    <field name="ho_ten" width="150">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="ten_qh%l"/>
      <field name="ho_ten"/>
      <field name="ngay_sinh"/>
      <field name="ghi_chu"/>
    </view>
  </views>

</grid>

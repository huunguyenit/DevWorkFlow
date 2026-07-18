<?xml version="1.0" encoding="utf-8"?>

<grid table="vhretn" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ten_tn%l" width="100">
      <header v="Loại" e="Accident Type"></header>
    </field>
    <field name="tn_ld_yn" type="Boolean" width="100">
      <header v="Tai nạn" e="Work Accident"></header>
    </field>
    <field name="ngay_tn" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày xảy ra" e="Date"></header>
    </field>
    <field name="so_ngay_nghi" type="Decimal" width="100" dataFormatString="### ### ##0.00">
      <header v="Số ngày nghỉ" e="No. of Days off"></header>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="ten_tn%l"/>
      <field name="tn_ld_yn"/>
      <field name="ngay_tn"/>
      <field name="so_ngay_nghi"/>
      <field name="ghi_chu"/>
    </view>
  </views>

</grid>
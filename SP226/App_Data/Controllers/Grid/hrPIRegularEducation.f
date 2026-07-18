<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrehv" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ten_tdhv%l" width="100">
      <header v="Cấp đào tạo" e="Education Level"></header>
    </field>
    <field name="truong_hoc" width="150">
      <header v="Trường đào tạo" e="Training Place"></header>
    </field>
    <field name="ten_cn%l" width="100">
      <header v="Chuyên ngành" e="Major"></header>
    </field>
    <field name="ngay_tot_nghiep" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày tốt nghiệp" e="Graduation Date"></header>
    </field>
    <field name="loai_tot_nghiep" width="100">
      <header v="Xếp loại" e="Rank"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="ten_tdhv%l"/>
      <field name="truong_hoc"/>
      <field name="ten_cn%l"/>
      <field name="ngay_tot_nghiep"/>
      <field name="loai_tot_nghiep"/>
    </view>
  </views>
</grid>
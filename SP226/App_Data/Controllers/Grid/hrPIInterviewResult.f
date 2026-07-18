<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrepv" code="stt_rec, stt_rec0" order="line_nbr" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ten_pv%l" width="300">
      <header v="Loại phỏng vấn" e="Interview"></header>
    </field>
    <field name="ngay_pv" type="DateTime" dataFormatString="@datetimeFormat" width="80">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="diem" type="Decimal" dataFormatString="@markViewFormat" width="100">
      <header v="Điểm số" e="Mark"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ten_kq%l" width="150">
      <header v="Kết quả" e="Result"></header>
    </field>
    <field name="trong_so" type="Int32" dataFormatString="# ### ### ##0" width="100">
      <header v="Trọng số (%)" e="Weight (%)"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="ten_pv%l"/>
      <field name="ngay_pv"/>
      <field name="diem"/>
      <field name="ten_kq%l"/>
      <field name="trong_so"/>
    </view>
  </views>
</grid>
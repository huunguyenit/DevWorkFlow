<?xml version="1.0" encoding="utf-8"?>

<grid table="hrtangca" code="ma_tang_ca" order="ma_tang_ca" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo tăng ca" e="Overtime Definition"></title>
  <subTitle v="Khai báo tăng ca: mới, sửa, xóa..." e="Add New, Edit, Delete Shift..."></subTitle>

  <fields>
    <field name="ma_tang_ca" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tăng ca" e="Code"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_ca" width="100" allowSorting="true" allowFilter="true">
      <header v="Ca" e="Shift"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tang_ca"/>
      <field name="dien_giai"/>
      <field name="ma_ca"/>
    </view>
  </views>
</grid>
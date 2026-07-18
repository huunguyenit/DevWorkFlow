<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrtthd" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin chung hợp đồng" e="Labor Contract General Information"></title>
  <subTitle v="Cập nhật thông tin chung hợp đồng: sửa, xóa..." e="Edit, Delete Labor Contract General Information..."></subTitle>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="dai_dien" width="150" allowSorting="true" allowFilter="true">
      <header v="Người đại diện" e="Representative"></header>
    </field>
    <field name="quoc_tich" width="0" hidden="true">
      <header v="Quốc tịch" e="Nationality"></header>
    </field>
    <field name="ten_qt%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Quốc tịch" e="Nationality"></header>
    </field>
    <field name="chuc_vu" width="150" allowSorting="true" allowFilter="true">
      <header v="Chức vụ" e="Position"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="dai_dien"/>
      <field name="quoc_tich"/>
      <field name="ten_qt%l"/>
      <field name="chuc_vu"/>
    </view>
  </views>
</grid>
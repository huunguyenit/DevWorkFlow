<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmdvdt" code="ma_dvdt" order="ma_dvdt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo đơn vị đào tạo" e="Training Providers"></title>
  <subTitle v="Cập nhật đơn vị đào tạo: thêm, sửa, xóa..." e="Add, Edit, Delete Training Provider..."></subTitle>
  <fields>
    <field name="ma_dvdt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đơn vị" e="Code"></header>
    </field>
    <field name="ten_dvdt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đơn vị" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvdt"/>
      <field name="ten_dvdt%l"/>
    </view>
  </views>
</grid>
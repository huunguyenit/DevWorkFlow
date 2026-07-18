<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmtinh" code="ma_tinh" order="ma_tinh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục tỉnh/thành" e="Province/City List"></title>
  <subTitle v="Cập nhật tỉnh/thành: thêm, sửa, xóa..." e="Add, Edit, Delete Province/City ..."></subTitle>
  <fields>
    <field name="ma_tinh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tỉnh/thành" e="Province/City"></header>
    </field>
    <field name="ten_tinh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tỉnh/thành" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tinh"/>
      <field name="ten_tinh%l"/>
    </view>
  </views>
</grid>
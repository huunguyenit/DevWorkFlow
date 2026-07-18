<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmktdbh" code="ma_kieu" order="ma_kieu" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục kiểu thay đổi BHXH" e="SI Change Kind List"></title>
  <subTitle v="Cập nhật kiểu thay đổi BHXH: thêm, sửa, xóa..." e="Add, Edit, Delete SI Change Kind..."></subTitle>

  <fields>
    <field name="ma_kieu" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kiểu" e="Kind"/>
    </field>
    <field name="ten_kieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kiểu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kieu"/>
      <field name="ten_kieu%l"/>
    </view>
  </views>

</grid>
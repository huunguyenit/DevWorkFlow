<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmktcbh" code="ma_kieu" order="ma_tcbh, ma_kieu" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục kiểu trợ cấp BHXH" e="SI Benefit Category List"></title>
  <subTitle v="Cập nhật kiểu trợ cấp BHXH: thêm, sửa, xóa..." e="Add, Edit, Delete SI Benefit Category..."></subTitle>

  <fields>
    <field name="ma_tcbh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã trợ cấp" e="Benefit Code"/>
    </field>
    <field name="ma_kieu" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kiểu" e="Code"/>
    </field>
    <field name="ten_kieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kiểu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tcbh"/>
      <field name="ma_kieu"/>
      <field name="ten_kieu%l"/>
    </view>
  </views>

</grid>
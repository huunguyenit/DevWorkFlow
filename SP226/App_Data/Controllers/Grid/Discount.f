<?xml version="1.0" encoding="utf-8"?>

<grid table="dmck" code="ma_ck" order="ma_ck" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục chiết khấu" e="Discount List"></title>
  <subTitle v="Cập nhật thông tin chiết khấu: thêm, sửa, xóa..." e="Add, Edit, Delete Discount..."></subTitle>
  <fields>
    <field name="ma_ck" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chiết khấu" e="Code"></header>

    </field>
    <field name="ten_ck%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chiết khấu" e="Description"></header>
    </field>
  </fields>
  
  <views>
    <view id="Grid">
      <field name="ma_ck"/>
      <field name="ten_ck%l"/>
      
    </view>
  </views>

</grid>
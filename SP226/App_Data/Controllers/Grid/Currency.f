<?xml version="1.0" encoding="utf-8"?>

<grid table="dmnt" code="ma_nt" order="ma_nt" xmlns="urn:schemas-fast-com:data-grid">
  
  <title v="Danh mục tiền tệ" e="Currency List"></title>
  <subTitle v="Cập nhật ngoại tệ: thêm, sửa, xóa..." e="Add, Edit, Delete Currency..."></subTitle>
 
  <fields>
    <field name="ma_nt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã ngoại tệ" e="Currency Code"></header>
    </field>
    <field name="ten_nt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ngoại tệ" e="Currency Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nt"/>
      <field name="ten_nt%l"/>
    </view>
  </views>
  
</grid>
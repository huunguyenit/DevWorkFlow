<?xml version="1.0" encoding="utf-8"?>

<grid table="dmhtvc" code="ma_htvc" order="ma_htvc" xmlns="urn:schemas-fast-com:data-grid">
  
  <title v="Danh mục hình thức vận chuyển" e="Ship Via Codes"></title>
  <subTitle v="Cập nhật thông tin: thêm, sửa, xóa..." e="Add, Edit, Delete Ship Via Code..."></subTitle>
 
  <fields>
    <field name="ma_htvc" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã hình thức" e="Ship Via"></header>
    </field>
    <field name="ten_htvc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên hình thức" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_htvc"/>
      <field name="ten_htvc%l"/>
    </view>
  </views>
  
</grid>
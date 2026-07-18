<?xml version="1.0" encoding="utf-8"?>
<grid table="dmnx0" code="ma_nx" order="ma_nx" xmlns="urn:schemas-fast-com:data-grid">  
  <title v="Danh mục nhập xuất/lý do" e="Reason List"></title>
  <subTitle v="Cập nhật lý do: thêm, sửa, xóa..." e="Add, Edit, Delete Reason..."></subTitle>
 
  <fields>
    <field name="ma_nx" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhập xuất" e="Reason Code"></header>
    </field>
    <field name="ten_nx%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhập xuất" e="Description"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk"/>
    </view>
  </views>
  </grid>
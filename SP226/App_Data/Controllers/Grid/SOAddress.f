<?xml version="1.0" encoding="utf-8"?>

<grid table="vdmdc2" code="ma_kh, ma_dc" order="ma_kh, ma_dc" xmlns="urn:schemas-fast-com:data-grid">

	<title v="Danh mục địa chỉ giao hàng" e="Delivery Address List" />
  <subTitle v="Cập nhật thông tin địa chỉ giao hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Delivery Address..."></subTitle>
   <fields>
     <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
       <header v="Mã khách hàng" e="Customer"></header>
     </field>
     <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
       <header v="Tên khách hàng" e="Customer Name"></header>
     </field>
     <field name ="ma_dc" isPrimaryKey="true" width ="100" allowSorting="true" allowFilter="true">
       <header v="Mã địa chỉ" e="Address"></header>
     </field>
     <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true">
       <header v="Tên địa chỉ" e="Description"></header>
     </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_dc"/>
      <field name="ten_dc%l"/>
    </view>
  </views>
  
</grid>
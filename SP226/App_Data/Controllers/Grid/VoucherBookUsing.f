<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Control.Unit.Access.Type "2">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
]>

<grid table="vv20dmctnk" code="ma_ct, ma_nk" order="ma_ct, ma_nk" filter="&Control.Unit.Access.UnitFilter;" initialize="&Control.Unit.Access.UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo sử dụng quyển chứng từ" e="Voucher Book Using Definition"></title>
  <subTitle v="Cập nhật: thêm, sửa, xóa..." e="Add, Edit, Delete..."></subTitle>

  <fields>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowNulls="false" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Description"></header>
    </field>
    <field name="ma_nk" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyển" e="Book Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="ma_nk"/>
    </view>
  </views>

</grid>
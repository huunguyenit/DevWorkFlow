<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Control.Unit.Access.Type "2">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
]>

<grid table="v20dmnk" code="ma_nk" order="ma_nk" filter="&Control.Unit.Access.UnitFilter;" initialize="&Control.Unit.Access.UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục quyển chứng từ" e="Voucher Book List"></title>
  <subTitle v="Cập nhật quyển chứng từ: thêm, sửa, xóa..." e="Add, Edit, Delete Voucher Book..."></subTitle>

  <fields>
    <field name="ma_nk" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyển" e="Book Code"></header>
    </field>
    <field name="ten_nk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quyển" e="Description"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nk"/>
      <field name="ten_nk%l"/>

    </view>
  </views>

</grid>
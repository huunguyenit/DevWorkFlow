<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Parameters ", 0, 'tk_no'">  
  <!ENTITY UnitTag "dmtk">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Account;
  %Control.Unit.Ignore;
  <!ENTITY k "tk">  
  <!ENTITY Tag "vdmkc">  
]>

<grid table="vdmkc" code="stt" order="stt" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo các bút toán kết chuyển tự động" e="Closing Entry Definition"></title>
  <subTitle v="Cập nhật thông tin: thêm, sửa, xóa..." e="Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="stt" isPrimaryKey="true" type="Decimal" width="100" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ten_bt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="loai_kc" type="Decimal" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại kc" e="Closing Type"></header>
    </field>
    <field name="tk_no" width="120" allowSorting="true" allowFilter="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="120" allowSorting="true" allowFilter="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="loai_kc"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
    </view>
  </views>

</grid>
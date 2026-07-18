<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY UnitTag "dmtk">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Account;
  %Control.Unit.Ignore;
  <!ENTITY k "tk">
  <!ENTITY Tag "vdmcltg">
]>

<grid table="vdmcltg" code="stt" order="stt" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo các bút toán chênh lệch tỷ giá" e="Exchange Rate Difference Entry Definition"></title>
  <subTitle v="Cập nhật thông tin: thêm, sửa, xóa..." e="Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="stt" isPrimaryKey="true" type="Decimal" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ten_bt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk" width="120" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>

    <field name="tk_cltg" width="120" allowSorting="true" allowFilter="true">
      <header v="Tk chênh lệch" e="Difference Acct."></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="tk"/>
      <field name="tk_cltg"/>
    </view>
  </views>

</grid>
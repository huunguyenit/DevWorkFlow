<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
]>

<grid table="vdmdvcskbtc" code="ma_dvcs" order="ma_dvcs" filter="&Control.Unit.Access.UnitFilter;" initialize="&Control.Unit.Access.UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo thông tin tổ chức theo đơn vị cơ sở" e="Defining Organization"></title>
  <subTitle v="Cập nhật thông tin tổ chức theo đơn vị: thêm, sửa, xóa..." e="Add, Edit, Delete Organization Information..."></subTitle>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đơn vị" e="Unit Code"></header>
    </field>
    <field name="ten_dvcs%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đơn vị" e="Description"></header>
    </field>
    <field name="ten_tc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tổ chức, cá nhân" e="Organization Name"></header>
    </field>
    <field name="ma_so_thue" width="150" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="dia_chi%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ten_dvcs%l"/>
      <field name="ten_tc%l"/>
      <field name="ma_so_thue"/>
      <field name="dia_chi%l"/>
    </view>
  </views>
</grid>
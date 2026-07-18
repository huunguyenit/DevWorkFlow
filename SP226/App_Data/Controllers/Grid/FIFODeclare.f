<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
]>

<grid table="dmkho" code="ma_kho" order="stt_ntxt, ma_kho" filter="&Control.Unit.Access.UnitFilter;" initialize="&Control.Unit.Access.UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo về kho để tính giá NTXT" e="Warehouse Information for FIFO Cost Calculating"></title>
  <subTitle v="Sửa thông tin kho" e="Edit Warehouse Information"></subTitle>

  <fields>
    <field name="stt_ntxt" type="Int32" width="60" align="right" allowSorting="true" allowFilter="true">
      <header v="Stt" e="Ordinal"></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site Code"></header>
    </field>
    <field name="ten_kho%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kho" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_ntxt"/>
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
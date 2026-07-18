<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<grid table="dmloaigia2" code="loai_gia" order="stt, loai_gia" filter="&FieldsFilter;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục loại giá bán" e="Sales Pricing Type List"></title>
  <subTitle v="Cập nhật loại giá bán: sửa..." e="Edit Sales Pricing Type..."></subTitle>

  <fields>
    <field name="stt" type="Int32" width="60" align="right" allowSorting="true" allowFilter="true">
      <header v="Stt" e="Ordinal"></header>
    </field>
    <field name="loai_gia" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại" e="Code"></header>
    </field>
    <field name="ten_loai%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="loai_gia"/>
      <field name="ten_loai%l"/>
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
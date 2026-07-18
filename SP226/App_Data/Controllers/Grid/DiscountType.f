<?xml version="1.0" encoding="utf-8"?>

<grid table="dmloaick" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục loại chiết khấu" e="Discount Type List"></title>
  <subTitle v="Cập nhật loại chiết khấu: sửa..." e="Edit Discount Type..."></subTitle>

  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại" e="Code"></header>
    </field>
    <field name="ten_loai%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="status" width="100">
      <header v="Trạng thái" e="Status"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_loai"/>
      <field name="ten_loai%l"/>
      <field name="status"/>
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
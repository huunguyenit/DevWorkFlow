<?xml version="1.0" encoding="utf-8"?>

<grid table="crdmdvt" code="dvt" order="dvt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục đơn vị tính công suất" e="Unit of Capacity"></title>
  <subTitle v="Cập nhật đơn vị tính công suất: thêm, sửa, xóa..." e="Add, Edit, Delete Unit of Capacity..."></subTitle>
  <fields>
    <field name="dvt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị tính" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đơn vị tính" e="Description"></header>
    </field>
    <field name="he_so" type="Decimal" width="100" dataFormatString="# ###.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
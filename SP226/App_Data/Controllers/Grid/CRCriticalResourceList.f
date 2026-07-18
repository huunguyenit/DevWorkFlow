<?xml version="1.0" encoding="utf-8"?>

<grid table="crdmnl" code="ma_nl" order="ma_nl" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nguồn lực chủ yếu" e="Critical Resource List"></title>
  <subTitle v="Cập nhật nguồn lực chủ yếu: thêm, sửa, xóa..." e="Add, Edit, Delete Critical Resource..."></subTitle>
  <fields>
    <field name="ma_nl" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nguồn lực" e="Resource ID"></header>
    </field>
    <field name="ten_nl%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nguồn lực" e="Description"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đơn vị tính" e="UOM"></header>
    </field>
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberViewFormat" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Công suất tiêu chuẩn" e="Standard Capacity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nl"/>
      <field name="ten_nl%l"/>
      <field name="dvt"/>
      <field name="cong_suat"/>
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
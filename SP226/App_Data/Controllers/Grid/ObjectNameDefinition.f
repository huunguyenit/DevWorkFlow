<?xml version="1.0" encoding="utf-8"?>

<grid table="giatrimau" code="ma_gia_tri" order="stt, ma_gia_tri" filter="@@admin = 1 and status = '1'" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo tên đối tượng" e="Object Name Definition"></title>
  <subTitle v="Nhóm: %s." e="Group: %s."></subTitle>

  <fields>
    <field name="ma_gia_tri" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã giá trị" e="Code"></header>
    </field>
    <field name="dien_giai%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="ma_gia_tri"/>
      <field name="dien_giai%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Search">
      <title v="Chọn nhóm$Chọn..." e="Filter$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
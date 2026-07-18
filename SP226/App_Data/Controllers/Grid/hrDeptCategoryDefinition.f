<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrpnbp" code="ma_loai, ma_pn" order="ma_loai, stt_ref, ma_pn" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Cập nhật phân nhóm bộ phận" e="Department Category Definition"></title>
  <subTitle v="Loại phân nhóm: %t - %n..." e="Category Type: %t - %n..."></subTitle>

  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_pn" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phân nhóm" e="Category Code"></header>
    </field>
    <field name="ten%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên phân nhóm" e="Description"></header>
    </field>
    <field name="stt_ref" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_loai"/>
      <field name="ma_pn"/>
      <field name="ten%l"/>
      <field name="stt_ref"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
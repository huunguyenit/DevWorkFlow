<?xml version="1.0" encoding="utf-8"?>

<grid table="mcthsdb" code="ma_ky, stt" order="ma_ky, stt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Hệ số dự báo" e="Forecast Skew"></title>
  <subTitle v="Thêm, sửa, xóa hệ số dự báo..." e="Add New, Edit, Delete Forecast Skew...">"></subTitle>

  <fields>
    <field name="ma_ky" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã kỳ" e="Period Code"></header>
    </field>
    <field name="stt" isPrimaryKey="true" width="60" type="Decimal" dataFormatString="##0" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="Number"></header>
    </field>
    <field name="he_so" type="Decimal" width="100" dataFormatString="###.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Hệ số" e="Rate"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ky"/>
      <field name="stt"/>
      <field name="he_so"/>
      <field name="dien_giai"/>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
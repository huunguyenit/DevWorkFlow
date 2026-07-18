<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrrmhttt" code="ma_ht" order="ma_ht" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo yêu cầu kiểm tra" e="Test Requisition"></title>
  <subTitle v="Khai báo yêu cầu kiểm tra: sửa..." e="Edit Test Requisition..."></subTitle>

  <fields>
    <field name="ma_ht" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hình thức" e="Form Code"></header>
    </field>
    <field name="ten_ht%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên hình thức" e="Form Name"></header>
    </field>
    <field name="ma_vtr" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vị trí" e="Vacancy"></header>
    </field>
    <field name="ten_vtr%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí tuyển dụng" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ht"/>
      <field name="ten_ht%l"/>
      <field name="ma_vtr"/>
      <field name="ten_vtr%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Xóa chi tiết (Ctrl + Delete)$Xóa..." e="Clear (Ctrl + Delete)$"/>
    </button>
    <button command="">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
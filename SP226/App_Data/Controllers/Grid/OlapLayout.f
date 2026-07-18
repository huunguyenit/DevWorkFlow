<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or (uid = @@userID))">
]>
<grid table="olapLayout" code="id" order="id" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Mẫu báo cáo phân tích dữ liệu" e="Analytics Report Template"></title>
  <subTitle v="Xóa mẫu" e="Delete template..."></subTitle>

  <fields>
    <field name="uname" allowSorting="true" allowFilter="true" width="100">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="id" isPrimaryKey="true" allowSorting="true" allowFilter="true" width="80">
      <header v="Mã số" e="Id"></header>
    </field>
    <field name="cube" allowSorting="true" allowFilter="true" width="100">
      <header v="Khối" e="Cube"></header>
    </field>
    <field name="name" allowSorting="true" allowFilter="true" width="150">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="date" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày" e="Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="uname"/>
      <field name="id"/>
      <field name="cube"/>
      <field name="name"/>
      <field name="date"/>
    </view>
  </views>

  <toolbar>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
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
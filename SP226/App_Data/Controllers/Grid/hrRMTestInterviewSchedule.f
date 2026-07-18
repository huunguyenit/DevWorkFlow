<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
]>

<grid table="vhrrmlich" code="ma_dot" order="ma_dot" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Lập lịch kiểm tra, phỏng vấn" e="Test and Interview Scheduling"></title>
  <subTitle v="Lập lịch kiểm tra, phỏng vấn: thêm, sửa, xóa..." e="Add, Edit, Delete Test and Interview Scheduling..."></subTitle>

  <fields>
    <field name="ma_dot" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Mã đợt" e="Period Code"></header>
    </field>
    <field name="ten_dot%l" width="300" allowFilter="true">
      <header v="Tên đợt" e="Description"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Đến ngày" e="To Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dot"/>
      <field name="ten_dot%l"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
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
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
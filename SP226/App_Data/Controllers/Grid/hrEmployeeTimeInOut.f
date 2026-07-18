<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrvaora" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ngay, ma_nv, gio, hs_yn" order="ngay, ma_nv, gio0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật giờ vào, ra cho nhân viên" e="Employee Time In/Out Input"></title>
  <subTitle v="Cập nhật giờ vào, ra cho nhân viên: mới, sửa, xóa..." e="Add New, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="gio" isPrimaryKey="true" dataFormatString="HH:ss" width="60" align="center" allowFilter="true">
      <header v="Giờ" e="Time"></header>
    </field>
    <field name="gio0" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="hs_yn" isPrimaryKey="true" type="Int32" width="60" allowFilter="true">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="vao_ra" width="60" align="right" allowFilter="true">
      <header v="Loại" e="Type"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="gio"/>
      <field name="gio0"/>
      <field name="hs_yn"/>
      <field name="vao_ra"/>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
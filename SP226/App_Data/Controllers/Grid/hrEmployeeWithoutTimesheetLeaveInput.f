<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrkcccong" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ngay_tu, stt_rec" order="ngay_tu, ma_nv" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Cập nhật thông tin nhân viên không cần chấm công" e="Employees not subject to Time Card control"></title>
  <subTitle v="Cập nhật thông tin nhân viên không cần chấm công: mới, sửa, xóa..." e="Add New, Edit, Delete Employee..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ngay_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_ca" width="100" allowFilter="true">
      <header v="Ca" e="Shift"></header>
    </field>
    <field name="ma_cong" width="100" allowFilter="true">
      <header v="Công" e="Workday"></header>
    </field>
    <field name="so_gio" width="100" type="Decimal" dataFormatString="#0.00" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số giờ" e="Hours"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="ma_ca"/>
      <field name="ma_cong"/>
      <field name="so_gio"/>
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
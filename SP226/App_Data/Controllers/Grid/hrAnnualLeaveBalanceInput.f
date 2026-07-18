<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrphepnam" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="nam, stt_rec" order="nam, ma_nv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật số dư phép" e="Annual Leave Balance Input"></title>
  <subTitle v="Cập nhật số dư phép năm %y: mới, sửa, xóa..." e="Add New, Edit, Delete Annual Leave Balance in Year %y..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="so_phep" type="Decimal" dataFormatString="##0.00" width="120" align="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số ngày" e="Annual Leave"></header>
    </field>
    <field name="da_nghi" type="Decimal" dataFormatString="##0.00" width="120" align="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đã nghỉ" e="Used Annual Leave"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="nam"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="so_phep"/>
      <field name="da_nghi"/>
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
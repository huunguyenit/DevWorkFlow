<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
]>

<grid table="dmclkktd" code="ma_dvcs" filter="&FilterCheckAccessUnit;" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo thông tin nhập xuất chênh lệch kiểm kê tự động" e="Auto Generation of Stock Variance Information Declaration"></title>
  <subTitle v="Cập nhật thông tin xuất kho chênh lệch kiểm kê tự động: thêm, sửa, xóa..." e="Add, Edit, Delete Auto Generation of Stock Variance Information Declaration..."></subTitle>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_kh_thieu" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách kiểm kê thiếu" e="Customer for Issue"></header>
    </field>
    <field name="dien_giai_thieu" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải kiểm kê thiếu" e="Memo for Issue"></header>
    </field>
    <field name="tk_kk_thieu" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản kiểm kê thiếu" e="Debit Account for Issue"></header>
    </field>
    <field name="ma_nx_thieu" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nx kiểm kê thiếu" e="Reason Code for Issue"></header>
    </field>

    <field name="ma_kh_thua" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách kiểm kê thừa" e="Customer for Receipt"></header>
    </field>
    <field name="dien_giai_thua" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải kiểm kê thừa" e="Memo for Receipt"></header>
    </field>
    <field name="tk_kk_thua" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản kiểm kê thừa" e="Credit Account for Receipt"></header>
    </field>
    <field name="ma_nx_thua" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nx kiểm kê thừa" e="Reason Code for Receipt"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>

      <field name="ma_kh_thieu"/>
      <field name="dien_giai_thieu"/>
      <field name="tk_kk_thieu"/>
      <field name="ma_nx_thieu"/>

      <field name="ma_kh_thua"/>
      <field name="dien_giai_thua"/>
      <field name="tk_kk_thua"/>
      <field name="ma_nx_thua"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandCheckUnitRightBeforeInit;
      </text>
    </command>
  </commands>

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
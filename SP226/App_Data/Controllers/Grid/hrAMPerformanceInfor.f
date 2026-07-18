<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrdgth" code="stt_rec" order="nam, ma_ky, stt_nv, ma_nv"  filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật đánh giá thực hiện công việc" e="Performance Appraisal Information"></title>
  <subTitle v="Năm: %s1..." e="Year: %s1..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" width="60" type="Decimal" dataFormatString="####" allowFilter="&GridListAllowFilter.Number;">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_ky" width="60" type="Decimal" dataFormatString="####" allowFilter="&GridListAllowFilter.Number;">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="t_diem_nv_dg" width="100" type="Decimal" dataFormatString="@markViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tự đánh giá" e ="Self-Score"/>
    </field>
    <field name="t_diem_ql_dg" width="100" type="Decimal" dataFormatString="@markViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Quản lý đánh giá" e ="Appraiser Score"/>
    </field>
    <field name="vi_tri" width="0" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt_nv" width="0" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="nam"/>
      <field name="ma_ky"/>
      <field name="ma_nv"/>
      <field name="ten"/>
      <field name="t_diem_nv_dg"/>
      <field name="t_diem_ql_dg"/>
      <field name="vi_tri"/>
      <field name="stt_nv"/>
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
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
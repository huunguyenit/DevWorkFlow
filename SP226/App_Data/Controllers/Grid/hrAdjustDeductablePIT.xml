<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or (exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1) and ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrtdcthuekt" code="nam, ma_dvcs, loai_tn, stt_rec" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, loai_tn, stt, ma_nv, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật điều chỉnh thuế khấu trừ" e="Deductible PIT Adjustment"></title>
  <subTitle v="Cập nhật thông tin năm %y: thêm, sửa, xóa..." e="Add, Edit, Delete Information in Year %y..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="loai_tn" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Loại thu nhập" e="Income Type"></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" external="true" width="300" defaultValue="''" allowFilter="true" allowSorting="true">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="tnct_dc" width="120" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" align="right" allowFilter="&GridListAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Thu nhập" e="Income"></header>
    </field>
    <field name="tnct_dc_nt" width="120" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" align="right" allowFilter="&GridListAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Thu nhập nt" e="FC Income"></header>
    </field>
    <field name="thue_dc" width="120" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" align="right" allowFilter="&GridListAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Thuế" e="Tax"></header>
    </field>
    <field name="thue_dc_nt" width="120" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" align="right" allowFilter="&GridListAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Thuế nt" e="FC Tax"></header>
    </field>

    <field name="stt" type="Decimal" width="0" hidden="true" external="true" defaultValue="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="loai_tn"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>

      <field name="tnct_dc"/>
      <field name="tnct_dc_nt"/>
      <field name="thue_dc"/>
      <field name="thue_dc_nt"/>

      <field name="stt"/>
      <field name="stt_rec"/>
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
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
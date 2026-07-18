<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "nam = (select nam_bd from dmstt) and (@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrbhlddk" code="nam, ma_dvcs" filter="&FilterCheckAccessUnit;" order="nam desc, ma_dvcs asc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật lao động tham gia bảo hiểm đầu kỳ" e="Insurance Information Summary Input"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật lao động tham gia bảo hiểm đầu kỳ: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Insurance Information Summary Input..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" width="80" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ld_bhxh" width="120" type ="Decimal" dataFormatString="### ### ###" align="right" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lao động BHXH" e="SI"></header>
    </field>
    <field name="ld_bhyt" width="120" type ="Decimal" dataFormatString="### ### ###" align="right" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lao động BHYT" e="HI"></header>
    </field>
    <field name="ld_bhtn" width="120" type ="Decimal" dataFormatString="### ### ###" align="right" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lao động BHTN" e="UI"></header>
    </field>

    <field name="luong_bhxh" width="120" type ="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" align="right" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lương BHXH" e="SI Wage Fund"></header>
    </field>
    <field name="luong_bhyt" width="120" type ="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" align="right" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lương BHYT" e="HI Wage Fund"></header>
    </field>
    <field name="luong_bhtn" width="120" type ="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" align="right" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lương BHTN" e="UI Wage Fund"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>

      <field name="ld_bhxh"/>
      <field name="ld_bhyt"/>
      <field name="ld_bhtn"/>

      <field name="luong_bhxh"/>
      <field name="luong_bhyt"/>
      <field name="luong_bhtn"/>
    </view>
  </views>

  <commands>
    &SubTitleBalanceShowing;
    <command event="Loading">
      <text>
        &CommandWhenBalanceBeforeInit;
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
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
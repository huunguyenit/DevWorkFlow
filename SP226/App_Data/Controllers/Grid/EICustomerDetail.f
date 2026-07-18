<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "$EICustomerDetail">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Customer;
  %Control.Unit.Ignore;
]>

<grid table="ctkhhddt" code="ma_kh, ma_dvcs" order="line_nbr" type="Detail"  xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ma_kh" isPrimaryKey="true" width="0" hidden="true" dataFormatString="@upperCaseFormat" aliasName="a">
      <header v="Mã khách hàng" e="Customer"></header>
    </field>
    <field name="ma_dvcs" width="100" allowNulls="false" aliasName="a">
      <header v="Mã đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên đơn vị" e="Description"></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kh"/>
      <field name="ma_dvcs"/>
      <field name="ten_dvcs%l"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmp5cuPc5eSZtD7LseQ9Uhpwi9PxjzAYbz0V9TIyxFFQZlGkLtA/cqbOhrzPvs8/UdFv+isbm7iNGZTMwjQN0NMcnI9B0xvYe56xZ7JC/bKHKHrtIDqWVaB7o96FYe/2964=</encrypted>]]>
      </text>
    </query>
  </queries>

  &UnitRetrieve;

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    &UnitToolbar;

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
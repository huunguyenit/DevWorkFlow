<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "PRSaleOrderGrid">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "tag">
  <!ENTITY FlowGridSetItem "">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PRSaleOrderGrid', 'Grid', 'PRTran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 a.ma_vt, b.ten_vt as ten_vt, b.dvt, cast(0 as bit) as tag, a.sl_nhap as sl_dh0, a.ngay_ct as ngay_yc, a.sl_dh, a.sl_da_yc, a.xac_nhan, null as ngay_dat, 1 as he_so, a.stt_rec from mrctyc a, dmvt b
  return">
]>
<grid table="mrctyc" type ="Detail" code="so_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ma_vt" width="100" aliasName="a" readOnly ="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" aliasName="b" readOnly ="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>

    <field name="dvt" width="50" aliasName="a" readOnly ="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="tag" type="Boolean" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
    </field>

    <field name="sl_dh0" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Sl yêu cầu" e="Require Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_yc" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly ="true">
      <header v="Ngày yêu cầu" e="Require Date"></header>
    </field>
    <field name="sl_dh" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly ="true">
      <header v="Đặt hàng" e="Order Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_da_yc" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly ="true">
      <header v="Đã yêu cầu" e="Q'ty Allocated"></header>
      <items style="Numeric"/>
    </field>

    <field name="xac_nhan" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60" readOnly ="true">
      <header v="Xác nhận" e="Firm"></header>
      <items style="CheckBox"/>
    </field>
    <field name="ngay_dat" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly ="true">
      <header v="Ngày đặt" e="Release Date"></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="&CoefficientInputFormat;" width="0" hidden ="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="stt_rec" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>
      <field name="tag"/>

      <field name="sl_dh0"/>
      <field name="ngay_yc"/>
      <field name="sl_dh"/>
      <field name="sl_da_yc"/>

      <field name="xac_nhan"/>
      <field name="ngay_dat"/>

      <field name="he_so"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4LF4fhXi0g9Xvmlgzisyo8lX1QSWateVPbKWIZIfqxBF+7TSe8K9U7Tui1dfNHzisedS8v6LClAIAh8ewkCTYbGK00xjqSCzzGa2srtiKZPWgZ6BWYYrKxkBybsDeArdhxrZ7eyX/c8O5EZd/yz0FX1/pAGo3h9yx0+SidF227p9lcoR91CYRH/mPb855SP4c1NxKc8OvzS7JofWGNqwMn/NvL9WkyNcmB+2PmxCYGUQP4tu6qmndfsQwJnmy8iGVdkMD86MiTzLaAYeShbPL8qxwXaDjR0gx5gGKCuOrekGL8Jmi/Ao/v/utEHOvIlwabLgFUGjM5lN1gKUowyCMEsqh+EiP0bqQl0NMe1hniWs+IKjN3Ul7ibTd2U6MVT4eXEwOuku67wj4FOwiXfQ4X/g+AZVxiz48ACjQcd0oQjNYDcRxbb7OWtdm0an25WKJ1Y3A5/oJU0LVTnWvljE296bwa8sHt9mKK4JXch4px1oPWuaGtowaU0J1hYzsmXZGloqrW12GEFr3cxNS7m9HAGFwCEoiyhNTDrNg938Q0XOlofyoOMBItWOsHqerr95hrofvQPgFFwXzdgHX0oK68AWmwfR2aOyNA10RLttnJB7N3g/bmjquwExt7vdPDC8Z3V4qF272hR8Na+QGEMTAv72IVfZY08S4TofeiZX+06gCdeHhIV/T8uDD18QdZPqUMkkj5d5b6+rVRd4HXNLdvxrYzSCne2MJr0fRw8pd+8E2Jabi1FxU/lUfJadMN3Uekf9fgPF8q1vIggf/7+jwmB8hVnPM4MjEtS9t6JjIL/WjQZzmfNeVoQ8lvaJPofIwVg7YeWxBlk9u+y4v5dmZR+lG+KXW117VlZB1GxT5jQ</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
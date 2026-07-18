<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "S1BM">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? parseFloat(g._getItemValue(r, g._getColumnOrder('so_luong'))*f.getItemValue('t_so_luong')*(1 + (g._getItemValue(r, g._getColumnOrder('tl_hh'))))) : 0);">
]>

<grid table="ctdm" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="DM1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctdm" prime="ctdm" inquiry="ctdm" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_vt" allowNulls="false" readOnly="true" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" readOnly="true" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <handle key="[nhieu_dvt]"/>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="&CoefficientInputFormat;" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKoJjScIBCzrKvEQWxYaCH1iLN+d7k3O78zMgFPktn7n</Encrypted>]]></clientScript>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" allowContain="true" defaultValue="0" width="100">
      <header v="Số lượng" e="Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl định mức" e="BOM Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_hh" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="50" readOnly="true">
      <header v="Tỷ lệ hao hụt" e="Scrap Factor"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_cd_t" type="Boolean" external="true" allowContain="true" defaultValue="1" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>
      <field name="chon"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="tl_hh"/>

      <field name="ma_cd_t"/>
      <field name="nhieu_dvt"/>
      <field name="lo_yn"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2Ze6XkSt+C2BAv+/6SeYp9t1dCenLrEMDtwi9NkbSI60B8NZwvNl/aVJCSoqYcmKh5zgnbCc0OlTu3QUpJmwsLhQLorpSOD90qFhyjc9344QbEbXFA+QiN8TVafjMP0kMwrvLzD/OQ1dCrTZmopukB3Ca0gyltOnKitoUsyEJ8dfWnKxgAI9F/PHp3snEeKOTg4He5n1fmIEftKJeqD53AyL7+S360BK1nzEBNq61QnhWVi71n5suKaQXLqwxn0aSDJjFFlx/9ngYEFB7I1Te2vfff2LqVP8tdmEdSixhVwwLpn4Wrcgv1De9VmYO+GuZuczmFvGprY4PUK3mlX8aGz</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK94pVLwdikMl6B+kGVaH5giK9DasFhbFKjknfQWfg0LkVoRwdwtKOAhOlb4F2urjfR1ua/RYsBDTspsyrKZ1hX1I2rL7S4iZwL35x5uGr/+CFnum0BIKTJxh4rABz0nWl6VWc2krLoKc6HH0mNiLaBaHY+X/Iazbknf68m2ZmqE/4WJZnBcX88cBx8kTLMMgiU=</Encrypted>]]>
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
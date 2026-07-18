<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "MRMO">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) : 0);">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'MRMOGrid', 'Grid', 'MRTran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from ctsx a, dmvt b, cdvt13 e
  return">
]>

<grid table="ctsx" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PX0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="isx" prime="ctsx" inquiry="isx" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="&CoefficientViewFormat;" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="0" hidden="true" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="e.ton13 / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKoJjScIBCzrKvEQWxYaCH1iLN+d7k3O78zMgFPktn7n</Encrypted>]]></clientScript>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" allowContain="true" defaultValue="0" width="100">
      <header v="Sl yêu cầu" e="Require Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl lsx" e="MO Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho" readOnly="true" width="80" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>

    <field name="dh_so" width="80" readOnly="true" align="right" inactivate="true" aliasName="a">
      <header v="Đơn hàng" e="Order Number"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" readOnly="true" hidden="true" aliasName="a">
      <header v="" e="Location"></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedHiddenFields;
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>
      <field name="ton13"/>
      <field name="chon"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="ma_kho"/>

      <field name="dh_so"/>
      <field name="dh_ln"/>

      <field name="nhieu_dvt"/>
      <field name="ma_lo"/>
      <field name="lo_yn"/>
      <field name="ma_vi_tri"/>
      <field name="vi_tri_yn"/>

      &XMLUserDefinedHiddenViews;
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncJhMDa+4b50guuBrscfachL6tubfRX9Rkbih7qIGdIeRORRle9xrovFpA60gj+jFGahfAsypDhbbwkxg9VjkwesvenLxwcP53My1ydYhUjX/w==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XRMC8K8xZiq/YigWJchR/2bZK4pQf3xaOOTjiKfpZI+EKk/OXe/oT6cN6Qv5zs1Hk8vNRMGiLsdq7OeQa56B3hqHId9ab5jkoFjjVMXLoQedtAGmHeNX0NVUoQsgzMvoEDeGXmMeVMyEvpIH7OQZtw=</Encrypted>]]>
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
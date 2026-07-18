<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">

  <!ENTITY Identity "WR">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'WRGrid', 'Grid', 'WRTran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from cttt20
  return">
]>

<grid table="cttt20" code="so_ct" order="ngay_ct, so_ct" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="chon" type="Boolean" external="true" defaultValue="cast(0 as bit)" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
    </field>
    <field name="so_ct" external="true" defaultValue="ltrim(so_ct)" align="right" width="100" readOnly="true">
      <header v="Số hóa đơn" e="Invoice No."></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="dd/MM/yyyy" width="100" readOnly="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="tk" width="100" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>

    <field name="t_tt_nt" type="Decimal" external="true" defaultValue="case when isnull(ma_nt, '') = '' then t_tt else t_tt_nt end" dataFormatString="### ### ### ### ###.00" align="right" width="120" readOnly="true">
      <header v="Số tiền" e="Amount"></header>
    </field>
    <field name="t_tt_qd" type="Decimal" dataFormatString="### ### ### ### ###.00" align="right" width="120" readOnly="true">
      <header v="Đã thanh toán" e="Received"></header>
    </field>
    <field name="cl_nt" type="Decimal" external="true" defaultValue="case when isnull(ma_nt, '') = '' then t_tt else t_tt_nt end - t_tt_qd" dataFormatString="### ### ### ### ###.00" align="right" width="120" readOnly="true">
      <header v="Còn lại" e="Remaining"></header>
    </field>

    <field name="ma_nt"  external="true" defaultValue="case when isnull(ma_nt, '') = '' then @baseCurrency else rtrim(ma_nt) end" width="100" readOnly="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
    <field name="dien_giai" width="300" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    &XMLUserDefinedHiddenFields;
  </fields>

  <views>
    <view id="Grid">
      <field name="chon"/>

      <field name="so_ct"/>
      <field name="ngay_ct"/>
      <field name="tk"/>

      <field name="t_tt_nt"/>
      <field name="t_tt_qd"/>
      <field name="cl_nt"/>
      <field name="ma_nt"/>

      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="ty_gia"/>

      &XMLUserDefinedHiddenViews;
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7538BzVLbxYo6SyGBb8l8BT08UY2Dj1u2W24d2cYSnSjF</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygjSFPbOV24uAWl4u4X5Uv279mD3oUnI+BfPKauxsseDVstaHvU4Tfh4kQaUgP/Yixg==</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+i0ZKH2wHirB+ogDbZlW0aBktLPOBxnyAlNrxCsYXtb</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygjSFPbOV24uAWl4u4X5Uv279mD3oUnI+BfPKauxsseDVstaHvU4Tfh4kQaUgP/Yixg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygtg8VRc87HLlgzo0rnek4J6Z2CZMPUZqNV57p62jwigLEC9g67KLF877V/dpDU6D3Uer6vOYGZ4+PzvCqANj1P/PSKYqpriQTQtbgqhF5i3tImch+aX8O3pSOGyIOqln5Ql4k6jhOGVOv57F3Ko+N8aMjHdZ/hz2WcQtgsA0q8k+tVNhgqxWhcaNWSLJl3uVxKTNrDhHffNZNB2nILKVGhBowda0SyLPrEFkYmblsUDLneI1K5Vi2EBsoHNfpU4rsEaz/U3pOV0sgjpcwUwy8NdBC+/K+25UiHKI2eRfrM+E</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygkSXzMROpZ2hydOL83xcIzWXkip2/ycFxr7dI8Y5E3Sr41qM21AbIgecnFraB63tAg==</Encrypted>]]>
      &ScriptFlowGridSelect;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuynvFHnr3ErYMqXn8h5rm3jw30UsdDVg/hQBfMoTl6aSCFsLvo+oZ2v/L353NWFkTc89nS6a9hrhW1sxBeesiUU+fHTkTjNtCWsbo27iB5CsA83hWtqeuHhEHvlc1fX8pg==</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK8zVBBiUqG+TCHqLZlhW67o0gOvzXuaLRsKfoXwH8MfM8kD33Ut7QYMuKY4MtmSydSs1qu7csjp7Jr+vSHAUW5z+hQ5JS/K3Qj31qgu0pf3YcSTIUUsHoiefj3iukQDFNgBDmydcgJg/kY0HrYfq4HodGhvDEGcc6ILtvpAeg947DrQ4rbCZy0jSYgkxVaobhvBio6UVMH1/n/Qut2dlCOJ</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
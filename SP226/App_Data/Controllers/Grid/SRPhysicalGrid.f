<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxType "2">
  <!ENTITY EnvironmentTaxAliasName "mt">
  <!ENTITY EnvironmentTaxPrimeTable "36">

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "SRPhysical">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SVOrderGrid', 'Grid', 'SVTran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d36$000000 a, dmvt b, (select *, 0 as tl_chiu_thue, 0 as he_so_mt from dmkbtmt where 1 = 0) mt
    return
">
]>
<grid table="d36$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HDR" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c36$000000" prime="d36$" inquiry="i36$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" readOnly="true" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" readOnly="true" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_tl" external="true" defaultValue="0" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" allowContain="true">
      <header v="Sl trả lại" e="Return Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" readOnly="true" clientDefault="0" width="80">
      <header v="Sl nhập" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" hidden="true" clientDefault="0" width="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" hidden="true" clientDefault="0" width="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" readOnly="true" width="80" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>

    <field name="tk_vt" hidden="true" readOnly="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="tk_gv" hidden="true" readOnly="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="tk_cpbh" hidden="true" readOnly="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="tk_dt" hidden="true" readOnly="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>

    <field name="kieu_gv" type="Int32" width="0" external="true" hidden="true" aliasName="case when not exists(select 1 from dmtk where dmtk.tk = b.tk_gv and dmtk.loai_tk = 1) then 0 else 1 end">
      <header v="" e=""></header>
    </field>
    <field name="kieu_dt" type="Int32" width="0" external="true" hidden="true" aliasName="case when not exists(select 1 from dmtk where dmtk.tk = b.tk_tl and dmtk.loai_tk = 1) then 0 else 1 end">
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 1 from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    &EnvironmentTaxInheritanceFields;
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>
      <field name="gia_ton"/>

      <field name="sl_tl"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="gia"/>
      <field name="ma_kho"/>
      <field name="tk_vt"/>
      <field name="tk_gv"/>
      <field name="tk_cpbh"/>
      <field name="tk_dt"/>
      <field name="kieu_gv"/>
      <field name="kieu_dt"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="sua_tk_vt"/>
      <field name="ma_lo"/>
      <field name="lo_yn"/>
      <field name="ma_vi_tri"/>
      <field name="vi_tri_yn"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="so_ct"/>
      <field name="line_nbr"/>

      &EnvironmentTaxInheritanceViews;
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        &EnvironmentTaxInheritanceQuery;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK98maWS2vjmVM+QQCnn54KQiZx5+WcLlvahQbnkLOHB1w==</Encrypted>]]>&EnvironmentTaxPrimePartitionCurrent;<![CDATA[<Encrypted>&/CeVoo3cM+o2CPgco9dGQ9pavM6kFfE8PSVHHXdAorNFH1ypDWCj/vUOQCpEChOQjM0SIEST2TuCWBhjO+pfVw==</Encrypted>]]>&EnvironmentTaxInheritanceLoadingJoin;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNJHJfWbHtxMG+gpjcey2LaM=</Encrypted>]]>&EnvironmentTaxWhereClause;<![CDATA[<Encrypted>&OlC3fE3ec4FLfJZpYl/SRxk/njgID9TUCOE3zzmSoz7OOE9H6JLHXmETsXFMX9n+</Encrypted>]]>
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
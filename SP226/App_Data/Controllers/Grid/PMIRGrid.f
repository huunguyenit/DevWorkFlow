<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxType "1">
  <!ENTITY EnvironmentTaxAliasName "mt">
  <!ENTITY EnvironmentTaxPrimeTable "74">

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "PMIR">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) - g._getItemValue(r, g._getColumnOrder('sl_hd')) : 0);">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PMIRGrid', 'Grid', 'PMTran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from (select a.*, b.stt_rec_dh, b.stt_rec0dh, b.dh_so, b.dh_ln from d74$000000 a, d96$000000 b where 1 = 0) a, dmvt b, (select *, 0 as tl_chiu_thue, 0 as he_so_mt from dmkbtmt where 1 = 0) mt
  return">
]>

<grid table="d74$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PND" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c74$000000" prime="d74$" inquiry="i74$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKoJjScIBCzrKvEQWxYaCH1iLN+d7k3O78zMgFPktn7n</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" width="100" external="true" allowContain="true" defaultValue="0">
      <header v="Sl hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl nhập" e="Receipt Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" allowContain="true" defaultValue="0">
      <header v="Đã nhận hóa đơn" e="Received Invoice"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" readOnly="true" width="100">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="tk_du" width="0" hidden="true" allowNulls="false" aliasName="a">
      <header v="Tk có" e="Credit Account"></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="&CoefficientViewFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
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

    <field name="stt_rec_nm" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0nm" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nm_so" align="right" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="nm_ln" type="Int32" dataFormatString="#####" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dh_so" align="right" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    &EnvironmentTaxInheritanceFields;
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="chon"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="sl_hd"/>

      <field name="gia_nt"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="tk_du"/>
      <field name="sua_tk_vt"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="he_so"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="gia_ton"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="so_ct"/>
      <field name="line_nbr"/>

      <field name="stt_rec_nm"/>
      <field name="stt_rec0nm"/>
      <field name="nm_so"/>
      <field name="nm_ln"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="dh_so"/>
      <field name="dh_ln"/>

      &EnvironmentTaxInheritanceViews;
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncJhMDa+4b50guuBrscfachLr0IBdva6HLE11oCjwjYzHROa07j1SVbH6pla4bW8zgqS8bh4O7SSEzL4Yk3QBDvZXS1voagTU43CGrMKKaOO/gjiOeklQvmWEPjomWXOKnA=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        &EnvironmentTaxInheritanceQuery;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKTsB2B2gB5rd8939JehgHPqzBUyIrkjd9f0s4vx/suDioqewqF23LYdAY+LHYqxZKnM/aN0iYKg3HqiM8rgJrWHYcwXzmrGItAoX762o99rdE3IfSmVU4mV1orbGhXUKYDUCgoAyAO2Kwe94yYWImaUVgJ85O0wMAP0VWIbrCClzLOQ8GdppNvaBUoRKFEw57HtDbmXjs9MVX8S7liwlGTv3Vmqxn58mFbiEiFeBa+h337hdZnuFGWwVqhrdkXtXP5PYIjhOtHIfMkKDe05RbB7cNrL8eab6jejd9tWqcqB</Encrypted>]]>&EnvironmentTaxPrimePartitionCurrent;<![CDATA[<Encrypted>&TQs0CDX0qovkoki0iE9tM0HHccwTsdRJ0MSCl0U1XDATUQ9yVF0m01M9Hp9B2yz+6T8CBEuilLL8x1PXmxpP4XSe5sgG9OuLL7nbZcR8zOK462Vt8WhvZv/zl6IzXVWQPEK2yd4nNzbvNkIE/3o7lrJbjeAK/LRQTR54UyKsD3PTwolYCa/xKdtdSsgEWKIbH/JD907tIKvkc0bV64xfzXvZa0x5lUeZiBy1cykYvtH+5ZdLe39X08OHBL6Yjyf68v+TNowq5pn9KSgbiYq14MCSVNVePwZEOsfxmwALtdShfetYxKCrysLSd3v5qfd24wdV1cI0ZKYQ4XHJchpig1iCY4aDEBjTfoMRVYzUeUQtbITE60OEMd8z1WvEkE2KgY6Ug+3Tz7a6MXEejTRDtotb/7aOQ/Vz+YxIGTifXQaUvDult/0n5F0R8Vic9ev4NHbnwGEGCRjB5Yvfigt+tGazo/OnYAY0Guh0qaQ8HekWQwuzsAlYlPNsHnUUEpEQeccHt4uUiC7lhOlpmRLU68XncNuPuRPm3tsfZijfkcMUNb/xsLQEY+EWdV5DDZSe8ezLcFNQYf93Pkn0eIpcEIYgG3Xsjkh8mtYd1sjcYu+z/FxDxUm18FXLbDIxTA2H</Encrypted>]]>&EnvironmentTaxInheritanceLoadingJoin;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNBhzOVbyJ22PRlGj/bNflrrB+2xTSAXMgf7vBISF3D/bWG8ufujR9WVDqY7eOh+Gw9md0mOquhyzo5zf0bl4jjo=</Encrypted>]]>
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
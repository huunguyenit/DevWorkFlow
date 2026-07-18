<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "WKInvoice">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'WKInvoiceGrid', 'Grid', 'WKTran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d81$000000 a, dmvt b
    return
">
]>

<grid table="d81$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HDA" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c81$000000" prime="d81$" inquiry="i81$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <header v="Sl hóa đơn" e="Invoice Quantity"></header>
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
    <field name="tk_tl" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>

      <field name="sl_tl"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="gia"/>
      <field name="ma_kho"/>
      <field name="tk_vt"/>
      <field name="tk_gv"/>
      <field name="tk_cpbh"/>
      <field name="tk_tl"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="ma_lo"/>
      <field name="lo_yn"/>
      <field name="ma_vi_tri"/>
      <field name="vi_tri_yn"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="so_ct"/>
      <field name="line_nbr"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4R5WPurvONXlXPy/jxQyx5/tygPniSGVrG82pjVdXduiJK//ZfrB6eByq2D0qY0hOEQZq4i0Iu/MeeIoceyfWC3</Encrypted>]]>
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
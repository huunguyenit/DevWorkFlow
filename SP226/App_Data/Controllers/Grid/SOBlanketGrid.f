<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "SOBlanket">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "tag">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) - g._getItemValue(r, g._getColumnOrder('sl_dh')) : 0);">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SOBlanketGrid', 'Grid', 'SOTran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from d64$000000 a, dmvt b
  return">
]>

<grid table="d64$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="DXA" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c64$000000" prime="d64$" inquiry="i64$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="tag" external="true" defaultValue="cast(0 as bit)" type="Boolean" width="60">
      &XMLFlowGridTagHeader;
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKoJjScIBCzrKvEQWxYaCH1iLN+d7k3O78zMgFPktn7n</Encrypted>]]></clientScript>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientViewFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" defaultValue="0" clientDefault="0" width="80" external="true">
      <header v="Sl đặt hàng" e="Order Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="Sl hợp đồng" e="Blanket Order Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_dh" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="Sl đã đặt" e="Ordered Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" readOnly="true" clientDefault="0" width="100">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" readOnly="true" width="80" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" width="80" align="left">
      <header v="Ngày giao" e="Delivery Date"></header>
    </field>

    <field name="ma_thue" readOnly="true" hidden="true" inactivate="true" width="80" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" readOnly="true" hidden="true" inactivate="true" width="100" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="gia_ban_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" hidden="true" width="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" hidden="true" width="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_bg" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0bg" width="0" hidden="true">
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
      <field name="tag"/>
      <field name="he_so"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="sl_dh"/>
      <field name="gia_nt2"/>
      <field name="ma_kho"/>
      <field name="ngay_giao"/>

      <field name="ma_thue"/>
      <field name="thue_suat"/>

      &XMLUserDefinedHiddenViews;

      <field name="gia_ban_nt"/>
      <field name="ck_nt"/>
      <field name="nhieu_dvt"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_bg"/>
      <field name="stt_rec0bg"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncJhMDa+4b50guuBrscfachL8pOJ2mAMizQgXNcnXzGPU0q0zz4UZGYmTcDNz21hgCDcWojtzhyax/H9hhhEqkeYr7cB7O2TQVHafJaigqnAFvkBA+a/ymSew70Ew0scyyA=</Encrypted>]]>
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
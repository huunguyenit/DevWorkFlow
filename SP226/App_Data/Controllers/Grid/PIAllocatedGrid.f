<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "PIAllocated">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "tag">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('sl_dat')) - g._getItemValue(r, g._getColumnOrder('sl_dh')) : 0);">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PIAllocatedGrid', 'Grid', 'PITran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from d93$000000 a, dmvt b
  return">
]>

<grid table="d93$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PD5" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c93$000000" prime="d93$" inquiry="i93$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="sl_dat" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="Sl phân bổ" e="Allocated Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_dh" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="Sl đã đặt" e="Ordered Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" readOnly="true" clientDefault="0" width="100">
      <header v="Giá" e="Price"></header>
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
    <field name="stt_rec_nc" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0nc" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" hidden="true" width="0" aliasName="a">
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
      <field name="sl_dat"/>
      <field name="sl_dh"/>
      <field name="gia_nt"/>

      <field name="nhieu_dvt"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_nc"/>
      <field name="stt_rec0nc"/>
      <field name="line_nbr"/>
      <field name="ma_kh"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncJhMDa+4b50guuBrscfachLGCdO1NNgeo9ujU5FBuFZ6dERUVQxt6tAXrXa9YkQ/LM6H9afg7+P2WecIlErcTrhccuxGGW38OGVJgps/YetlIl5chegxIx5K83Bl/iU2Js=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF7GuEGLaBKkxqo3N+afAKBQGcf/Lxv4F7/A5mMDdDAC5nrQBaV9ivCUUfGLOx8V3S1mJzlwTMZv1luY5dhQ2F9AMKqqjAIELY1y5FJxZMp5N2h6UDZuRVN4xue5nCX9QrMc5BVp2ps8TcfZYKLcRGBKVhorNV0pN2qHO5WaXJLgjJEzXlLCPzfVDPwj7aWaUcYBJc9N7CGIWbUxEkynzN5zCTz4wLKqwK1PMPAtq6UTav5n/vMUjETFWOAOo3CjfwduQrNAtKDA2WywbF3envh/PQ7ds6ZP0DI9E1UgT65UbOYSObvvMc80EQeyQ+JpDLtRO1Qt38j2MuzY6pxiVp/ftXMeudHt9rvrK1h1A7pqa+wytHfr/32K1MwN9fCsO0myYPiy8AywSS2qaa1Dh+klUTkKHlO4mUckBoC6+6WjPoHz5GVVVB9e7rb8FNb9BQ==</Encrypted>]]>
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
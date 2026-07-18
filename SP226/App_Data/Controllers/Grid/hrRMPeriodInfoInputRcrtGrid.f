<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">
  <!ENTITY Identity "hrRMPeriodInfoInputRcrt">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? ((g._getItemValue(r, g._getColumnOrder('so_luong')) - g._getItemValue(r, g._getColumnOrder('sl_dot'))) > 0 ? (g._getItemValue(r, g._getColumnOrder('so_luong')) - g._getItemValue(r, g._getColumnOrder('sl_dot'))) : 0) : 0);">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'hrRMPeriodInfoInputRcrtGrid', 'Grid', 'hrRMPeriodInfoInput'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from hrrmycct a, hrrmyc b, hrvt c, hrbp d
    return
">
]>

<grid table="hrrmycct" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrrmycct" prime="hrrmycct" inquiry="hrirmyc" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_vtr" allowNulls="false" width="100" readOnly="true" aliasName="a">
      <header v="Mã vị trí" e="Position Code"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1=1" information="ma_vtr$hrvt.ten_vtr%l"/>
    </field>
    <field name="ten_vtr%l" external="true" defaultValue="''" width="150" readOnly="true" aliasName="c">
      <header v="Tên vị trí công việc" e="Position Name"></header>
    </field>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKoJjScIBCzrKvEQWxYaCH1iLN+d7k3O78zMgFPktn7n</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong0" type="Decimal" dataFormatString="### ##0" external="true" defaultValue="0" allowContain="true" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="### ##0" readOnly="true" width="80" aliasName="a">
      <header v="Số lượng yêu cầu" e="Request Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_dot" type="Decimal" dataFormatString="### ##0" hidden="true" inactivate="true" width="0" readOnly="true" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky_nang_yc" width="300" readOnly="true" aliasName="a">
      <header v="Kỹ năng yêu cầu" e="Required Skills"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false" readOnly="true" aliasName="a">
      <header v="Yêu cầu từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false" readOnly="true" aliasName="a">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ghi_chu" width="300" readOnly="true" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" readOnly="true" width="0" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" readOnly="true" width="0" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" external="true" defaultValue="''" width="0" readOnly="true" hidden="true" aliasName="d">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vtr"/>
      <field name="ten_vtr%l"/>
      <field name="chon"/>
      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="sl_dot"/>
      <field name="ky_nang_yc"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="ghi_chu"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="so_ct"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenoAnrd+6l76dPWfgKFTo7ZgbnZbHSGrCEcGrL2C9CXbxYi1nTZt2FESPwUDvWhXWXjND8DQqyMdO/+Awur9M1gbcPs1CgGk4+Ul4+2DlY60wnsfZcdo/Mr8TfxW8zw22BVxW+wB+uiIoOqavXjQNMzuDsmx4y7+gEOtku6DkxRko=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSM/6qdRYIGcx9G9osqypQmGJBAQNSBLsi54Hd43j/Fsu9JZ8AeeWF6TvCwtm2ui3zTMSwlwSVT5NQC3qHKLsX8MEHA/zN/FDPqGNyJkK+9oxanVKM8QxDVmlL/NM9uVj71fa01qLdJndgz3jjYboVIc=</Encrypted>]]>
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
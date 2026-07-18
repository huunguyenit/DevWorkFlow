<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">
  <!ENTITY Identity "hrTMCourseResult">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'hrTMCourseResultGrid', 'Grid', 'hrTMCourseResult'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from hrdtctkh a, vhrnv b
  return">
]>

<grid table="hrdtctkh" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="H08" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrdtctkh" prime="hrdtctkh" inquiry="hridtkh" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_nv" allowNulls="false" width="100" aliasName="b" readOnly="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="status = '1'" check="1 = 1" information="ma_nv$vhrnv.ten"/>
    </field>
    <field name="ten" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="1" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Vị trí" e="Job Position"></header>
    </field>

    <field name="stt_rec_nv" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten"/>
      <field name="chon"/>
      <field name="ten_bp%l"/>
      <field name="ten_vtr%l"/>

      <field name="stt_rec"/>
      <field name="stt_rec_nv"/>
      <field name="stt_rec0"/>
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
    </text>
  </script>
  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSDV49hXpphWWPk0sSDatADNXOFFI4QHp9oxOvflEiLptYTS0vM9wh5xQmpV2WIklODrTMf7doA2wuaNK9sTHwbIGZ5ZYko7JFCVYlgjmyMvs</Encrypted>]]>
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
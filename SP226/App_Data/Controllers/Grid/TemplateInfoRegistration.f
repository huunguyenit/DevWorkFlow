<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vdmmausoct" code="ma_maubc, ccode" order="stt_cn, ccode, stt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thông tin báo cáo" e="Template Information Registration"></title>
  <subTitle v="Mẫu TT/QĐ: %s." e="Circular/Decision Form: %s."></subTitle>
  <fields>
    <field name="ma_maubc" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_cn" type="Int16" dataFormatString="####" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ccode" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_cn%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Chức năng" e="Function"></header>
    </field>
    <field name="stt" type="Int16" dataFormatString="####" width="60" align="right" allowFilter="&GridListAllowFilter.Number;" allowSorting="true">
      <header v="Stt" e="Number"></header>
    </field>
    <field name="ten%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên" e="Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_maubc"/>
      <field name="stt_cn"/>
      <field name="ccode"/>
      <field name="ten_cn%l"/>
      <field name="stt"/>
      <field name="ten%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<grid table="ctdmku" code="ma_ku" order="ma_ku, line_nbr" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="ls" type="Decimal" allowNulls="false" dataFormatString="##0.00" width="100" clientDefault="0">
      <header v="Lãi suất (%)" e="Interest Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Hiệu lực từ" e="Effective Date"></header>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="line_nbr" type="Int32" isPrimaryKey="true" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ls"/>
      <field name="ngay_hl"/>
      <field name="ghi_chu"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
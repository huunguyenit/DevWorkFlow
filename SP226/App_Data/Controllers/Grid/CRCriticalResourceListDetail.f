<?xml version="1.0" encoding="utf-8"?>

<grid table="crdmctnl" type="Detail" code="ma_nl, line_nbr" order="ma_nl, line_nbr" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ma_nl" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="0" hidden="true">
      <header v="Mã nguồn lực" e="Resource ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right" width="100" allowNulls="false">
      <header v="Công suất thay đổi" e="Capacity Change"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="## ##0" width="100" align="right" allowNulls="false">
      <header v="Số ngày" e="No. of Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_kt" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" width="100" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Trạng thái" e="Status"></header>
      <items style="Mask"/>
    </field>
    <field name="line_nbr" type="Int32" isPrimaryKey="true" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nl"/>
      <field name="ngay_bd"/>
      <field name="cong_suat"/>
      <field name="so_ngay"/>
      <field name="ngay_kt"/>
      <field name="dien_giai"/>
      <field name="status"/>
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

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK8zVBBiUqG+TCHqLZlhW67oGTac7eRglXz3/2t6IfpkAGwajJCZd46OZUdqtd2KEFHaSzL2P2PiWR4dc8wCCQsL</Encrypted>]]>
      </text>
    </query>
  </queries>

</grid>
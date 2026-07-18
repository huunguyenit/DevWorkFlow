<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
]>

<grid table="ctns1" code="ma_ns, ngay_hl_tu" order="ngay_hl_tu" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>

  <fields>
    <field name="ma_ns" isPrimaryKey="true" allowNulls="false" readOnly="true" width="100" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" width="100">
      <header v="Hiệu lực từ ngày" e="Effective from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Effective to"></header>
    </field>
    <field name="luong_cb_nt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Lương đóng bảo hiểm" e="Insurance Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_bhnn_nt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Bảo hiểm trách nhiệm" e="Liability Insurance"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_khac_nt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Bảo hiểm bắt buộc khác" e="Other Compulsory Insurance"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ns"/>
      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
      <field name="luong_cb_nt"/>
      <field name="gt_bhnn_nt"/>
      <field name="gt_khac_nt"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoVw4MQWSymf2aqBlbdss5aKrTwOSh1SRR6QUoIgg+jyawlNbD7Lxaf3NHcgd7qUK9HO+oNeF0DwCs0/RAiTOEl</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ctdmhd" type="Detail" code="ma_hd" order="ma_hd, line_nbr" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="ngay_tt" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Ngày thanh toán" e="Payment Date"></header>
    </field>
    <field name="ma_dot" allowNulls="false" width="100" aliasName="a">
      <header v="Đợt thanh toán" e="Payment Phase"></header>
      <items style="AutoComplete" controller="ContractPaymentProgress" reference="ten_dot%l" key="status = '1'" check="1 = 1" information="ma_dot$dmtthd.ten_dot%l" new="Default"/>
    </field>
    <field name="ten_dot%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ty_le" type ="Decimal" width="100" dataFormatString="#00.00" align="right">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="120" clientDefault="0">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="120" clientDefault="0">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="han_tt" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Hạn thanh toán" e="Due Date"></header>
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
      <field name="ngay_tt"/>
      <field name="ma_dot"/>
      <field name="ten_dot%l"/>
      <field name="ty_le"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="han_tt"/>
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

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoxjFqAhaw5xkjwwK86TV1Vv8ORPLPXHKdYfx1gDg4og9wLDpEoTNNLQW2UVaog0rbugBZ7l1NypS2f9KQF+5Yh</encrypted>]]>
      </text>
    </query>
  </queries>
</grid>
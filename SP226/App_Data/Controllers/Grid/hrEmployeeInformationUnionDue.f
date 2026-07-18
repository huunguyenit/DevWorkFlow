<?xml version="1.0" encoding="utf-8"?>

<grid table="hrttctcd" code="stt_rec, stt_rec0" order="ngay_hl_tu" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <partition table="hrttctcd" prime="hrttctcd" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" width="100">
      <header v="Hiệu lực từ ngày" e="Effective from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Effective to"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0">
      <header v="Phí công đoàn" e="Union Due"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
      <field name="tien"/>
      <field name="dien_giai"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiKDEJHQrfeoDW4aIWXvdEMT69AF6h6kgMPD2jw23ZWiOeEwdZzoMjeedZr7ZZZRMZR50ny3TVN6bY1u6WYdtUoHPghZZmwnUfXztaANn7wit</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPvmytVmaNKyp7hIMTc6xalAgcUxO/XexsPeL9c+y3x1oLm1qwU4hFoBnOMwyizkItdEe4kz5f6ICqXJlGgz5vbu+xShbNhbq8oBqr6EIFNn</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlJMzu4tW1RB+1Fx3iiw+e2BzkNdPr6kP0uxC75I3maEL7ccdgcAEVsZ8w9NfC1ITDyvewe+vMU7S1RbynFNj3VYs/NWgyjZYVhipxIE7eNsf9F9qmLXtclZXuNH/1XuuuQuDSc4CMbTSXcynhHPlambvpyaJqpqzGDhp+k91P775J+Mlujepmd1L5LvIgPOyKj2Kgrft04EqUp2xlK2En2CvIhVzyAHdFkPQDeslt13BQf1L8s0JMCv6+WqADHfSKNcuegdgLuKHUxA3V9vg+fIEg3CvibhV0qET9FF6R5j3sIHGlSosSw3fPyuqTHY+f6Y5JNjs/gQMQMjuYWtRjL4hRyxkHyqiIFs3nawjLxkezQgbECWDD8vYLmrK4MNtY=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45KmkYnCcU4ocCBz1RBywnpKdOFQ3ioDlUYAKKY8tUZVvcl1LqpYVrdGxq9TKO+nPIsvq/6BXyyS2YwimoQnO0NMQ==</encrypted>]]>
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
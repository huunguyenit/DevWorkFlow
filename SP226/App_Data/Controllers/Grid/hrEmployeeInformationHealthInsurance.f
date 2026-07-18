<?xml version="1.0" encoding="utf-8"?>

<grid table="hrttctyt" code="stt_rec, stt_rec0" order="ngay_hl_tu" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <partition table="hrttctyt" prime="hrttctyt" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" width="100">
      <header v="Hiệu lực từ ngày" e="Effective from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Effective to"></header>
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
      <field name="dien_giai"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiKDEJHQrfeoDW4aIWXvdEMRTS1jH65mO0INJQArzrZ2+OEmpq9uKsY8Jf0b+JuTswM9nfN3KGDZoi3vE8tHjkY1Z3G22NzW91sKbjOZQgbUF</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPvmytVmaNKyp7hIMTc6xakMKHso3IF0wZf9LD2IcXgodObkCY10Q8Ip5OgsW/LtYZHdXyGUgj7sX/vdxye0fQJ8hxqWwn+56ATtikkRr4y8</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hnkwa1m1R86TN1j29SH+9+Tq7L4k1e+MJDcRtLdzETAW1JFq8repD0DtNA5KNiZSguDLF7j21HZPLITBF8XqRNbufQqKyaDVWWQ6G7dB4azuQXq9ZENEDsCS0bQGG401m/14Sp2MQ/x3VtU75JRcPRHwjyIhM5A95jCvHqCZi3PdnsCdZ1vfoekJx/oD5iOI8vnBGN0Hnl6hs96hCfw6QGPomWtMlSxOlBuLVnXJ51CRVsV2U3Qc0G8mMZwaqRgiV3iLa668wr8nAGY/nwu8rY/ejsZG6t3uq1iVMylPH5F26x3mWoQiwv8CWL8FMOyuvcf+ta4l22psFa/2ripdieywkg+fxT48UGfjyCOqoYwKL47MKCGlv3b1I+AMOzFei8=</encrypted>]]>
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
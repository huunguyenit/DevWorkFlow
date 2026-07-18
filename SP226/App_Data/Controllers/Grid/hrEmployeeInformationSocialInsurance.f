<?xml version="1.0" encoding="utf-8"?>

<grid table="hrttctxh" code="stt_rec, stt_rec0" order="ngay_hl_tu" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <partition table="hrttctxh" prime="hrttctxh" field="" expression="''" increase="{0}" default=""/>

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
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiKDEJHQrfeoDW4aIWXvdEMT46onr5JW0ILaXxjJXDaKNBDsxIaCe7KUkzJ8+OxZVx3Uc5iDdB4TZKAnAOXyqGs2gt1SNRK7SjzY0wvMqkHe2</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPvmytVmaNKyp7hIMTc6xamp8c56ZtHzpvOdsV9vgF7usik8nHrJ/rOcsqj1/SLoTONzD+a9rxWNfYEeDTLgWpr9+r9EsVb74Dj8u7iIFBOm</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hm+5sKrGW79NlPcbqhVpCQzleDiLJzK/8nfczNFzS74yOKTDrQVESAq2EpeDKnW6VoKOav87OI3tBuuK/jer2woD1ug1LWkwG2ixV+Ps6+lSCz492/Rwh4JSUuEoI9LTFSwyM9jTKmn29vTGTWqVtA/geGJxQvjhqTP8W8j6AiB96RZlUUagdZ9Btm3SAP36SzatTNB82g5BBEdbBV1yd88bvsQfZMV20nKwysUSmBvA+nwkE5DV3gLLkAhWF4HZvSXyt/ZPTixkgKDt/JxkXsc99kINKoVbERY6Z8PlNnIMA67R7+mAna+JT4ej133H8iBCsQNEBU+2CmeUHFBx9Wxdiei4oCyohKw3v+LxWxZqJVuFV0PoGazKnI93KdP0W4=</encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<grid table="hrttcttn" code="stt_rec, stt_rec0" order="ngay_hl_tu" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <partition table="hrttcttn" prime="hrttcttn" field="" expression="''" increase="{0}" default=""/>

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
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiKDEJHQrfeoDW4aIWXvdEMRk4jD3p/Sid5EtAllmvwj0aDQZmdGyyM6lgodlEekRdWdVTqQfLpRk1KHZv8vfS1l3tsy25+T+8ixXEumeL9CB</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPvmytVmaNKyp7hIMTc6xalAgcUxO/XexsPeL9c+y3x1BmjNn2yrJ1NGtTZdMUIMOpEF2dGhyNvz87qg85H1Cyeb4S8zLVjzy1PgQ3OLOfG9hCUqV50ciTceJG2AHXB1Bg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlJMzu4tW1RB+1Fx3iiw+e2U1yoE2y9pNR18FFnlqxhM0aY5HX+/t/vYTn7TzQyZqJFYAZJPrc31c4BL+r33+GCdLZ7wCFXCwZbtCM0c3fJpKl27zyTh2cKkLmfLT9WblWz2+jiOAj0rVvcpjXOkYbHwxy+XTGKJRkbGDa0dgN/epDDwEzho7ipW4TJ9t8qWQpif432DHJTmKcrIPh+Vu8HN6I2eAUNSGNx/8NUMnm3wmOPHF6gWFsXqGf64F01W4cxTOXN3JObD0E5hFMUqNlUNYVb3YE8WFSqRMENMvOafKHiXoJ2QA6hQebQfBSqqPDFpM9keSeIRZcjul6NkRcPnRW0vmkvscq13QdGt9rtcINvbSsGSxNx1x//rcPNVnc=</encrypted>]]>
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
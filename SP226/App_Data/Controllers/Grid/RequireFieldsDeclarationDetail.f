<?xml version="1.0" encoding="utf-8"?>

<grid table="ctdmbbnct" type="Detail" code="stt_rec" order="line_nbr" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="stt_rec" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>

    <field name="ma_truong" width="100" allowNulls="false" aliasName="a">
      <header v="Mã trường" e="Field Code"></header>
      <items style="AutoComplete" controller="RequiredFieldLookup" reference="ten_truong%l" key="(controller = '{[$controller]}' or (controller is null and charindex(',' + ma_truong + ',', (select ',' + replace(rtrim(hide), ' ', '') + ',' from voucherinfo where ma_ct = '{[$ma_ct]}')) = 0)) and status = 1" check="controller = '{[$controller]}' or controller is null"/>
    </field>
    <field name="ten_truong%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="150" aliasName="c">
      <header v="Tên trường" e="Field Name"></header>
    </field>

    <field name="ma_dvcs" width="100" aliasName="a">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Entity" reference="ten_dvcs%l" key="status = '1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" hidden="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên" e="Description"></header>
    </field>

    <field name="ds_tk" width="300" aliasName="a">
      <header v="Danh sách tài khoản" e="Accounts"></header>
      <items style="Lookup" controller="Account" key="status = '1'"/>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="ma_truong"/>
      <field name="ten_truong%l"/>
      <field name="ma_dvcs"/>
      <field name="ten_dvcs%l"/>
      <field name="ds_tk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBHwD6V3UunWN6aIVgRxH55nSIipztr/Cfxm9sY193qrE5PbJ+DOtQRT2bFsADKpQYbArPco9NMcDkePlfVrVIDIYHdaHay01O/YZXkqqLaY</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8h842utXmI8+w0DR4Pq8eukY3VMXqTxKAls774gLWiQsuphsy/3LpVOVTfb19deM27ai8Hf5ih7bQdKl4QTc7sA</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV3cWgSUjgKlReKY0mh6LQbv+oXjkZ8m0/v9CcjX4x0ebWfxujvQ0k7bYK9C6VHgOQ+6q57HhRJFsN9CRPpu7Zr6LFj4v0N6w0vFyrFbSG+kkexwRYEY/lJfe9sSPn4mifmRqihkJkmrD2rxJkXv4a4uMCXk5t9L1VJksjxPYv7trtX+WVcuWCXUtkzQcY6W8AiHCmliecuElqlb9IbgqWBsUoVtw8IhnW2dJoZoiQawt8G+LCFxWg6TGcdb61U7lGMV3/HdvPVCGh/I+PNbKWyAslom53YLognSDf66x6ZazLcw/pyXCxYhA9ABw+B1OzG4s3QgblCsD0bn1BoI7IjOMNhj9j8mFt51PwgUDn+vdPQ75n3ajMM8q5Lw0wcpK1Ivw3YvePH26b3SDQ2Ikk4p3/M/fUzm9AORtkU3xBzpSP+ZfIA6N552oO+MI3LkS8ag+p6fANczCK1i3yIVQa1tPIozIVJdhftDXBCGZFPP</Encrypted>]]>
    </text>
  </script>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8rIpOBcsD158VHnrS55aPZzHDkDN4jAYvlo6OlgxbLAF4u/6AwjqQtryC0mYzauVSV6qtvErKx8uzWNj+0pUxhcyyNF0JNUqoL3KbgyoCWCVNHAPwhadWjKiWprNlf++k9v0U3EyJb+e0W7sEc36B4AcvWrm/uXpZoY6X3yKnEnb076uTWCQx3tKmqdeQcxw/El9XfLr2I2J4qWXpRzPZAOS20jmZSTs0sOQ+NB4UTMMICRNJyVgoP6XO5d3e++8Ij8pasmyV6mrTMeFg5PkQN5UQ2qt89hz5ndwBXbb22umIGW3Pe24R1JjBpGsVFI7lMViSskwi31qqwSQRlWh3E=</Encrypted>]]>
      </text>
    </query>
  </queries>

</grid>
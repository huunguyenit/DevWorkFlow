<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY % ManagementObjectTransaction "INCLUDE">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;
]>

<grid table="dmpb1" code="stt_rec" order="line_nbr" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <partition table="dmpb1" prime="dmpb1" inquiry="" field="" expression="''" increase="{0}" default=""/>
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" allowNulls="false" width="100" aliasName="a">
      <header v="Tài khoản nhận" e="Receiving Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="b">
      <header v="Tên tài khoản" e="Description"></header>
    </field>

    <field name="tk_he_so" width="150" dataFormatString="@upperCaseFormat" aliasName="replace(replace(substring(a.tk_he_so, 0, charindex(';', a.tk_he_so)), ' ', ''), ',', ', ')">
      <header v="Ds tài khoản nợ" e="Debit Account"></header>
      <items style="Mask"></items>
    </field>
    <field name="tk_du" width="150" dataFormatString="@upperCaseFormat" aliasName="replace(replace(substring(a.tk_du, 0, charindex(';', a.tk_du)), ' ', ''), ',', ', ')">
      <header v="Ds tài khoản có" e="Credit Account"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_vv" isPrimaryKey="true" width="80" aliasName="a">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="c">
      <header v="Tên vụ việc" e="Job Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="80" aliasName="a">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ma_hd" isPrimaryKey="true" width="80" aliasName="a">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1" information="ma_hd$dmhd.ten_hd%l" new="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="d">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>

    &ManagementObjectTranDetailFields;

    <field name="ds_dk" width="0" hidden="true" allowContain="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="tk_he_so"/>
      <field name="tk_du"/>

      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="ma_bp"/>
      <field name="ma_hd"/>
      <field name="ten_hd%l"/>

      &ManagementObjectTranDetailViews;

      <field name="ds_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL752CmBzyWz03Q1JxFVvBFHEBUbEhxM5jR8xai1pChatZxafrxg15wC6WttIWBkw9FVANEI3NYc36U7L3j9ZSdtZw=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEFZENl+E/dEb3G/jkvZGxExlNVouUnxGaT09+xFzQpodNVRGb9pUNooMqZUqLmrohiFzGlPT03nuAlQsn+R52PTSBpiWJe3IbWL84TFW8t77/a70P3yrACoo1QuGnMSy4IBs6mEk6q7ah0zU3dnx7HfMr2KAPMUKYqPzlZPfv6JD2YnEEYj+emSKVxjVYHEQMFeoYwUY59OCSVjTPaG0FE0Wy1noL7+BLZ3ufdnrhWAdBhsQYBH9dCyn3aHy00AlewciTlWHQHKnMBGMTRnZOJsqtdJc4czSTAQ21MdZObxZWBqJorEpLOWRinAn56WBXHg4nhn7rlD3QZFoyoc9cvPQnajdVLJ7kyHJwzx/S2p8=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNKyrn0cM6jkbscC3QA5Esue6oLCYmWXT03mgmhgmqGb1QHzzDTql3Vl2CCmo8cGdBURx0P7zx7k6fQJBiVsMFM0rKyTJHvWmoEKtez1LUvA</Encrypted>]]>&ManagementObjectTranDetailQuery;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNLeWL1tFO9gIOfVQTfzRLMk4eylVj8iq6U6X12CXu3PfPVOSBt7kOFsG7o5L3/JvmA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu39PU2peMcOwZIaD+XcTJiHtGxjbkGqJBEylB9coqKjVbTwjBjtHHA/igUF4v9KUpgA/UaZ7YtGF2LVSfThLSxd3SOpv9b+ipybDydXwMGg6Ne5GtBRobC+Ylc7j8vsgro1aNXt+zxeOoy/S4dceOgyvdB5D9zc5lt8JjtStdsbODhjNNBv4BMCd0+Q3OkG00w==</Encrypted>]]>
    </text>
  </css>

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
    <button command="AddDetail">
      <title v="Khai báo chi tiết$" e="Detail$"></title>
    </button>
    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
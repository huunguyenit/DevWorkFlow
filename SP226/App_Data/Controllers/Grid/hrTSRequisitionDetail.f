<?xml version="1.0" encoding="utf-8"?>

<grid table="hrccctyccp" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="H13" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrccctyccp" prime="hrccctyccp" inquiry="hriccyccp" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_nv" external="true" defaultValue="''" width="100" allowNulls="false" aliasName="rtrim(b.ma_nv)" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bb/qspxo/In64/zacjRF5X0sQs7qjzsK/7ycA1fO/E2hCBritmFMBqCB7q4j2cRoj8JJTybAnIhdrhG1LEorqk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true" inactivate="true" width="150" defaultValue="rtrim(ho_nv) + space(1) + rtrim(ten_nv)">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ma_cc" width="100" allowNulls="false" aliasName="a">
      <header v="Mã công cụ" e="Tool &#38; Supply Code"></header>
      <items style="AutoComplete" controller="hrTSList" reference="ten_cc%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_cc%l" readOnly="true" external="true" inactivate="true" width="300" defaultValue="''" aliasName="c">
      <header v="Tên công cụ" e="Tool &#38; Supply Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" allowNulls="false" clientDefault="0" width="100">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hh" width="100" type="DateTime" dataFormatString="@datetimeFormat" clientDefault="Default" align="left">
      <header v="Ngày hết hạn" e="Expiry Date"></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec_nv" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true" aliasName="a">
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
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="ma_cc"/>
      <field name="ten_cc%l"/>
      <field name="so_luong"/>
      <field name="ngay_hh"/>
      <field name="ghi_chu"/>
      <field name="stt_rec_nv"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEAwYZcB3DJ8VktUj+e3SXGjczj1lep4VPWDCjgMPhpa1fEHNjQWSNnP+L5HW2+aw2KMK4ARQr0FhSZpawW0IWzjjdO6ZC6QYzefOEh80EaTyzu66ibwgVYFijuvs6JU+6ONPxh7BCQU/rEbxWVu8OcRUQLOZm2uJD/buzdRj9lNEm1bGe3H7zQZAz79HAjvV+GiNamVJLTIxdvBj0iFUiAJf1isZrAUpBf7uycVoiSBvoji4puuK6u8rFcWYbDgOZtDxj6wSsLJMw7k7t5t/XsmUBxsieyKhPwMQkKwQJvD5Pdrpt4Gd2zf5sjlbE9F3oQeK/fjz82EH9jdKaXzvEm6ZX3akxOKR9u4uplgqCMZC6X0u1RkqiRcyZDhmVCJWqkMdA0Ba81udue7Wk4jALZiLwmkJMnhKqKd2deEpniakG/ANmLn6vJgUBRzcAnk3z9ZFxPY82TeD649rztK7xnQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="EmployeeID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWNRE7oibOz15UAauBnUtmvG2plJ0n8VduM9zqgaRb4YlgHc2QW3PV5HfWGJB4RT7LQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSE9lpqvYo/pe/te+bQwVILLwzF5t8H+o2aDrlhsSVUOj50dsGrl42xjOsltZ0/dmvtmj3OFlIAeY6F1sLhLDjisIfipRJnpvNr14KEBOZtaUvqO3R8Nfsx4IE702b9ydsw==</Encrypted>]]>
      </text>
    </query>
  </queries>

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

    <button command="Separate">
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
<?xml version="1.0" encoding="utf-8"?>

<grid table="hrccctgiam" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="H06" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrccctgiam" prime="hrccctgiam" inquiry="hriccgiam" field="ngay_ct" expression="''" increase="{0}" default=""/>

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
    <field name="loai" width="100" allowNulls="false" aliasName="a">
      <header v="Loại giảm" e="Decrease Type"></header>
      <items style="AutoComplete" controller="hrTSDecreaseType" reference="ten_loai%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" allowNulls="false" clientDefault="0" width="100">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hh" width="100" type="DateTime" dataFormatString="@datetimeFormat" clientDefault="Default" align="left">
      <header v="Ngày hết hạn" e="Expiry Date"></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Lý do" e="Reason"></header>
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
      <field name="loai"/>
      <field name="ten_loai%l"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKaiCJDPkl9c450L/15/d9Lpb9GxPgsFMkAY0IboiRenoxYDp+1+4HHoahZY5/ecN1HC1UrtiADA4nGRQE7WlYt7T2h1xVX50fNHbbUhZ27Dexfrb0lEHb2wQ4gYYyG2IyAqTII4zq4UCIpondt2NP2GDxDdnaglTpz/1dWIRYTRsl2WdlJBFNelXbzdRoFvLvzFxPAbrPd/AHrTlYrk5WDbqJwAxrsIuucgVD/ceWuZxtSWc564EvH5KC6ZacEvtcKcV+h+dwAHMYyURp2qRpCuF78nMVIHnqo0PTRvp20ECOmvlun4XN7DjJe0M2Ka9ClA+Z9hrVZ3HGdIqoIgEQW9+jACIQRDXoKpuT+leiiu6K8scszs/0rOF/+B3W7T2uwNXVK9UmC/rkPU2MDB048m76snBzcrFgLuLbwuPFxkO/80t9qI9NyYxCuxzUcAQ5GV8K+y77GshksuPbF8rxySjyKsX6a1g/cnXWrsVt2d80W1ZVh9pTioPf8JVNOK0Q</Encrypted>]]>
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

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
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
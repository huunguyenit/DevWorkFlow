<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
]>

<grid table="hrccctcp" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="H05" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrccctcp" prime="hrccctcp" inquiry="hricccp" field="ngay_ct" expression="''" increase="{0}" default=""/>

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


    <field name="yc_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Yêu cầu" e="Recruitment"></header>
    </field>
    <field name="yc_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
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

    <field name="stt_rec_yc" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0yc" width="0" hidden="true" aliasName="a">
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
      <field name="yc_so"/>
      <field name="yc_ln"/>
      <field name="ghi_chu"/>
      <field name="stt_rec_nv"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_yc"/>
      <field name="stt_rec0yc"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKaiCJDPkl9c450L/15/d9Lpb9GxPgsFMkAY0IboiRenoxYDp+1+4HHoahZY5/ecN1u62BqDrI1i/vRWWBqtw6Y57PpLproJXneWHMO9kOIDiAKFnFsJxgPCCHhQ/AZqJb4QpiVkNgfOFVXYjWyUAp+y9TlMzAB8+JR/R1bqE+nD0ZNMqVe58Vo7/eJRq/LxBqQ3CZ1Y+OYRwmUyqVFfMbYZ+vcB2q1JFHAvidE9xB4y63Dc0y97PpMRIaoD8WFSwArrrBJNhq7SSYRC26YQD1oVWOQ/sywBWKOXmnD8CrBeoiOUiZ2pFimWpUNNDc4FPDGQuP//+6c1tHfmYycCMDghkk+rqB5DE8ntrTuL4OGfaWEgetOJhUJ2IdhkdX777PN+t9C1eC+6jtD4jQyiqKaQ7Y/8h7kepnMdXCAnwp2VX/Hx4DrJiliZNmBEh/i+DWFxvP+peUSrL2lQlwFwH1PKFH9k2At5l9SpsyQghkHjwGTGL1agOFE3794wtAJMyx47XrzSRz1OhWKAJgpF9+Wh/Pb2+g3mzljKlhfOelsBctEc8/e0lIEzq/P2Ve3GNMisKBhGMu+KQBTzePzvjY0AE86GPz29bwMYnRQa3QcvWld/SZATCFH/kZTx4xXwBsXRsNNCcn41dGFAM44V50+XR8u6uhf4dw2eujusjAzVnUdzEs7Xn+lZJuAIMIM20bQg5Qv7YFBkejddi1vok/SPpHTJKLX3vydQlJoQMjewWyTHyH0+kLxPByZADxMHAF</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
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

    <button command="Retrieve">
      <title v="Lấy số liệu từ phiếu yêu cầu cấp phát công cụ, dụng cụ$$90" e="Extract Data from Tool &#38; Supply Requisition Form$$120"></title>
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
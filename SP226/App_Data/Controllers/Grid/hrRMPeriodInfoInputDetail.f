<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
]>

<grid table="hrrmdotct" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="H11" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrrmdotct" prime="hrrmdotct" inquiry="hrirmdot" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_vtr" width="100" allowNulls="false" aliasName="a">
      <header v="Mã vị trí" e="Position Code"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1=1" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrNi9tJBbW4VuT19vebII1ROl/RyWQewcxQEThLrDlm7LiMCmkVrmFXp9D9M40OF30=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="150" aliasName="c">
      <header v="Tên vị trí" e="Position Name"></header>
    </field>
    <field name="ma_bp" width="100" allowNulls="false" aliasName="a">
      <header v="Mã bộ phận" e="Department Code"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="### ##0" allowNulls="false" width="80" align="right" aliasName="a">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ht" width="100" aliasName="a">
      <header v="Hình thức thi tuyển" e="Examination Form"></header>
      <items style="AutoComplete" reference="ten_mau%l" controller="hrRMExaminationForm" key="ma_vtr = '{$%c$%r.[ma_vtr]}'" check="ma_vtr = '{$%c$%r.[ma_vtr]}'" information="ma_ht$hrrmhttt.ten_ht%l"/>
    </field>
    <field name="ten_mau%l" external="true" hidden="true" width="0" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_dot" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>

    <field name="so_yc" width="100" readOnly="true" inactivate="true" align="right" aliasName="a">
      <header v="Phiếu yêu cầu" e="Recruitment Request"></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
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
      <field name="ma_vtr"/>
      <field name="ten_vtr%l"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="so_luong"/>
      <field name="ma_ht"/>
      <field name="ten_mau%l"/>


      <field name="stt_rec"/>
      <field name="ma_dot"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="so_yc"/>

      <field name="ghi_chu"/>

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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kLDeym8xloFZHAXKgnrjfOmt7EsuHiwpyiyJb8b6q/hQjMUSYN2+pOVc3ZcZu2YrD1IDLFfKt/CtnFtKP0KMjaSV9s3uqoOh+HSnMvmfp3bIN10rragef3kyCOPq3Xtmm0URIJ4e6snxX+556eL93mIO42RnNGXIJgqcMNA/YYRZ3i+nw1rKFJwrmysy6f1c4InDh9CqzNwz8QjYl4BezjGRe3xK01O0s8EUaeuTMQgPkfZ6JT4KUIercM2J1W2QgGz2e+VY+MFM3AIC4+G36HPK6RzbmRtrWx8uzXXzu5ALHkkPnIW4Z7Prz7/+CRV03dwM1PiIz/bD5QSpVmhIrlWgoce93OtA6E6Qfg8HFt37T3B14/rqMFET25TqLdvhqtRNAZbE4vt0COLLtgfYgh2aoI0qIOhWTY40VLtuwqa1xN9Y9y4JzVUr2bRSQk1F2fvFcTO1YbxaPi4DWbhYdkQ13/3sSoECzFP8XWdIs3WDsz5maa5dImhwJ3KNUBC3PrWFZCdHcz8IxIH1mInVB6N4mTrAPbW66r3k/ss8aP0BeSfHUWtz+zeJ1J4JsaZnBnR+AcLole6GamVkhOuCKn+tyKjBtaMBOzLz/RZdeJdcPSlHWFoPVnUVvouOWnu3yg==</Encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSE79m6etudKEADuRNDNK1tkOHc3Yo8XCbdSe9oUYJSHTljRqE3NLLi/zJ83FbWX7VFVI0TE8zi+JhPTdtYKA9hLIA3L+A/4TnD/EFh7F8XqxjfJ2cn5xiAD9kFRCgxt1DQ==</Encrypted>]]>
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
      <title v="Lấy số liệu từ phiếu yêu cầu tuyển dụng$$90" e="Extract Data from Recruitment Request Form$$120"></title>
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
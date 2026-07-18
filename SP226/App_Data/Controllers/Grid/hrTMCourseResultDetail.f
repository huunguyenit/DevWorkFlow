<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrTMCourseResult">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYSwSI69qM2IsqM8QgkT3/Utwly19tXWqrwz+YdUGmc+WAJ7WTgnb4n4PgFxhLOmjvFIfDlclFz6R4RpsvILijg60Aav2CPQQqnsrFFkASHMl74Kd5jBte/I/kfbaTxejAGw8HqClqJpmqUzwzGh0pCWpsFQYtj5yTh5oUeihH93nYcbUGxX1RPbpqYuJ75NPOtd2dk6tzy08VqhwNgjSfEFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="hrdtctkq" code="a.stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="H09" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrdtctkq" prime="hrdtctkq" inquiry="hridtkq" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_nv" allowNulls="false" width="100" aliasName="b">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQp9eTAb1JdVAnOSAxYYh/e8SzbGsPhRgnDhM4gBAS3q7OliI2+ID/lMt4tLCAzd/W8=</Encrypted>]]></clientScript>
    </field>
    <field name="ten" readOnly="true" external="true" defaultValue="''" inactivate="true" width="150" aliasName="b">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>

    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="150" aliasName="b">
      <header v="Vị trí" e="Job Position"></header>
    </field>
    <field name="diem" type="Decimal" dataFormatString="@markInputFormat" width="100" align="right" aliasName="a">
      <header v="Điểm số" e="Mark"></header>
      <items style="Numeric"></items>
    </field>
    <field name="xep_loai" width="100" aliasName="a">
      <header v="Xếp loại" e="Grade"></header>
      <items style="AutoComplete" reference="ten_loai%l" controller="hrTMGradeList" key="status = '1'" check="1 = 1" information="ma_loai$hrdmxldt.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" external="true" hidden="true" width="0" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="dat_yn" type="Boolean" width="80" aliasName="a">
      <header v="Kết quả" e="Result"></header>
      <items style="CheckBox"/>
    </field>
    <field name="chung_chi" width="300" aliasName="a">
      <header v="Chứng chỉ" e="Certificate"></header>
    </field>
    <field name="ngay_cap" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" aliasName="a">
      <header v="Ngày cấp" e="Date of Issue"></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" aliasName="a">
      <header v="Hiệu lực từ ngày" e="Effective Date from"></header>
    </field>
    <field name="ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" aliasName="a">
      <header v="Đến ngày" e="Effective Date to"></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec_nv" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten"/>

      <field name="ten_bp%l"/>
      <field name="ten_vtr%l"/>
      <field name="diem"/>
      <field name="xep_loai"/>
      <field name="ten_loai%l"/>
      <field name="dat_yn"/>
      <field name="chung_chi"/>
      <field name="ngay_cap"/>
      <field name="ngay_hl"/>
      <field name="ngay_hh"/>
      <field name="ghi_chu"/>

      <field name="stt_rec"/>
      <field name="stt_rec_nv"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwzZMc2K6gBUwwfyOaI8TS9eky/hMe8FWtNGE6e2M21MMsz3+OsLfX79aR3LcoV1wNGt6Qj6F7QRNOGSrrfFamFGcXFWmT5US+OLJFeThRFCoqNXD8+Pb64SVGJaaRaqXA=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEAwYZcB3DJ8VktUj+e3SXGjczj1lep4VPWDCjgMPhpa1fEHNjQWSNnP+L5HW2+aw2KMK4ARQr0FhSZpawW0IWzjjdO6ZC6QYzefOEh80EaTwuLvfzVbvksSf0J62tPTdiLUxWss/22g/1h9/ud4Zq6+5O9OBkHDvcQGfIv1o7CQmxvA09kmD3g2C0rSNxg+8rpYLfyv6YSYxgXiMJQ9g/ly4s9EKX8BbQl9F43dmG7GUK/caPamXWO6J8AbZu4ow4c2XgTTEi5cCfyv3fZzJkje47qcI29um10Eo1QeppViejm/Vg+d65kf7gprmP+RgEpkGfjDPra7tp/mZFdvclXkGInF1JkXxeC1TsfNNvrhSaNpESdGQSIjn+NcY/LJvs+kBY8FVEhdpvw//TXys6kDzkTdjaOHJ7cWRP2iMyMj/W1wp3uoezwoNlVXK/hKLK2gbQt7RzmY38jnhJTeZc2CIkjfWhcVM3bSN/Axo7+3Ri9dnRm2WxBSH9xgPKzeWwce+Lre7dCkV7kenFTBBe7qVAB0YJUerpeQ0so6dr4wjbPaf1c15SWOcSmp6Mk7wvEXG8ZaRbWgU8CJ73s+QUqTdbUxQYR1UTN+9iAF5WGpSrrxMAvBROyLwr7RsQI3d1o+0NoqXPx7FjAt7VkRmaMqi+ND5rLh9et/eRARD0TjIYDr7HNWMslAWVuJvr61sBBefkBSfqIEjA51nXqRLjq4y4qCcumfzUSwiBTvouHz0OcldcxrfJHAIaOXl8wM9bUIZQNz2YdNIOy47ksGLWAg==</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Employee">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5QnKJe/8lIvMI4BOFbpmSzE/JOS0QrFekoAv5Mku6Nv27nKM7DuTSBC0rtPuw+GF/W/639+wXXHjPklLuIk+WlTtPKnKrbRx757jN8a9N/IgYE212IpHOLg5c/68W+XxU=</Encrypted>]]>
      </text>
    </action>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSDV49hXpphWWPk0sSDatADNXOFFI4QHp9oxOvflEiLptYTS0vM9wh5xQmpV2WIklODrTMf7doA2wuaNK9sTHwbIGZ5ZYko7JFCVYlgjmyMvs</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+avxtQ58FqDl+auj1EQWwj5dfinL5IP8rhT8LzRDfvuUBgD2MNAtzN1DiOZa52FE8IuRDX2Y2OwROitpbvZAnJR</Encrypted>]]>
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
    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="Retrieve">
      <title v="Lấy số liệu từ thông tin khóa học$$90" e="Extract Data from Training Course Information$$120"></title>
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
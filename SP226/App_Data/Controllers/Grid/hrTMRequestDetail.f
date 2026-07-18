<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrTMRequest">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVavw2VZFIS7bPrkzpUUmDQRji+SgDiKER6rqMkyQGXu/j4yKpfHRIGriVKI0qoAnUCaJSi4UOMr3xqdlOhg9J0D8xtQ2bPgpgZBk+NILH0NiMZGFJnArbe/Y6CaW97pyWIW2qKeIcNjcrvVOz1wlqHc71aUPi79mJZoHQop3gllAW7ULmW454s6TLZtFVT2frodFNAFHLfVwZCz3r5tARyKFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>


<grid table="hrdtctyc" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="H07" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrdtctyc" prime="hrdtctyc" inquiry="hridtyc" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_nv" external="true" defaultValue="''" width="100" allowNulls="false" aliasName="rtrim(b.ma_nv)" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bb/qspxo/In64/zacjRF5X0sQs7qjzsK/7ycA1fO/E2hCBritmFMBqCB7q4j2cRoj8JJTybAnIhdrhG1LEorqk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true" inactivate="true" width="150" defaultValue="rtrim(ho_nv) + space(1) + rtrim(ten_nv)">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" inactivate="true" width="150" aliasName="c">
      <header v="Vị trí công việc" e="Job Position"></header>
    </field>
    <field name="ma_mh" allowNulls="false" width="100">
      <header v="Môn học" e="Subject"></header>
      <items style="AutoComplete" controller="hrTMSubjectList" reference="ten_mh%l" key="status = '1'" check="1 = 1" information="ma_mh$hrdmmh.ten_mh%l"/>
    </field>
    <field name="ten_mh%l" external="true" defaultValue="''" hidden="true" width="0" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Yêu cầu từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Đến ngày" e="To Date"></header>
    </field>
    <field name="loai_hinh_dt" width="100" allowNulls="false">
      <header v="Loại hình đào tạo" e="Training Type"></header>
      <items style="AutoComplete" controller="hrTMTypeList" reference="ten_loai_dt%l" key="status = '1'" check="1 = 1" information="ma_loai$hrdmlhdt.ten_loai%l"/>
    </field>
    <field name="ten_loai_dt%l" external="true" hidden="true" width="0" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
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
      <field name="ten_vtr%l"/>
      <field name="ma_mh"/>
      <field name="ten_mh%l"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="loai_hinh_dt"/>
      <field name="ten_loai_dt%l"/>
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
        &CreateTicket; <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwzZMc2K6gBUwwfyOaI8TS9eky/hMe8FWtNGE6e2M21MMsz3+OsLfX79aR3LcoV1wNGt6Qj6F7QRNOGSrrfFamFGcXFWmT5US+OLJFeThRFCoqNXD8+Pb64SVGJaaRaqXA=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKaiCJDPkl9c450L/15/d9Lpb9GxPgsFMkAY0IboiRenoxYDp+1+4HHoahZY5/ecN1u62BqDrI1i/vRWWBqtw6Y57PpLproJXneWHMO9kOIDiAKFnFsJxgPCCHhQ/AZqJb4QpiVkNgfOFVXYjWyUAp+y9TlMzAB8+JR/R1bqE+nD0ZNMqVe58Vo7/eJRq/LxBq390Npi93ExZ4pOfstnBQZ0ANmWZ3CGkAk7dZ27Pe/jpA1/uYwSNpefHE+eyaZpYb0ETas4pUaJsC9BwEQx2d5M+zwp0SJbaQOeFYq++Y7rx4xsXHOIFQZRc8uEOAWROGYks2NvrBlUSmE+V9LNIhFMjEcMBve+U/e2E5pp8UiRoKyl5sfCx1YoIXFewxGgjFiHWWfLxTqc1/ECuXE7vKXtQmwJCmJ+ZfE8beSoOYntVRYyUZXjyQIEq8IoS1BSVA1jFbiQiLCtW8e3zExvotGlkdjlA5FzdceUNc6I7nZMotskYjWlHXghQ/O56r7Q94G7g8jXX51APYosJwCgbnYyO03ICu8CHIDYTxYfa1uaz9nSxC0ErTZlMCX2YuOZh5TpL+LDuKxQubIlAL2Nc/9vVmoDEggsjosZhb3ByLcSM=</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="EmployeeID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTtaWcGdqBr39H/c2kL8is+SvMmHoC55J5piDfHM8XyVjUPbYA4g8wFohWmHbehT2tNgr3DKFoiZes9+wHauUeWHvJYYQoye6O7iHoXvVGMD07eTIaONVvPDz9Tm0ikeHiGoyMPYNqf4PzYCK33l5CwPfXDvsMuHgR0cZ069Z2/Cc3ODeqOoGlnuAi+abB6uJjD5XGVmxqflHxbg4jOeJHtyDt6beFe3VotnpahGOJPoIUjFO0fS4AYJMFCagZfUlkpVt46LfaBXc/LdcVysv+fc36ttWa24iM4sVD+YNtiXk=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSE9lpqvYo/pe/te+bQwVILLwzF5t8H+o2aDrlhsSVUOjXGiM0krUO6PPxl1Wmev+C+tK0xRXtQfGL3se8cVZkHk00G6gRdNtwrz2cNvoUTxdxSOfFG6eLncxipzUb1Nl3y9Fv7SoUZD0rSvFilOPK1c=</Encrypted>]]>
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

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
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
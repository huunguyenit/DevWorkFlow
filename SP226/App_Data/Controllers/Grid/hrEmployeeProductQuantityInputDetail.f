<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrEmployeeProductQuantityInput">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbUBOIUa6QGxLBJ9/j5Emo94gmrnW548vnDoF3oAqvzxEs2G/9PWDNA+DA9ghdrfUhI5e1StChiqzRUztXFMF4b2mwSC8LZanGdzTfDv/2kgcnaufPw/W5gFWsKLO5KzRWedZlJw30BrN3HQtovwrpgCFgY3pXJC62RXBMRdscKPzpSYY/UHgaI2sbh3OdrFwiEJ1/A9u1eygl/apZngAzGy96zbBXfthQCSCkTU3Ld4w==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="d03$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="L03" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c03$000000" prime="d03$" inquiry="i03$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_nv" external="true" defaultValue="''" width="100" allowNulls="false" aliasName="rtrim(b.ma_nv)" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="bp_ref like case when '{[$bp_ref]}' &lt;&gt; '' then '{[$bp_ref]}%' else '''' end and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bb/qspxo/In64/zacjRF5X0sQs7qjzsK/7ycA1fO/E2hCBritmFMBqCB7q4j2cRoj8JJTybAnIhdrhG1LEorqk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true" inactivate="true" width="150" defaultValue="rtrim(ho_nv) + space(1) + rtrim(ten_nv)">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ma_sp" width="100" allowNulls="false" aliasName="a">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="hrProduct" reference="ten_sp%l" key="status = '1'" check="1=1" information="ma_sp$hrdmsp.ten_sp%l"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" width="100" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_nv" width="0" hidden="true">
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
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="so_luong"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>

      <field name="stt_rec_nv"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/dMtMnDmcip7QOXdz/wAQVIjmb9GIKh0p3FMTnu6DUhh7sF7+IkgoTHLYxl/mFWnux+ehPQev4QeBoZ7f9NgbXj4qGYSPTLevdwlaMEU3ReVlO7IXmLpp/c2oWn3zb7SQ==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKaiCJDPkl9c450L/15/d9Lpb9GxPgsFMkAY0IboiRenoxYDp+1+4HHoahZY5/ecN1u62BqDrI1i/vRWWBqtw6Y57PpLproJXneWHMO9kOIDiAKFnFsJxgPCCHhQ/AZqJb4QpiVkNgfOFVXYjWyUAp+y9TlMzAB8+JR/R1bqE+nD0ZNMqVe58Vo7/eJRq/LxBq390Npi93ExZ4pOfstnBQZ0ANmWZ3CGkAk7dZ27Pe/jpA1/uYwSNpefHE+eyaZpYb0ETas4pUaJsC9BwEQx2d5M+zwp0SJbaQOeFYq++Y7rx4xsXHOIFQZRc8uEOAWROGYks2NvrBlUSmE+V9LNIhFMjEcMBve+U/e2E5pp8UiRoKyl5sfCx1YoIXFewxGgjF7JllaWjsqjjblFT/6Z7FdqQ7GOlez0oy6H9rQRuRcaqiaHIgecA6+ue/l8KEF5yfkH1JVSsjA/ihUPVi+Of965z6hSbmKMvftVHGASicAIKf6HSqr6+WtSYuprJD4KO7Pw0qgMkRBc4C3slJ3QVo80qnhjz79bdinZmsGcM0qsRsHoIr3x5XDrhESF2vzmolzjqYNZ6B29ErozhXO6EeVcSILfh+HVeq1XjsRrqF0f8=</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="EmployeeID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWL0NrHOGvesS3m4DIirDcBS7JXr/l/3qRcO01MIdXu3uEuTGZI8MiEawePR02IeAvQ==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSE9lpqvYo/pe/te+bQwVILLwzF5t8H+o2aDrlhsSVUOjTSdmoDcNTpdAjhfFRTtQwdGSDvbDVtimdNH3F+juXnTQgOff2PKcNf4dEKIlJQojqkzTotEBHpI3NNuqF5DnkQ==</Encrypted>]]>
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
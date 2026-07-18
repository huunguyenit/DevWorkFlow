<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrDepartmentProductQuantityInput">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZ/HDcEWeMaKFDYVzlLnHhXHnqc1KhvQfJV1uDzNfq83tfWwSbDEMRCF3i7v0jzeNuJwl9lDZ2zUddvc5GYn3jPUZ912eSKbv5CcAXw/ta+Ma8iq1AYw5r0QX3rN0kVX+aT6VfwjI5aSmmhJUonQ/C6JQM1OzNS7plQGyJ4i5iUIWmmsz3d3AibRCj/XL1TY0C1JtwubFGl3JPJlXksoEq64eBiGqNE+luYGhqGKuEpeauKTrfcnkxK73aLz3XqA2I=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="d04$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="L04" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c04$000000" prime="d04$" inquiry="i04$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_bp" width="100" allowNulls="false" aliasName="a">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="bp_ref like case when '{[$bp_ref]}' &lt;&gt; '' then '{[$bp_ref]}%' else '''' end and status = '1'" check="bp_ref like case when '{[$bp_ref]}' &lt;&gt; '' then '{[$bp_ref]}%' else '''' end" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="200" aliasName="b">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ma_sp" width="100" allowNulls="false" aliasName="a">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="hrProduct" reference="ten_sp%l" key="status = '1'" check="1=1" information="ma_sp$hrdmsp.ten_sp%l"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="200" aliasName="c">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300">
      <header v="Ghi chú" e="Note"></header>
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
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="so_luong"/>
      <field name="dien_giai"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKaiCJDPkl9c450L/15/d9Lpb9GxPgsFMkAY0IboiRenoxYDp+1+4HHoahZY5/ecN1u62BqDrI1i/vRWWBqtw6Y57PpLproJXneWHMO9kOIDiAKFnFsJxgPCCHhQ/AZqJbNqmh57pA2hnsJuVjTnsZ9z1EscEdTbhiitmsPsB4WPjpWFW6ZyMhwixfhLWKbNyC05eFyMpvikT01b9rXIPgmkh41nBB8Eq0PbnRxit041IYGeJQEx/0SXmiieF4vq/aAbzHSAvtronNyJ9FSlDqxhzz1B3PuYI+ZaNNeyZsYl3qdt15w4rKwZ3n47nrqeqoW0JpHZ7jwg7AQ0fsDb4Js8GLUMB6meyyK5BdXDVrnkqXlsJjcH/JXgVyaRr2vbwAQQiBHi7g0x6CNkvyVMaUZBI7IrNRTsE3SOew14tTK1BinJnI/wdWPQW0f5VOVLCEWh3pfyGUFLZbNKnzKMSs/Tc63ZiR4HqFm/3+K+PGnAhQC5mDcWfcS0t9k5cOdHyq</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSE79m6etudKEADuRNDNK1tkpcW+YyEBtkcBuHDlG4Y7XCsrgyPpy3eIWif8EkRjMF0kkv7GlG/d6wD2nEMr+oEPn1CZFNiOP+DFND3tIUbABwFBjs/MqsdK1JAtWz40+vg==</Encrypted>]]>
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
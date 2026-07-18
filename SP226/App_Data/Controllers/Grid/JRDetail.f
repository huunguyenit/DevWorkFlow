<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\JRGrid.ent">
  %UserDefinedFields;

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "JRTran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVa6BPSdGcK/6SIpkLIuVHs4Xsr8s/yR5h+E8zGhDOYcp//rej94JU+5B22y9t4VPn4fMFMw+Q5PRGUKSvdjfcihTje0ckLeB1uee22nm8OUxWIRJMwYeIhSzYg6ls2m9Q64xAsxA3DUxZFuUsaJUz3ZLTkWX8kv61pGBu4EW3/cXe/05YC+pY7HARo6/tWH2k47wpaqepT+N/fb4Lb+rCRA8sNktskuIzHVvvt+efRd6ULcmsek2OEspMAeLPF6/3g=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="d29$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HD9" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c29$000000" prime="d29$" inquiry="i29$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk" width="100" allowNulls="false" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpWSXXgQX0CPEwohHC7OTUYem7aDAlbX4xe1RyyAa7R3DHmtfopjVzrMauXa38tgyU=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk%l">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="tk_cn" type="Decimal" readOnly="true" defaultValue="''" external="true" width="0" hidden="true" aliasName="b">
      <header v="Tk cong no" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c.ten_kh%l">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="120">
      <header v="Phát sinh nợ nt" e="FC Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="120">
      <header v="Phát sinh có nt" e="FC Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh nợ" e="Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh có" e="Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_tt" width="60" aliasName="a">
      <header v="Mã thanh toán" e="Payment Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="so_ct0" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" width="100" type="DateTime" clientDefault="Default" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="nh_dk" defaultValue="'1'" width="80" clientDefault="Default">
      <header v="Nhóm định khoản" e="Group"></header>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
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
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="tk_cn"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="dien_giai"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      &XMLUserDefinedViews;

      <field name="ma_tt"/>
      <field name="ten_tt%l"/>
      <field name="so_ct0"/>
      <field name="ngay_ct0"/>

      <field name="nh_dk"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDBhDHWunZE29U4VN3K7ZBtZ4NnaCkjizvGz4i4ubN06C62sS0tEIEKbAQoHzM7OG6jHMQ3WPuBQiD1OCVzFQX4kHzsn5TepCvFMIGfrm/Wxp4nEyRirxRIg++TX7viQFe/cjFljzPAySmjlJFqusRJcw82lnLgI7FZKdNWXO+pS4WYa4H0+x5D34HGQan+4UoFF0sbnR5qdSxtMKzwQGNrmM//DZcKGXGiHJs/ESDZnOLZT4o0tyDGgVnIi2yeuJ1fx5H9OBuZpiv3tkP6XMnV9wouOIXJmSdE2K8Y2afiN3N0rR4xtmpfchhk9vioa1wdDcTsX1pjaom3f56mwJXK34IKbyQOgMUdz4TeQzY0f6AAmwRy/5VvETLIKspQvMI+P2XRjHONCMDsKSNAVMjNvKYvB1SJGyT5waZ/xzZtdYzs2lL4c/eMl5RpnDji1HM4VocoInZ12WXqH2SrZ4KSbRrnG3MA78m9YpV9HmNRMP4K1gyz3nzWsthUdeidSJBN7aaXEFnLPBqaak2lYQUurAzaTy+ErWvia+Iulvt/k+7ucMq1JOcKdZjg5GG5lbgQ9qKLuwqyAJkYC912GwUNjz3Ts8zlGujVDWrCYPfYXsoiELj0+0z7DzX2f5dsPICH6DAFInlggSmDxKrUA6tPyQoxKYjr9tb0kf9TLPGYT1tpXybL19j1cPgUwjDFrYvKOXwbN+TAzhieGrzKqH7gGsVKDj8X8Y5uQw/9g98iw/NIAol8IPHYDiJsmKxCQBxQ3mzQ0Yq5mwuDcChKslAjBN1uZMcnTWC/b2ntTptUk+NmXErf54ab9IaB5ElCaVGOseTWjlDM9j1ij/f+9EFzm5gPUiSDDcVCb3vZs8XFjgMtZt8QUgSpmKxvoYb3VgmTd2rwLvBiY1vYGBhKwMBw8ZN/CD7+9wmX/Te9fZDYtRZLLdXVDWULyqHs0luGycm6qOgLEwWn4x871SckkZvXcF30IGvrFzaKFs2pFRzbPptwPcCYvy1PDaUdqMCieSUqp7dgLnFOgIDicw0TU2HshfKwhxKPpSVvIL01nFMrFTdaNHEmKE4fq3xReiU4zJS3r5piJDFs11jgaFpJkejfit8oZOeKPkElVA1TQC0wKTt9gNhbPsC1l6kKFz4RLQzieZ19VUa9ar6lHeoM6qQJnOLhILheRXPcsf01BDItZYMrsIfAUhbXiFm0n5zUABqw6D2+wKIkCVYTQ/hhNEOb5</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Account">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35Jc8oQ9NuZIOhCca0zCH4rH7iGQBd+ZHE69YeWoBKeATk9UTCGZLXxUKrtkm1ElP8uFBizULGz477EAJraYSLDWnw==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNKyrn0cM6jkbscC3QA5Esuwt2bjAP6mzr8u+6HZ/LEClmsPYrVaZlt1cNCYR7t6HY1m8ese3cV5S38ky1pMsGCUAN4djVb1K9gelOigsdkKH45GCCTI0+QascG4PNrN+Q==</Encrypted>]]>
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
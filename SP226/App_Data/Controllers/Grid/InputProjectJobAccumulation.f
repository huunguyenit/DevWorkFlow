<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "InputProjectJobAccumulation">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbean51ttfvyeZjwl4ZeLm9Z7fc0L/0lU2tpKdP9hnSmHclpi56H++lYdVU2TT2+HAwSSNWdWAfjXuS1/CWgMFZYpDncdo5E5ug3ODW5omT0n8gLg5MXBqMsr9n5Axv3+Gj/N0qYE8Z5sybf0k30oea6TQQhpJO0LqbIKOBSI0WC6NAuQlN8NitigdjAf6CpBPIAD/8IB9jEJFPgl2CypvVM88zLQWUxtuWdHNW1/DY735Tt9HJuAbvChM7R9QRV1U=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
]>

<grid table="vv20vvlkct" code="nam, ma_dvcs, ma_so, ma_vv" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, ma_so, ma_vv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào lũy kế theo chỉ tiêu vụ việc, công trình" e="Input Project/Job Accumulation by Job Norm"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật lũy kế theo chỉ tiêu vụ việc, công trình: thêm, sửa, xóa..." e="&SubTitleBalance.e;Input Project/Job Accumulation by Job Norm"></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true" hidden ="true" >
      <header v="Tên chỉ tiêu" e="Article Name"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã vụ việc" e="Job"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vụ việc" e="Description"></header>
    </field>
    <field name="lk_no" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế nợ" e="Dr. Amount"></header>
    </field>
    <field name="lk_co" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế có" e="Cr. Amount"></header>
    </field>
    <field name="lk_no_nt" width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế nợ nt" e="FC Dr. Amount"></header>
    </field>
    <field name="lk_co_nt" width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế có nt" e="FC Cr. Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>

      <field name="lk_no"/>
      <field name="lk_co"/>
      <field name="lk_no_nt"/>
      <field name="lk_co_nt"/>
    </view>
  </views>

  <commands>
    &SubTitleBalanceShowing;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89p85ItASuuESd6UsZDA1oUybhlfYvCrBZO0kpUi0yt2/Q==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXYogEUvqarUlDtEnQTivYjd1QbeuoCmyQaxltPoO4426xqms58plnmKhbXnyz+UI95+pG2i9fzWbumVRYBungwAD9RzDs9Wso7PsTQaXCkUbB7bKoBATxv10H7ooE+ra2Y0FkaApO8qNj6vQE5VvGFf9Yn6vXaiCkWa5970uYuwXRQSWt9WGMu1W6kRG2jhztzBPFIrOYfROdohz6ixuO0AnRFpOKO1hHuqbl3i1B9+wN/hAe0lb5wFeEkTaLjox5bb4EpTehd5A+wC1/pBmXPmmBUsJkr7PoL4F+Qwt5CBx3+t2QFt6x4qSboj9kBQCcqD5kx+ujR9b+E3KnlupFNyJotF1Fyv+55o7pqS5V4RFICFdoeQWQbKna28YRHaOEtl2IVWnWvBrnYnj5OSSaMVw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGs0P0CIxThknogj+7TRgBOWW+ryeM7Q3BXJ1DOs11j9JmkDNd4marT5Aymi1Em3rw4=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS9M8fDYRlH/tLaGZbF1Bd31nqFNn0mTppYvJIBEL3yQf4=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+KtPbSBw3ozeCQIA0bUaL7QqLh9ImGD2xX9+GVtua6LB1zGxQH4bwzeYsQ1LSnZJmukpgfY24CQ0jd9nytSrqQ5g==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATa04dMSYSXGKQDFIFb/o20G</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2nLvddig5/eUyfWZ5kjxhRxWmFnknDRDRkepQJZh/Izlk=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucDXRIFFn50U2np97XSqKulGUFHoVjzR6nzTldDGoKC4PIDGc/vPiKN7SK1u7pphX/fwpaNwyYv1SK9s86bdVFanZK6zC+21phCxwvbbEBSUjcrJPWs3P4at2Y1JMpgIe2F/Dr9FR+z9MFSEMv2A9png+bH5waEV5xrjQ7sel6pZPLLKWAaBbgvDWTkOuTYvnE=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1PdUlmnMNn8JPDEmCiQFG+1FlSxdXJz75TV5qGY3vD7WznqZK9k18/lCpFqftldqleN0DedQ8AqYWc0qUQ31P5NW7aSuqfhs7SRE3LkBOz6NeNW4CJ7hBGKlvy9FQ0/aYCMviAsbiHQkobWwa0ibKpRkBaT1qV6Dj9DHU00RCFkm7/xE9Uo17Z+ar5wVh9ZD5OFojaM/3vHf+mA1eFXerwBZYBijKMdXvqoQXDlG1q5EqaCpP0GvCIrgijy5CfvsM1dmqIMaywwcNNVHlNEFEaQ==</Encrypted>]]>
      &DowloadScript;
    </text>

  </script>
  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
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

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
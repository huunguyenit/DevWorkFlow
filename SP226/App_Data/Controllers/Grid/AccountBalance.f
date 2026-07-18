<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [

  <!ENTITY % AccountBalance SYSTEM "..\Include\AccountBalance.ent">
  %AccountBalance;
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;

  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  
  <!ENTITY TransferID "FastBusiness.Encryption.Begin$ZvP78aIpe5AeVOYLUkX8fdCUzNHOtchWTMemNzzlz/+cL7Ppm1muB/0FBzvb+ZiAFastBusiness.Encryption.End">
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbalyo8buUuJtLXVKHcA4GlXMk4u4nuQaGsGqfeBFkbjLdZBaraeKNCLKOfP0jYavUXxJsbHADFuihq0HGP5mTuWEXxGC2MFZ+vZMRZl1m0P319i6WtUW+LFLmlWPnBkZ6CbAHkdt0bHP3km+HbImGOZzeruwj30fIkJlzOUyQFDv7yx5QMGChus/HaU1XBCcI7pm5IUdirmSpp+it3C3T7NC1LOOTWEjnGS+BqwA+8qQ==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vcdtk" code="ma_dvcs, tk, nam" filter="&FilterCheckAccessUnit;" order="ma_dvcs, tk, nam" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào số dư đầu kỳ các tài khoản" e="Account Opening Balance"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin số dư đầu kỳ tài khoản..." e="&SubTitleBalance.e;Update Account Opening Balance..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" >
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
    <field name="du_no00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ" e="Debit Balance"></header>
    </field>
    <field name="du_co00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có" e="Credit Balance"></header>
    </field>
    <field name="du_no_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ nt" e="FC Dr. Balance"></header>
    </field>
    <field name="du_co_nt00"  width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có nt" e="FC Cr. Balance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="du_no00"/>
      <field name="du_co00"/>
      <field name="du_no_nt00"/>
      <field name="du_co_nt00"/>
    </view>
  </views>

  <commands>
    &SubTitleBalanceShowing;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89rIcGurznjdLw2YeMwg0RHPS3z2pr8R8lhVlxYb8HD4z6YklmRqztV8sDhiuoVefyQto8OV4zWJbs605KlY5lTDhgFJE/bFgweevvvozZv7rlUYRVCfoUjNkM9F6QmigUzz86MM1JStTZdJZ8DsG4DfF0jhSfmufQrGcccqT+fxcswbrIJIep9g3EquqPIf+v64QzHUOyoV3DEQC9VrRwS46CnL6C+WHoY5AltRH2gOMBPIx+PzuaHGLx4JxEr+fvJjuEcfNR5MHyoJTeG2qvpWU4VzTGTDlebvjDj9nVwR7hXBoHK7P8pIiP8Tp9rDDmy8V3bO0qHChh+ujW3Z0z/BhBBDABm169uLRod/zfR1OhV+ZSLLjHUxliFq9WKwERECc0Z5ripG+gBrJDvFviOKuZUrcq0JxZf7pKK2r63FAA==</Encrypted>]]>&AccountBalanceStoredConvert;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7N1kyt25QentJGX4u/7Zi2KtD06o5N6GIZ2yfTlbjVVAAySIbs6h0iJk20lY+3EWiSUT3EmJBG1lbgvQiKPgmFf/GYhh/V9+cqXmAlade1t+XE9BF+dGUvgbSekbi2uiplspbcUbTgtPpc++WY9V/nfSuYNvuqLenT3BFlujYSU6lyRaOQBirsGNtTTdopJncY43ty+zQ3rKlKXagYEfHjyY0fGrkCK0v5OAur/Pr1PZG+B9XoPdqvsaJ2lbsNkTTsQzn2axqedzJfj+ykjUe7LBnFAYpJOv1qzI//HJnEZ0CIn/Y/Xc/rZ5fBGPd1dtzYLLLmm9vjySrFAADE1W8CTwWwnEwQcMcvm+PInXDxEYrC8Cg0fmxhUmiidc4vN4v8PQ4+gz4nLmXaIWp39a0n95/st3hyaL8zDU0s+x9au5NYc7kA377NzNjwAmAFtTymmQjxRIPM44dBBROn4PhNM+uCYMSn0Lu6H5dG9LppakTyTe0dlWF3mcpY0xYGOvd1</Encrypted>]]>
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
    &ToolbarNew;
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    &ToolbarDelete;

    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
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

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>
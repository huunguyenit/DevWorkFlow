<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;

  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CustomerBalance">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZjBysd2l2r+Z+o4UNbSeDzX9Im7k/nUVZtQTjJPrY1V6U0xYxZbn66dqeXX4hdubZIAYPkvlkkOfk0OE4aBFNQaLAThI3mZ3e3oldRpAOcrZ6vl610RUOuHQ4b4euarqEu5OxuB/xDE2oFO7/c9iXHQX9qxiacLVwRRjOLqtvwIFsw2nkJH9rFDzPEVjtfBgHWaJWQuJ5LjCFMB94xkhXIFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vcdkh" code="nam, ma_dvcs, tk, ma_kh" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, tk, ma_kh" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Vào số dư công nợ đầu kỳ" e="Customer Opening Balance"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Information..."></subTitle>

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
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Mã kh/ncc" e="Code"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kh/ncc" e="Description"></header>
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
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89p3TRrc5R9ibYRs9Bnz9/4MmPPQ/1y9W+ARO8u9Dwzvw6l5FKBuF3TRZSvTwQFZfN5qClTUjFo7s5uGDJCONzqSXwIYsUMnPPLeFXskUdHhtfdDinzrL128GVWROXGKsapbhwrHurtDBWWnZwCYzIN/FngzneKd5TfhvLA1vrWBUmdmRwnNAGN43oExZnac4FjDF0wvF++gXuBCTaEqrLaJalwwof79gR12fXt2sT/XEL+W7CHgKkHaQ4dmngTe+NL7VjAjEbyuPS1ro3KXfHYrtpXlNVPEZpOer+ybmIKSAOg0TSmnO9bObuRbrQX98DTEAvYDSu81BICaovwBcTH/Nzi3qtaVvCKUpdW11JlRlPnxceUWGZ2/DFM8okk2WzhmlCMi4bkMZQxH+awZHJjrVfJxrO03WC8THSwml4AOOA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NdNAOBox6/ZewIqDuig/fUTAvwy86KJuHqugxiwsi8QlrwNr1Fn3qWtX4oXgbcURXW+4h7nMFSraY2ghLe+hAPU2cX9XLdjZJOiPoHFLRXAN3aCi8hJZgVoanSW64UKKqNy9UuU0nZ5JpJxSalXsqfYXDAm4Ol+d5Y9hbiPwzra3vmFhLLgapOIBttxE6sIWG9saQAfuZYab6t0EMUAP5cxwxVIy7UPpPV4qBbabTSK5mPbv779hbAeFNfMGFDITyJ8dnDncuE/jdGCup1ykrNH3w7fzyxDeMg8x4Gy1uaYVtTDxdAOxHuahdmcN53nKQcHyoI+VnRq0O56dA6SkI7rI2IrArGSscP+Wa/GR/WgfJ5boQladiqxF2pZtlEN/WS3VImjy8qOqXvKFjkIdyRCwFxXVYWQiOYEnVyYtc6ThVf8RZo5nR5X7u1PfD42eGDEsm7Bejbz8HkoKpOnvFQS/qm+aDOOvK8XFE2XOJSnghwuwkppZb8olsQ9+uZlku</Encrypted>]]>
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
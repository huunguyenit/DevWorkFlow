<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "OpeningAccumulationByArticle">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYMBrtwhQi2umzO/xMMyPbmiCXKxC2tv6SSPDK3Rir7DULaCjc8ukn4Hs28wZngIoNIgKKOcK2D73R/oBCTIojQPUikB5oi8mrft9UF9BUvOUC+jAhpx0Qf0tIUYw9HEu2/s/b6rOA/v9LfOjJITZQu4ssLg/PFHfypxsR6Mo9F/vL1xkwc7e+JyzzEpnYGXUw6GRIyF0xf6+r6J526pLuVGFoXRg68CqW0p+W7vaWFkHgxb8iiEkPqBoQIfBG6wzT5Eqalnh8iDMtHXqq1VvOcFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
]>

<grid table="vdtlkct" code="ma_dvcs, nam, ma_vv, ma_so" filter="&FilterCheckAccessUnit;" order="ma_dvcs, nam, ma_vv, ma_so" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật phát sinh lũy kế đầu kỳ các chỉ tiêu" e="Input Project Opening Accumulation by Article"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Công trình" e="Project"></header>
    </field>
    <field name="ten_vv%l" width="300" allowFilter="true">
      <header v="Tên công trình" e="Project Name"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
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
      <field name="ma_dvcs"/>
      <field name="nam"/>
      <field name="ma_vv"/>
      <field name="ma_so"/>
      <field name="ten_vv%l"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89rYtUCQhckXFsIZ1Qa1N5NLOj9gf397D8xMffbg43PDFz1+Cs9Jw3uxbgzGRNBqZAsYnxDYZwCew1UDUkLDB9/GAs6UUrFx7QRvqnW1a6M6iVv0PfqKlB9hVKPR5L4MO74QxVofMPiiMW5CmIFQUYSQgvoMPhAvZyEOastxrMhoNtuxfcXOxi2xcHySae8s+xhpwBKQhfRv+QFEeIXu9FUdu7qNL00HH0HGUwwJjJx3HCBjxmIMjhtMdQSDLbyVp5oIcgPYeyeSHbiw5LSuRwtxyN1L4PSJldhRak7B3bJyiDtFdwHf2FEE/GF95QsvBTKz80/HxjYlmcTa0IAKBQmPwPxfVNL70RvD2Tvybvxa/2Ycb+KziK5oOtCZC0FZ2iAYhcn4CXUJ3qhRWta1dvEQz4D1TqvaH1UqF6x6qLiMwJhmWzm6WFbzwBPutjyvFmk=</Encrypted>]]>

      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NdNAOBox6/ZewIqDuig/fUTAvwy86KJuHqugxiwsi8QlrwNr1Fn3qWtX4oXgbcURXW+4h7nMFSraY2ghLe+hAPU2cX9XLdjZJOiPoHFLRXAN3aCi8hJZgVoanSW64UKKqNy9UuU0nZ5JpJxSalXsqfYXDAm4Ol+d5Y9hbiPwzra3vmFhLLgapOIBttxE6sIWGfmYb++G5IV67iVrssVGGExiESrqLc8Tf5Ek1NgJ3428qUv9fD9+WxzsmkD6AbShyz8oYB1OwIe5jfE//IrBl+A4qPR5apgConqGZBl9Leo+//qa5OQYQdY8FAm60qeV00xR2g910aOsyWfyTVDPZOccNSWj4d8Nnuq7+ZtJXBvTmcXQhJx/OAIRJwL1be0xkEr2oThvnZJK48GzaNihbeFv/Tg8igIXHdX55ADH7lTLYC39kHJU1dRpr3sjkF4vE0ypc8qxrBA/qWJP0lXTlC//vsvjHbYb4iwHDYDNHdam6+LuX1Ehkvx8HMCC4RNMfsYYnZTGbAOYf7KtYK7eubA==</Encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "LoanBalance">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVb1+doV/uqyQ2ivZ9seZr+Ji0+ryLScFKY/wEyg5MIRNzQNObltoNbbjDTcrCV60MlIHHg0PrQQTjlCyh9WEeE2hQwmr54AfTq/+foC6Vbv+cMton+iL4aRVAxEOnX3ZxTpZsQB12ZGMPPNRA98GNs/0HfyHDuUt5HLZomvNkiq+NewLR/8jVffE7/a88VFi93Zwz9umZzd/W6HIH3/kCWBldwrDz5SX4rvxhX18/x+hA==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vcdku" code="ma_dvcs, tk, ma_ku, nam" filter="&FilterCheckAccessUnit;" order="ma_dvcs, tk, ma_ku, nam" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào số dư đầu kỳ khế ước" e="Loan Contract Opening Balance"></title>
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
    <field name="ma_ku" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Khế ước" e="Loan Contract"></header>
    </field>
    <field name="ten_ku%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khế ước" e="Description"></header>
    </field>
    <field name="du_no00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right" aggregate="Sum">
      <header v="Dư nợ" e="Debit Balance"></header>
    </field>
    <field name="du_co00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right" aggregate="Sum">
      <header v="Dư có" e="Credit Balance"></header>
    </field>
    <field name="du_no_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right" aggregate="Sum">
      <header v="Dư nợ nt" e="FC Dr. Balance"></header>
    </field>
    <field name="du_co_nt00"  width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right" aggregate="Sum">
      <header v="Dư có nt" e="FC Cr. Balance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ma_ku"/>
      <field name="ten_ku%l"/>
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
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOv/MZ08ZIci22aJp1jHdTPlAzRKwPT1ZiY7n2fTmld5jXWyUJFwP7GaZWYbA3EM6tOGBYZI0o6PdfstZEZGAHGWvRhuQ1PiFFAF//a+dVcS2KWWq492wFMC+cgEJRES8LrU9iYxWM5peZriLaTYKWptrf7JbBcqzX5EROaGa5fZw2JVlPv9NYwcoWo92ppAVllmyNe9lCp7KnJ8syGIFPsQuvgThwZ3skdc6nCA/soDhCQ2yhTZZ2IMqPxpicKtA9gM5dnbUzLeo8DzLRfFRADHC2tZt28XDiBQX2PZzGjUN3IIfXmk09dHHYddRS6UAzldinNqmDnze6uYO88CoJ0IpiXKv91pY/2xNUBINQSIq/mpN4kn+CLJksaKaDqvmxLkfyElu49d2uHso3LVg0fEKPj0mZ+X/KQCs9f3eqjjgxFGbsWKES4EJhmqghtujWUqqGTMRX4ukjGKcWmhPI8sPgC27uHJanFMUU7ZKk8CcynufxRxB+Gcbhc4aa+qCgJrllHD6HBDNHFwDtCRQ0FO4JQFLwghuOFDezxWvvS0VdD1mgSMFeSfUlQWrfs1jmFZtEz9EfI1fpnd34jY9fiPI3KgbFvV/2rXPQbHtBQqLmdwK6OkDmXmT43xa0B1Y7Uv8miOdOTK49bJ/PWPNgm6hlabB58vczJS7sf7NXMPSqZmAFAoqVQgYiWQHUZKj4w==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7N083d0wzvneWk0V3pN3ruLQTcEg26GwLK2omivb390VnH5v/0e1yk5zZ0+qGaJuH3TX+4CVHZWmw7AB7+WmLcVa2n87dJL0XaUWCRR20dUSudM7yn2x8DzsbMhnPtmzsn0vSXYd2pAGrwSvvBptx4JqCo1b2ZZ4sEqA+13KxNqLsqJyXVJqwN/NFrD8tWqjrzCH4YB13VP8/6VraH7Gi3NS7OUEkR20RSGCl9Fgrvzncz3XFzQlmZvDQ6HXeWhK1hkFqbBoEq/qmlK7jQyl6Q0yV5BhZzgPLFxdom1/zGOS+q3IkZ0juxzN5HXa0/I3YRz5e7+dotU8LhJwkvx8MAgquO82Y3Yc2MgF3X1TA9fnNYuFf+HfTfo3jH4hPXcdnh4gceXrbRSlH7KP6mfxMcEWAXfg3kO0leSzFR0keKx3v4wWYtJMq72kd6Zn682vn4rnaydeldm8HeP4jf3WyN2dAE0ebRKaktJfKverlApQFwgm/uNmqakXtaJ5+yOakM</Encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "OpeningBalanceByArticle">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZNwgxUJR9Kd+0pdQnnMYbCGe4eM0KxZ2Cy1D7QP+odJBe6L1mP/5x7ePRcpAQJn/K+QuzdaD32ftq8loQ61Z2UopnawlZhYdcefQyAk5lArwuTT6/eJi8bzMYI9lRL7PD4vThg+/4Kd9gP/VD4PIvdLvTv7MVgTG1SBdpYrEyUm9+/LBjZ6+7nCqdiok0ez5gv9vcHg01aStfGpqXO2wOz+FBCVKV/oGiC2rWFwvuDdHCPFvLnzwMyFuzYnYwX6Tk=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
]>

<grid table="vdtcdct" code="ma_dvcs, nam, ma_vv, ma_so" filter="&FilterCheckAccessUnit;" order="ma_dvcs, nam, ma_vv, ma_so" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật số dư đầu kỳ các chỉ tiêu" e="Input Opening Balance by Article"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="60" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Công trình" e="Project"></header>
    </field>
    <field name="ten_vv%l" width="300" allowFilter="true">
      <header v="Tên công trình" e="Project Name"></header>
    </field>
    <field name="du_no00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ đầu kỳ" e="Debit Balance"></header>
    </field>
    <field name="du_co00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có đầu kỳ" e="Credit Balance"></header>
    </field>
    <field name="du_no_nt00"  width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ đầu kỳ nt" e="FC Debit Balance"></header>
    </field>
    <field name="du_co_nt00"  width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có đầu kỳ nt" e="FC Credit Balance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="nam"/>
      <field name="ma_so"/>
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89rYtUCQhckXFsIZ1Qa1N5NLHFHJcbc6YVpK0gKHV8tcnP7/4hjcAqvPKy8Uauhq6RFhPZnu5/rZoQBOYD/NDeZcC9BIU/uTOeris2tr3H9p2f1mH0JFWjBwAQnqnlWvsPkOViV/LCiGXovbd2xT9jDIf511Z+Wk8m/rCQfV2/CQffXIb4q/qHz0YNVm7XsvoNzciD8GYOihyfJZwpbWfd58lsw43tAdylOd44Ndjc4UxPVkpvE+dTfebQsWaFKZvnDrlOPT+h4K4+Ci9Dtz6tq/Er9sv4JLh3voI5ltaYpk0zmLz+Jk9oV84cRN0Bz/geoZmHF0jMUW64YNacks5lUXPfAEq71DsPeibXKX2Wg0l21vyyRP+5gACPpLM60287nD+/c+fqhFxGOyLtpp3G96aSL+5XRkFlyhl3FHWS0Xeiok6DeCwUBTCVtkdqF7738=</Encrypted>]]>

      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NdNAOBox6/ZewIqDuig/fUTAvwy86KJuHqugxiwsi8QlrwNr1Fn3qWtX4oXgbcURXW+4h7nMFSraY2ghLe+hAPU2cX9XLdjZJOiPoHFLRXAN3aCi8hJZgVoanSW64UKKqNy9UuU0nZ5JpJxSalXsqfYXDAm4Ol+d5Y9hbiPwzra3vmFhLLgapOIBttxE6sIWGfmYb++G5IV67iVrssVGGE+R2Eg1rNE4f6wbGoGGMjYgXKooU7PUaA7RXO7g/zCXoZ0vHYzy0srP88hG5qGG0N56rf+y9IK5EdOB+N6+KEmRI3o1TMgUheqQTTlf8vESBW98r2DF5ugdnxQ1UrzEq+kKMHK2XjicxCkgewbt00bWxkxO4OJagJKVdb69zNPvvj4iN64GpyorqbFrvEnQABj6IBZt2PmNK4GU6Q+MKpfw1tFCH8bwD68sGh10CDtrMC63+PxSP5osjkEOXpEoFPuvELkN6B8HD2JvZN3tl/Galn9J6Fh6vgGF9o05KnFpeaVAODmEpncjPwLQ4tZQ1HA==</Encrypted>]]>
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
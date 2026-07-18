<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
  <!ENTITY FilterCheckAccessSite "@@0">
  <!ENTITY SiteRight "exec FastBusiness$System$GetGridFilter 'ma_dvcs', 'ma_kho', '', '', @@userID, @@admin">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "LotStockBalance">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbu/6C4aux+FUM7t+OU3uysEieg0+0XdufnQQsHHoT2nMcK88H9otCCnAk42Y9mGZ76u5J0MHsevWfGso/GvQ1QcLMaq7aG6DSJK5H7LODaRPyvsMQpOONXhoN0tsMTms/jAtQhWVbMfZ4+pdI/4mMq0VmY1N2BK+u7GmdQ7NTMCiCMPBiN2jVQs376vtYT6/yBIk5t+vbFdAqb+EGr6dUqzjJa5z1JLj1c2BGOOFqqpQ==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vcdlo2" code="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" filter="&FilterCheckAccessSite;" initialize="&SiteRight;" order="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào tồn kho đầu kỳ thực tế" e="Physical Stock Opening Balance"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã vật tư" e=" Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Description"></header>
    </field>

    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ton00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@quantityViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Tồn đầu" e="Quantity"></header>
    </field>
    <field name="du00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư đầu" e="Amount"></header>
    </field>
    <field name="du_nt00"  width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="ton00"/>
      <field name="du00"/>
      <field name="du_nt00"/>
    </view>
  </views>

  <commands>
    &SubTitleBalanceShowing;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89pq1Per/R1IMWLFAA+82QP1pDhCmMWDgITqllUb8WuOtC+s4yvpSj0tJPZNnv+51gzN+N6frQiQKrGGGkAUniD1TfC4WjYHtNNP7TSUAxgyl//LzPIq2gVVWj8PvTpOVOV8oHT7L5+RcO70WTqiDOIPii0/LjvqJMUK+xjwLG+lkjS76FxxtqY7LRyd9YAf39ie7dRYV+FYD0JwaLGQfazEvYNB2NhAFH7fDBLCp2L7PaT1r9GGYqX/p5AMDTshkqBKM6Z7aQlHc/kerwyD4SDrUGKNzGMgIl8YBAww6/SKMdWzkv1Ee7AME7iJEFALtrGVvMHRFXglC8IvYxGtHZ18cXkh6Zei6G6qiXC1e0SCiimRD5f14IWf9RVyf9p+ljNPPh2jrFOFpZtfy/U8QiJLFOwuOIj7eTUFGJqt7CxgBg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NypjzP6L0az/MTGcqttLO9GtbqysuNLd5fVHYhAQbffeGOybCeRVc5KgohU68g5fzoqAtocGuh3/fe0Hxf7OnqHjgxW4I5S1JRuRtMCkVCIb/ZWwbJ/glXRYM9zb5DFnlbglppPo/hk9W9djyEPEotqlx7okfGsdxwMyVZC5wu6rETf9FudZdzqOmoaT7ZUgnktvUHjY4H2JrWyRtkoUyqFo2Owg156BP8Wx6GqREEuFztO7PYxS7oEIdzrT0ePbbsS3o0foIQMEtj0pQMd1PPF5kV/JXGO4yD5oyKNd1uPoIq0tRSFgihu1d/KOFxfC3VfyV0pRl1IgiXZDQgP4zzzVvTbxuUkpWm547wxn8n4T9tnbhn1aeMvtMob6VaJLxxgrJao6NY+BICJp6tfMNAB6xRglwJHLsmbobAW7BzGjYr5FP5EWny9Tlz4Ku3dOXq4+eZ96wnI4uFgs4V7IcRXJMSqCP80MRYeYWBJgSSR7XX/z2g17kQYkjcvUQtRTJ</Encrypted>]]>
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
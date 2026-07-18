<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "COAdjustOpeningWIPBalanceFactor">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjU1ppkGB4ZbIssBLcvOScTgBxaKfORdjkcHP7+107+MsR21kNs2xgIULxPsjFL7Vq/Tgf8M184s5TV9MoNfftD7xBz4YaIMQI2A7shE29lNDvkxBqXiIPqgXVOo09F7XwNYE/fLotpyVnlfkU9EmCGB73bvnW/7Jkt+NN5IIjYUxOeDQd3GOZME736d63ntO+cA64XxutbEiHOKJgdiAZ2UHZl3zJG22Nuey6JpS9ToS7IE/a+R3DLemsv8MPEyTCDB4hmNBNRcaRrAvBEG+O2cb/RygGebdPU+aOpqw0i4pGYanN4Dv1Qe0hKcsewWfFNeKhiI+c1M6U2QFsU5HVINvj+o8MqZ6bioUhYk+cEKcCZN3S+qCESh/SGvwWNuyoSFhBpQpK4PLUKEbXO18xMSg=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY CostingUnitGridClosing SYSTEM "..\Include\Command\CostingUnitGridClosing.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcdytdd0x" code="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" order="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh giá trị dở dang đầu kỳ theo yếu tố chi phí" e="Opening WIP Balance Adjustment by Cost Factor"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, Year %s2"></subTitle>

  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" width="0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" hidden="true" width="0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ytcp" e="Cost Factor"></header>
    </field>
    <field name="dd_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_yt"/>
      <field name="dd_dk_nt"/>
      <field name="dd_dk"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridClosing;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pQ/Iozn/13dZ9C9+pHtoqJtBLCAd830E8kenDgrVptvo8fg+KrPh6vj52nlvnQeubHs6mCZ9cfSgqq5Btp/4uk+qU3RjDThWxmso4bDwzKYQzn0dnwJGG0A7NUUtT7IBDCUIE/aPDCkitasUBsderiiXAZsLYhqWJIIVN+6SxNBwQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKUa8fuaH25CnMBCoI1FPuJ9SRtfZ2XvsOWXw0DS/RMb8Uf9TsOh47v/bbHkoiIaK9U=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUV0oTtciE8G29OjoeOK5lsMXNiFpZzxyG5TukzVqaFB+6DthEoKrOBnSOq8ooCqh7onBDCZ1OuE1NS16sW0vAyB0YIun+YphmntamALjmyPnKKnskEVEH6icAGZ8c0C0EVYu2ISgv3HRP8Glmu8g2+si9bClQ/+DCjW3ReU1mW5n84QrWCsNXkoWkRzzGof7JgD+49liAFP5IBNYbNzEgPql6eZEYs7qPsuHDiQhpJakmFmT0yXgBTKmb28WEI1UZ1faux3yys92prN/uWuG05b/lHpLnVLvRMi4hRHWCTju5ED8LNSvUojv6LoyjttVV0x2FKkIl/Je9lWnrbW1ubkuoX1PFAS0evV9disfI5XxT0uUU59lq9BuMqlloIXHroTKTnl6JIlkr6bBDBl4aBEtTuaHkG+/ZVv3VEW9O1BJdWAV7C3TdiVMpXqD96B466cH+vMbrdMSCRb5RWWY/UrgdwsmDVO1rFEO0VQEefx2UUp3dZdm8H6H282sqIw6TvWPYXcxvj/Czlfp1whdItL/m09GGSy11Rf+SXx6m5bKCBq57g8QZLaeDBLsdC8tw==</Encrypted>]]>
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
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
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

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "hrTSOpening">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVb9/6VqWnnjAlOl9LlIZPx7N3eABY8qukP7q17YHxmBQQ/n+L/KrBlr13ivPFtNsCoEqzeLu2BVMcQ9ggFJ45646M+B6uVHZ5ptlwpZ8Mq0varNLvJbu1V/7LpfANDC9q6wJBXi0RTmvAZGAfrqEpOaFastBusiness.Encryption.End&amp;FastBusiness.Encryption.Begin$/6DsaM2LHfeX4VBOyUJbis8T/MpMKrMvyqkpAgb2z805Eoz7P+ZIMcWrPgGEF/REGWw5uelQKXwAffRJWiD7U3Ho/HkePpNR/a4cfFp+Eicr5pj149lzNVjlQLpegqiQQatlfrp6rpSd7tlec5RZig==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
]>

<grid table="vhrccdk" code="nam, stt_rec_nv, ma_cc, ngay_hh0" order="nam, ma_nv, ma_cc, ngay_hh0" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật công cụ, dụng cụ sử dụng đầu kỳ" e="Tool &amp; Supply Opening Quantity Input"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="stt_rec_nv" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ma_cc" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="TS Code"></header>
    </field>
    <field name="ten_cc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công cụ" e="TS Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hh" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hết hạn" e="Expiry Date"></header>
    </field>
    <field name="ngay_hh0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec_nv"/>
      <field name="nam"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ma_cc"/>
      <field name="ten_cc%l"/>
      <field name="so_luong"/>
      <field name="ngay_hh"/>
      <field name="ngay_hh0"/>
    </view>
  </views>

  <commands>
    &SubTitleBalanceShowing;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89qU9MNdr0Wap7TwqnUixusIlz96dwovm5GZ5vJ/KVJGBJxg1osYABUQ6Klzaxq/NaiV9+rUDqhAIg4bMxyLPyuKaOLAOoVUbRXiqWDeX/vtwWbX1dVDJ2IlqlDu+On7HiEkDRPO+S+8q3UrvVppF1YF9U83kaPVVU63fB8mEA55Lwv0kQBFMYxc+Ogde967Quz/IHpCXjfhuCmA53AA5ammQSHTGeTz1fVPLYXX5dEx5lGxpPsAAMyxbHRbhs472tmOBqmeY9Ke+fiwmlOdqVcazBttuQGz30I2FoSQvmUTg0y8aCr9iwteS8tWImhE8z5bw8BmDlwQaJglWi24gYV9uxxjQ6M5ff7G4XSOV5Sr86wVsJ7peSdhQ7SNY4qDL5m+jXbFrtBIiGUZcWmM0aP5LhBqn1VZaDfE8gxi9xrsAw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NdNAOBox6/ZewIqDuig/fUTAvwy86KJuHqugxiwsi8QlrwNr1Fn3qWtX4oXgbcURXW+4h7nMFSraY2ghLe+hAPU2cX9XLdjZJOiPoHFLRXAN3aCi8hJZgVoanSW64UKKqNy9UuU0nZ5JpJxSalXsqfYXDAm4Ol+d5Y9hbiPwzra3vmFhLLgapOIBttxE6sIWGFUXwqfabHCDG1QNG6uuvW8SUJUPyskI4+/A6aZpZiRUj7L9WH62AK00bKJaVpmyP8GpJm1dTgzqxybWAh5Q26FpBi0tviyk9m/z9uZA+6NzebK0ertnW2WuLSTnyIzx2RrLj/l7LQxkBq+HR30W9JMoll4h4y/hc+uqA8vbJhHu+s7V64VqlED27fT8/0KQWXAqSpc9owFigXfC71myGgHFU1fHpwiN5vASSj4eOI7gTMTJCir+3hnjtm76bHH/bnHnemrHzkB0/cxUwBQx4ktH0TQ6KTY5eALqBoFOh98tXUTpmPDJAsc1YXfRBsHP2</Encrypted>]]>
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
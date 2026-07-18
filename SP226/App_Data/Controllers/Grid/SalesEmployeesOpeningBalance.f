<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "SalesEmployeesOpeningBalance">
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaZyDFoSVD5zo/3qSLet+IXThwhIg4Az+jYzSBhYZy5t5GZlusuU7dsHo3a7tOWr7bX9rZUtN2PlfkeVuRYQXvmr7IRhxp/HwSzgEPrxdd2mg/PW7xCXRYmjfWvr0q6LBv/h/2OwFzQ3mgNeNzUfAZ6aVJV/1+0uZjezI5CQz9tfgMWmsblF7O9UOEA+r4wn4h9gyAYydIcexXCUPv2kAaLarR9pQy7N9ix6qHbeXwZFYVyY6yRIfjfYyRFtJweOIF+mETjBaDBbXPetp/6xExXFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vcdnvbh" code="nam, ma_dvcs, tk, ma_nvbh, ma_kh" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, tk, ma_nvbh, ma_kh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào số dư công nợ đầu kỳ theo nhân viên bán hàng" e="Sales Employees Opening Balance"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.v;Add, Edit, Delete Information..."></subTitle>
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
    <field name="ma_nvbh" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên bán hàng" e="Sales Employee ID"></header>
    </field>
    <field name="ten_nvbh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhân viên bán hàng" e="Sales Employee Name"></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
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
      <field name="ma_nvbh"/>
      <field name="ten_nvbh%l"/>
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
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOv/MZ08ZIci22aJp1jHdTPlAzRKwPT1ZiY7n2fTmld5jXWyUJFwP7GaZWYbA3EM6tOGBYZI0o6PdfstZEZGAHGWvRhuQ1PiFFAF//a+dVcS2SG6uohKqOxE9eBbDNIaoJL8VNAv33AE2yurGsD0B++AR5T99arl1uO/S+tRwyfBAVeAl3F7HjaomTtQfxAEkDz7+C0E3EZri6RONWe/JN/CjGb3qbSdbW34RPoLwkEuuDUyqiHmKuFokUXiY7RMof7dastm12czpk9CiIZ1Y3C/NYnWRnQWS6pUNrFRK5KspbNWINwF8jktaPUV3tcOIyvkhAH7rzCaSs9mSfq9FBip0ONAgstLMyzLj4IHdVz357/kNVRywVDE5voQ2w7YUZcyC8dUEDCx6gj1Onmf8rhGyEpievR/D+qR+C585QkQdxLBZ4rSBwgchyr/+KFqIRBCZH41+6m4niOP4PsDOFpfFc+0okYeLw8xnkLxjqs/Tb72qlSp5Q1yN5qv8AGVMeKCHp+bvfIxxSWESIypR8CLBjouo0gD+v5mycANYitRnqlBQI5O6WwchdEqyq+Z40NqTynIot8Go2esLB1L5RS643lds+St5D67lpWXKrRSLkt32WFfb1KhRzmepz/1a7cqQQf5f9WvKTObkpS1DaBePR7MPoEik2ggkRv6Gi3tvIaE4QaiuGp402baVygxNGyl3MFZfHRMB5iKsZURv5j4=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NIDuoSPW9f2YCjlltw5lDkt82siAk3/jTvY8g73Ao0wdFHoaaXtlDjp/UYoIA8IFM8heuuGxPwypjkSBaxKaQjSdvacTlY8hEhaUO7kH9WkPhd3dO7kPu4kj+7Za6AI1CsSsQ6w9ke2UD3j4RCp3irOu1EGyPHeFayezF3IYEX1v3Jn5PKjLLYUqC3qjRmFd9R/0JqSGV5OLQhX/3fX4MNtziOfBuDCDDPBGZ2xT73T9E/wQTf9YRINmpSg/4drFxM5vc4jwFOCCiX2Rqaonib5CPXpteoclvWb6QvLBDQTohXhrHe2IlkofJI9ZHRprb0L9cGWlNN2ebazRCX8K2nTyDZvgXEnjd2qatkoplGNuYC+a09pepBxw0tcNmfs0++syMQon/WuPhRxg+dI6mo1y29YOn37UvEEIgzEfqha3W0R+ol3SDQJUz5bV75P5Lrq+XqSaVd96e0adejZdlGWDIQAlfM2Wy+C7EMQFBf0T2V1h1dXPq2m2vIT1gMJGEzQl7a4fwXSpki2n3nbwNUg==</Encrypted>]]>
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
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
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

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
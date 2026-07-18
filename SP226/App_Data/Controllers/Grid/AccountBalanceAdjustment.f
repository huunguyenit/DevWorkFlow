<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access = 1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "AccountBalanceAdjustment">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaWQUmoTJlRg3sXGrOL3OpBEyYSP1PmTj4sF6jdee1rrh9ebz/xYnXQwarvwHEw4P8E/7zIj/+oHoAn2MmBjolSoI6hRmjbikMEvV0D8wyu3xt6z17GwOiTzHqE+m1RSgwQ9oAplpaVy3Rvie5BnJDAJsqVfoOzKy1btdoEr0R34oUDKnbcVc0A1yH1jt++VFHFmS/b8kSOCjv2nmrExCLEWMp2Ndvt2VJluIOSRVDYx/j3kTm4n94BJ2p7wOSbxfA=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vdccdtk" code="nam, ma_dvcs, tk" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, tk" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh số dư đầu kỳ các tài khoản" e="Account Opening Balance Adjustment"></title>
  <subTitle v="Năm %s1" e="Year %s1"></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" >
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Description"></header>
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
      <field name="ten_tk%l"/>
      <field name="du_no00"/>
      <field name="du_co00"/>
      <field name="du_no_nt00"/>
      <field name="du_co_nt00"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pQS7/VnKz6tAR+MT6yavU5ZcemEGDnJwaUEzv1OIaH+CR2Ss35VbPx5txRmiTxYP+KeTn7yC4/Z9gCh41HniEE7JNjrMkcaoriD8XOfYTiBk5JM7IheXvZhT+DdYnofWYBw9tIQCQ3qKSAuGJiHmcr3chUNmnR8HjCl0GNl1c1DRgHH7HEC+u7jxFceoh7A7EHhBxcTKwlz+jRSfn0m7AH/ZrGRntNCuIR6aG/qWBS2ZtRHYt9SO4EpO+wWUSBTbbCqPcM5LvDbmJekYPxyOMECmnuFxJcpBWxP610XctvhdeWibkTP7VibbqQmxaRXulWA0cFt+yikOZ9UIasYvrEn</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7566AN2Ij+bol3KgYrO2XvKLoAUnz+8KrlYMPIXJhJqbiKZRtA2uqr0rHF4e81BC7WT8/539NKxC7hD498lrmefqpvmKOF4m70Icvgx8mFlUQ</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJta64aahL+NHga8yoWjIw+X/UW0XcWPXEXIszOv/JtXd8vGPQN3ZUP9c6GONQdUN3kP7nzDhrPvjUfO4DNUk6ILXdtIx1Qde+oMf/rbzyE4tpjRt68K6CKaF8H8Yd2sAzihDp7BUrNWDawz4m8NXaJhlYY7++dckpypR0dB0lOi6ZiIGnghYSQdrz46sG6MhI9bFNCmT5YrLszOOf/zc2YWSqaWm5RgMQCzLpc43BXEiKXthEcNgv+S8B+I1yoWR7hXYUnfKVlj2y6xa4Ug5cjZNFTBbsT+TLCD4SDwj7w47HXGSMfXkP/GDcuhybyVhMdTXE1q5Pbz8dALzKUgHW4gb4R46EAUdEPn8ojtJITCcO/o5AM2pxsRCqwgS6xDqqUpbyAZ2UZVaH3oU6qzlvOneMPRpD4it/6HH14HM5RWwAoNLhLnMUcwfQo7RVEaoiVD/HkpTNEmsapvb2AYH8ZoDfGHGbi/o9nmJMe1p0jDf4XeSWRX36unkCePc22IDMA6gRK5VOu/oOZGIeh0WsaiuIfcTBzPnnuR+YyNb5Hmns</Encrypted>]]>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
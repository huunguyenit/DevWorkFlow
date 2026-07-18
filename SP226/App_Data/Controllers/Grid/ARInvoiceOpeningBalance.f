<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "ARInvoiceOpeningBalance">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYKy0IZD1/KCQJjl8hm7kzBqTURriL6KqxKy1Gr0s/kn3AoJmuCa5/QQy2AcMyKSmKcMTD7QgdunPNr8a2jR9Sr824SWYDRJZ5p5f9/Akfpu7GHlTUg+GZoSfi64AABzzCmmz5TmSwUklPkLnLG8d9S7IBHvLl7m5plxe8FMWJwHnE40ACNrkEmIE5OvY1kIA+LUD8l6vHfzwHHSoAUgono3ntDwWY9AiHIfPiMYdsBfg==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcttt20" code="stt_rec" filter="&FilterCheckAccessUnit;" order="ma_dvcs, ngay_ct, so_ct, ma_kh, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật số dư đầu kỳ của các hóa đơn" e="Invoice Opening Balance"></title>
  <subTitle v="Thêm, sửa, xóa số dư đầu kỳ của các hóa đơn..." e="Add New, Edit, Delete Invoice Opening Balance..."></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Thanh toán nt" e="FC Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" clientDefault="0" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Thanh toán" e="Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ngoại tệ" e="Currency Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="t_tt_nt"/>
      <field name="ma_nt"/>
      <field name="t_tt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89rdw8bZE1fJmlWEL/wl4Gcr1639exmEwNKki1M1TwNUq3rStQj9YUCPlA+TkITNFBTmTE+PPGjTiZFLSA2gyD9TvsZT2aY0pnUuM5GqH2glBDlUoobo8I30sErxLBJe86h0nXWfGDBba+pvtowxc5ROdEkU32SGkMO3mNiqWyYp9AqMxXgcBzkuz674OvXWfXAIobmfFuqtqM/Gq+AW9uvWRKHJGgOHriCX+zzkqo0Q2GFP1C6Vo6sVVoArnAbNcQ79xw7cuhP3g1etEetCfgUuUIdbi9AVmNYFu+RAD3Zvg9ARK1ONMP0WuKb3LFM7Gv9LgOioQRQ7uF2IPMldQvCCCdvgyKImf4MKKpeioXxJPqldE3OaCvGQxJXM9IRwGIF1ig8UbT60+Snvu4CyAfYlcdVbJlb77ENg8b30+Q4CHXLAql5PObQPGxkbazgxOzU=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+RP/OAJ7Ii0exfVCM80xl8BK9q4PbK0ZkR0rG8Aea9ywNOAtWw3DeyaOGhn70FVPNswNRtRZHF9lcl8R0R9YbRYGB/CAn+24HTdCkiwivptkxMs7QotHAsO8/5cjdyEwWKEDadMICprI0+bWVR2Y9yf4nZnzALtSofUt3YQ0875TM9j/NImB8A+m8FpwqiG6cOd7ivPjo9regKhK60JFlvVIaDmff69JfZrzzG9+0qyjLGqyr2pYkCop6TFarri7auqWDZQKHG8jxJIbJYV6Jsizma+lEOPRxga+TLQgJVns5FFNON1Y+Qo0uWEpsTxb0rFM3cEkgBerglyW0+axZD4WN6zEK1kHL+Z2JGmqQNeNxJDHNeTddgdFEKDxwNOw0XfhB9JcB151QRiwOXfkI/8xTJvQ0+lu8z2kuwgDhmgWbnqe09Ai4bi0xty15K9RDqq7cgutl4ZTZyhVNmVt3FL7Z7uLI6/0ANASxHHUJ/3O55InqVZho92PpzTEH9Ub3</Encrypted>]]>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
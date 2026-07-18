<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "OpeningARVouchersForInvoices">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYQNSzwxJ13BSBcSbVYqKf57vvl53RsQNGsRG7dCtc95izFBXGc5IlWKl3siS2FNHljfn1hQHJ8uU9ayOfexlBkK/Z0kNexeNQvsvklW+W1zE+CyAQku+lEPSh8/c2zqptDCQxu/hN0drq2csXtBN/25qyiplJdi/h2NIMZPQQywrFJ2AD/By0u5b6dzwaltwiONsoWPsOl4jdA88hHWmuPYJsJUgBxZb1L5v2lmg3WfvWESxqpRFYGUPsXRC3aEeziIE+iM7j5FL50n/xGkg/3FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcttt29" code="stt_rec" filter="&FilterCheckAccessUnit;" order="ma_dvcs, ngay_ct, so_ct, ma_kh, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật chứng từ thanh toán đầu kỳ cho các hóa đơn" e="Opening AR Vouchers for Invoices"></title>
  <subTitle v="Thêm, sửa, xóa chứng từ thanh toán đầu kỳ cho các hóa đơn..." e="Add New, Edit, Delete Opening AR Vouchers for Invoices..."></subTitle>
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
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" clientDefault="0" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
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
      <field name="t_tien_nt"/>
      <field name="ma_nt"/>
      <field name="t_tien"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89rYtUCQhckXFsIZ1Qa1N5NLJbRkrGJ/sJ8WYJo2v+vT6jl6yXeLWuU6Udz6uxQ6vcfbU6ZgZ8h8MBt/sa+xRCNUTYG6dGsH12pSsiY4ZIhPoEl3WlhSYtprKuvC7hAPdeQUX33cq3DUMMkEhFmw5tWbqx/D2Wef5sv46l4cEhgOTgWMXYoGeQpwE5CiXDRFbsLXPuz1McxoPLuQN3L542V/ri+tnnDtJPPjQSe076EpADuCExfw3TcAbDoZI2BCrKf7NOJj7NTAKJFoCM5CmhlJ6fh6xanaCeBWqRC9M0QhIwhMGN4kjGsynOwTGneYYvvKciUyDLaxkPaw+jiRYdg3TrO5QGXr6pTgFNFmbtB9Y6g2QvClXxl+Uf7rzvKNjk7P/7XlJ4YsWfLAKwsW3R9oKDsigh4pYw7RaGqgfG8FgMvXARlIEXSfx6BdeIGoOL4=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+YgPBOBgx5fsCz+6uDhWSjbsG7jHWqbQY8jbFtO8awVGIrTnbNqXEToj4zIGIFVR/zCnN/Z1LlrK8B4G7SLIFBLult8gPuY1csyeLvr5i+af80lsYOXzm26Rkn7mKuYeN/732rw93QC/6RCrCYy2uNSd+FWFZJKn9KYYEY0kdv5i3d8MwzlmkHShXymmVzuOTD0KbR/eDNW+h6Q7B0sQiEgHimRXwrCLB4wKvx0IxBerzU+L96LN6pw3M8vmybjsyMZ29WXqFsp7EDOdN8oQlKumK5BfZTX4GxHJnzGYFuBm8oieGXm2VUfw1EalXsNNqHezmckzIu1JjyjsZknpC9+8o6XHf3MvxYNdJpjltXakAgXA5YKTZvpiLhTqeUoAymqPl7MgiAHbZCf7nS+9JciFqCXbLoSShwTkUfb5HYPmTWj2l3kXJcomRDo+qZBDX7g+mzZB5beaEHJOiO/2/caQOx9KAGK0s/Bbm2hVr1KJuLfRTAhH/rFswvEDmw5Qb</Encrypted>]]>
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
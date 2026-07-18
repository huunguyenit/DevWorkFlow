<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "OpeningAPVouchersForInvoices">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVa8bglpgI140hXeE0J302ahk5TgDdlGUhyKop1txGpi7X12vvQDqiDb7Q6pWHV5OFoZD2C+Whp0Jmi06BKb/OcMB5VDF7PPLmZ0YtIazquEfo4BPqOQYrT9nZ2SLDcINWKRFNs+TqoLHFbyVTbrjMYYLKmuQqj2CmljB8nRPK/ZCySPAwLfxi76qqH7rt+TwGHULWUxyiIiC3+P7CCp9RJMYloujuXe0Spw4IdQbCEaqy4HrUFTK+dOegLKkm+U3/vrOWwxyg3v0/ja9Nr45o3vFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcttt39" code="stt_rec" filter="&FilterCheckAccessUnit;" order="ma_dvcs, ngay_ct, so_ct, ma_kh, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật chứng từ thanh toán đầu kỳ cho các hóa đơn" e="Opening AP Vouchers for Invoices"></title>
  <subTitle v="Thêm, sửa, xóa chứng từ thanh toán đầu kỳ cho các hóa đơn..." e="Add New, Edit, Delete Opening AP Vouchers for Invoices..."></subTitle>
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
      <header v="Mã nhà cung cấp" e="Supplier ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89rYtUCQhckXFsIZ1Qa1N5NL9mIWmTK+PwXLjJPYIix6tJVnpyCKls24uvScp46GK9VsW+fnedGNQqZKOM4rK41s+oLghYR+7oZgBoRhwiC1KNkfaWZ912yGE+Uic1zxK8RQSxWM0/jCNNQKDJto/deZ1FpdEcK0he+rjENHfw2ZS95fGPe0rlH+IDwUosyK/PN1WdQkKiV2QiB2JIF2CPUssIysEjgAHQAxIDrS384kv9aX466HWwVL4wskaAO+UaIn5648yDoUs+p6ICi+FFDf1XMHFvDbe2aJQeizBzBahlGFy6Zn46bdOz9jJk0wTF8a0lMDVRjv2k+Ii8T4PGP8TeQSNPHtMUERv5j1nYXXaf16N2kRNFLEkUXGu59v0wXNx/S+g6KKb0lfpUu62MNAwAJiRjoY8loaLkZe9y9su+Q32rWmaD5hocwHdTuXpIs=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+YgPBOBgx5fsCz+6uDhWSjdcsMsVU09rW7CDFOyJz/ak+qOrfZ3tlTLPlPUzgRtsNdaHWpB9RHgk/VavV6nVWcp17ppgimk+8MMfR7VNHRz6lprvMIjOC3ULGGgFpFgB8VGRfqIuhKKeJ2+A/rrNvjms6lxwxIsgtlCTBUM8EUajMc38z0gPOagzvANnbhLdu4plZ/Lw6hn6fTUv/gPvEMANOWubtwtksxOcMeAYRD20e12u5Pv1T1Rq1k4HCJxArej3m3UPRxQsdqKGf3EFSdk1u0rJ3j8rQa9r8TfGO+Li1qjiO8bTDTwH8fCb0SiVy0g+stAb3cqaHIhAF41c9sZ0CRftDz2BP+AhVCfLGM8mrlpkneWpFxDeo1NjLUwbxmVgk2Msxl0bVkXwsDk2F+Ia/P+Oq59Kn02TyC2y+mk6JI8XjMdFd605w0hkD4d/Ze56KbJI+NZnKxg/ombYfEEBlX1Dtet4ikBdpVI6gg495baMBg2GwtOY1Uw+jIGrQ</Encrypted>]]>
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
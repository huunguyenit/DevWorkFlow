<?xml version="1.0" encoding="utf-8"?>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chuyển đổi phiếu xuất" e="Inventory Issue Convert"></title>
  <subTitle v="Đơn vị %u1 - %u2, ngày hóa đơn từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Unit %u1 - %u2, Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" readOnly="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" align="right" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số chứng từ" e="Voucher Number"></header>
    </field>
    <field name="so_ct_hddt" width="80" align="right" allowSorting="true" readOnly="true" allowFilter="true">
      <header v="Số xác thực" e="Reference Number"></header>
    </field>
    <field name="so_seri_hddt" width="80" clientDefault="Default" readOnly="true" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" readOnly="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="so_ct_hddt"/>
      <field name="so_seri_hddt"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="stt_rec"/>
      <field name="ma_ct"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCUQagP8WN93u6v9P7BZGiS9lX+KO/ofDEyUKlrpV/SBOFV5y3pmTwH7pDP3oJSZNXlx5ZZwROffftKK0DX/HaR32xLDWCNjfoBcdNazh0TjfDGGrHNbaYAJLV/F1RbxpMKr4a/JOIFDzfWSNQNp/i+JOQLACmEzBUovMdwt31jhQNzLbo/VE4/cg8CPWI0AdofU1n4WFK1j/8Bmax7BgDPNotxEfW9n7vzzagch+QED</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNGvl0yp/lxpJCYsfxfp8GGZJ/P4MjprmDzjFSkbOuslKheceiAK7q7w9anDhlqtAYuKP1ASWjH4+eQRISDnlqHOwoxkh8Af4iPA+41YX31R</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKWMPrFa33OBJRj+yVPvFUGfuTW64ctxSrP98RVsdMb2uBMxfbyDNHUEWJbiE/3CWJ5W1DEF77CkuF6AuG474mcL</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRrFEnATUtKIGPo/In1MOD6n/ENi2ZmkzCjM/c5zIKZDu9BVLSKT7+b15tZdkMoJvSxX70WY8g2OY0xHp+mSyciLqarPIC9qIkmOZCBAcT0Yz4I50c1kEPvujjTMiqX20f4wD0m8pTDzTHX4t8KKAXPy9Ra3MO60I/sLVRcKzFIg0SU/CpTPIv9AUo5b6vExlWspyD5Sq3V19XwnporGfsWRupuKSAprFDnuR/OkZ5hW7rx54jcPBDCDgL2WvJt0+3dajiL412p95NVUwe41Wet5lVpBQheUDbL1yiZtDfZoh9eblTJARLePXd5D1n6X+GZKYe/gojfFz9z/LrWt1umcZOVS8JDFeJTErVe2OH8ny68JSnifig59PrRV2ETQuUihW/x8vf/DKPjxZ9SCNuu4iTuRIyp6WXiGu2aqPNE9GocYJHudkS5JeLgoxvzI/r45HwxlYMUv882bsqbUflGr+Ufbe/lsoVHxL3raivcCzo2WL8kCV/t3xw6rAcUlLW8DUq9SC1JevW9xrX9F68mwMGHa+g5JlCmV7vaiPH8XmGO0uHxA4a/CCw2oHVAmhNoqz8Z1488zcE/21slTFQbCYgZ9CDABq8bETiIM9+anee10h1IcNHjyMc++7v9z0BYmtYkghUVkGf8EJ3zFURo/N6+y+GaCfOpi+z6eIrdWR4YDTQ9E0oQse9vNB9hU56DgxhFfvmbhdq2tV53nBJUb/FjBYWWpB71EOIGtt4X6AxklxcCFGSJ/L4FEj8tT20lBKaJeM1zWkgyMPlmIml4Ath7W+efatWH0paBzivbnGYHHLLa1qNYuTMpScZrn9kVAw+44bad3CMy1MVk+lFNMBDpqcNKB3p7RUQEBNYS3lPnBnBh1GtPnI1N2ykbzZATtZVTL0PiVYTdTB4uiONXomD8cnHtf+o6zcQRKipbQri9jxnSR0B7im9Bl/jEgcGNkp88sj8NhllYcpfK8egcF6kngwUYZeF9U72tBicm9lYw6hkRqDoOuDGQlLKQoB5CqfrnwlXhO4n3hJL+arRTahLchV9oDey+cwy4ljBnTSIUTDEajaR/Ulp0gPWgM3OS6OK6CyBD/cifjoDfLY+MvbjPvKKYiGyNWo4y1cIfXrdXP6C5wzsUwbbxpQluHck32ZDeLFM64eduzMI0W/lILxpqxhKjKTDhQpsS/cHhQLjtlhHCRnXOd68havVCoPagA+8Hfq80t/fT1L4fpdtYkDJlANV+ucxG8O8qXZOoUt6dYMQUR9BTXshyRbDnOcQEql4GnpB4T5oLR5FNPNvfh59/YaHwJuiWDzskMFsovdAUGhfZcihq54J1NfO11Svd4fwU6tj8ikC/qQNRFZXpjrLy9Dsixt40oafOCvteSAksF6CS649T8FeWi/1xhzFZ9jC8vAv4i/LOHj3sLdpDBS2CHb3VBJrAvL6sIeNfzvEF4LdRO7uqRWBdMyCOdNMdwEt3ke9sQuso4FlbUbh4a2lMcJ/FINMvXlULauIm2E8zhyDjVQLcSrenKsW9/wA==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyszvpOHcgLicMstcJWNFA79++fYiNui9wm8OhrM/VCavAybZixKlhIF/ZK4dsPnXdRrXHCmvYXAZEGtjsE1GEoTmeht+uUegaKadBtba7XD3cjUy7CADyAwo8qkRS0Lx7QxRS3xiIJAetgGkeUAtoDo5jCf5eBFFmFVF+weJE9eI3SB+T5JQPP/rvSwnpuzbHao//eCHdBdsRb6V9C8wmoP0Vr2mqvY+5YGM5KJ9mGv</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Convert">
      <title v="Chuyển đổi chứng từ...$$90" e="Convert...$"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
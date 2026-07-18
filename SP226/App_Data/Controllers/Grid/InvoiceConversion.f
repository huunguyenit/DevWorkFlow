<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chuyển đổi hóa đơn" e="Sales Invoice Convert"></title>
  <subTitle v="Đơn vị %u1 - %u2, ngày hóa đơn từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Unit %u1 - %u2, Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" readOnly="true" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số hóa đơn" e="Voucher Number"></header>
    </field>
    <field name="so_ct_hddt" width="80" readOnly="true" align="right" allowSorting="true" allowFilter="true">
      <header v="Số xác thực" e="Reference Number"></header>
    </field>
    <field name="so_seri_hddt" width="80" readOnly="true" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tien_nt" type="Decimal" readOnly="true" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" readOnly="true" hidden="true">
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCUQagP8WN93u6v9P7BZGiS9lX+KO/ofDEyUKlrpV/SBOFV5y3pmTwH7pDP3oJSZNXlx5ZZwROffftKK0DX/HaR32xLDWCNjfoBcdNazh0TjfDGGrHNbaYAJLV/F1RbxpMKr4a/JOIFDzfWSNQNp/i/8WIeGHdyfxS2eUPellhOZ3VMChUVJvy8gCpDK1hQL2dwt/ThvJu+kT+Cy1sKuC8xsJoRpn8oq3YYaJNnhittC</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKV2ZLsFvXOQQU3PnBqUBjE5KBVfE23iFEKVnnUZvZKe8xyvqroBZ3/3poNKBM0FjwMMO2Q+JLmrKk8Hxk5kSunh</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRrFEnATUtKIGPo/In1MOD4dHRq5Rnr1EEEvGv64jaEPzufBi6BnmlHtDYp242ke8KL0rAlzXwx32b+oMnfsY1mS7whsuRjBZoHGMIdViHVZ4RynuzCWUoX2MlmVsQ2hmijSnnXVNtT/RdHY5ka5s3nZFTejXnCZXziW3yNwxF46i8ggxU8ssW91XaHmUtLY0U5nb8AZQ2qecoWUDPcTjMuefXtRDmtiY0Zq2Wl+z3lh7DGr0lKDolFIvii6ink5c5wQ7zJg3CHe/7LAh5HxElY9VKfFVIKa+0O3eCtTCVZvT7gi8merJJX5kZm+KkYETknIamz40Lyji1O2TAuW9T/xTukdcQMZdFku1B1tH+aho1LflzN1oeZfGWvV2w4DSVUaQ9vb1jVTSXlbuy7yTKOmn6dCkvbIsJzd1b+fGlrMgj1wcPo/302/GVx36FUkHXcrjVnIqL24g5DZx3KQt94w/hpWB3hdBSFSv5msphDFfecToG1s36OmIHCPhDpClQbet5IC2Aniugg06AwaLIBsPidRxyfM/oQumlj+YOjBtiNuvOOEZbhFO/biXeOOcYGcE8hKPv/luZkvebO7W6QtMqZRygiwHgbwQDfqW+vFJ9sjf4iXBpfjOMXqpWGPoAUnrFz0unwjZXP9xtYT1yXfcb2VABRi2VpqK8xOEenl2bia0xI0Vn69Bl+HOh7HqKfifhitUOfRQuJNQbjk47bOO5eRw3JEcav6Ro9I9n6XEjQREdK7cpU5Mzyr6AN4A0YOzRcfzSEmcSKdniwjvYPzH/dSZ6CuZh2BBTJLdeNFQx81E8ag6tNLIeeZiRKxNkKX+hy54vVSSZ+dZjd5IDkt/3ZSmrGhdBM+MLX54nDQo7ePCtKWwhasn2zy392PcA5IML0Ewcr0F9T2c4mmSQZy8y8NFOQeODLudy7f6IDrUMz0ccnJZpsgxo7Ec8mZ5MD+VWyOr4B0CIaZA5eUOKHSG83mkuAsKcpfSi0xr10EJr2VOepFdUuqTUZ6DSW6w3zxbQV6WPyBrgOrQRCTeJoNYUhu7y+r57T+qPTg9pfR5Bf5/foY6USl9VRVqWUP/CfWgp7jnmF4ABcvUnHZxOyQvT5gfNUQMPldMQ9ppXd/eUFUoq6WVr9XvX2zAzcSotPHt9wiyDYOmvKR6H09YZwS9+FlMZYFzrIxWG3o/XoRffSfDpQbAVoEG0ErFWX9Y0uEk46UKBLhGTlWDmeoe+it52jMJb7VgJdhAyYosFwhVR4hXsm5+vWjDo2j4FAQseuMTVyVevPxqu+yry/J5sgD5b3m9mxzBht72UAWFkE626nUwnTy4b9ZBl8jsEFGQbZYNZQrTIrpDBPSOCM74SKc3awnTxStZUZwtIke3KAPl1QX49C8RNPqi99VvrzbEKy+CayN7XII1kgEAUvCGPVcHwVkC33gR5hbSHvK79LO+sreWRM5cbI3MM/iUyJcrAnEB/UPJMNuUdyfGFqNxeIX466dGv4u6LY5hU+W8//2KaMvOkzkZ4aHhtlSC8C84Q==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7rR3xVWubOXvsqMLEWZXh3n445agvSDsVPMJmcUKLsEz/UWLCvkxlng28oZinX9twS1jSpy13iZAAEMBrRXrLcGz+sdQjTFnRtZ5SZnLoljdqMsqTONpzHvgnBhJsdhZ8daw0zKa+eW2vt/Yg/2bXslE2C+sBW7ljm3QCxxP0Q15bV7M0shMrVCPqVyU+QdbA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Convert">
      <title v="Chuyển đổi hóa đơn...$$90" e="Convert...$$75"></title>
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
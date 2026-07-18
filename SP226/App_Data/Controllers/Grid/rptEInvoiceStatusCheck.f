<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Kiểm tra trạng thái hóa đơn" e="Invoice Status Verification"></title>
  <subTitle v="Ngày hóa đơn từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số chứng từ" e="Voucher Number"></header>
    </field>
    <field name="so_ct_hddt" width="80" align="right" allowSorting="true" allowFilter="true" maxLength="-100">
      <header v="Số xác thực" e="Reference Number"></header>
    </field>
    <field name="so_seri_hddt" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" allowSorting="true" allowFilter="true" maxLength="-100">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="mau_hddt" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" allowSorting="true" allowFilter="true">
      <header v="Mẫu số" e="Form"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="tinh_trang" width="150" allowSorting="true" allowFilter="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="thanh_toan" width="150" allowSorting="true" allowFilter="true">
      <header v="Tình trạng thanh toán" e="Payment Status"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tinh_trang_hddt" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="trang_thai_tt" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="kieu_ph" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dich_vu_hddt" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="so_ct_hddt"/>
      <field name="so_seri_hddt"/>
      <field name="mau_hddt"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="tinh_trang"/>
      <field name="thanh_toan"/>
      <field name="tinh_trang_hddt"/>
      <field name="trang_thai_tt"/>
      <field name="kieu_ph"/>
      <field name="dich_vu_hddt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuw7DP08FmyV+onsNvetd3m1o4O4UCSR3u+DkujOj/wfQmF0Pyt6EipGDJEX9pkiE/roeoXrin2n2NU5n1P+C9pNkIHVdR8IBbs94bu7g+85Ah0r7xPHmo+VSJfankgVfgmXaGicPm4xN/iY1jIj6jyRubnj8yYMOZKDEfYIzsBU8li04jgqpQQF+vWJkEFXw34wycxapPGBZsMixb9Vw3mOVIuw6hOpKi03zWBkQGbM7rwJWILtcEYVDffnAxjUPlHTFPCQYylU10VqU144PcKgiYUHgTkNuJQ6tCk7GkytQrpusSaVKGWF03lodDlgDkUE2OTsOrUkCIUPRz8PAKIzSJoJdWMZ9rsGNBRPy1wqQh27iYcmdX5Rs7Ujnr8b9QNFnSoqTmVAMdE3of8kBu36OSBQweLW495W3qQANG2DMS8K7o8fiIewckNut8g1Xy7X/9/OhjieAJYotiSBE76/v3mNNHCSKr/B5hXTUSS6x</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8gnFb7QR2PmdFDi6tQrxh1KT5TnfYWzk2chMve5n4NHzeNGM0tkIWwXFXLQK4hwrOJd0uVGLvk/7pB1b+FK0ylS</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcpoczpRy5TZH/a+y0QyHco7hJSyPlRgq+MOcl/lr6S1+O1DkYBfwBxJAyiT8MV6tjDb0NjzIXUA+h3YfTmg1kHe3jvUWtM36V8BlYpNe0WiABVZ9KyhvLkG/qPb09B30kQwDdEyo4kXNvNye6YLmova6/8q2UnAYKua+arRw+5lce4xwiRI3+ISlfJlWo971qSunfXQeAYfJDnvKNtAS38DOYyncA8l6OVVuX81AyW/7/BbvfB1LmdIwGGNdKbfKi+JJi9xl0sVsn443gZfxN0NfqrFMV1EqHJTEU6Z3n/GpPGtJt80xV4ZpK6h+haWAnpna6xZVi4EGF7wk0Lwyug6vid5nHaVwjA65D3s6waCgNy7/eYPLUrhak4ELvBqdVJ6madhplfO3ufSeY7+ZC2eXsJxeJKOyIg9mxZePBZHvrGZJ8ds1khCjfzvODUWjqeA27kIw7qEl0Zs1YSAZcIAWXEhJNoHr736eINlVWpTU79oZHEzNHRLWurzDrVVL7TEX/jE7p5yNqMBNNK0JRXHIUm2s970IC+Jqj55ta88cuTBsJCgLEJC54ds22TewQHUIkssRwXy65CXCQFIivoJdmnYzgOxM5NwP7vPEoZTVcZ2AsGVjY8U2Cnl3j1yX9ng06Lrqo8r/8s3hANXmaTc8sickVdbgDs0cRV1gbTxv7k1kc3jc9j2gOhaNZvmvciQUjD3LRb2j6hxLSksQeH0tuQWfddQ+zlZHZ89jH7+/Pds5x9coGfb/VMJNjyUmXSSsbZ+2+As1JQL0sGszUqDuGAbu0ulMnyq+BrpgidLPus1aI9584qXQe2AYUs3DmRByNvSglLjk8NYEPuId2B+1J6o2q57QYctmXqoObyTozEye+anjm/v8L9m3r/UcmG2iqpsk4GzRv0+2rY9O326fVN0GUCiITsLvAx30olJpOPHZeGgYB+9J/SI78xX4ZIsALUanhMBPXEeYMotyNID1uu41DWS5ljAklRl4/KFsb8ph4WxWm2Pri06dRKwgFRHPqvU1ezD0p47ZbUTeUPy5IXVO+XUnu6Ah+cVJPJui1hgzv4RGWD5ICbyFIJEKcPFsAM60ZjBVq6FOzwfNlXCzSxToMKDZzfPeHtVAqwWM0JSYwVbOBqifnYf35QFjzVHXLfVVh8TnvUHPp/+NETj0zyU3MPNM6MqycYOkaxH55SKY2e7Xq8mx2H1fiiqrnUqFwQot6sbOMqy6afAfknA5y8A+n4PTnraqePzGziVgTLvASyZ0eVNPpQvbnwWhPgQdmoiS2TSoCuKXrrnzBjJNxtKqvFrjjd911IfAqQpI5GiBb/za5JkKM6D5JcwQketB5fbHfgKfaJ6q2QYEKU9shmsk7v+Bh8lHMPpVsGp4ry8bDPIuenXNE3VS/GytZQjwJx1T2H1Z455F4p5KPijLVYY/vJvw5K3LfDXlCpRKRozwuefjWSLg54oD17kmNbdwgseNi8MJdK2AC8+gSgf+vV8sTrEI9tHbX7ROGg3gP3tp92E8N39yWB3Gtl8Tt1UUk7GUIg6X3bOlQOU+FD2A90jZoyakdEM/KkAw79ehUowMJ5cp3CLz2WwWpTUYAaSV1DYdZ7UJBQvFnm0gUhbvZUlyFsicfxjZfbPT8hJ7aYqWmy7+Pa3H2mggsDEEq4foAPYuQv5zOWxDJc4DBh+TBfxqRErSUfZ3CAyy5noKhZn2GTS+mg5mho5yV5DS8xlEIRRpCgl/IMJhNa7INQ8SMWq7jLnHiBMO+igz0jmpGxLHMYlh7Q8zC74FnfJZgqvI+JaQOVax9eO4SSh0a8hvexg7P33Uss2Mu9pgfXM</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwguLdDBpi8qI/DSTGBOgHy4ADNO1/F2HXbeqTTyragzFJe1gBMg5MvZoN3XxQRToplwu83ntmW+2z1Y5L5Wux8BEw/Gv4UL0ZjjhNdGoPzW8KlKhy1vG1ofcvPi51QDC+oZersymm+gieLmLmXTMq5ETik7+6Gr+xto3jpcojTt0FdBbSjAhbYTVwJHiCU5/A==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Verify">
      <title v="Cập nhật trạng thái hóa đơn điện tử$$90" e="Verify$"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
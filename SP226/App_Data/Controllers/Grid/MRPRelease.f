<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" code="rkey" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chuyển kế hoạch sang lệnh sản xuất" e="Copy Production Planning to Manufacturing Order"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="tag" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_dh" width="100" align="right" readOnly="true" allowFilter="true">
      <header v="Số đơn hàng" e="SO No."></header>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp" width="300" readOnly="true" external="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="rkey" width="0" hidden ="true" readOnly ="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ngay_ct"/>
      <field name="so_dh"/>
      <field name="ma_sp"/>
      <field name="ten_sp"/>
      <field name="ma_kho"/>
      <field name="so_luong"/>
      <field name="dvt"/>
      <field name="rkey"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMux/Czbag6jtQMBBbd+utfTON/BBzNIdQ1xgYPr+zO7p/HKx+w8O1/fjbeyLRXJSu749iObuDa1louuaxpzahUnhyMZ9RK1UCjMmBcOSdsexgKmqFcc0XbD0aCJUcO7KiRI7yTg1zY7HdgZa9bveKpas8s7H6GVvFWrtOZlhfOVoHttSpMiFE7cMgYpXN6nyOCx6s4MA+vewQ6J2KVLPcxeP54qeGF736OGEfrNiefsrupmhSKHQ8gPY2bVCZwBD+MMp0VppWFHj9HkpD0uSaxCl/XPHG0znR94/Z/XfmnST+MlGZ/saUxhdp94ifxuBLxL6rfSIv24FFu3RSBXvY7pKJgXf6uwKqW428H3wN1lF8tdZ6OaSUvExOT7eGcTXL9Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8iPaG86vSLQtOIrnsmFxh2G+2UhsQJ6hXc/CvJMtkFs7/BhD0kOX5TluRI80/1yibc3zZr+Tz4QbKNOxHQxDlPR</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDvLTjVfQRMpHVE5x9uOv7iBM2E0wAYiPUaQJlVKduA7qr7Pg32azMAXR4eLcyxXCXXPnOqWTrM5kkDmRUatC3ADQ7yU3vbokMDvwZmex1z1o8iYgp+FYkQhXocr5Ilf6rJ6sNapfz1BvjM5rE/9ILz3b8G4J4/qk/kcRAxw8Kh7PIhlunYc4XA+QVq4+heC47eB0m9wCIgdTx+bANv+YkUxNPHZhDsr5pfEwYks3zktsT9LICyFyISeRRSRuonT8T1Ssl4+uddNgYirXfr/wnThn25QL2GBb2I911Ar936tWRFloUdeSPNO97YEFRi1DDFcWcq3ZGgrAmgiq/6MzNXEcANwW324hJp6rA6MRcITUCdn6XFxYpmJr92Iwke4kno5MJofFiOItH7UUW4X+9bqNctMYRATcuM01eXs18PIMn/J2xPkESRJySJ/Vff+ksNXfFSc/bHLfxCQ50/RYbgH7+6AOewmWSdzSL/spsXm42SfG24vUz2qFfdKzczsjX5ygJUwdZPAb41T9/L7lI3YtVlG0+MoqNrgqFFy5Xr2Zf7Qc47LaphcHUpZedgsSWVOnEwEhHsQo864Q5YzFhOB1oWIlTfS89fKwca+MpPxkrEBnTcAKeEWxjJ/VD49BSStzr/wMhwpSfbnFhaRPPdlfzI7NR0rr+o3jk137sV1mUOZQ8BgorbcpvubzivKf1UOyD5mBzUjJwX8MoyEtu1K1f143O01yMxU9vZ3/mv+B9dbn2D6zl6xXWu9B0eIARyjnccj6Rtp6DjANuSqn5SGxDA877LUGU2Jsk/oHtR/U+c7u9mIQlLs3UjrzCXPS16OarXFndma8u9EP3Bhg0ZP7iNWmHSzgHQ46a2CJfEhOmgKVpeZ0QNJackdnpzG+PJWqM/Dwnjzzm6U0TWBaSfBJmO9EPgENfQ2L0cHiy73hIpmrQZ8rPU8EISzhQPpvH7owLq8THtIK2T0xmiLTqy1uBFdTKwrKzGqaQH7iQwwJfzoHytnkDKclVVuWclpvjA==</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz+EM15QmeuvEhIRC5JG/UEzyzikSjbA0YA8aDikC4fzpgZBspSpnKhRAbo/nBKVycN6KndGYUaUzrJDPL1/pkDuNm3F3UOPM0/xRIAw7FFCQPi70Z7DJjBqb8v5V7M9tJu80cv3FnoJsxV3GpIa6Q+6oWdrgxehm4dfw39IUDjIh/DK3zyi2HFDIU05ut+thg==</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Change">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu58Q/vNOJfOJsHmrDN96W7VOAEvzjy0ybvddwZfBbCTcV+WsMazvS6/7Wwivmv7iZQSTcGB+OuPKRJsXryKt/iGwXezz1JNnM3IdxBj2W+0wPj/kIs9+zY2mPMn7Rdl28HgRFkvd3Hj51/N4bokbNn+w8K4yQGiyqin4AXz1m9kZXORN0rxhs99CcskkorKMStsCLVXBsfwe10B8QW3IyDFWVAf9KuHt0nFeSMqQxD1v03c1+3rNWiZXYjO1Y3hYE1GhodB81W92AANJPaT1j7CN4raoF8ripQ9GMBdXbCt1htLr2W+FdqtOONchpN2W6bpUFgDEtWw7jKJWdz+7TjhOyowU4qSiImB+iZzTkPLlH4YugEcldJcfobZA3G4Fz91myeURMXjHXtsL3Ja6TJLP/DOsrpFQh91SDcOmHGd4kmHnjDD0mq2DYfZz/+5VNmZQpD4nx0zTFZTZYzlgDRQQbyBbYab3u2v2xSQ1cHRchPFwc9CEdJEGlCsDfmrR2p9Y/AGTb/yGf1SrwND1oL/1GvC0deUfaWZHdFbrivCdtyAa8pQfRevyJ16oEFy5KKpuf3G5Fy3Tm4zTnXlV8qfivl7Bted6iCE5TaKEoH62S4PZzxWzVXpTlJBeWod0BS1dJxwkwn8IE4DbdhFel6Ee4e/AikPEmzmcwkS8T7X5780WvvAZMgGNOiNIlRrBossQEBzHOMVqa5IMgnTiouBsJioS/JRRgJywJWZd7ADK67nR3PpUubSzab3ikfX/wxH3XdQDmjSv5k6V/NMrySPEOvUfNBQ6DuaDtdolP81QMTHwaGsCuDpinaAvRSPrfzaFwNb0J9e7iS/53aJX6kXlrJduQHN0ol9NHOw/nCM0MKEtEyXaBELTGk4Y/UhsS3WLNCuJ0xS7fpUtFxztEK+I2Um1d2gWbeFvfu6IbuN3rbpT66SKAwb1vnwDK2x0QWMdWKqLuaqv7xkfs9uN48BNvBVubfE3kS2fozBsWhWOmQh+TLgcYLKWf++uFB1RXMV6KFenm4GIKd8T/5L0nCdMNqUMzLZkEG22muj5a0xuV+gu1x3NzbQa8FDmajuOD2fPMDpyi5wijKb5mT6PBekUEqiw4do6QvkpbT13WduGtZ21hWk9nzSVAN/fP8HbtKkJmLNxZ1UQLa+IWWP6EqeBhhg9GOO1tuKAFZ2vMe/4hLSF29uBKgUn/MDBttZdKgan4+YqFcjUotwt1ucre46PNXUB0PHEbtaXyNjmXMPr</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Change">
      <title v="Chuyển kế hoạch sang lệnh sản xuất$$90" e="Copy Production Planning to MO$$120"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
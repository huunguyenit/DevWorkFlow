<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "PhysicalCountQtyUpdate"
    >
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVY0z3QbZd8OrHnae38fw6LGIORWeGav/hDcWtc8EnRfcbmdcTKLaUyYr61zjPv3KaNMG7Mn4NZvSsIySwJW9roJZANA5O6CIkZSFPxWQPO1yI/+GCYQCUe9FDlRQdZR+McvxohIhHwYU7PmJaqmaLqrYJLv9wsG+0LLnZtLmvgQIH7HcUx70AoNPmqmQS0zjZJYHOKgijMR8b3N9RwLhljWFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="kktt$0000" type="Voucher" code="stt_rec, ma_kho, ma_vi_tri, ma_vt, dvt, ma_lo" order="ma_kho, ma_vi_tri, ma_vt, dvt, ma_lo" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Lấy số liệu kiểm kê" e="Physical Count Quantity Update"></title>
  <subTitle v="Số yêu cầu: %s..." e="Voucher No.: %s..."></subTitle>
  <partition table="kktt$0000" prime="kktt$" field="" expression="''" increase="" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="0" hidden="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" isPrimaryKey="true" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Vị trí" e="Location"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã vật tư" e="Item"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên vật tư" e="Item Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dvt" isPrimaryKey="true" width="50" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đvt" e="UOM"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_lo" isPrimaryKey="true" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã lô" e="Lot"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="100" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_luong1" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="100" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Sl chất lượng tốt" e="Good Quality"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_luong2" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="100" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Sl kém phẩm chất" e="Bad Quality"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_luong3" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="100" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Sl mất phẩm chất" e="Deteriorating Quality"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ghi_chu" width="300" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ghi chú" e="Note"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay_ct"/>
      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ma_lo"/>
      <field name="so_luong"/>
      <field name="so_luong1"/>
      <field name="so_luong2"/>
      <field name="so_luong3"/>
      <field name="ghi_chu"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJznzoo2UreQI6gdtxXgUiMejyVza6KP5SdCe1Oj6G9+o7rbjaq4IzMy5bIXiVaivcLV742sb5a2Uny3OUGv8PXFP0r3Hm2AqxdIZaurObGsUGHRXHLztW78BChN3WTV/xXmcHi3Q4haCxGK/Om9qdPGR9/fsEsoZpv/uqxVqPzFfg=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKXJELVKliErwKNMSXmjLtBUyUk3sHRAxrsG7BbeDbvlEOiSz5gOOjYdX39y/tMjLHc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+UmzQBx5xYhGQ2FjSwomgPLbTmblJQoSQvzIcOxxMLAmlKTfE7R+R6k7ThiLoS05MhF9K3Akb8MQxraRMNULbXTW697pGeiTgUP7uv/TIwL0h958lIGgeuU2AkRO2OT5bIdfhsdsKSbVshP+t2hYqugULmQEqdTyww6gr7qiBVJN8m+2oLVysUqzjE18JBXxREPBo98cvoK5bAcnpsL0VYZ1TdeoARtr0XSteFCewo2Bahly+3osrbW9rBihIbUyhyKEGjPWH1WUoD2hKNFt5KdETuuGhn8oYvzTh/3cmus57CGBh9owv7H0+mSiOq3CZvdJHfpmYioA4at9SurdgvVBoUbdQZ3tezGwxmmryXVgpEXhIzLhWy6mEaG8Si1Bu4mHx8YceUenqCSGYVN894oaWbQA4nqfTE2GL4A2vouxXl0ZWQZxjUlHyKV0YvnWng4dgVnCUUhPl6xopFvpVq246l84se33IkSUcYJabfKT4+wQ2GzUdxvKwjUWGagQzSZemtrpgbEfIY6kfT88321JWTTYtqtCRGLOWxHEqFhE8mUDycBKl4ZOhTjNszlSRyYOzF8dr/XlFdmVKKCjnRGFJJ1deEH/yxmD2mELPTX3J4C8Z2WKXWn+8S7OHkkn3TdwTDzjXszTvNHqkBOjAvEVycEJQAGwI0ZZjingj0tWA4K3X7GNEt+VZDL9PFZWoGxUp2iJnTVlsPC7K/ZRURE77K4rRDg+gnUEDymOQ0K46/nweTjnqipd2qQjSwEyBSRAD6hZsxfN2EgnVMxwCI/lsulg2lLSJOQ9BrjxBfCqKtK1saUlY8+HNgV7+V6+HkZQNpyKRh5uxfn9GT6NV1FlhXdx0t5gd3VblB2cTbIpmIgaaAqrr3/gYv31EoJtupxl31Ve4/ryB6NVgia+T+T89wGt9xCFCOEwExttqhV97KUQUbpBb9Z7VFjp0AjIhh+BCYmYCO57QL/P86KBpHg==</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6sWafR1HfL2PG6xuQUS66/5piosuC3lpHmFQcJasFL1SBjqCg0otw4ItJxYaioWok/zn4Y2+yTkeMDV6DxJAVxGjgrm07MNOfDfGynq8kT+ktSQ3l21i+VOdgoE/FXhmNvBjfwLM8aciSE+g5WM/N34mFC3t+gKns9Rt1WSMIb1veRIWRvcNWujtZMw+i6UHuYDDPhRXhg8X4/Z/wSuq++YCIHVjNfPK88rNH1lZCBsz+WVFRbKlFdDRFTgZBk/GSXkWccSHup/uJ7/2AH4z7GqSrSYGhIrA8VqH0Upg0q6lKV0dBLzG7BY6W2LkIv+PXvl23qKn/CsXAXGX18EctHBhfA90M6Rie5I9a8wDk1v+JGo7qXb0klnyWHhX0HxUZnxF0V2aXh2+b/X/SgZBg1xPdljQfLvnCjTOEAzceTg3Hpm1gDYMoIemZqU56H8SnKudp0bf9PTz3t2Gq60CMIlNN0YEtRjvJd1h0sNjqcVg4gQzeEzvGOdh89/lTtZYKgTpTGiLfFUytjhEcMiMdGGUBRTCxdEYfOv+2YQ9LdBYPVRGrSJdBdEdGttFb1ndv6QBRC4QDtlPLvFjKOCc6HQbqA8oBHNxJ3yjXrbxK+yD7oQ5nHSjN1ZarDb3/moaxZozWjud0tD6ZNgyVgpuhCLyz2M7Rbl1qVsMHo9VNA0ryhktRRLpPLzcUAsSQ259Peziu8bAa9SpSSfiqcEHZ7GeklHdD3/SZDA7CJeLe+scdzR9b4W+1LJ3zbPx+nwpRErrdhtDItbv1W1QX472sep7SHkPYVqoOdqdOaSxjoYkqru/NrImMu6d0AE/lp2Fj7dGs6V26vs1rR1b4LDib2CXfu9ZvHJfrY8uNpTH3JgsmE6y3r9VOgAmyJ/VU/bVA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+avxtQ58FqDl+auj1EQWwj5jYWRLKLAfJ461BugvuHZ7EXZ1dSdY8cuur3TG0KM+/4tiuAzVK1D9Lv7cKS/9wbq4HLqYxeZG4/L+oIT5EBuuEUeF2gOl9B4lYx0YqTfKjmQF0X19J7sfk/vDuTIAWO7CoVQW5XmalTWOm1ZxX8qjg==</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>

    <action id="DeleteData">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFlg4XMzxPft/mvrmknGUrnzNGEuTbatsT6VIBpuVQFKkLuvjm/G1HwX/ms5JsG5YBQYiWesHATTeVxPlrsaoAbwnwG00P5sK7+UKAcAfEl1s85b19jsgaj21C9p44P/WMqKVtZpOM+LXTWJQjnaLuTLl5n4qZUhWuFZrFOw4SgNRQ88nIB5wPaSrWQdbAHhR2MD69CxTMec1vm1nUwNbr8TTQXAJ5sVLQ+MEj7mwY57PgqVzuEZQkpJ+byAhzhJQ5Zgm2rbCWkeMzZED0uwPW97Shyrzu7vKUhTqdzZuC6VKTYZDq9d9tmwbHjyV0vQywpNxHMVl+JsSb+WK3dedITPJNHK0PMyop3uU3MMfjGuV84kVxa2BPjhbRXVKZlOvTzUxUlFDAh6n3etST9muTHqkWTg6/SocpnwluSISEWdLF0sppAoPoL+H67vrFNzlIjCm2qts0CkCldP9tVuEVV1OUW73BfC6nAVAMNJCCC7n8LqLVQ5+TfUhMqxZCwICnOIxE8jSbaTo90+lm+RTO7AyiC2PoezgVg1JyEbLEQWax3Eyal7AchY2VNRmh7Pc1RNTEQ498NUCOlE0XiohyjVTVkYvzx4FAEPapF0IE2cEmT1qSQe0lvlEucIcRrijg52aVo4EhayJk1lMO508Ri7CZBQuiSkxKhmRhCWj5I5K10smiun64Nh4uAy0TJUzw==</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="DeleteData">
      <title v="Xóa số liệu$$90" e="Delete$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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
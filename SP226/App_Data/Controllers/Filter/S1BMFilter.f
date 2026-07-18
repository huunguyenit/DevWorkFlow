<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  <!ENTITY Identity "S1BM">
  <!ENTITY c11 "Từ ngày">
  <!ENTITY c12 "Date From">
  <!ENTITY c21 "Mã sản phẩm">
  <!ENTITY c22 "Product">
]>

<dir table="phdm" code="stt_rec" order="ma_sp" id="DM1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn định mức nguyên vật liệu" e="Select Bill of Materials"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="ma_sp">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>

    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" hidden="true" dataFormatString="&CoefficientViewFormat;">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230, 0, 0, 0, 0"/>
      <item value="110101111: [ma_sp].Label, [ma_sp], [ten_vt%l], [ngay_ct2], [ma_dvcs], [t_so_luong], [he_so]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpft4Sd4q5jokGETfCgExOZTTXMj7QsHmdY+otyHZoYfeWU2np8VlePmVor0sVLJzZwjramY/tPKwUxb72eAWKLgMeVr6gmofJ0gvEqes/AAyp/nwHNiSlVemEXmlftNEC66iAt9jp5MlGd7qIwFdXecddJyOFwr+R+hhTCqYB4kZQgK6R9bznPx9DCZF844WjFZJ5ctOz9LTz96yjs6hE32aZF9kDjNSKUP7X+4LrsDIypO8L/n8CP/60Lc8irt+krAv0yuqg1WkczjOH3l2VhCOY91xzdu1uQuhhTt1wqBgtYvwmic3myHGVl9uNN2UJVjpvJ/m7nGlnA8yakowbPUBLCB3rrKQwW9Cz/oaEtVeMwffNSizr4RQBZcgG/5PpnJRWJ1Rg1UtzFQAbKWhDr2HwY5VuchLNAznOwSA1ZXiUJwsiWDJlzlk6AvpKWmfzt749rFjn3e47PngGm9wpYrRVoagfxAzRNh80jER9V339v3EgVNXN6NbOKNHZBDHOqKYqQfUjcxsr+eLgb9DqBX+5Z1N2lESSiE0ajxKSyzYvJp3i5ewB+W44WOAnHHSFpMtoENItPQoMzTXbYcHDoWo1gCBsoRPYeSrFaYhfWNUq3Q3Gp6uXFRscXvkvxMBWjzxHt+BQ+Ci3ZzRrYRC7sslNT6MOoy8hr0/1kG4ZdYOMDAuzFPNXJhxKmMbpx92p8=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIFuWhFfGwAduO+uG+CZheuhtzFool1R0ruuiemZgkHq9oZnmOsnn1y5f4k+hPUuP6QRfLZMWp3xo9lPvAhDIcNnxEt49x+rop57nYTUgjb33PvFMo9YrYpqLUjYbfIEcd04aFmKqXazJVyc6hArj3HLKSt4U/5aP5M83nZtS2waq8hgtr4eOer47/x+VfofywUH0NX/ofxfIihQZ4qCJun1GT3fM8BG1ulQV1IzPUpWA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3pn8hVKY0irha45e9N5rBRX38zIzrbr9lwJtdcXshmfK3iKrryxdSC8l3+9l5FLBWL234wZUTRSM03HDFQE0U4eqxHfOYr9M69If5VEnjnze3r1ohedIXxKnhVkf0o0vBUcaAwa7jJ201TgqheR3/xDwTNMICZU7CKWe+pWDXQnKDUzMtiPEZvYBr3rHXiQFnEpl+/chAYbHUBJmgQmit3JjNrwqcRhw+Du3JqHJMlhaKNJGg4mA0dO2ROU8XfyKAkMSjeQKKYPmP6VERyA0IwP9dkOVVJ3rMtW58jGfTXeK5BDCIPkVYQyTCKtYbrVx2NVrTB+1TPiM6Fd2TXTstp31QazGNgb+VpZpgFrfOZsxyszU1nIDqROXbBsmD7Cqr04cJpjv+VHf2FSP1OR6BeBn/fZyDJzJrD8W3yZxrTXz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrJxzjXjJQVR6q3mhuHiW2d4In2nD2kjsY/aUGhGI/U+zaopGwT6vydMRlwbvQ+idtsqLrG1aPmHrajDMVigTPBiNtT0HPGeyyb7S2U8Ocjq94NdQtyNXNquq9W1/i2NRVgx7WMTI2fngCdF76T6nuLWnKrFz05jjlCOjM91bMG/bP9Kdsf8/FCE9pkqRytwUf0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sVpitp0+hFILyKfrnwQpCmVQKG08UnmtL+roi6QO9FKOA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/ymZ9l54qC/L2yU4fowjEL9nmGanANZheBzn+KFNsg/pYOoPyLmPCpOM6hxBX+OXtw==</Encrypted>]]>
    </text>
  </script>
</dir>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmkt" code="ma_kt" order="ma_kt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khen thưởng" e="Award"></title>
  <fields>
    <field name="ma_kt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã khen thưởng" e="Award"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kt" allowNulls="false">
      <header v="Tên khen thưởng" e="Description"></header>
    </field>
    <field name="ten_kt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 50, 280"/>
      <item value="1100: [ma_kt].Label, [ma_kt]"/>
      <item value="110000: [ten_kt].Label, [ten_kt]"/>
      <item value="110000: [ten_kt2].Label, [ten_kt2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfZc+DyoNwnHfHaPqllrbbzMGRUp8cjVG9E4GTzRQ0RZg99gj9G8OfzLD+11S4vGdQ=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaLyGuXyXxw7dFHUnYqdy9Xc2m0Zez/z1Op30Mo+D9wz4RFzTNyhR5pIo9op84lYMw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli7iSvLhB/TCPg62xQ39fZIcDGfcKka33ih98ewft0DR93KC9YzA5pm/FCTBnylMnRC7M7l3TrL4Sa5gv+CxIHJ7te0VI0+Ur2648sdIjNq5BaXkzRs9PguZffPoEDw7JgIbX307W3hVWDBnLI8Ijos45YHGj26xaYUhBjOfudli4wBJATqBYxg13qVXYl6kB1CE92tuGdHEg4V1oj3UlBa5z1KwkhqDRQHyiExcFAIptx+9leuVzNmZpSSl8Qh3gIkuv2qLdInS+6NTjEIiDnxgi7Hk9tl3A2YqBrz5dT5YyISEFwQaGUkT/SwhbT5cRtkrrYuXZqw/LD6r+TAAP2xw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nosxHjgxHoSEeiWYfeB/0pFY6vD1fCNf7nbcU4adQXKa9NRZ8q9s56WuEeq4wq7+5s+0ypLPBGgWt6rV+NxjnBn/O86R6nZbC5WDn/Le7RnV13oLs//0fiaYZ5PNKgAKM6s/uJCrVCZLprrGFQ+ZXSPfwSFC7Ru0gnaT85p9wjE8HIMCJT0kVa5t8iONpXCPmNtLJC8k9bxExR6VBNiHtOkJhkFVlhyLSn4V7n/o4Q9M=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jAlfORNA2nIq4+6uBLTCnnAiucIYRfSAUyzqyNY32V7qr2rlWm0Fh6efHViUpLbvNhrY90o78WF33M95ESTt3odyag64UnkYHaxee/Ir+PNLvE95jEV48oTmeGQ0SsztZ2S8a4ykJhcRzgm/nJsx4NM4yMt9pja/JzRQkB47gNOb29BdqY8Hd4oOdwosuzIybw23EHZwJw8VDHBrbq28AbTK9wFO1Ppp/deDBmXNE4Bz5zpqeYBp4YLIWbYLKvgvg</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbehX6C5nwZkrPaqtSvUbHCWb7aAfQ1mt6/BZKeFawLAH5</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkaKp9FcH5YoLgV+44Tl/inWIGM5vs6tPtGDeH1DWHnBZni45xr6rK7WCoeI8Dfr68Y6M9d+vQUyp3sRZMLCq6wOMao2YPtOC3hheL5SQ0bwqXnepS+uPtaQKcjyDcDdEFtPSONZPKCzgrLLBVIvEZMn40MW50JTbu7VPpHwOPwCZuRyUW/hB69j4giLFsdcDGFw+JGM3CJLCD5UusddJUpfcUQM4ThAj+80fxvIBXK08bC267tFBTcBOs2DB1/P96f00sAiL0WwRHtCjjCDcKB4ji+34tMZR3yx0ILdu+n/Bi9V93wvsAFBa4EL+Huaoaw=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmsp" code="ma_sp" order="ma_sp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="sản phẩm" e="Product"></title>
  <fields>
    <field name="ma_sp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_sp" allowNulls="false">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ten_sp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 330"/>
      <item value="1100: [ma_sp].Label, [ma_sp]"/>
      <item value="11000: [ten_sp].Label, [ten_sp]"/>
      <item value="11000: [ten_sp2].Label, [ten_sp2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6LwPNzJKQKN9FbnDOr/kvKlHHJu4/7Tipb+baWSr5dhUQlSy3ExV0FfkkcTL+/+32IOBwJnksw59f6Mf2WeJlI=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzTLG+tSOCfqTcLid24624KY2ZZrMbQN0DCqQwwf0fhn1JqlqauQeSlyOBwpbArVHTQo3Euxy/4KuBuXPcUTs6s=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliBrSUjl7fGgWFdRZxnDmKk+BZxu0ERqZG1E3po4FIcz8iOJJiZi3DYl6amsYCMCi4QtrX5IZKjW2bBt4qWhppeIz3z94dCcFSe+3/UNO0e07Ink6wOk0aPIocoeyacgIRt8R0idp20co2IXYl6qnbYGDM5NAfS8NzpUCSLhdhQcX37gdXobEebhQ2/16hGOgONg86w60MLQ+mp60/d7C0fpPKiy63nkHHbHsa3lu4cx/in3RJda5Aev288CxaUEQ1gp1w0J9KOIbcnEiQguAsTV5ASN2A0WyqG7dHJnbYqsmu6JN0rUUw+LpUDHw1I7/dLg2VMtrmXJlvqCp2XY5YTg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nF/XG+W+IdAPGViCZTgjUc44rn65ac8egfw8JqN44cELpxX7dSBMiKwGEE3vxqgQIintVCSBQjuBh4NqCbJQC9iH8kt4QtwEz9eoIj6it+0uPh1OUYOqpZBfM2NxiqsJqu7pJNvEj8lursF7mETXBrBaKgBzqAPxLHZflss/2BXkl57vJAjWBoj+2W9pAXpTU7t3UPWxEe8NN6F7UBkU6QtCQKzx/NRT3qrltAtsF4/U=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jkPwQrL7tWpGC2Oy1WD/2G7lZaNwv0POvWWBbUB51+oJ2q+doUDFGfbRAvSOa+CDIVFP3CvmuWINbzrdvoOgEZoutGqPce4wUp3UBzFrRHdAmbvVhBW2hs6r6vTrPKjgVkhE+5pQpnFTlpJKPs9WWPm2pLhq9w3QppXtrUKln+Rdj9eQnpKv/QSn39pxBwA21B/LV/JSEVOqhpNFpdtC2garYIWL9pCis/4fBBtXi9wjmwRzMlrTjXZg0FbI2+Gs2s8MZSslsH+oqldAsuwEwDA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberliqzgcFS6c7sbxDWMv0cyzfAg4Az5BTGF7okAVa3Gq</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LUWY2ltq6BuNkX2KbXhBN0x4za/Bw+RCFvSOe9SkHLDWDN+fBigiBItOL1impEwqPc6jzWHcm4ydws73BDN5uvQ1K2JIP/AYRbp3V9otRk7X5nVawp9ev4dQ2lCWwL1s1U8d9TUWQjJC6GKgSer0FGSnZKgOXjTBt4ndEJU2qwJgj6hy9XDQ22MwiGHtu9FtfuqNLe/ZhagF3W7xEuUth5ENosQOT0yJ+mtp4zUJ6N8XeNLBwahlMr9wLAQphvepHoQB8qDTr7k8rTXD2vqlYZFCswZmT7CS4j60pDuAF0T33DcwUingeWVTWRLqcxpf4MUkE6JIZAIZMJTfQ2Abjc=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
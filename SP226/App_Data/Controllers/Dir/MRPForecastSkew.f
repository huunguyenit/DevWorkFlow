<?xml version="1.0" encoding="utf-8"?>

<dir table="mcthsdb" code="ma_ky, stt" order="ma_ky, stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hệ số dự báo" e="Forecast Skew"></title>
  <fields>
    <field name="ma_ky" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã kỳ" e="Period Code"></header>
      <items style="AutoComplete" controller="MRPPeriodList" reference="ten_ky%l" key="status='1'" check="1=1" information="ma_ky$mdmky.ten_ky%l" />
    </field>
    <field name="ten_ky%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="##0">
      <header v="Stt" e="Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="# ##0.00" defaultValue="0">
      <header v="Hệ số" e="Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 50, 50, 330"/>
      <item value="1101: [ma_ky].Label, [ma_ky], [ten_ky%l]"/>
      <item value="11: [stt].Label, [stt]"/>
      <item value="110: [he_so].Label, [he_so]"/>
      <item value="1100: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9MgRA9wY1Z4JUC0BWZgLwPahwOyXeL0VrLSTTzZmhIdkxujKwYe/Ri8zHhBTFRzpYR0zHA5S1yuTWHAHHZitn8=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9MgRA9wY1Z4JUC0BWZgLwPahwOyXeL0VrLSTTzZmhIdkxujKwYe/Ri8zHhBTFRzpYR0zHA5S1yuTWHAHHZitn8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulibNAujXIvc25ZF4P2lmh50HD6NNkjAhvmqpWdjhx7WwD3TXAudrAcx5MIzJcrHUPcJao1uBcKX2S5ZNr7wWMuKqlKk3Iqc0dBfZKj1o6KbVsOW1tchC2GAcFW2n98+ynqucXTQj5vugKGWNdiw5VRmwS2S4E3xgp5SZgAU/tkBgDQlu5PJbTCaiCOs3dKGp09gunsZcw2zgGvd2KyWDtIg8rcX+HO31SpN6S9A6ti7fJW6u1C0vm3+UpHGfhWf8DMj5Y9qqiiRqeDDc7XkPAF5Ro4oXxdp1TyKfFNbeEnBxFlKSdy9doFxDtkuSG++aaQSgcLkwsZHtOZXGxd3awO3qw1/wfHOPuUPZ37wzj7sts6LTGGs5X2yKif7jhZNtz7oCJesx9LHBW4ir+RQsDgsA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cV+2g1vlrltTBGpkiuZNfodKMZjR9lkKM+qRgYnAKr8u/rFT51i2JKKvzIJUk9//UCoCu870LWCao5j41XB7qgPkn8IgMUvV1rywgS+X4gEHHWPJdI2CDmzQMB5EWAppFN0lNEN7Sfm7mhLHSU+pFyhZT0wZR4zjAuvaibNlLK/Ctp0LiCnI6P82ndSFEpibV0nK+9GUjcaruNFyc7Ut82w==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jxzQLsveFE3z3hHd3mi/hY3JA1zddpzmaibYX4sIDfmsbXGUjDFiD1qcAMyYFHOiKAuYTgUQQ5bT0N6z7eTztmG8hWcPTbF8sRwnSiTLgOECoqizz/YfSREFPku3U5dGc9OAgluUjUYsjJBxYDwKmErxpnI5FpVq8ZJFzNUlDLwz/aQTh+fP9HIqkqYZ4MkirqBtD4on4lZRUwl6V4eyKg76UkS5tAs/s5c/QAKPkzkPkbKdQj4yWoEiO0zvb4V3n</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbek5EXyulXC72yLlo1HPNDwCM296rUggg4BUwlbQgsB+cE5fdrZqW1pHbLKJ3lYJcDg==</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70N0dNRCfQLlM4cWm9yVqx0n+duckwYhOxMdOaz7uyjQqukOFJscLQ7DB+vwNJ8s4ZjKLGH8muzDyZ+Enq4a2KOchNiIZ0Klfkgy+BGl+tpw5z2ayExFcypnCkYN2Td+48yDYkOAv2RNFLaRieZzDVblvXJcOisHr4HDOEId5JsIT</encrypted>]]>
    </text>
  </script>
</dir>
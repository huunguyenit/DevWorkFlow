<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmquan" code="ma_tinh, ma_quan" order="ma_tinh, ma_quan" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quận/huyện" e="District"></title>
  <fields>
    <field name="ma_tinh" isPrimaryKey="true" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tỉnh/thành" e="Province/City"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="ten_tinh%l" key="status ='1'" check="1=1" information="ma_tinh$hrdmtinh.ten_tinh%l" new="Default">
      </items>
    </field>
    <field name="ten_tinh%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_quan" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quận/huyện" e="District"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_quan" allowNulls="false">
      <header v="Tên quận/huyện" e="Description"></header>
    </field>
    <field name="ten_quan2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
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
      <item value="120, 30, 10, 60, 330"/>
      <item value="11001: [ma_tinh].Label, [ma_tinh], [ten_tinh%l]"/>
      <item value="1100: [ma_quan].Label, [ma_quan]"/>
      <item value="11000: [ten_quan].Label, [ten_quan]"/>
      <item value="11000: [ten_quan2].Label, [ten_quan2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcf/4LdZ0Hk1+LcaQyRZ+bAig4P+oO72dV5psBYA+2o2OxUUDiMLokX7NfBu4obIRs=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbXKd6BQIC1054KfQtvewAovckzMU3lCAYcP5J+0GPStx+Fxqi6wXPezQ3tKirm6MQ=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliFwhsA4eMqfxwHuG5jbSlvsb2vuMPbRyhLXPLWQ7tCwH1mZjVBaL4RWLjuRs1PMcHg6BJwHTzfrJGNhkM9VbN2rIuCKYT2EslV/iCKpDmQRTUdaPE6xLbupdRkjQXuiwHHK1vg+xe5LdeZUGZGK/3A8n4usN7D+FLsLx3Zm2aKhrJn3KMlks+V2hAPi5wEutsVk+EZhJQcYciiUzHCRQPWZhlazeXd+PJf4pWT9ybDlUgUhfbOJISqfM+yh1ijFvcgYURgi9FL/wt+ePf58GyduKuAc0IZiulnf8QxjerthFzWFNfafd2rVUCKQCsiQ7NnwIWKuCQgLC5vmtl4qIpYO7S/FDyQmCEJCzqpEfEDxA6esFojniDJd643+bggEfnrhP44F8u7w7Dpr72tlp4fPL7kEKq/l3lzg7waSsaf1BiEAZEEDoUOH1wLQZVut0L</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nngMSZb68KqsQsXy9Os2k39ofb9X4X618an/W+JwRoFebth4WtUyxZ5i3CC6tE1xkgyRRTWvD7/TkEA6FKcy2Hf3st+4mZMtp4I2N0POHDfGf7gzNXHZG02DMgCA9dRIK/lZmNkt9IBXu9pKjOnyg56FQBgY5RSjRyLaYI2dWxDSQC0z5bqILN6j8Tr1oe8blRKzMlkJsUmlQ0p/646Vd8xn+sk+DnV3HhMCA4HkZFYy9SpAmwTr7h/7Xqb7dNBwRUhp5uLrX1/V6ev1R38ddrw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j07/04u8dryEXXo4qLKMdBNzQ1XnVuMnXI3e6RcwfsvSYPNS3wNTsg0HdlrnQfgtrQJNJJFKL13o3pQ/ygZFJxQkNGaDba9teTTCWWL8S3D/Qh9r5767ik8M9WenOkkC0rhW0PWpFsPKFvq8fBf3Slylnokopm4HLUc2shXaFXcseV2v/G+vsDXbkgCulHOjdJo2DwHTiB2QWLoRxEO3mnEo7ixZQLFVos6EycNougEpJJgd4AAI8ckxJaJ3Af7RG/ws69F2++W/4MJzlH9HCo4hLts9y/dnbKV2s+aZ074GBRRQzb3o+S1onYq19zfOIfZhOfdf+njySptsu/EA1Ig==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeusYty7o5fJNdKk1SR0NMBqoQyJoI290EBxnU8zNvjAzQZlHzs9qRNVSCEvcE8nl8Q==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYPLPoonW4ZGiyPnmRHs2zO6n9y3VLzEPqDy6zOVRI9bKcugcL+DunCdHC3Eu3KW8Bjip4YhiAuaSxn7waHWXF+kqj2h24A677sNGzcBz0f87Sl8d7R2FrXNR403sdgzku8XGX1Hkkk4Y9oih471KjZOpqIkkdY5qBDQI5tKBovcb7xz4vy5GtPh1nGu3aUHruAayOIDbFWjJ7yDG5yYP7evoxIZRpgOY/JX0VxD1ufo+8NFHHfGlAK6asuGpQLdlD1QEcaD/vQX/zMw8bHhSz+qFnjKIT8WE35MUqyP/EOQ3MA7AZIQRIaB0K2+eflkl9BW8F8OQrT4PnuVBDU0nZk</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
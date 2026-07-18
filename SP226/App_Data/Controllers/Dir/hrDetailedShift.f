<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
]>

<dir table="hrdmca" code="ma_ca" order="ma_ca" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chi tiết ca" e="Detailed Shift"></title>
  <fields>
    <field name="ma_ca" isPrimaryKey="true">
      <header v="Mã ca" e="Shift Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ca" external="true" defaultValue="''">
      <header v="Tên ca" e="Description"></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tính chất" e="Category"></header>
      <footer v="1 - Trong giờ quy định, 2 - Tăng ca" e="1 - Regular, 2 - Overtime"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_phut" type="Decimal" dataFormatString="#0">
      <header v="Số phút chờ tối đa" e="Maximum Idle Time"></header>
      <items style="Numeric"/>
    </field>

    <field name="hrdmctca" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="282" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrDetailedShiftDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ca, ma_ca" e="String: ma_ca, ma_ca"></text>
        </item>
      </items>
    </field>

  </fields>

  <views>
    <view id="Dir" height="343" anchor="7">
      <item value="120, 30, 20, 50, 110, 100, 107, 216"/>
      <item value="1100----: [ma_ca].Label, [ma_ca]"/>
      <item value="1100000-: [ten_ca].Label, [ten_ca]"/>
      <item value="1110000-: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="11: [so_phut].Label, [so_phut]"/>

      <item value="1: [hrdmctca]"/>
      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9/7Q4SBX6QbSFyNc1unSZbC+YN9+XDJ9p4nAIpsFE5Ms4Q4A/aoUt7lxr0QrvobJ5nrxY9C3SeX1XqBEhSEKAE=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Schq0gpjYUmqVzAkamKjrHsBdduqCo6dY3caRDfwcRsKCcr9TvXi3kOVEIQCopZMB3mgL0zKm3l7qlWoKoSVY=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bok4eab9zaXok2A59HTD+/fXcGixcQNvajufsHd34pzW4ll+Ob/B2ac74QZ5KtXwpy26XBIgOc5Yzj9tWKkJZ32rIe7rQ19Umf0Kvi3AmVw3rb4CzgFZhQsSAYuc65g1JPClYhzk3ewH9ocHinOdrvIbNrhi1mFdYTF1m305dgO</encrypted>]]>
      </text>
    </command>
    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5dLCHhtvx4RqvndumfWl7b38vwLpDGVeC5bNFC29RaB7n3F0v5NqvRHvNnrqk89vo5uhGcNrcfBPIZS8ZP9ElMugn1oEf63hPwyiaLV5xtTyC4cQiNjZB0dKMFacx/riu4La6Tmo9oVk9h1L9by4gbNhsZ+TL0lc10W2CrRo8hd333FoF/QtCq9HQmJZy37qw25z8TLwB6fkaHl4NfZxcKbwkG0GdE5dkBUhPJA1sgZ5trXd2m+JaD04Ik/xwJap+KSDn4Y9Y6hH0/oHZKuBRZmz10UbXAQBV/0BCSa1kQHPFuTy1Is/H1jhQAZ7Jn0YcMVD00kZU4l0aU9YB8OWieOIYPgOMixLC/F/eybwNPvla4NQNbn+b/6hFmxD2xs92lMSOGG37qnF/NFyXJWm54=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FIbnIBvcPJdeg7CGPVF1Lc=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krhl46OH701sAJ0MiCdr1ukkoXvXeQ4zUr0k81LHCafqusQ31xYn+26F7grRUFBuCgQemGcVrsshtAVvIRq4YhxckvuhKz/fEs7hP7j4MBvpgVNchoKLiHfS2trHfZIHcZFErFW+i/YYLzJpCCcXfR3GPxZb9kCLqVyeKKYwscPCuL8E/kAGopMGFH7aenjMa9BqXMX2wfFZfq5aJymcBrNKc0TJ0lYZhdm277ID5LZrMwb6Gs2s5x1zMm/DNwcX4NVxAKLzsR0qlKlEwcFNcUU6Xa7KHxSxdeCWIlgSGMMjmmmAIfGU8OeHGXXLDevdwwPq1B2OBRE94IsZ5+UuFa+rHUva8FOe+aTSIl6LVlQUDCLZ7lWennRHg02osxybvMPxuj3SK36UDuwcFjNep2HVULk84nsUZ5mfYkTRaNA4yWinsRTMCaEMkqlEpCe6GF1u84HJ1TRbaLC/yZuCXpPp80Yx4Ha7o6s/2w7GmuZjn6vsW6zMSQwSnghTPosszFK6GAn3qsKp76jHw23CvKRKME4yQPhybujPLjo4BMkYzUrHEUYxDtGeRUzFG4cGzO6QzaTeyVMXP80laNvvYvQFu/34RF2HDyfDWUVQB5VTjkkChLmYcSBjn0k6Geuk5uTGnpAjY3GEQbdVW+XLtvxxhNAwmPv0wzIhGGTgHAEDsB+RjEHqzYlfXn2tRQ/kO7GclXho4nhOSm1aopeXpKnxgGqs3n9JHNUaRRdqnUB0J8IWhfXXQdJwZ3OIZ+bnvQwFDd5bsVAEkt8kKFIvitrIF4wms+QRu8lz5Ijb5mCt/vAF6A2+fPMNB5A/Cz2s3MY5NWZunpDNJScbduTv+R6e10UUDfG6MhISZxf/RGCqpE9M3xfYQNwBHeefOOiEw3zkTdc0p8azh309/SoAdC46fs7TDYXMCSYXHLeoYCIOMl8CrzusOddccfkTWHsZA2epBgJnBnZBKohxPMCMcYqIH4wN7GhtgeBTPwptXZkYa5o039Jxv01oVydtFUEy2s99BSkm7BaAPc6TAQggLv4x</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70J829IpyFmlq40i3RbuC5KW9aoRXED7+o1ygpQ0Mh1+htviYw17I8oosV9YIeaIZk5/0u1gzpPx9KCgGoBtS5ebv96MRkxVja5IqnptIa9LoC0pTi+cxDuGi1ke+QOmGb/FJydk8q3TWx7/UBVZOCRaOY1KH2tPVTsJPNfpkjIfcyE1MdIT65jjDl5LqZMjE65fRzqCpzGKEsDqIW9L46u+nX9GNX5gYdBPxK7DFTQjM2d4fuvpdgdARe01siZyYsN+74s9LDGMNL83X84lojmjCaOvE45eQL9XUhlVei2vGtxg9KK8mV1D4DgPRKs9oKLsDRx+jc6uAQSrmLjplCly8ENHxRBrbgaBWfuzsvq//3QGbSD4HZc1GXMQ54wTWpA==</encrypted>]]>
    </text>
  </script>
</dir>
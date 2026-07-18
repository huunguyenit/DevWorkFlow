<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmpv" code="ma_pv" order="ma_pv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại phỏng vấn" e="Interview"></title>
  <fields>
    <field name="ma_pv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_pv" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_pv2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="####0" defaultValue="0">
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_pv].Label, [ma_pv]"/>
      <item value="110000: [ten_pv].Label, [ten_pv]"/>
      <item value="110000: [ten_pv2].Label, [ten_pv2]"/>
      <item value="110: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9uObV7QOkBsfen+WZqTe4Jt1AqIer67yi9X8Z4+L/79Xmx9zfTokwQ4/cSWQkWm2XOGvgmqqu/Mx7Svz7yocuY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1wCG08Iofxvb34CPN0r8ixVbaAZPGWHr3TyM44/3Si0CPVuleXEdxAOCTZfAVuozdwcfw5+3u90LDCdbwL0wCk=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEJzsjscO2BnRTR0gjWtsOodQalA1FkkW/rW6o8d8TIkMkmRhWoVcUC9Qi6o7Gm6I1J1RbFsDmKBrpgIqnvmFRrypjttmJj/iZ+zL0y6ksMLI6QjJiub9560sac7pCDpSOcVJNam5jbUyKVSEDmQixX1zupN8xl5jPahCsom5NPD819sigbRDD0R5U+1z6tRS36J3wk/Y+40IvUJvymSFSSEz6vDfFePK5sRoHDigh1IwxPp13dt9qOAHfrH65/wJ6h1wAJxpPjuyMwZ0xO2EoQ0eqFxE+krg5c+zeYMKap3NHKBz/YfM+j0qdvOfrDTEX9etlfHULDTvAQw76eYqtog=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nD49J741t1Qzyd7zHs10ZaHZJ6MwjaGNjjHEqzr6fijwy+OHIKd0YigGJEA4f/mqCx4VRJzsnX2p9c2/szPN2C6Rh0dmjEO2gSqZYFfhqGacXWQ/bIOs4u5Cdnh03fpZQCDuL1cm/W+Z2zUlF2n13lR77F6huWAqUK3MneB9cjmTCij60n51QhuqN/d3ZjoTzUAGjZLx+aYMQV2dF1YN/t4+ebNmU4XgHBpeOBVrkjjo=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jQqwLK5htDRo2ourq/tHkX8gkc6aqQJOQfziod00JhmnpYdcl12PYToRPxEYLfUF3QQcc3gzx2ZRASCAD1KMnawGtSgmEDQGzuLR1U9jqFeg/2D1uw96ciUkvdeZEF1oAbPLfvTnZiS46xsz7sXy8a5UbVjpxKQFWKTnWrCgrzpEiIlubK5HEq2STd9vVS86S1UyujD23jFKnmDC0r0K37YkBLb0lSpORjTO5eI1mNw3jWtQwTUc7GH6iUhJtIxJzgmcKsUsXvl1pH3kevyIK/w==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev/waI6ZKcLwqj3lZN28jzhfaDsNLGYFPMXOvx29+prX</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AxzAG4bdJ6ntszIWnWU0gUky3Pxtxpnnrjflzp7qQGrGmi66QLE0tJDVpFC7J4z2foUWAxbvE2Ggsuegu45y2iOAnJJP1C42yRmYKZxRNttctLX1upfJuULa9Qmd2saWhq1KATRWUvbsTTFayvupRW6wbP8Drjw7CeHLLWRDYCr1Xc6ls0UWJxJuBway0v90jaiuZgs5Vo6FhSju0xTS1uZNAuY3filgYhwHPeQfAxxdAM2kT/ekUmUZoOy+t2tCWZ6EYUku1EKNHtb1oloZz4fKvR6in1zUYW/YStJi12J64Ry1iCdA+K7BnAmZnAub8YtY1jqdZGofC20Etgr2Eiqaci+4xObqDNFiIURQ0kc</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
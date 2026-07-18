<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmtg" code="ma_tg" order="ma_tg" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tôn giáo" e="Religion"></title>
  <fields>
    <field name="ma_tg" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tôn giáo" e="Religion"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tg" allowNulls="false">
      <header v="Tên tôn giáo" e="Description"></header>
    </field>
    <field name="ten_tg2">
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
      <item value="1100: [ma_tg].Label, [ma_tg]"/>
      <item value="11000: [ten_tg].Label, [ten_tg]"/>
      <item value="11000: [ten_tg2].Label, [ten_tg2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcl2RomDa60x354maV10lai0mRccYwS6ci+DQQvvYFECMldmBh28YXMFBFJ9aIU0Bw=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfywFCnvqlMFw0RlY6EOha1+rnIxzNjYAosXTqsn/6dfjq/npy/8xRv4XeZi52PaM5gsLJbnuBLKuTs7RVSwT1aI=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulivIou3e094Gnq/ZybzuLaX2txm2ar1sJnX9VomCO+mRPoLPlp9fNGlXCu4uQ/OZpRyBt7/ejQunGD3B871f+aWGAxAVq3ioRJkhM2DEE+ksp9auDaC312rfupxTwrRp8UWZTvgQeWfs90KbFCEm6adi+D1N7w/iG9SVMKNDlddeq4TZEIOjMMeaxpCZWmkDOPGY+y3rDrFog+3SxvEg831yQLmh9Ui2ymMwBALJSow1RuNuHUtX6BsQuPsmGi1/PkpXIYXTt7RqT6S76R4vGhB7GalfvSm6lkE8TzlF+xtwPlgTzaTM3SKg9Cs3bCbz5e1B8qvjBASkmCSIaRPawVQA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nd1MWeiQLJoALRbvQqutOJ2NnhQpG96tdIrDo4qgc/sOXELIRnT35Oy/U5t/ELodfgLwLaayetzKoOi1DveWDfJGn90LUiLWN9p12c82Ahkqdqic+HvcmiX5iJrW4YL7ERsnZU9FtHYU6n88VZMwRm8c/32Qdiz3umB40YS6lL6BI2WxwJlo8ppEbuYSU+znOuGQpKPJFbNel5//nQGPDiQG5UmxzZvZG7aUC5Yrd3vM=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j1KOb9zPj1nRuhFWZYL0FLuBQMJDN+Ol+5W9D7fDW/fAimw7iuY0sCRhzlgUTHsDX0eVJ8Lk7HfBZR6h5AdVY+MLoofCMlypami3VovYUtUg97CBxQ9t0du4Vll0PW8Kg1laoiEvrjsi6HcnB6USx8LBS5wHQbok9uDNctcRuUtlblmvLEs+viM892Ml5VQ63kvkT0T3FvkHxl9/e141r9/N4KNhXZoOg3DVsKYZtc3c1U82TYQKM/iBhBFuOjlFk</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeg1afd+0PILrf/QS9QfQdxgYvPwD0GKE0Fb4xzT8StOb</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYX/hYn8M6IytCKSEVtrhojo2ETi1FQXD+M3Z13ez1jias5w6ZEKfT9i86UcUqnixkTlCezaagx3OqMW8pz+RspIh1mUhwS4jPCfvlAVv9YuB3xUIPhBqDwtOkLU+SlJ2aeawUOnEP4w1LPWo4DoL3AUzGZEA8JlFHAvTGbXHvDr42j0nFxNRcuvPrzMsh1vElGLtfLyoR/3ISfBKbSlEhvAFRHgo7iHzu6/eFisHnw01ut+SEkgh7T65+EKlvJLl+iI9i3bi7nsVFBkewoHvWtfs258XrsIZJSGrpN1u3OU6LjW/NYuPh0OLWb6pbh+HtverUJr8bAf1WXrAb3E4JH</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
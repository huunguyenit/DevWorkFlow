<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmdt" code="ma_dt" order="ma_dt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="dân tộc" e="Ethnic"></title>
  <fields>
    <field name="ma_dt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã dân tộc" e="Ethnic"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_dt" allowNulls="false">
      <header v="Tên dân tộc" e="Description"></header>
    </field>
    <field name="ten_dt2">
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
      <item value="1100: [ma_dt].Label, [ma_dt]"/>
      <item value="11000: [ten_dt].Label, [ten_dt]"/>
      <item value="11000: [ten_dt2].Label, [ten_dt2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcnn9XI9QJIR4p+gVRDRXDSNG/I7buvQWwgG2xuRpOTA3PRKts+IcSkmqMSXfZJdUw=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxHqAY366rKGVNHlUEz4AR4NGEwlnWCESNW3PE9ZsyNi38kTkFwvuuXdUABpStdamwrfYXD9vNOBJ5KRQF4Szq4=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli+id0gJPMlMohbcoc/mJOwNJfnB41BttyrH48PlpKK50M/asiYiCc8A+8hy5/hM6UXNehrZtwUX7LvOh9STTWmbjLEYkcA9Pfj1XMuVIWYB7WKRy/oAyQq8QuZYeOA4+e16BsGLz3YMlDd6oGk4X2LH3w2bFx3Bo647YSbSdwAEtswSS5g+2UBuFCj7UQsaB53sl6G6DqGx7vieoOeKxIkmFR3w/vcOa51+rBNmhN3R0tGfyYSLMW8sPpk0SBjz4Dic/T1S/T961AL5RY8HK6D7Nb6ODeheGlmyOK8jjjz1CzhgVHMtuP3CqWciLKaAeEb6RVhZvkfbwMrp5JBr+Qtg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nRH18BK0F4iIvMrJMtK+4xS8qfxiN7DMHZdmFCR9qaA6706Az2JYgMR621JE3TVwZ50+TJNNSJRhv2ia5CYjcGothot7CilcHnY7VB8a4ZJZLD984gPqX0JPnkr1Pjed1xoCRZUcCn0fKcM6R5/iAoq43VQvtGFQyjC0QV8b9DkwPCBrBdtQYJ6yksqEI3fHC</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jfFpnRA7eee0Hewr7o5pAgBVrMfrlH9oEUpFM1jQ0R8VHT1BPAaCRgj9aorzEfgMcqd0/EapKOfYf6XmYQIlK7njLdBcANkc8vjbFEk0RwVceIwtkAGmQKFiCvvW7xCfomOka1ZJ1D1yvgMM0wSV6A2KOUdMP92E38glDQEJbn2ZLuoecx96JDrKGz6YYMC0UdaOEg4domFvTJcwPHtZpTOCFTHpDkyM8RNiC4iW1aMQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbejhZ+HuMc4a2OkeMC37hg7kSH4sq+F6D8wwipouvE4k+</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZ8ALN6Bv3FGrZJKvs5NxRkTyOLqb0zlwl2Ct+lS3e5f/0GA/t+uZA91sDF3P+H+l7OCac0tvzk6mpCtok3l9uoZ6Lfd3NQKhs1BPaxTtuCEG0IygnYGIYTj3DZvjGJsZvLkTVleUCDaIOFdhLxrysxezK05ePYsWpup3nuBKrvYFcleAeHbuAeXaFo0Cha057sdAWwDwQGyIar1Hri1vuN6a+3HC51LUjhPs2XpESL/jQROeAFdyRsUZs2qdKIvTv9Re3o67c175sZz1xQj3Ux6ahDNyFOYEg1YGYYj4SWX3YnbP1FH8nDymeLlWR5reg=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
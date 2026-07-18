<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmtdhv" code="ma_tdhv" order="ma_tdhv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="trình độ học vấn" e="Education Level"></title>
  <fields>
    <field name="ma_tdhv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã trình độ" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tdhv" allowNulls="false">
      <header v="Tên trình độ" e="Description"></header>
    </field>
    <field name="ten_tdhv2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan" allowNulls="false">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
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
      <item value="1100: [ma_tdhv].Label, [ma_tdhv]"/>
      <item value="11000: [ten_tdhv].Label, [ten_tdhv]"/>
      <item value="11000: [ten_tdhv2].Label, [ten_tdhv2]"/>
      <item value="1100: [ten_ngan].Label, [ten_ngan]"/>
      <item value="1100: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfQoZKsUg+atYUpm0oPqPYX2JHxxSxundgDs/ZB5LFZW+kVX9DJB+EQxIPwP1XLGcln2PQ9VzHbrmuGQe356Gar</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN3rmPmhU3MQe+NDLN7G4uZBmW4IKAmNL6BTvpeR3RCI570AEbEKpwNcz/VBOyMcJ1GALxrXViOS+MuQuRogySev</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli4/GlzuyqbHBbJGtjPn9cruyGu82FwH0W8qjRszPa4aPJX9zRJo7D7zSWiO1sjVpkK8yjQSZw0kK3NCMkf9O3K6+3IfxsE1xCWKWZ6WGLgRhh4+GrC7Vx3Qo4n1c/enWztPuTf7jikjuDHTGEZ6SVr4mhnBwlCxSpltucwLH3PbsOM6oCsRzuoHsNREEuYVskccjBifskf/iXmp0zXXTond/iNHXie65voGELYLAI+vDTO8nbXl/gsGfdbO3ReuBKFU0BqbJ9MdTggZVMAm5htnw9X226vyGtQ86CG2BEIsAm8OzRrh2rGOzmkeXMuGK2+ySipacQq6TgjCsELrC6dpnZmn1y9ZwlVt1zQeLB5Xa16x/tWfF5T0PZl4lfhQV9</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82niF9LUbJ7AVkRIycxMmntOFxTK70jB3BeZfUVAfT4w9AAQZQ5nsTRwSY0xpX1v4hq3igUepmu+hxvLAxlArxYwVwBv696CFEIgS1op0neQiXQTYNGFsby9cP9U68k5k5o4Oi8vADe+N+WEpm4/y0PdJiQbDYyKVPTgtd+vlEFphS3y8ZYCFqNDWhdTDLk8g4w2qPPAeBVYsCWK6DPqOlFMT+CPPHOAamgij2OWzhUv0E=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jEGAuPxgyjt36hoTZlQrsh8HhKn7MYMJ8UjBHGMaCjg6XT8/nWOfl8VE2UN9xTdWPigz+ZTrP1mxZIl2Xu6BcjPtyvnUsAYZwgi3lO/Wwfgoae5+/CyS4y/e/0P2859P5tx/sPENUAMHkXRtjVqbGKupi/OeRz+n18nmeWokuPLVlsx3VdbR64CYtVrRthDYt+2WfucRhiYkbADMkWjnQrZk3Gexv8c9Z+D2sJWMtQcgcKzZ+y/zlTuLpgTWvVWaQb69DTnerFXmSrCI5i+/pbg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbelzLLCTUH6h9VLUHKbFZr4JOJarf0WaihaYXPmF7TDvf</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbPtmRL8YlbvA7nGbZqY+oHy+L3YKO8y3G53UrYdlSJLxZYyu2P1o6OYnvUf645eWdmMX0fe3J13tD9EfNaEzoxpYUW2v60pnli7kzYeAD5e9OSRURum8UB4pq55wbYA8UITFdqsV+4ecpwaeeRts2wac9FzudnvgY1AYStjId4k3VpkiTdHRPu6kKcB8O+UFWk+lyZiaJ/aIraX8yCRctnepcPmFl7DWuDvKuwxhKK+3Yl7HGRK4ofscp/gQvcYyZj+BtoVq40gHhxiVbbIlCE4mxe3yE3VWbqv6Fn2bGreWen6KiB3ReTXXn+8aII2h34RFOC9zhV0G02aiPre7zA</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
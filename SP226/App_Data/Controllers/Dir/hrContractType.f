<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmloaihd" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại hợp đồng" e="Contract Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Loại hợp đồng" e="Contract Type"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại hợp đồng" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tính chất" e="Category"></header>
      <footer v="1 - Chính thức, 2 - Thử việc" e="1 - Offical, 2 - Probation"></footer>
      <items style="Mask"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="##0">
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
      <item value="120, 30, 20, 50, 330"/>
      <item value="1100: [ma_loai].Label, [ma_loai]"/>
      <item value="11000: [ten_loai].Label, [ten_loai]"/>
      <item value="11000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="1100: [ten_ngan].Label, [ten_ngan]"/>
      <item value="1100: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="11100: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="1100-: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4ZC3Fg3BZfeKD6gqeOhap+kXnHyezmp0U0S6/2ezbsYdfT7SIBjNx2eyO8Q1oCoTcH9QeOU5zuyFJ9tQZk0Bas=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4t1epWN803R6avRuiq0hr1fMlnAiFi1MLf2hAqImFsMPKPVM1Iv0ONnjSjSqs2zAOPuQor4YQ6PGmahtVC4M1g=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEDsRkPkTYxm7kr1b6AszmwMp2Vg+hAOPfileoZw+jt9Hao8fQng70jVhZqW5V0P48NyWQF07nwiCa8XKVs6GVJCC1A3ta4Y9p964a7uIXCMpdI27XAHzyYkjwYUlsiRT3u8epmc/tURYdaSvCJzX6cyCNcSIJXJBP3IDiANLpipn0DHX5chzGtG52E6rtiiGLnCbi6P4ohEdwveJuybKJR1b5xSv/Y85JxlIz+cMGJHHTiGBSxlYOk0rmfEZc4IgQDBCyybCGqfmUi6jr/SDXCO6Ajw1246r5428UcqCPneVfcGmLEayZguh6OYwLUXdCA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2yWu9hjJFlfsBY3klD8tats3kDmCDyXhi3KEawqMkLJjEmgas7elA3cWsletFMJG3+ikghBWn7L9uXLnJw3YB4lL3x0gPDj2HEL34gPeSYTh8krYoJgcFNIfBcN/ndXlwFLkxlyF2/pCAVNTvpJz0+ttcdeCyFnJThNkyOmDp26qJyYqjGtz9yh4ov6WLQ7NkMXPJhf6WS7GNO2TEp7GYSZEKblp+7ptT6m1ZPDZbE4=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwMlrCDlMuk2ZBU7CprWOeBQqJNNbL3cRPPtAK5XkyLEJq2svAsXCP7+LbQLrg4c2RwaxfRslgI020qRuS++u4NrmktKayefu3ipuW4+qsOZqqhSMXVr5QZOVtB4jUTslzm12GHiiSi0I/q4BGZyp1eF295uGZWb0oHuyYpa2Bz0UMRUdzyN3Tl1HuYmJNRBtRMvu3ftydnHDvkJDsN+m5e8Zn0T+BJlKoCwPN+thma1/X6YXLVao3leSCbPa/9QxIjGo574rOScuE7TnAj8RIg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbetWfBl0hcG73VT+s/+ZHj2hznlozytuZ4Xiqd+p6WVUY</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HR0aIpvmtYtEEw//2J3m3ft1lxx/4lIg4V2MlwYWnP7pKtCalRFOB3zgiqrdiSMhqiIbYa1BeYoYxW/vEuxl+dMYfNrqDg0j4dgo01qLpkdmHMFZ47wTC8eGr7sImE+3zKTbSnA+WhDk2JkwqFB7D6nkVLzicuRraYoX1rhiEWFTZrkHtWpT2zN38/3iFekeWIexAku5WKdLYpD2NWNgO978EfX5I1QV/dKKh3aMpy2TPV2HHQAhn0m4rLFSBXtsSW/vDCHK/8bgiJ/PA/R578JWP+MOX/qJM6bZ8BATtyrTsdyKnyI7/a2RlMstHbFZfh9Tavf9B6k37GGlxMq/cU=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmloaictdg" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại chỉ tiêu đánh giá" e="Appraisal Criterion Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2">
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="110000: [ten_loai].Label, [ten_loai]"/>
      <item value="110000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyWzqgNTJhH/yi8aBqTa/wqfZJj5/fq8FGo+XXYx0Nx4T4I1zmwQ1Ldju0SN+Xd0Ki7lIuGn4VJCLiVFlU2NAEMzDNuARhitllEpkyr+DUqJ</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf75jiJqIQTrjZlnq9kvx3y9MLNSd/yj2O2Xfdooe1RYZVDHA5f9OuPzOrEtyDZ9D/SsteJKoBoa/i7evSFKybWo=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEGPU8kRQiWNRv4LVZWTcJSYPrl+9Ya7GQ+7Aly0TwpBbDwOUiR+czE76EMtOZnRafyEIv8gVuTY1bWKbPnogI4xgS7eGrtZnanrsJIlPu2L4jbYRtT77X645PETJLO6EaxTv3YdrU1J6amUcjnsZV9sR/x8tl2P0JsJ0bh/3sTcxZbN2A9MuHWfDIGj0FENIpq56w9PjbNuKs3zru/+ajZgBMKguaw37dsbTEOSEzV8gJXtTlji7NMuwOowhbG/n9aZz4OwFQL7UpoRFmsVEReextBJucZ7TLvVmToJOL6lNA4dmQ7j83qlRjM5NTL+Dgls1pbleNcbIseeSq1Wihc0=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JwrFIjALGeRBeUCbJGJFfMqksaciUGejDnByUINb67C2sPz5aHtGKwwL2PP4vWmLt1y6OjuGj3Dcqb47yR1JK4Npy1BsWlCP0qRI3smEfBAHlw/0UaqeH9sT7y+Fe+GgvYmkrG19fAjpjarE6rjfPGmEWC8XWYuHTCDpbgRvQ8hpvCuqFksR7BIHgslSaBTc5y6SB6IpySeHwr2x0tr47TzHFjhW4+d2S1wQCr8pfDFTAxn2VCari/eSvbVtTMDGvmvGhRzX7nSSyeUPdaiVgM2DTeBKJo44nih0KAMrbQnQonh+uPOCdnckvljPkkIpKeAnzZVocAoJifO5cBYJozPOmJEsxuagaThaZ8tLr8z</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
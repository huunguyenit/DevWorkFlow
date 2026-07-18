<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmloaidtbh" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại đối tượng" e="Type of Participant"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Loại đối tượng" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại đối tượng" e="Description"></header>
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
      <item value="120, 30, 20, 50, 330"/>
      <item value="1100: [ma_loai].Label, [ma_loai]"/>
      <item value="11000: [ten_loai].Label, [ten_loai]"/>
      <item value="11000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0lGkIhDGq7dvBCnwQKwoCN5/kLYhCbZZf/74JOb2E/yknw6TRCdic+bEhr0TmMmczCLhEsS22QWaxAW7N8IzFU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz5WoNAnxQsVJGUybDsneeNL3aHgPff7UI8N2zY+DBPuLuMjjwTtzYUMj3pWjNhn5Jrk4+WzhJAjJPPNE+8cWX4=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEPPTMBrYcfPaqeO/GBdOPAdyPFKFv739IHdjzgxZ9Mgt4O+3YfNKesJojwG9svLYEerJAS+x/v5YbmgiGb8CXmfDv7ZZpgdbcdJk34Ud+sOuxit3TYmeQPE3QTcVSoNfV5Bn5L7lf3cN99TjH9RKvUaepUMFtw9/znkg+xRGxixP3YrzLXHxsPdPE38xqa5iUrso5LIHzDrdQGPhXHghLn68Abwp8bpZjJioJ/HRd2KIQQOtbjSE2kYocvUVyZ3WPaNqegXMc2qpALTuB1B+bI6L62fC7WedQ23gRJ2Sz8WH5L4+R4mf1cfmuMdo2CJrZQ==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70DX/nrgNJi9Ej23VNH87bHd19Pug5VhP/2Fh5pHiOQ/liHHmszYkmUi7z7S7BvGewjJywk8Pe+WzA2gLnKB7ipLS2GRwQnZy2ZnyQ63f0SD5OeCeo36Q9gcwWRBMFwm/oA0ONcBp+us92T7HBOKasxPj4WYbOCoqa1kbauo8xLPyyZYAt8iQOuc5BY16qJweDNReyoix/Mh2K0j+xRgwuY430DiEQ9WEEsMNGZHnmd6CYwFtOPSvs+zdeexP/1sfGBTF9QKPZFVcKTL4HnlNGwPCL7YXyp5sUz/iPM9IiDIIpS8n0/MC3jjyxmM6z0+z1wiRAG9Z5/mLI0G6L3VLMRk=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
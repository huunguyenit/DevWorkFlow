<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="xdmnhyt" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm yếu tố" e="Cost Factor Group"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="" allowNulls="false">
      <header v="Mã nhóm" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2" >
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="110: [ten_ngan].Label, [ten_ngan]"/>
      <item value="110: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfDuYxXrskTC66E08df4b478AKdulxuFt/nMsA0pxjFV/7pNL6bqI9nWukUI7Qxda0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaLw01+3rzRinpLdJYd3w7i+iwJb3CtOick0XPKe8qbSa9YgYUZRGR2Gu620VeHNAw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7fBPeEHp0UmTTR2dNmDhhPAJynN9aMEz4AjjS1p2gWBf3OhNo4fB4oPyBuMTVIgkizF0JJr9RCch/YmYKIjtnuxcnp48KDvZUf4nGMEAZNIV+C29HgEgEcpH9MopLsd04CTu50FOtF1SVS5B0afSbjbxBaxTLpHw/A7J8ZiGcxF4U+H6/oxlViZDX9QMV23T3AwKvFFKejHxjpqK8f1G1k1I0IN4Wa4mBnY97dbDxDyiaCmk9j5Lc+hMGxJBAxftSlQbjUNV2hUzV8jCcLXqWTDU3kx/nz30SoGJeJmzKg1tG6IpjMaw/nEXI1kSBcvZ/mx2jkZrWzA/FHSSDCG3W/OSfgxQUZ9Qwnd0wp8/I66y5tmmfzUrPC9ojf1gPrAiP8HOHZ0tnAomVkxyERzQLyjcdbaROQmW1cOvymYKgyK9x2vaWuwZ7uKgY1o72p031E=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nmO7HEg6pdRyICA0emyDinOvgPt6yN1NuJeKazRV1qUB4kkycvzaLvyBc6e66+Xhu2Fx16hlXjSi/LFXfVRiC+L0O9Gyz8ebFA4mKvElPDp6kh5VApuKzyHk/GT2w73wwO1ktuWdFpSP7n3wLhWX3xQY+z/dIF2lYNT3k5v/e8k2LwsM710hbjsknvs8sgezRwdRFQGdPxfP59QcKgssI8Fap6Wlp5shBCmB/YOa9e8o=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jlUm+KYjerF4fyFdcFcgOgS1/aHNIWKipQEx1ecJhWiy6OBvoVyOxF8AWjya/yW26SEkuhx7F9PLk5maBSiBC6QHveh94sZk4sY4sMnEpOkoYU9hPkSwBzerdqMviB9MFf6ShASW0Q17UdkuvCc766ONwzkiBgVPUxNk26N1rvsdgMdSbbLMKxWmWRFaO7oLUHQIbzZzCJ+7nu/M48NL7M4Ki849i5MJkBj5Lmipnm0g08AxcijHNKQn6r5LxYrn1DH4Tvjn3U1+vklOcFL1BSw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesgG9joAWjFtSRPOCAjSMfO0qGd8m52QOCxTlqRlPLBS</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYrVAxAnbpJyAWONtiiIjAJi2UHZ52dc8Dt0mk1vy4vbDWconazJ3DFL0eEMTRPAVcucsNSruiWoCDOmvoN44C5ndT+y6d00sw5KSTwhqrIEmO+21kG2/Mb0oiw0IFBpwhSvuiMPG6FKJHjT/BhjVdBYtJlTmpr6q8an7GtMBFiFYNqk7OLm4YwJ04lTsHBZbbL/ikwWpJwwYsmcZR2i67i9qZdZVAGygb97msbjEbneY7rW8gXhXIag4Dkrmy6k5gQ7voTuIpaA4V2c2oT5dgALAkghrCktiUCTIBDwbOT3fJ9e7lqQw+pvS7GO1BECqNN4WA3tjusoa5Sd+fFHAjI</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
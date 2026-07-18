<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhkho" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm kho hàng" e="Site Group"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="X" allowNulls="false">
      <header v="Mã nhóm" e="Group Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2">
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
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1110:[status].Label, [status], [status].Description"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdKdMj7ZIW0UJSDejzfhlWdWP32zMNT9AFKMfDT60nzT40g5Zn0oskW9QsMAeym2Lo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaRaVRiVViS9WvA/pAEJYXpMZwIWVcMA8iQNgpylPZ3bjAl6asySeog4ZbM51K/SIs=</encrypted>]]>
      </text>
    </command>
    
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7ev4ceN9SEOymXo13mlBnpoHUYME6PKLEcOY78lnuq/xHgbX0M1e9Kovo0VMYcW0HuD4wprn/E7wKpwb7UpRbhhsEdNgVfDVOQXJ2m3RNfrblsidoRS6aEoqDDWSWuXFLA8amyurOHVcoTxI8AFCLd70FLnSwJ4uEVjk4jb/IRNbVuc5706yF2GOX8CF0QImEhwoT4kRJtvTLN27OXdaxt9asfjv2S5LHPlEQYuc8clnQlz4RVJPC5mDvl0KVHfGkxx+Dd2o7p5ggg4u+OV44MbcBbHni7vNgICQyZ1KVD9awRfBhrdSj/G1JTWhMJUcEnW+Ou7MuPct4x59KZPBN1grIcKSznYds/K3f0i02TxWh121mpo/36Blh/9dS75Wc60+L5/y8Tj/1BxZxFfKow1j+yicgYO6Xl26pWmFRYRfeifzQQY1Kplh+EopvAfVpk=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYU8dYkBc+UQlPVWP9SAz4BpuyoD+4OKTsNC45WwhC2wn2SmHyP/PsdkGNQ//26F4IueflYHFeZsLBYmd3f6E8UY3OXfZvpYe+4VoufYihfc+3Ci5KoCVhlV7EsImf3x6eZ1lFvvIiepc65bQ/mNTmDI7r9yp2LAYfEqJU05nWJeTeKrNlB4BmIpi3BzgCtKdqDiPEPVBnFoGCzjnIdupH8zTbW6pNPinkxixxYQz2DTafeaMOOzVW78/ykEJXVT4I6LVZbC/xmPZQAqrbe4bF1fnLBJLYum+mY8OYCBoVX8X4GE21e4aBtc7N+fYdEjbGG/zv+OnksBh0GrM8gehY1</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
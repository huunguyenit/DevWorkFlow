<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhvt2" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm giá mặt hàng" e="Item Price Class"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" >
      <header v="Mã nhóm giá" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm giá" e="Description"></header>
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
      <item value="120, 30, 70, 100, 100,130"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="11000: [ten_nh].Label, [ten_nh]"/>
      <item value="11000: [ten_nh2].Label, [ten_nh2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwd3iC4Qo4KENUEphedztsY/vJrO+7BVUozDVlF3chwzeW/QKcND9hfVjENsN2YeKLVTl+QE0guxEjcmrk42SQZv</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN0ytgWRLpGa9H9kTiQhhvENnQWNqZk3+iaKCuiqI43DXC/QYLuQeuoEkfGGp64isqU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7fBPeEHp0UmTTR2dNmDhhPAJynN9aMEz4AjjS1p2gWBf3OhNo4fB4oPyBuMTVIgkizF0JJr9RCch/YmYKIjtnuxcnp48KDvZUf4nGMEAZNIVycXziE19BSGCddfvQMALDYIAEmHhwXg0CUNRU/knGDPLnthpCenurjahrb1jjz9GPtAeci1yhkM7n/TMtPp1SgQ7HYHgmvkyCE3Fov0w+mVzL0Rn8DKY7NnbsbAQUeaux7l2fXcWBwoaICm6aIy/MLQwsUoSVMvBSx4y/3vSaBvngCmp+UAOfR367EbC1JQijsdIqxd3C9x6a8RASsLkyWSlXvAyCNNdDAlwssleP3JuWFhhNFUeAKWXG98VexsVuHtPTJ8hPQxPTFT2X98WojImqq8G6kjQ1Zdn4OgOtg1fTspZ8CeCuWxE9J0UHOIhinNH9VPuEOS9eDfBvFflw0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nmO7HEg6pdRyICA0emyDinOvgPt6yN1NuJeKazRV1qUB4kkycvzaLvyBc6e66+Xhu2Fx16hlXjSi/LFXfVRiC+L0O9Gyz8ebFA4mKvElPDp6kh5VApuKzyHk/GT2w73wwO1ktuWdFpSP7n3wLhWX3xQY+z/dIF2lYNT3k5v/e8k2LwsM710hbjsknvs8sgezRwdRFQGdPxfP59QcKgssI8Fap6Wlp5shBCmB/YOa9e8o=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jlUm+KYjerF4fyFdcFcgOgS1/aHNIWKipQEx1ecJhWiy6OBvoVyOxF8AWjya/yW26SEkuhx7F9PLk5maBSiBC6QHveh94sZk4sY4sMnEpOkoYU9hPkSwBzerdqMviB9MFf6ShASW0Q17UdkuvCc766ONwzkiBgVPUxNk26N1rvsdgMdSbbLMKxWmWRFaO7oLUHQIbzZzCJ+7nu/M48NL7M4Ki849i5MJkBj5Lmipnm0g0n8KrPuQ4E2KtR+zTOW0AzOHMtAs6jgcObVTRTd0siQ==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbPSLNMkBTD+pxa2WVpmRFL6IC28J0aSXAs7A27XBmNNncdDmMJl+GdH9ifvxAxGBT18LHJY9kyj3z49VSaXL8qW2966/7frT1Yk4NBej74alDb1eNnnzhOAB39ymEoBQCHapuckgvTQutYxb2c5+yGBEIMbXSMudGfZPveeR+XAhsMRtl2FyrwNyjmUM8BUWaPFxqbFJyZ9AKtNcxHGBC0gywwptOSzt75Ptquf94yR8M0AW6qve0zxskXHckcl6KHyuMhCQnQJMd148mSZUsTqFCnix1TgLSFmVnHHpY2pau5RZyEIDkOhNz7lxFjivpwOjIGShNh0NyQYT2lplLC</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
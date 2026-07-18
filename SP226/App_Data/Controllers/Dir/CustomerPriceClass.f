<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhkh2" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm giá khách hàng" e="Customer Price Class"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" >
      <header v="Mã nhóm giá" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm giá " e="Description"></header>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwd6xnZpawBZGil2XE7ZxXiWEvDs5cR0fzlWPsSEomGn0NRX/Jzn1NGeHdCRVgBDjcK1UUOv/yxpsJRB7G3VZnic</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN1kYGTEQgaKfDDR1aBGxA0zGSj3H4aDZj1f1NiTBpXehIyn28XIkVj1ilYVzGoQ0ei+MGQAH2B1nAkjrnHQ549c</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7fBPeEHp0UmTTR2dNmDhhPAJynN9aMEz4AjjS1p2gWBf3OhNo4fB4oPyBuMTVIgkizF0JJr9RCch/YmYKIjtnuxcnp48KDvZUf4nGMEAZNIV5a+ISCvCuRPbEy+5lkhWpRp4zM0Ur2SFLu51HTz4ngmXPoe2Dqu5TwqmqG6AzN4ImP+v8z/++M4wHujQyZRVcNRiZKEzxURfnbbtZXynH1Lu/POm2wnqjyfSbvXRP3LLv+xEB+e5AFap9nmYnRke4WtHUEQJ7ilVYJ9hiWLtEU6NWjOr1BzqCcJA8hPHHwxRmmCwfEEm2eJyvYkls+BmGaSaqcTpOkVnZnWcuMpJZQp8NDv4OmiSmDLuX9SNKDeAiJcMm7RYnxMc/HHGM6THqzLPyMv5/RVVmLlSYD9n6Iu7DdYSr63EDzwPSsUmnM5Aw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nmO7HEg6pdRyICA0emyDinOvgPt6yN1NuJeKazRV1qUB4kkycvzaLvyBc6e66+Xhu2Fx16hlXjSi/LFXfVRiC+L0O9Gyz8ebFA4mKvElPDp6kh5VApuKzyHk/GT2w73wwO1ktuWdFpSP7n3wLhWX3xQY+z/dIF2lYNT3k5v/e8k2LwsM710hbjsknvs8sgezRwdRFQGdPxfP59QcKgssI8Fap6Wlp5shBCmB/YOa9e8o=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jmszXpeSqrmgPN33BcE1BozxtT6Wl9qDmYCtxYM2VzQ87DwZetDfuTxDDtSJ6y0OL3+ExriO4zDA4T2FoKyd43PcAY/HqpgG2jXwaApTH0esR19ngtMMsWDbG6/VeBe5ea9gI9GtDAT4v/z7Hyc12JM4Q0Uu6ITQRZpFaI0MLTPiQ/Ssrsp64lm/uCTZ6l2wyZeRucfoVGTruBGu5s/q3M4VWFamNsHIkt7foi5R+rhUWr884zAhQ8Q5ROPgC5rdbycjCdAeubMBpsF8Vm76wjw==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbcEFa7rDuCod30K0el8lgJfSJxD0RWWXc9KsNuLWyNgsYdFus8at9HlmfB8Y3qn9FG8MBnG49XK+VebhMrWLJ+GhLLjy8J4bIHWyed/JXFwc03y9dXOV/eQ3hh+6HX80isQPtbrH1+pyE6l2AJggxS/uO7h0+oIws9ZOqwRCn54+F6dcBoPXWa/O4qN7UefzjWj9CDNjCDAbOJLDTq8oJaYQT56sJwBpiyHNrnP1/J0F0HcVuQ3vzQY3mciBugBeqcNhJcjl1tjl6dN3YMH8bpMAIq03fJRcbQrDofTNzHItNH0p1slMa6ImOl6daEDHCk0daIq306vvL9P2rtivpT</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmnldt" code="ma_nl" order="ma_nl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nguồn lực đào tạo" e="Training Resource"></title>
  <fields>
    <field name="ma_nl" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nguồn lực" e="Resource Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nl" allowNulls="false">
      <header v="Tên nguồn lực" e="Description"></header>
    </field>
    <field name="ten_nl2">
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
      <item value="110: [ma_nl].Label, [ma_nl]"/>
      <item value="110000: [ten_nl].Label, [ten_nl]"/>
      <item value="110000: [ten_nl2].Label, [ten_nl2]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx5ygYUqBflFA7N7aGadDr7ZCd6/78SPu6JT45Pdu+IUOH7ulVJQW3KN401ENyn2cT/VuKTCH7jAX9LCAAy4VRs=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxo9sadXlwFLP/JrHDWSfC4RAWJm62elG0vKQ3CRfIOfT45Xxx1TyZSXQrXGALzEZDTxuMiVwCtQAnFFwU42DvM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliA6poYu/Y8ZMKx0PsfiHaD2ZvX6eVBOA8eF35DCaqB/f6r6dwpiydytPNAk6aZXfyBBIB3OGoXcvTHvF8STyudSvoBvodOT36ckpChXKdmc2DK48nEWMyPxL6DwfBiC+HwwX5vnnCP1Aoo+aJi/P8sAd7C/eJqd7HLvLRZeGe//w2j4gZJpd3WYMKZoF2PJsx7gravHIn2B2gDaK5CPgrK3mQG1XwLgU2CY894UOpjrpUKeln2cThMiyZaSFwGpGA2kZB1oYYnkwknSCIALRKVciwVRVN0tTt/m3530UKhUeik7+3MIvX/JX6zanOOtElbkbeD6KNHV4p7+m3JuKVx7/wRnhQiyc9eiW6s46Rfno=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n7MnwjmQLl3dnj9AUSXixIo2F4WXylhYO8/gjhX8lNZYP0EIY032HHGZwjsmQbBkq2Mr2udeeCayndbnpwt+NB1uL7UC68b+JMAxgbrpFxSPet8EgcWJ6H2B3t95CmzrUgo1tS7h5kmYt8YaY7w6uInjV4OfW/lNhOb/ATvDfYKFR3b7QxKI3sZ2HdbUN24H+JOyps/Z1WQEYbahRvswmgkp2bSuLUmP8f+QgKXStNBE=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j5Pav5ccPWkHgIn711ftIGyI2SLCh89w+0rosDhJJXjrRyuwwlSpNiVQiT0Qygry1QbyN1RR0G9xN5gzT/Q78Ce5EQKJUlK/6wQnFEI3kzCNNdcWsIW3DWgrySrwj9/v4y9j4bOJoWn3XWSXLIIS7WtXEf08XAx/dmH3+9ky226lvbLRgusmEa9Oc0hVijePiFwMJy/f4C1SZn5SmrC8M40RZJyf8vdSAA4FfiR5C8klSk6x5CqcFnaM4gFHHNyntr0MDdDze5fEJQ+LfE0syzQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbegDZ8tH1HOKPY4fVJGKZ8NlCBLF3FxDyfYq2d5uxmXV3</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Oc0QJdCnkoxRoPQPeia/JWvcMuKPb2K8AzYgw2XCcvDeDMXTLkMbIBxLKguEUqMPs86TL8ZLSL9QvB5ZrTd1E95YLA1iVo7fdK562w93oGh/a6duzqMwrBDPRTCOE74NjggfyhQ1US5w3RFPyaP/LiTplnGAfO3penmk90iXXHe/ZAbA+BzQZUqpAiLdgtw+uAlSecRAT7HECoU5gImutt0aoeT6+IASiBs6sKoyUoPEpyZy1wyb7e0+lZ1C+Ue47eudAuhPoxpDD/zukpF0XFx9jq/1YgGsMx9QZ4pQCXzBNU7xXjKHHNwpoXeuvvVy3RXk9PNmhpCloE50wJnsoM=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
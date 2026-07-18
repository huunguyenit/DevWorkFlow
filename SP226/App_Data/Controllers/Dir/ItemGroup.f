<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhvt" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm hàng hóa, vật tư" e="Item Group"></title>
  <fields>
    <field name="loai_nh" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" allowNulls="false" align="right">
      <header v="Loại nhóm" e="Group Type"></header>
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type: 1, 2 or 3"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
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
      <item value="1110: [loai_nh].Label, [loai_nh], [loai_nh].Description"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxweHaMj46jKW27Ti9NDJ449bI13WzLsNvGTHrPxze1VQGRnStwcYjFiJMlfWWWznDig=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN1NeZQ0TK3cM21Q2a9vSPNS1sp6ZVwVvXireFzi2aYUloJijjoSTt8CTJZ2XiJ4l+o=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEKB5namNr+pUUo+cYvOAif96ck7r0WURDjcEjtuHFlM1YbBt83B2O2xM0o2mQx1qiA7BpLvxqhL/c2LFccgEk3z7LZ5PXKtsbwyttIWmcsh4sU9NgYIcAxaJNFrtjcyMujZFzvmYhMBkZdqFtdoxGKiR0CxrqZDg6NjLa82g6S/NTz/qmOimmFaiF1A4fGsIymUTXo6Qip44vkznNKIt6Z4DNhL9+K8sju8TkPghmBo3cHjEXMDFnnYPNT6RxWHwbDV2xuMst3a/LqNDgf86WwjOR1/1bYMRRmSt0dDQHejypuSl1v8Cxkaz4IX9Iti7A0hME0vWX6vkVgH+kR90C+VoIZxJCZv+5+KPve94NXL+JA+B6sJStymrHCq8EEH0JOKXv6lL37gUQmTv5/COoLU=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82naZcogpCeajCtEhgkNU3pq3pzFxVd3rZUs80tXohCT3xb9xkoR1ANYQ5qEgOKBxWcyOBEsWgbN33089p5xVkVVWAF1sf/BT1QEWXredUPDNNpTlEtNNl4cdskhl0vmFzNs2SG0lvTgxTeWShjhmluw9YE3Kny/w+BMI70ySuN35qwJs9UCd3dqYCrycAX3oEaxIEWmJ+pAnoEVHQlnP/Jng66hpwgYGrLgW3BMQl/UqNpJmWBHs4p7av3IU8s73gs</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jYVHtnfab9pOCUbSkAnVHEvsWHmqRhGNaf8MosDxAH4HOaJaSh7P4cA6PvWl63WLh6ARlGjAOsM/8uEQAYjg5dN5Hm5AwQhoash7vuf5M0SqJ8bPfiElCmPPH/T1PcFxvMU53vkBiZgYAeFTzSMEOEzAQ2NGo3RW1TCVXuLPdkReXpQpHNs47oelUoxzKDXnM+g97R1kvHIFqeE2e0x0x4BMliCWjjTdxNVYjg3HDwe9j829Oubhx43CT5hvKOP7XCcZzSkdHO6Jm3vyFKxgWZcJHcJAdQnSjDGnRciVzIaqvcveQOemglguKvtapqlcAJs/Iz4wCaGl7JEu4OwzJ+Q==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbehRCaqK7mRRSejil883DxjntSP1IFG0A7PU3T7C/6L5/Zb7/zagAyL76MHlhRZUzlQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbnDiBZWpgwn3sD33nWQiaX3Ujy9TI5ZjHlqh3Ag2A+hbPY/RTm3O8sUym+Ph5qZIAaaKMgtqCjwZZc9JpQkNivNxwV26Jf0+aGiDeR36QzTsTVhm2EZcnYC6IXQ+0aX+1k81bQVNpW4juPW1GgcVYXqzgT8eoNWmG/G9HSja3Le87MgjFQRlaJ6DAaOI6ba1GaY4Las/GHrgbpLc0UZ+g+Ely3SQwKqH0MgtykyR+pK4pN0Fn5Sk3L7d7ITv/qCS7Vw4FW+SBEjJM8FQN0rFxy4/Tu0EGNqfvIsAftksJG9N6sn+Zw2RUARWQSZxy9CvZ9xrqYrKhWwf0j8sfeiHhA</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
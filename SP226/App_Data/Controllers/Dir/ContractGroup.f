<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhhd" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm hợp đồng" e="Contract Group"></title>
  <fields>
    <field name="loai_nh" type="Byte" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right" allowNulls="false">
      <header v="Loại nhóm" e="Group Type"></header>
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type:1, 2 or 3"></footer>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwebsYJr8iBZWH+2wsQVDZE+es4iDZCnwR56fe4vjAFKr5hlQbwx6SB/EdXeJ0nbld4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN3/N4r6ROW1GqIpGROB5v+3cU5LH/2YbuTQYvT1cYCvG5i9ZYBeeafLkF2tYM72r9g=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEKB5namNr+pUUo+cYvOAif96ck7r0WURDjcEjtuHFlM1YbBt83B2O2xM0o2mQx1qiA7BpLvxqhL/c2LFccgEk3z7LZ5PXKtsbwyttIWmcsh4HJpF2slH1oOIVaEAvYjzx0JsAJrwNpN0nl++NBZiZP+1Q7G0LX0W0uXIcuzeW/QTr6tW1VZBxc9wpD6OFVyOotoHguhEU1AT8eBXYdUQuZEEowbUcCtlsshJIFmCsGhcO01l132n5jG849UTBkx0bZVO0oNunMMGXFVK/xLlKzBNG7JPVFM4KrQz+FRNczZK0yD2NSZQh1A+gPazu/M5sG/lcVsJXocIiRQa990BqoBlIvDLsI5SLKiHQcEEJUFo4DQl40famuDWP/l2nHF37g==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82naZcogpCeajCtEhgkNU3pq3pzFxVd3rZUs80tXohCT3xb9xkoR1ANYQ5qEgOKBxWcyOBEsWgbN33089p5xVkVVWAF1sf/BT1QEWXredUPDNNpTlEtNNl4cdskhl0vmFzNvVes4mSsSniO1iJgGQ434CCHJvlkoJYUmo1/cICeNhP9H+LGNaOcgEWrCNRwCELn9vvq7nGq4kahq5K3DkOhtJjxJhSaxzTaUTKoLjCRipj9lvyIEDtOYMxZMPZKvg/3tC7ol7QgKEKsFmYzaQ5waQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jYVHtnfab9pOCUbSkAnVHEvsWHmqRhGNaf8MosDxAH4HOaJaSh7P4cA6PvWl63WLh6ARlGjAOsM/8uEQAYjg5dN5Hm5AwQhoash7vuf5M0SqJ8bPfiElCmPPH/T1PcFxvKbkVhaXeJyEJwlfWPBZHAIxpWGa5tdvCgPBmTN673dE1OaEM/8WPQustN8/BbosYiol0BYadFnrgE/8gfOzZfp9LWi9LRdkxnW+182U7C0sWFjSqZEceijA2Do1qx1M8oTpq9p+iTjTY8XMqOKXp2r13KQCOGr5bbU4hxUksvtSpZgfC/t/1VhM6l+iFXEPzLZNvTHRYW9Vbujd8LWELtQ==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkauoO8U4AhpBqOWKN84UYPqD2KYAY+JtYlR6UE7TdIIfJV5ifTSheOlkPIx0Z9vOI3jEZEGWEgt2Rpa3+uaLUWUuW2QCAUN0jYz+aL+mMDtFErotZ97wHRSFHiz3OANykkq8oQ7af0euGv3umyICE8CAgiLbY5Vn0znUL99g5YSDBw31Qrs7bswih7JA4VX68qiVgJ9mvNpZxBarRil7qwPnPqyi7eAWk2WHYulC8HkNPRQmfZe3kqd1NfQyP2tMplTwS+yZwlC4yqfNMofdVtVz+oFcYK2F0d/REEb+Hu6QKixPZQWtlkiheDbRiDC6CsVHOlHHaJyclg2DfowGP7U</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
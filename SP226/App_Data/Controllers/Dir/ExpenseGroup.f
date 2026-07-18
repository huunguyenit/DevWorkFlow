<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhphi" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm phí" e="Expense Group"></title>
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
      <item value="120, 30, 70, 100, 230"/>
      <item value="11100: [loai_nh].Label, [loai_nh], [loai_nh].Description"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="11000: [ten_nh].Label, [ten_nh]"/>
      <item value="11000: [ten_nh2].Label, [ten_nh2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfKGo42/yZNp7/8BNrTzJUr3o9dh7Rj09axiXo1rZVMMFkFfuP5GKqMNKrKrWvMUFM=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN2i1976f/2n/7AGHXqM89PrQclxWRw6nboaw+XruL9XkGg96wOs4qOcgSDqOHOo1Zc=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEKB5namNr+pUUo+cYvOAif96ck7r0WURDjcEjtuHFlM1YbBt83B2O2xM0o2mQx1qiA7BpLvxqhL/c2LFccgEk3z7LZ5PXKtsbwyttIWmcsh4qPEEYX7XV3ps/wJN4fxzkxZtBLXysEzFxZ3PQeMIPLo74EAsv2gUIfVXhfdeGy+4qGQwXzcK44x863L6PUk7ITfZINT17MtzpZLpDpi8f8Lvjsrz6ZIXFVC8Oba0ycnlUbKF22DBtFOMaJKQ0dUleAqI1FApo65eSuXuFAr+KRpWCPPb8P32BfO6+YalQM4EQowKFBh7wgwLfyfTmnUKRiom6AIQxXhMihE+NO7hw5+wlnMIV1Sg5Vqik4U+JrQPV/O6FHzu7xg89oSrybQIuw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82naZcogpCeajCtEhgkNU3pq3pzFxVd3rZUs80tXohCT3xb9xkoR1ANYQ5qEgOKBxWcyOBEsWgbN33089p5xVkVVWAF1sf/BT1QEWXredUPDNNpTlEtNNl4cdskhl0vmFzNfX8sqmyi8oKoeexDsspDorOZuk0+8FNGZywIGWV/ks83+wnxDgNqLZ6Jh6Qah+7kzSkI7F1EpOF0eyrD7Xzx1FhK4G/7dmKBh6pC45t7xemRkK8FtKw9F8GzXIxlWWVPTpXL55dM96M7BI84hXaNXQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jYVHtnfab9pOCUbSkAnVHEvsWHmqRhGNaf8MosDxAH4HOaJaSh7P4cA6PvWl63WLh6ARlGjAOsM/8uEQAYjg5dN5Hm5AwQhoash7vuf5M0SqJ8bPfiElCmPPH/T1PcFxvGkDw6RJwC7OIKH1YhZm69KvoWYYDM43D42Lhvw/cwrHQjS2XDHME0Jl1+oJEqCesEZ//SGTLl9EpKiRqo6lrjjBB9WHqwzBo10XA4XmE5wVR2wwrjw6HMe7mScErQyzsnAiME6cZAixJK5RFr+Ngu3ILgDHSRTlgBYa+1LPpWVajEybRpJcIQHXXmcTzYqEPNf9JGLRBqEhGs8zfEijENg==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYYLnOlfjCGkPb68DOnIq+N3msh70ol9IHYDC71wchSRFj4Gm5Mrf2bSr100OVOMP6ORagCNwrr8cn07fXEJRB1y+1oKIsbxsdZZO0G158iXzkbd9XZnP17z/Nifi04aALXJz63DtZfa/M4LwCCKrgRgWyzDhp1Vz4l8zn1xJnu2/2C4LV3pj9nKCQRTlHAANl5n6ZKFl0fmYUYuYLY5i5yCSGqbcLCi58k2LFt8+PWTEvxEvd+XkRw/g82KJs+kgLlN+oVRkfG0JKdyuj71ZOyYPJ3WRdiIQGiievBaqpTQiFvqfjyc88XBvOtAaBXqMWCqEyRKFSXKwA+2MAnl3G+</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
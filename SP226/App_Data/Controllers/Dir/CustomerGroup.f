<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhkh" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm khách hàng" e="Group"></title>
  <fields>
    <field name="loai_nh" type="Byte" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right" allowNulls="false">
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwejlmWw7cUUo4dLdc9aeoGIa+tYk9EnKTmeDTTDtRKi/aMRe/DuwB0zZTZ94uoVaEA=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN3L+18qSawpF2YNZxltKJELPMhu63EDp91/21Day3K/GmFpmLIwyxxYxu3DyeU2DGY=</encrypted>]]>
      </text>
    </command>
    
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEKB5namNr+pUUo+cYvOAif96ck7r0WURDjcEjtuHFlM1YbBt83B2O2xM0o2mQx1qiA7BpLvxqhL/c2LFccgEk3z7LZ5PXKtsbwyttIWmcsh4rEbltqgUkU/wnsZ/7ir8vpZUDYZvgcS32wv1zdhqIGUuHE+VgYETWH0zQstO8KQqVgGK9AJMJ1GlCfo8dzD8GpvjPMpS+H9Qavl0u8FsVSpyehZ+9kK8ZlSYCbJjid4+CNrBtcUJ1gCGQhU/yrIBGKkYRRUB840/jQdGID7v/oEV3Bh15FsYJ8611955pAqHy38yBX4ehyjDfuraVNtZJf1X61QrMFL3vCElOmpNa++e9Ah4fsnTqW5sOkjrB1lNRwdb8GfmMZhaZrIr5jxn7mTH8D6nXcbkF0wV84ySC4E=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYc3z0jS7v/1rGKh4PrJE9+dpPXzhnk/h6C8qOBSRysWGDRjSt+P4iqiUlUeY6fiml2TDi6YN3JNv/UNbLMnvIPmikJQU3GrPPhE1MfvROTlMz3kpIRm8qzEtcgBfmNHUBU1eaSJIQf8GAnuIpePvXgi5GNpVMz+iuoNXmpgQC4PUGR+svrUrZH/vLx9lY/EK9EQuThb5OsVv40TeSVrsan80xMJAN4gRXmpGeI4q/nVb4dNtMBIa64j2nvmF0bytQpZtw6SIcuGN2UHBOi2L/WRAahE2MVUnDQBbN1xPTBFb4eylOWlKmMH5o4Z4K1vyAHEEDg649FFtBXe4ZA5soP</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
  
</dir>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhts" code="ma_nh" order="loai_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm tài sản" e="Fixed Asset Group"></title>
  <fields>
    <field name="loai_nh" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right" allowNulls="false">
      <header v="Loại nhóm" e="Group Type" />
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type:1, 2 or 3" />
      <items style="Mask" />
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwemy16G8b4s3F/ro5KfqCV0afER6044Gin49w3y/rQH/ePAAuUwTrlaFKryjQ8L4F8=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYZzcbuSpINVsPve8qd6KWacn+2bUwX29JmzxNzr+TxMORVF7Cwv6yxVW6LwONnv9PA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEKB5namNr+pUUo+cYvOAif96ck7r0WURDjcEjtuHFlM1YbBt83B2O2xM0o2mQx1qiA7BpLvxqhL/c2LFccgEk3z7LZ5PXKtsbwyttIWmcsh4sU9NgYIcAxaJNFrtjcyMutyHMx2bxkKazj0hTVDgz3ECrTLkcMAAV7xlcj2xOaVnWcOfx0dH7c2VkyZnQjdZ4dvCGugqSvnTJZwi/LRH0NbfxFIAEFSRyV8UVqvL7GVPM+I78hQgaW/5bzdaAuMzxKeBQlwHCiVKiM92vmeeJkq+8tHnROPOr5kRO9ZTuctNb46u/FkydrmgIL+KfW2ZH1kCmMfO+o+vwhSkR//fU7KOF5Smv1rUHvkFUnkd8DmnPgQyzkuUWwQ7yDAdf9Yd0w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82naZcogpCeajCtEhgkNU3pq3pzFxVd3rZUs80tXohCT3xb9xkoR1ANYQ5qEgOKBxWcyOBEsWgbN33089p5xVkVVWAF1sf/BT1QEWXredUPDNNpTlEtNNl4cdskhl0vmFzNI4ZqClKjzSgth0EiQEofxwsSgT81IFEjvumRjjb6xK0+bttF3y305wWtkWrBnpW++bpFc1lXCkccX1Y6vtelK5aRWmA5Ppii/IOv9Dq2znSDuvq8TJ2AQwMj0cYYl1/mgCZCQGtI2G0Txy/XmdvmvA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jYVHtnfab9pOCUbSkAnVHEvsWHmqRhGNaf8MosDxAH4HOaJaSh7P4cA6PvWl63WLh6ARlGjAOsM/8uEQAYjg5dN5Hm5AwQhoash7vuf5M0SqJ8bPfiElCmPPH/T1PcFxvEVMHoJ0/d66500eWEAZlVr0+ahcTUVD8R7SrxfNxB9NugDrvZEbOPliTYJdu/D0fw4BG5xPgYt82crkcFrLSa4YHO+nbOknxqDtnDdECdLUKL34pPKdO/sX+vFqIdtynB1oLs7Kiv++8G81Lsz/R3YCQG2J90agCv85Q4PrJvE1Z7IYorqCKlH5kfdrRbb2AaipYrgO4rxxXoLMiTLb1/A==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZOvHYuBNjgG554cTdumPXMCfW8mdV0PiKgJ3iAiOFg+5T6PAxqFBJZIsTIhQDIuy+uNZ2Ck0rtEfybB54Yxth+elCFN9RMCfP/nQqwVevXRqSMWQkLwHHM+rTUpzBCBioitKxJJr9VWYwmihRW3oz3zUCyPxFaFg64eQptO2ZhQ2GkEpOL66808Sm1h1XPE+uYe1D887iF1mUfgttUiPVffvt4/5yHlby1+AsjQVQoLBs/fTh+04lI1NKU01wFzNiiMLcFVQ+E+vn4kL7tEX+NbaA7ED4wfMLlv/cLfoDEbZ4YznQRati+IKHVR/S0ua3PmGpFRZrbPkFuj86wT9DE</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
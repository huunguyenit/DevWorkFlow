<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhvv" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm vụ việc/công trình" e="Job Group"></title>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdrMOBdNy6LDCNFYCSa8ntf2HLLP7G4e4VPNS3jGkJ/yL+zWUwtP60GWloiAVAOD8w=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYKCRWH5tPBBlDXvQ/ds9V1KUdqvu5UB3jsPxLq1ohVQGjGvpslaOLS9Bf5KQ7TcW2A=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEKB5namNr+pUUo+cYvOAif96ck7r0WURDjcEjtuHFlM1YbBt83B2O2xM0o2mQx1qiA7BpLvxqhL/c2LFccgEk3z7LZ5PXKtsbwyttIWmcsh45qL/GOF3nMhqb17SXLJAC0Wn0oONQ9PTIti0C9n00qDxIOW8WUZ040ZjALUces7qzby65JEt/IUR7gp41vEL4Iym9OlYKJbhU0cj6sSUNwZ4CElNs9l27IkJlS5LsKQDKGGEgzcMDxFn2ZMB1PDSSVzdNyniDFsJsG1Wy/Idq3UmpLq4SBs5cTKS3eHdHlYTaFxrWhcDk5Yp/4RkeFV5z3nwCVLYe5AF60ec8HwFF2OcQrTG/ImN2IDjzAE8UXldCTmCEVBCH8yWxmrWhk90ZMPUnDL1OT6PK8Ay2aTDdNA=</encrypted>]]>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbehRCaqK7mRRSejil883DxjntSP1IFG0A7PU3T7C/6L5/Zb7/zagAyL76MHlhRZUzlQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbW6TsUzSJM/WAQsQ7tYKk3fPq4vZFZjrMExOIa89i+qxaVsVdkafuLBZWvMRgz/madQk9TdPzhXooAvgseEltH8bIeecAw2Pt7tDAEedOA/Y4/7L6k2V5HoGebaTEmaT2H/3iduBd1l36FwWldCmw/SLqRYLld9KSl948Irzdv+yBhe5gyE2sSGh3Loo3gehdrO439j3OdIjK+woq6lo/o6IvZytBvH0uHF19mC6QzFSpMgO06yeHZpBXZz4Dccl7Bs0okajG7UaYzUqc4ft1KegebrjswlrgNDf25sNWhrrTpOCGO3laQw2DGr7Abgl9VaTjhuKJHSbUHzZ45wZ3I</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
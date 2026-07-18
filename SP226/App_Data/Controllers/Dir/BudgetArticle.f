<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmctns" code="ma_ct" order="stt, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu ngân sách" e="Budget Article"></title>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã chỉ tiêu" e="Article Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ct" allowNulls="false">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
    <field name="ten_ct2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ds_tk" clientDefault="Default" dataFormatString="@upperCaseFormat">
      <header v="Ds tài khoản" e="Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="ds_tk_du" clientDefault="Default" dataFormatString="@upperCaseFormat">
      <header v="Ds tài khoản đối ứng" e="Reference Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="ds_tk_gt" clientDefault="Default" dataFormatString="@upperCaseFormat">
      <header v="Ds tk không giảm trừ" e="Non-deduction Acc."></header>
      <items style="Mask"/>
    </field>
    <field name="ds_ma_phi" clientDefault="Default">
      <header v="Ds mã phí" e="Expenses"></header>
      <items style="Lookup" controller="Expense" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="cong_no" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="# ##0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="8, 112, 30, 60, 10, 60, 30, 30, 210"/>
      <item value="1010-----: [ma_ct].Label, [ma_ct]"/>
      <item value="101000000: [ten_ct].Label, [ten_ct]"/>
      <item value="101000000: [ten_ct2].Label, [ten_ct2]"/>
      <item value="101000000: [ds_tk].Label, [ds_tk]"/>
      <item value="101000000: [ds_tk_du].Label, [ds_tk_du]"/>
      <item value="101000000: [ds_tk_gt].Label, [ds_tk_gt]"/>
      <item value="101000000: [ds_ma_phi].Label, [ds_ma_phi]"/>
      <item value="101100000: [cong_no].Label, [cong_no], [cong_no].Description"/>
      <item value="101000000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1010-----: [stt].Label, [stt]"/>
      <item value="101100000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5ekeHVq0dK92+Dnrd76xYZ7GHyMGL9USuxVLCW7ct8NP5K3qnlQgHukFFzMNJrFyCs1lgR2pjQ/VmpGNrnQkSY=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FZ7Du3m7Rny2+OPmYoEles=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4VoMQaMr6luHdyhebPN8Zf7J2TNKUZHNBq5va4Bf20QyTtj5whDxe1iePlzePDrLgpkB3FhCtzAm+KkrcSJ6OI=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliTALPvCbqmHwGoeAPuLmm9c928DdmXEVwtyKR1wBhY8yp87rVNcIggKqfE7eNqpv5MFQ6biZrkCjI1aAS8eKKfH+D1JY1sXH2DR8i0wfAvx5DlaLw6Uyn+HRfcjtH9+ZkB95lpikxiT6vfc2Opc4sIWSfhfzFI9B2FyF9ucGoMhbchoHrdMNqN5IV7gq0+QxD2xzW2ps24rFXTil/OfSp9Y8H1Najh1IL4pIDcPcFCG3sbCl5FJGoPkvG7mmTSf6uQLTRj4fuIZCm8TW5J87jWCZ5k1mme2SIOp7M+igSIot0fSnhmSjWk4yRukLJQFg1/a9bdmC4ryC4UNJL+ndWPtkmcsWd8foYjPv6Qd6JeITlEf3o0/FIgrZrUnDVjJ+p</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cB7YsitluzfXMaOWNJAynyjsDrwz5t/aoHl+xsefDyQB7USUPP6ZXqlLEohZLzTNtWZFMr+ZxsQDMXxxXS4SnjrNPAWPZX93sXQNggz+ELp9jGOpeZdSgAf18vZY9PXtYuXxuasg/GKECkU+iTHMCMuVJcbkyJmlnb8kWL/ga6GrUqAjHzffIX5N/dFK3Skh08f3cjZnWx1BqjnLm/LIRng==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwd4y2MET4DtLkWcZxrbC8A/T65mb2pMzsr1Pt+1ev8QSXQ/l64fNPyaZgnFHtPeuD40syUSFUZtOOmr24V3I9Ru1KWIUgMvObs/T3qxbDn0NZZJ4H24dmgpT98RH5yIL75jh6TTFjqwiLGt9yc8dPs4OYJM4I0G1pwOEGYUHL1uVYy5IZq9nHjHYqlI8IcYy335lb0cjpXJu26fuHmRZjHvfwkHxgGBqmUIW4QtyTud1E3h17RgGvq2D0aG02hIR</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeiikR0KH1iTsKcqzpelumIspiZjVGjZEjNopiM3ayMbk</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70CSnquJuQVw1FOA3RXxOCAIp7u1V+tPSux02u1gGIPd9eqQshA2HKeJojJCpc6DJ8HYjFEHErSBZwqvrfqEzwjZ/9uW2lR9mF4NBnDqT05UZT+f9PV8I3p8ol6hcNDOLrGGKFbJTrJDgA1gFeQYtmCmGYiNfFPqBaAwr4T2EL94Mv8ghNxD+lPQ28wNeTVj74oG9INCFz/mUOQAsV3hiiytyNZhb0VCcNgUEDSPr6JWvWfQ3/mDN6/JrPNen7t1N/ahQMTluF/APheHxenmh2GZekpKpG3DhufSOTcghSUzmpeT1YTFYWM/dmN3f2A8OSHtUSGUZ5+C2H/JEBK5Wg+8Gz//ERtkxN922LRpPyU23</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmctdt" code="ma_ct" order="stt, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu dòng tiền" e="Cash Flow Articles"></title>
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
    <field name="kind" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Kiểu tính" e="Calculating Way"></header>
      <footer v="1 - Theo phát sinh, 2 - Theo số dư đầu kỳ, 3 - Theo số dư cuối kỳ" e="1 - On Account Arising, 2 - On Opening Balance, 3 - On Closing Balance"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="ds_tk" clientDefault="Default" dataFormatString="@upperCaseFormat">
      <header v="Ds tài khoản" e="Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="ds_tk_du" dataFormatString="@upperCaseFormat">
      <header v="Ds tài khoản đối ứng" e="Reference Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="ds_tk_gt" clientDefault="Default" dataFormatString="@upperCaseFormat">
      <header v="Ds tài khoản giảm trừ" e="Deduction Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="ds_ma_loai">
      <header v="Ds mã loại thu chi" e="Cash Flow Types"></header>
      <items style="Lookup" controller="CashFlowType" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ds_ma_phi">
      <header v="Ds mã phí" e="Expenses"></header>
      <items style="Lookup" controller="Expense" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="cong_no" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
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
      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="101000000: [ds_tk].Label, [ds_tk]"/>
      <item value="101000000: [ds_tk_du].Label, [ds_tk_du]"/>
      <item value="101000000: [ds_tk_gt].Label, [ds_tk_gt]"/>
      <item value="101000000: [ds_ma_loai].Label, [ds_ma_loai]"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4ckXmvGTX5LRYv+NSvzJf5Iv6KJrL3nse5waiFz0NW7kRQwfIJUVyTmAyV703KZspKmEJvQHBcxE2kg+gQ4tX8=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4VoMQaMr6luHdyhebPN8Zf7J2TNKUZHNBq5va4Bf20QyTtj5whDxe1iePlzePDrLgpkB3FhCtzAm+KkrcSJ6OI=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliTALPvCbqmHwGoeAPuLmm9c928DdmXEVwtyKR1wBhY8yp87rVNcIggKqfE7eNqpv5MFQ6biZrkCjI1aAS8eKKfH+D1JY1sXH2DR8i0wfAvx5DlaLw6Uyn+HRfcjtH9+ZkoQnrddLvq1pqHy19ZUhV5cKbCk0ZrzfYHlEvi2tu8FL258EeeTxrgkMgINxiZGBwW2EuotNVoez5YG7U+gYRLwxYDdrYest/qzpkCno++q4WEQ6Fk2R2e9swt4rKJCeKOc7rlZn52UoUPF1rU8nqtPdpU4xRC51CXl77MT4IpDy2mBB4wNgNuxkT1TfTwRGggFY1zXEKhI+HLJmhqm3MBi9GI8YKNVpFR0JK+F2PsSoiGfa19Xpv6OAh8cwLFdau</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70CSnquJuQVw1FOA3RXxOCAIp7u1V+tPSux02u1gGIPd9sV5c7BPzubTl4IjAZ3kUVPEFt1vZEB0REQbbfBq+SNZqqS4crfIZAKKnEegtloZUWYUjPG6w43vzBPf+RryIFKJupXdXfzPtKZa3FAYpcgOgDDJO5rV3MDMCjppCFfrdh9vgMwt4DusN+DLwApl+VjqaDOEn7xxGfZIxMpzCnDru2Yk4KS2y6+/NL/jicH4w3N9JHjzZqm9qssI2SAQMzYQsZIu26NoqQOv4wutFUPCmTRMFh4IdrsqeaRpvYWGWfgxTcHLuIRlJDQJSizpQtD1Tkbn15jkricLofHtfkJMhPgcklRAQ3dnd7Jt1oe1D9WwQxCKPdya/JCT1CntU/Vr+ewUXKfIOZwz/zdcKp/E8x4/6LNvB4l3013Qv8EO+ffhaP3O730dbLX32VpJGURTIR/cBVqNxw8Hr7lDct+sm0PGgxKnTZBAwVabJa55Ewf3cSti58RnKo8aX7t8DTdVEyG4CuUN9/LRYFVA8D+U00E8kD1cFQyewcOQHqsm1WcMnTcUCrIFOGTf4psXVr060mvOCOOvHKj9/HQFH1dDmQolOCniHsM7AQNke+B7tyl++l2lwWieOBL6WsGcAaDHIqkjZXRGeSdawoRWBQwHpCjmS/6xich7nD+f07TFlfPIBLTy1MdHmqbyj1B5+3HqTR/9Az0rGmFNdlmj3VbeVz7INips6r40kH1mDTXO8qJhanTZZQpaElM+WycGiChAzOnW+DJpLjPKbjZVHCYLkNFkxyrhndU9a3pmO7chR2ueJXO8eO4FYCouaK/02h5Iv9Ok+bU46CFnX/Qm2BEBFn/oNr44wNVsd9hnPDI5u</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
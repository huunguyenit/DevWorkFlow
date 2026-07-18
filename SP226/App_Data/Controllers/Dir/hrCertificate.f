<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmcc" code="ma_cc" order="ma_cc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chứng chỉ ngoại ngữ" e="Foreign Language Certificate"></title>
  <fields>
    <field name="ma_cc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã chứng chỉ" e="Certificate"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cc" allowNulls="false">
      <header v="Tên chứng chỉ" e="Description"></header>
    </field>
    <field name="ten_cc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330"/>
      <item value="1100: [ma_cc].Label, [ma_cc]"/>
      <item value="11000: [ten_cc].Label, [ten_cc]"/>
      <item value="11000: [ten_cc2].Label, [ten_cc2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcjlzwG0QEbehabvKz7UdG64kOKE22lbIeXUN6LDpoYTxZGJ1xZrOZ5nWX5i9JLhEA=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN1WkuRsVtfGTRNEKPFeNMlcmwG9qQ9Ci3gxUq7r6gzEDZ8lgJ201Q2M2OmYtgyx7rw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliTALPvCbqmHwGoeAPuLmm9dxSfupa3n+BStX7G5QkF2oKN/jd3uE25ogKN0+BiET2RLmqfY9pyfmyTa0Tquch/sj5iYbEtHQXNQlZvVGRItZj3Tq6+n6tr05EYWlW8C6+/VevuZsUaeGEiZ8vaLUzEbXUwo1eiUM/iLSDf45lQ2wIK7qzDYktH9tMpaAxbzd/iuQjLg9HN2x/tGDIdnE8oKYWY1VTJ+dzN50cmY5aIrDcUnlgQ1j55kU9OIzXTKbxXkHcXTMxnQCc/zhFv4kqew5P43InsvDkaw1Q9cXpTpGabX6X4L1NMgJ0LLxdUJSoiPukQD26b1ELkGOq6KDKgA9hzlgPf6ugF61420NAbIs=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nUZ5WM+67Aa3uGfiRmFicij/1JrqvfpnhN8g8hRyO1UTL50Q9SCzWtI0LbLU7GFnmoalv8ymT3u9m/Dc5NdjKTUTxuG23+WhCd8hN0Y8+yxg6Ikxg2h25F16DGjQOn8RIAq1ohw+5bhTZFWsgLCxTcOnwLxVDtlYpUBBsOs9MmE2NCULPSt5vKLXF2gVYwryed6sel9w37NS5sNN8Oah4463NCYoeCIWC9J+OkUUeC3o=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jXV+ZGpqlBJ9B1j+VIraqrGZuP0Zzt8THbvPRPLViN4yiUNEbmZXB7C1cZo1lWJ18K7hzAWSGicSgFktyGd4MjWTiBW8FCU7Mf9eLXFRsk63lliAnIqNajPWDhlnJJvY1CP8Ff/xIOOGGbSPj761vryIVJ5wa0KTqxjCvVz8yCL49US/aNlYblGJXnprx6EtE85QK87PGN1YGpE4Kw8bt/Zw/Gfc1q5hcpgg0B9szpsnRoVAFh2LzzoRItX9Z/WAT</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberqDPRkbIQARNkL48Cqfy6YG6y6cAy3NKLGMst0/Yxih</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZfcFOmWshT+JwS3dpy4EeHcE1g6Sq1iXN0r3XMUHFtq0Tvf+1QAk3BkBHUk5o6kLfD/gNkKje7engb5GKXJbiFLF1HLkqizDTMspYTW0VB0zKT6AbhcNU3zV81xOKfnfQBy8YCeXunU4bBVFGR1B7Xj86WS3yVEfyPY0T7xCOezq+CQRcIktxzQmzCJxZkJ8AeecqieKlVtIEnEUzQ3tj6Nd7D+TsAQTYxh/e/CBka5R7VdfoJATIXTVo7EzWjoWaKK3S8OwsaDz1VuI8yDT/fQJP/aeRncKTLcTtsJOrNdVtMhX8sUUk5rRHCMXZSI2ctZIg+Wq28gYeSYO5GqcZL</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
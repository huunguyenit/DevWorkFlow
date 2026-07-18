<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmldnv" code="ma_ldnv" order="ma_ldnv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lý do nghỉ việc" e="Reason for Leaving Job"></title>
  <fields>
    <field name="ma_ldnv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã lý do" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ldnv" allowNulls="false">
      <header v="Tên lý do" e="Description"></header>
    </field>
    <field name="ten_ldnv2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan" allowNulls="false">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
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
      <item value="1100: [ma_ldnv].Label, [ma_ldnv]"/>
      <item value="11000: [ten_ldnv].Label, [ten_ldnv]"/>
      <item value="11000: [ten_ldnv2].Label, [ten_ldnv2]"/>
      <item value="1100: [ten_ngan].Label, [ten_ngan]"/>
      <item value="1100: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwc+Vxlk5ZpgJrWYN/aZ2kIU4DvtQjPI7KaBFLUP5niioqsaDsJ4tet+mvARRvK/SElxEquG5UMnxVUrh0r8b8pC</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYZmgAlVqGCAjlSwmM+0tdjUAYR8hPpGyVNbzQi/jFh4G5rbxLt652q8cPY4qOzVuGJnZJMBaqBYxRgiBKMgMHCj</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliBGSFEJsrtTKjt6qIjhgexGjSL9hU9m3aOTf7tnGkWXgdLtGNZdI7FpHu15s1eellM3cBUb1kIQEeV81K/vZdyYet5cKjtyGi9alVZ2Nq6Ubpq0limbXsdiPwaKzGbUq8pyA3uJSczv8iE9cXTC71xke5ytZrAoOg7W2t50pM7ybzhSZi/Ho/OW7NRGhCAJYM1OHBZi0D4hDaW3gTK/GvQY1VkZA8PKOZnU/Vm1O52AW6nccEHRZvJ1n4Tj7Ae73I7vBRlX3NpKhZJthAjkD1TmmS/P8eA/v/3+V+A4qe7NLZXVqcDbOhZxsh5QKCzeyvYF65mi9+v2s3+7y5+qoxbLAts4RflgBAAgYx2lR/+M4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n/GF2v6dn7Vbf528oEtZdI5x5dnqFiwkzt99qK7ssd202IKFMnTpAqblUxDUzRnwm0qGA2YKBi5y6A7Mw2EhHmOu2quyVrKCZFyv4Vcpyobqxghxx+oyswfTY0QUF4BI5YimBcEEMcl5+TgvLx/oydeeao4PWPNSqMHPoHMtgov0bR8yZr6TTqZxyvCCSxtBTJcGQM1EQ7Q+bMFBFDxHGsqJCKp9hKN0I1lAkbipKoR4=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jx2v74J8ND8UXYK9qet54wLwUTK6gbxmJgLpzNud9aFxT4B3VAmROVZg/9TIVTUfXCZTWUZBSnn4wtUW5MTDOHIZkztQ2uJh4DEUsbFRso0DT2BF2NftJuMG6YjM8boPe38zYj4q7U1wPmo03HAAkQFl0UPgEPWt+y8gVVVMij6UTY/Y8YvRI1HX2ebMNhsmK8diGu7knUtmlNuDnmZ5AQNy6FHAi0ymDYnYj1N9s53KYJ79rx4z/mtxrYcPUCQm7</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeicpK1XA5PT4rf8zSNfxxYXhS5Isnz1AoMB1A8GNYC10</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbCG9lKvyZNST7r9NG/twp3J9KmQ231J9DKXVKZfHFgU+1R5bDlpsbErp5ci4eGk3ps/RW035bOUWfkVNYJujTD+FSD4na3oYI81BO4T2JNOKB1t79ipU2dnMeiPG6cREgiLPNeUc13JQTVEzw60ZfwKcSGylL1vt9npD/1zHoZ8/ac8ZoVxaQMqdgkMC0BkOku1mfmT7De4AiBG37HmyELnIbF/UfLRKMM4KOeHoMnYHBp03eHtsBej1fdQwyw0OFtYE3NRzsA++l/YWhcihp/h6TQzHYk9DF461ZqNhbxxukTWc9sVRCaHDkUV8aFuTFe6Z7DZjpyS6x+WSKoJf6/</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
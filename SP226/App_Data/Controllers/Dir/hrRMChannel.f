<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmkenhtd" code="ma_kenh" order="ma_kenh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kênh tuyển dụng" e="Recruitment Channel"></title>
  <fields>
    <field name="ma_kenh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã kênh tuyển dụng" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kenh" allowNulls="false">
      <header v="Tên kênh tuyển dụng" e="Description"></header>
    </field>
    <field name="ten_kenh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="####0" defaultValue="0">
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_kenh].Label, [ma_kenh]"/>
      <item value="110000: [ten_kenh].Label, [ten_kenh]"/>
      <item value="110000: [ten_kenh2].Label, [ten_kenh2]"/>
      <item value="110: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9uObV7QOkBsfen+WZqTe4LHJ7gmEemK8isDlPrBdHxa5RM135pvyWQxAQm5UKszYEvjhYDmsUIYFGEg3pZi/qE=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1wCG08Iofxvb34CPN0r8izkskgk6FQDFj1BX1r34ItfeDE4ix8//GQRnBnpsg806/s3ODyzLKWDU43chHhPeEg=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliiOW9+hfz9SHSRVo2PXTsq4jlWld42fnXRSkZ0c+8M/4pjLjTl6kLFjOtzmvWY2rb/xRQaY5h9MV3uvqOIzQIiKA4vaRYiJZW2oEfKtLo9RV+kIkKCfaWDLzeA6By3oTNQhfjJX+PZvnoFdjYLgy5Vs1UES+KTGuTbLlnEdks8AOJUsAjX9NbL0+d3AXxDpJF4Tyv5XhnGcBHaSuKL7dx18P61/V11dyz4U1nn/uQWikq88m93OAvXHYzzUbdd7TIyMvGWmZRCzjHuqqcj5J6n8Mx4/+joi+lH28dlBVFKD/xeEVZLCIfwWX5Zt9qOfwD</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nVIyrKq6MXue+hF2MJV/fWBtCphZZMkHEhm/KbOYiuIxCvrhkUUiwS4Dd6xHBmCTSCgBdQnUBzeSZXAaGrJNBBvpuKmb9CSp8mkt6LeIxEYWbQRbRs2lLvz8w24mBSEtZWdyttnnOSceae2rB+I3rlq1uYCrqN78neUD4Ui9cwRPGiXZ7Dh8KjWGZ4fVxs5a6bD/NeE2dnkPsM2SyL7eY4JkX6jR3hxggmGH7AWqxHQo=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jLXW7/lEpfUGU2tcrkOlXkD6daAsp5zh92WPg/Zmg+eDseEBYPVspcg3yA0EUFUfJwFEc9CggUyYEZ6mjev1FDbgSsMFHtw9T/nMENqVmx0Q45+ZAqAj2+pOrl84qLB2+jmrCbVLJMlfV7gC+5X9t8Sa3hu6FbVC8etBQeHDAc4T2jFuJn9bPXAOj+hZR7C+j1OSOseqpQpuECSPEmqrB1xRI19enPF5fzidkKsXRWq3XWv0CfehlielmXfQKvMj835Tek+gx4l4AExDASfqrSA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbevDwxqXltihnBg0J7INFT5g0cvEV7tEKNe5QynOk+Ykx</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AxzAG4bdJ6ntszIWnWU0gXLn8Isq9sVTjBN4cpgLZ56Lwyd/X0NYmB5OVmo32TXNBwOeGAxuJnYZu+6aIET0q3L3iJ8j4ux02zgDt+et7Daudt8ZBdLp/6brUtQI/EBgxXn/rl6QsVoqkwWg5ifHOlNuBRldIxfP9AhKQoclipsJKsdLeaL97llDWCpGUUWpyZnI+WV9qtTO9LFmYkNHfjtLSkOBsR4eTjktISyNbYvIpoVjIqfLBzHMXvS1xQHFEb3D9IegzJr3a/VHMKe1yNoVbcUoB28BYXSXHY47v/Pgc0/P+l6S5r04QmqTZeMPFfyIHcTbTMWtk1SNEMAoliCXoJs9Bke7AnlgBiorVgr</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
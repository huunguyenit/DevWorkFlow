<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmtinh" code="ma_tinh" order="ma_tinh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tỉnh/thành" e="Province/City"></title>
  <fields>
    <field name="ma_tinh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tỉnh/thành" e="Province/City"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tinh" allowNulls="false">
      <header v="Tên tỉnh/thành" e="Description"></header>
    </field>
    <field name="ten_tinh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="noi_cap_cmnd" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nơi cấp CMND" e="ID Card Place of Issue "></header>
      <items style="Mask"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
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
      <item value="1100: [ma_tinh].Label, [ma_tinh]"/>
      <item value="11000: [ten_tinh].Label, [ten_tinh]"/>
      <item value="11000: [ten_tinh2].Label, [ten_tinh2]"/>
      <item value="1100: [noi_cap_cmnd].Label, [noi_cap_cmnd]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcPiARnn6pyxilJgS6bwLX+EaTvnlDiD8P6iPj8vyxqj9JVN8qMnGNyKCF6zi7dW8pBoydAIWPR6oCBOOT1u5mi</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaY0ACImSgTqMt0XpXECQ0L7GNSD+aDvRg2q7tLpRyZ3nqsPQVO540mZIn1F99m85C/w9riwD6emin0J85EuxWw</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliFwhsA4eMqfxwHuG5jbSlvsb2vuMPbRyhLXPLWQ7tCwH1mZjVBaL4RWLjuRs1PMcHf4o85yjaoXUIThl0akMrnY3iFZGmgYsaFsmrdfS1ZnQ7yQ9cz0bzyWYhH8D8BU3bHPYrpdBWKETQ3ff3foH0H9z5arbAvqE31yQR2OGdOqQ6Ow1RlpYqgfTTfOeHW0JgxHtU7rtYfNp4irgRSpbi12YgO2+hspakrTNF0fWV5uwRke0QiXpqeYh0ZdPeY8QNVMKp7Q4F39eEpmv7pQY1A6oy3MFWubUInnONMz+QK1MmTk2ZcBYsCue8zeWIQ7ZlmvswoM0mCQY5fWpG89SFxDbl9yfSNCl9dJ/7pQc94r0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nfOywBK1iMX7KnYqRRtRri4rO/jphmk/LMwK7y2WuvVvlx5sPCPG77ya7Y5+hVV7+KGNTd8eCszgr5LgKpAPteeiwN7Pe3yBc0A+hOdkttgAE8bXMD+bGdeEZqtMBc7QJUZKEYZjQvmu0JmZntv4jBlRj9iY0Ox4zBOYHlneQ7pYdTsVmwgWc6B1LtXK+bMyOu+fKnOAzltLAYH9Lk0Ls6JUvbloJ/Qre7m2iR42mHFA=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j07/04u8dryEXXo4qLKMdBI9fHFq1YI5vZ3rQjGD5bUO/si6BJK1TkFw5A5aZmp7AKPa3lOhfnKidRDf8JDGWg57HG5to0IsW6+KsVDK+aTE5NC/q+h6222I3o2zWKx0/ccRhGluUESySy2yk1b1MlUTfCiE3OyHCwz9SU9/AJBDSKVqQwmVXLwiCs7uyV6mA/vHU04RZqGBGxXEFyaPqaSnB+/Z7NEA9VfbK8OfSNYdxb8xd7cmPE25FiKO18U9IhmL8OeHJBScjn+Wa3hjUhQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberdy+e5/dMQS2f9API3jiQSKPLrbooX7IDtnI7tjDXPH</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbiXX2Dk2+pGf8VpRjWdyd7KlYpi/LAW9D43GjRRfnOXMSWNsJf/8iW11CuWbCg1GOVXyTlu2VArCfvOca2E7HqmW7xSzOrPnlW725HWWqZOT1hlakOlMNDEZjF9Sg3GoKYNktOemPlrIRicvsyOUFTnMrgJKtctT8EVcd74awAl+Ki5qsPpjrFFJ+rqNjf9Q9SW5xR8hekxW1RL4UkBuOUDln7U5xrD8doWX6v3EFbEjHDwnRNqUDyIFQqEwNUh/gZtZauWF0tXqFw5e+K6ex4v3D6T7Y/y0ZNtmFC+8pzp6xqgW+onS76fG0ulxy4I0JZT0BCTifogvSyx7OjMAkn</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
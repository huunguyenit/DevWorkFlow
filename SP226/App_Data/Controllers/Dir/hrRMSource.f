<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmnguontd" code="ma_nguon" order="ma_nguon" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nguồn tuyển dụng" e="Recruitment Source"></title>
  <fields>
    <field name="ma_nguon" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nguồn" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nguon" allowNulls="false">
      <header v="Tên nguồn" e="Description"></header>
    </field>
    <field name="ten_nguon2">
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
      <item value="110: [ma_nguon].Label, [ma_nguon]"/>
      <item value="110000: [ten_nguon].Label, [ten_nguon]"/>
      <item value="110000: [ten_nguon2].Label, [ten_nguon2]"/>
      <item value="110: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9uObV7QOkBsfen+WZqTe4JA5UrmxGoWDBgJd8o9i/pGhlwY0D4R4sdZVIn2vk9dlcmls7GO2GeJql1kz+UGEuI=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1wCG08Iofxvb34CPN0r8ixF/F8O2RwpsAc8NcknwqcL6LGAsnCdZG3vkYvmHKZJs5nQsIdWhjWCn86dLafWpDA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliiOW9+hfz9SHSRVo2PXTsq4jlWld42fnXRSkZ0c+8M/4pjLjTl6kLFjOtzmvWY2rb/xRQaY5h9MV3uvqOIzQIiKA4vaRYiJZW2oEfKtLo9RV+kIkKCfaWDLzeA6By3oTNQhfjJX+PZvnoFdjYLgy5Vs1UES+KTGuTbLlnEdks8AOJUsAjX9NbL0+d3AXxDpJF4Tyv5XhnGcBHaSuKL7dx18P61/V11dyz4U1nn/uQWikq88m93OAvXHYzzUbdd7TIyMvGWmZRCzjHuqqcj5J6n8Mx4/+joi+lH28dlBVFKD/xeEVZLCIfwWX5Zt9qOfwD</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nvH4Hr9zMqskPTxgPQ92rFG16siqVGQGZ6CwTIKWqVsZ2myisZMAnbmNEzjdBTvR+jd1HX69ZQ3GDfyz449wfa/XXXD31sqp8saOk4HZ82EuMElEQr18iykH54iNNuP/2s4IGhBk5yFq1l5C46RwJfLKuw527hk1zMrqf+fgaq1GLATKtRedjCM0FlHyhNrdWwDdhx8ub0fMcIogpSwrkID+1FFM2dq5HrXe9bmV39QE=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jh6dM14OyjioJqAXn7Xz7HcfGDlj/2myhy/yBi5oQAajD3QnXFDeSm195MGx7HJnLo1tUHESGb4zQwbrm0RJIrK5a6ahQVPQL1nblCHfa53sWxR5lYzJQT/NTCZDi8h9aOqeTtxshTqiggPhycqG5LvJl0R9WuAOksaP6eYDhhznXIBNRE8JeWMTD3NQQB3J/lcpiJ360W5nqqluRwfpc3gtmF+KA9H+7CknhGmv+a0aINkoaewJK6+WlkPlJ9oXegw50Pip12kD3v89RHW9MRQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbepfMPBGdJH7nX4Zz07a1UQ4E+5O6uwRWyRT3wNQuQ9sW</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AxzAG4bdJ6ntszIWnWU0gXkL+3gQJbhQ/B4FC14JDNnRDmkhnpzogQqFKxgKStLuXg0DP0AH3MNPaKhv4L+Eud7cbZNBY4VQS8uWEH+kmCXo2budgTCxwDiRuEWMN+DvekEV+sPHgKrswvhHfe+/XTub8/fEk7yskAnoLf3ampPNno1tyXV7wILEDVW6Y0rm6l5DvzTc81euAT1NCy+sZJMnTFtC49AQcOh02BIqk5G7+htYK2NQYM5tM1JKKuELJJrnGiRUxVnakpUdpMilYw7x30JczUBVe9t2MFF1hCCsI78Rt2OyIYRxfKCZlOXGNIdoyky4gubR/8c7HaN1xl0P8CuUlgsEUsloND5g3Qk</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
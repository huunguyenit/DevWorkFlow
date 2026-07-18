<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="lkvv" code="nam, ma_dvcs, tk, ma_vv" order="nam, ma_dvcs, tk, ma_vv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số phát sinh lũy kế đầu kỳ của các vụ việc" e="Input Job Accumulation"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" allowSorting="true" allowFilter="true" clientDefault="Default" allowNulls="false" align="left" >
      <header v="Tài khoản" e="Account"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="AutoComplete" controller="JobAccumulation" reference="ten_tk%l" information="tk_lkvv$vdmtklkvv.ten_tk%l"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" allowSorting="true" allowFilter="true" allowNulls="false" align="left" >
      <header v="Mã vụ việc" e="Job"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="lk_no" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế nợ" e="Dr. Amount"></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Từ kc đến đn&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Year-opening&lt;/div&gt;"></footer>
    </field>
    <field name="lk_co" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế có" e="Cr.Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế nợ ngoại tệ" e="FC Dr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_co_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế có ngoại tệ" e="FC Cr.Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_dk" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Từ đn đến đk&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Year-to-period&lt;/div&gt;"></footer>
    </field>
    <field name="lk_co_dk" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_dk_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_co_dk_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="8, 112, 100, 100, 10, 120, 100"/>
      <item value="1011000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1011000: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="1011000: [ma_vv].Label, [ma_vv],[ten_vv%l]"/>
      <item value="1000000: [tk].Description"/>
      <item value="--11---: [lk_no].Description, [lk_no_dk].Description"/>
      <item value="-1111--: [lk_no].Label, [lk_no], [lk_no_dk], [nam]"/>
      <item value="-111---: [lk_co].Label, [lk_co], [lk_co_dk]"/>
      <item value="-111---: [lk_no_nt].Label, [lk_no_nt], [lk_no_dk_nt]"/>
      <item value="-111---: [lk_co_nt].Label, [lk_co_nt], [lk_co_dk_nt]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZsA93l2Kdm22Vt+DtvQ0AaDEgQsIW79wnQrnlslwgHf8A118UCF4gKlV2Hv2UzZ8K12+eB6wqbnUSXoOOf776GUeHFD87pX1KtcdX18CAsDsFFB0SjZU9tYAeqJDPIlF3c4NnI6eps7H42zdB81e22zdu2eVXZ2N8Q7cOLw1MPCD9sEZmNeyYJ0GWJUmDOgEz/eq382bsSRKttATb1aDdRy4j75BkMG+BnZlBAjbJJEPut3zvJpfdmJ/sYj3KuPyDzyJkz0uoQrRL+P+Phfozg=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFaK1o8p+L8QMNjoFL84PVBX7mely3y2ac4Iy153G5j/lJqqmkLN3chf+mvGragDraDQG1MPoXIomNTjYnesiZYXPypTagNYJcZW8yPjQ8gzaYkEsWxZ9RDnNKF/Hsd29M6larj0M4X5kjwzju9Lg261+yjdiS9X1/EyxmYR+pKcv5U/YHlkhqaYhhAoCS+fOXlcmJ/kQlNrs3cKlWqnMytXXWneNIeOzYMwIoHKFNjlMpKIz0+zdv2dcSYrwHRu6N5nYJQ2HWy+nLuqaojlxWGfDh4eWH8XZnaIczNrBFno6WJJpmRoKN9c/3XLAhiAMbL</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyTPBwiyGfpcGWF/oAKZ5cj3c7dx4Tl1OwL3kw0n1e694dsx0M3StF0fb7IdzB3zpw==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tO36HfyLEJbkTzwimX/8hC4/CXOz1lOdKY5HwY2xufUePvXFhCs+1sgBSIrNhvfbiK</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliaaZ7lP5GMsQAn9UOKTX6jDrigteSWjY8ur4tQdZ+JArPJ/wm/4TJFYFlmRKieUS6Cf93l42QQ9P6UDBfuOTPCZxSse4W6Iidd0yHI2SG+ZxaA7qTecO2/43cy5SUwm9dOtgeo7CPMxuc9AhSLDCXvGgdPhPmWkI6WHvnficp1T56S0N3L/NF6JS4puW+IaIaF8+JIGtdHUHttH0gFGdITlsyH+YK7IH3YbFb8GuUlchc11osA65kieBOwn/oRhW7NUOLbOqhXiHQ0bliobkwgwxf+Owv9siIYyHOOlhIIip5bfrIEptoQQYvk9n76tqA</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nS0Ignx/uQretofeaHgl1PCJAmOiTy7deTp95cVtE1f0IdRxq2QGyGNqxkmKegGcXaeNJleqM/rioiz4i86Qx4p9sX8a8TyvVhxNyi18aTU8W0S+R6VF/SjJuDJXxQ/fWgpkyyxDGWDShNzfXU1CT4+qZhPTr46OsM1ZxeAq/z15Br4OWEzbJgl1vcdVZ22XY</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jPX+9//UVyVOvGC9jzOM6owXXKF2kg6MF5unCSLP/tub11rkMqLyj95573MWKwdkv4oNWpAFg78rKuPjr10J0dMY3hf4yiQTf778c5lamoAbBapnb0HXAmzdY9hfndWfnpIlICA+deVLCmFBbT4NsqBLtrk6ZAMlq1+wTcROaKSGYdfIjvR56qKzFnVh1GjAT6xOyrntR80RG3jVlK4Vl48cVzlpgqsBhCUARkVDIOOvMKRlN0UWZ0uvFVchURtQO/WqzZ2d6vJKS8WAfk3o9Qe/M3tRyP129swXYkmIE9KA=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoJ+DOf3ngC8YWY8utprm/FUDXW2R3LN70Al5xHlFXlyyJH+Qbf9eGAHHEGnsrRo77MGLw7mMdhKKxuh3mj7s0Y=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Fr0ZVDltMiDdMOvQbIU5XIPrmjqmFY8PgH6nSKJ2G/6D7oDv/q9WjXLCF7ViBnJhoNJ/sQMbeneSpikRS9isozM1U45IB6HaIl/ceb3hVpChpr+fKvypXTBQHFjVZoJ2xAbQyK4bzqwhefcDxkA96CgreSWvUOuHJBmnjHwkCRmXIqk4P56c7jP8lVmMDsKVCFlVI1xLcq9aJekaY6ohXnnFaW1KLjJucBns21C8fauUk2LTSLJsNrnpcAkK7KUaV18fpFgpj/PS5uDPHbtgekoHdol2klnpppc/d2FLQqRFqIhfrfG/YFkydJ08viNmVWf/fIXmsCEEXw4RdP1bwQ=</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5uy1Z6N60E5aB6/vlhUbneiIqSIPkUa76CQUQkeLAQdisFq/w0AZv7Ufm1E517NsC</encrypted>]]>
    </text>
  </css>
</dir>
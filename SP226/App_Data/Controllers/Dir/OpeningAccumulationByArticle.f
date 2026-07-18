<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="dtlkct" code="ma_dvcs, nam, ma_vv, ma_so" order="ma_dvcs, nam, ma_vv, ma_so" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lũy kế" e="Accumulation"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" allowNulls="false" hidden="true" readOnly="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Công trình" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Chỉ tiêu" e="Article"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="AutoComplete" controller="Article" reference="chi_tieu%l" key="status = '1'" check="1=1" information="ma_so$dtdmct.chi_tieu%l"/>
    </field>
    <field name="chi_tieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="lk_no" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Lũy kế nợ" e="Dr. Amount"></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Từ kc đến đn&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Year-opening&lt;/div&gt;"></footer>
    </field>
    <field name="lk_co" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Lũy kế có" e="Cr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Lũy kế nợ nt" e="FC Dr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Lũy kế có nt" e="FC Cr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_dk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Lũy kế nợ" e="Dr. Amount"></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Từ đn đến đk&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Year-to-period&lt;/div&gt;"></footer>
    </field>
    <field name="lk_co_dk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Lũy kế có" e="Cr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Lũy kế nợ nt" e="FC Dr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_co_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Lũy kế có nt" e="FC Cr. Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="8, 112, 100, 100, 10, 120, 100"/>
      <item value="1011000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1011000: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1011000: [ma_so].Label, [ma_so],[chi_tieu%l]"/>
      <item value="1000000: [ma_so].Description"/>
      <item value="--11: [lk_no].Description, [lk_no_dk].Description"/>
      <item value="-1111: [lk_no].Label, [lk_no], [lk_no_dk], [nam]"/>
      <item value="-111: [lk_co].Label, [lk_co], [lk_co_dk]"/>
      <item value="-111: [lk_no_nt].Label, [lk_no_nt], [lk_no_dk_nt]"/>
      <item value="-111: [lk_co_nt].Label, [lk_co_nt], [lk_co_dk_nt]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZsA93l2Kdm22Vt+DtvQ0AaDEgQsIW79wnQrnlslwgHf8A118UCF4gKlV2Hv2UzZ8K12+eB6wqbnUSXoOOf776GUeHFD87pX1KtcdX18CAsDsFFB0SjZU9tYAeqJDPIlF3c4NnI6eps7H42zdB81e22zdu2eVXZ2N8Q7cOLw1MPCD9sEZmNeyYJ0GWJUmDOgE3ZNGTLbaB/rly5zlcbJvO4dTQNNSwqCMIkH/jIqeHKKhW0a21TSLn1QCeAF/W0ju//31LwYJo3r5weJvxG2DVs=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFazLI7cXSlRx752hEPwzdvwr3+i8ZZYlmy4pRVXaGoDxsqM3NVqKMA5rQGdsrd2LdqBG23PrNmpHNHoYEQzwu9XfgwwbpURUplwFfjC9RLUqBZkPBAIt3PmgVKIbq92L8JYdBVeE5t36ZkliJIBwFjRHRO4fjY0H1HsTQHKtnVUkE/LrnWq6xyY3dHXSyi4zhqgsrz8mMDUyie+dG4u80dGbEC5Cucu+dwOPmZ2pKuY8imt0xBIbde0XI+dqe2U3SsA+9Shsk9UwEQ2T6/1J9BvTieVD7J8A5Au5BMcppSrrbyjtl6pVXZBcNXOMakXxdMsR4726VPrO/u+74Jb1sipCe5zgn5szLIG2x5YPLyr987Z33mQSeA9NoDf33XnCe1/lkrDRiNTj9keybDO0SWPeyVjVTmcqSiBowDyxtDbq32tLVgFendNYpaKZ/1CGiyMor6c5F1TcJBTAonZUxLjY9c85sfLVgl6owPEfldmVDmy/1a2oyiCg8X/cMPbGEVFN3I7+5c6GYVVEIHLvs2eg==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOmf7U01vaOUFYyufwSdHK2V9VyfdsNC4MNHFUMwuPeUbnp4wzm1X/aNta5GK/aamD</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cvfpk6/33rVHat5YZo0jY6kZqc2rwnbtkPIvBoMECgmszH/kXLCYFwL1UWSrukIEJTF//+6ITXjDVNaBYhJqxtV8wqpWWpqr+eQn6LtiGlkB5rXYtNPYmloO1GDOrpmfNWyiungcXDFfz58nNtQ2UXbUysvcYoB5jRnUTWpKSwIi6VulTevThWhe3YM3pRTFoAsuZUpoE+PBwWMVQH5kqjNH/uNXhZcijXmidcxEkhGPno1k14wAjFSETI0nDxlhZnlZC3yyTQpfXzJfrhBrN6vtsGd+Y177h0vGc4eRtJC4g26F+iY2ToKGNXcUMHvajtf3YHGaeglRCAbW0E1op/6081uZzbwBSr+T6yrYWgEd+WXTaM2Mm7uFEQg4NPCqaI09ZRuMgDQ/Yc7TetwH5/0</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nS0Ignx/uQretofeaHgl1PDDi6N6m8prqrqjOmB4vfuHyoudU+yZtalFro0J0CGqZKQj/UoJw/oznB0RZ9izD7vozLnLXWK4yP/R+P7ZtcLj93H0KXqU0db5zx/FT8sS3W994qsAetexGefxhTHN1QLmCIgJsR4NsNAGjybE0jlzZ/zSSKRWOEstN7kwGW1k+</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jPX+9//UVyVOvGC9jzOM6owXXKF2kg6MF5unCSLP/tubzCZPHRzgRVSRbzKo+it/CyppmZ3IaHk/owgQYZJoH++aM+B8Q0rE6vkVzVvRmYIsNMOwYGQ/sRSnKnHzOhZ/bVi3zxyF/6upv0KHPzbjhCQj+G+FPr1u3QbR+322oS4w6vD4MoesJOs6fSI3BD9kLj1DrijPJhdpkUn4T5y7ql89cdn9vx9t17V5hqSc1/Y28lwxQyrpJCtDF+k1Fd4CTMT/8Er9Ka7EgkujgmhC/XQ+4XlRiyH6APehhf65pxMA=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoJ+DOf3ngC8YWY8utprm/FUDXW2R3LN70Al5xHlFXlyH2dME+kKk+GfwWHxhsNObtwH8JZXyFc6v3zxZpvGbIY=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Ea2vn9Ickk7Cn0ocBTQLGg3XSytup0/mVGK6wXkigYpK5SSUKe+009IjQRu0tidKfV2ZYJ34KiwwRhHth/4PG/4Bj0JtqaUfETLMTCbyZMhkT/SGtVxwh5y5/54q3Dds8ZmJGpN9rmMUMmikZPMWVnRtZSo2q5AnU8OxG79LRZ03cjlgJlIhLK3vkXSdWJkwYlqnAz9IVyZZJoRrUw4znFC0W3+Ot0H0xTfqUXAPSC9jb+WydcmEWQqXOPF0yoPGgPZ4yF2gsPOSL3MTHD6M9NjeR9xAPEPUZ9hjyIasfkd1wXy6MfG4qKs4z0CceziObrVF/uFm7ohhRR70S7TblE=</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5uy1Z6N60E5aB6/vlhUbneiIqSIPkUa76CQUQkeLAQdisFq/w0AZv7Ufm1E517NsC</encrypted>]]>
    </text>
  </css>
</dir>
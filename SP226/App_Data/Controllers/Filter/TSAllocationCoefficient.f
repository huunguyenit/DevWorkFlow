<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ValueDate "dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldFocus "ky">
]>

<dir table="vcthspbccfc" code="nam, ky" order="nam, ky" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_the_ts" dataFormatString="@upperCaseFormat">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="copy" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sao chép dữ liệu" e="Copy"></header>
      <footer v="1 - Lấy dữ liệu từ kỳ trước, 0 - Không" e="1 - Copy data from previous period, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11---: [ky].Label, [ky]"/>
      <item value="11---: [nam].Label, [nam]"/>
      <item value="11010: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="11100: [copy].Label, [copy], [copy].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dUjIidpEb1I6jeFs4oq3cY9G5nbZs6Da6waZBKPvzzyY9sJEAqfL6lfTjMqj4hvoausX31eHuzNqWKg0TQnVbeu2DM8rAUPkbIKcIZ1VIb2jsKWbH/XqfoPJCh0yc4XP4SaHzlm2+yCJG8kLn0t5NEzfpi/ahoC2byNNbPmqfdUhbR76EBogQpGEzygIf16mJ3Jmm6/q3fSQvTVAQhM/A12VAR0zsfumz3OcExrRckOsgtVqZU9lkHI8AUBngdaFYE=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf21s0RqkLRL/Gff2E4FsevxU5Mmswo1O7JZYfct1nHvHsxndqWpmT7AFXgIbuvMIgNi5iUBbkKBkAH1XoaTg672lLYKeEsPj0LgobkO/eIVkJe51cXDHJFsfYE2oWJl2aK+K/JDg3ykjskBUZyu7vZY6B0hjYnXF+fDIu0uSNaRSApr19OYcCfVJ0euLtl4hkxTxRWLWbSXQ8zYwG1WWlCW+7YvAio2V2VjZuDgbvDS2n+r0cEAT22nJKgqmuWMwbSlOmUkp7pdnph08DNO64Yj3Lq3cacf1740wGSiOyhkBscTNYyqHlRO8dwaotvTGK3Dyh2Ox26TqtDmc1U5jYsk=</encrypted>]]>&ValueDate;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kiy6QynWS772oAvfpviuq1rApot/GMOGygevr/T2KE3nO5MiOwpD0ZAGCc/dTbIniX443CmPedDIN0Vf5Ke6cm0caNpDtOhiWZlB962cfehHiuC8NHX4hUQY5JnCyyGBSH+bSH60NKU2TJTu+Rcdl8E=</encrypted>]]>&FieldFocus;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf++GegJx1dzo54z3yORO6ga64ZHRPIyqM5s9F7LMO7iEYPbCibUE55CBYnvCLp/Jz4ssx8MLxtC/AQ3fccN8ulaR7aeddsdoGf2VGN9mCiklAK3x0MHalpCVhqEHttMJeWIxdtRjDwQka2qaFgLT+p30kEJcxSufP3ZccWglZknG</encrypted>]]>&FieldFocus;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf++GegJx1dzo54z3yORO6ga64ZHRPIyqM5s9F7LMO7iE65eOJCIPITYexOzDvkRgqjmYwIYcSnzpd/fbsEhUm89DMZ0ZqkxoWF3lOAxjojx4vBTahb8QpnLxzKatcJKQ5r6FiUW8I7f1wkRW+0pL4MSyRs47eDoJ/UdXUwgqlMbM7spOcP7CcNAYbAyy6rDH/g==</encrypted>]]>&FieldFocus;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf++GegJx1dzo54z3yORO6gZP5XFQtSR3BnVFuOx/rU0hfR6NEQQWigDxnHa6B2WVGjUn8wyrdPytR0sOp9htYYYdxu6ZfdxMRoYEleCl8VEH6ugzU6j8z6BapY4VnEP0LlsSIAyBLOXaniyxhiqOQ2drYB3qYA4Xg6s4v1C18ERg</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIAHqKIPjsqYzH7vD+idkFBPNeOK3i4mnkBLc63wsB6h86q/rjE4gGG5YTUzX4WarmBpedfI1kpD35GIrvlI+ZY67CLwXjGd9bh5vF3GScqdtQe/ULia8wFE5ynex+XFymTwpxImpIUDi7cGu0U/Kk5wlC7jOo+y51hAi4ulYmXg3P7CwMq92YM8W+VUaiTWeTuqs9L61xZhUMHpuebeHzil7iLuFnxGQOe94JKwItFQdjMv3OYd2z19FYXsc1X60Dhhr+AiirB1MGSRY4ovLID7wjbjQ803hndqI/9SOOud8oitFnzxpbHCnrfFMPIGAq7L3FeEUAKleru5z759rYYOrPReROaMFrq4QrfhiLfZluuruR1VKWviTMyDgS5hwGwLkCv5SK78E7FXgaL8VlFMFxqpIrVARJlEsMEgeKvrMjfpVxQzXag8Joz9BTgKVQ5yG0Zi1i8jwxe2bIB96Mn1e5Z3yq+N4Cr8vJPc/dCMCCsNazUhKJvf3Bx3SLeb3FStq9SAb8oyshv2SuROegJ+5lmI9x0Jw8l42rc3p27I9KUIc6vLhOKeEyNpKDl8zEDRs67p93gpSViAaWG3rbzExe7O7m0czGnbjc0thTai7PC0yW7Qpd8RqP14TjyeQXmso5GBkB9PgaF4mfFEyG5MCA8DrzJIRrAC+lxdadvgc7tjW7xg4o+rKceYNW6ytHFyiQJT6CgiUFTPkyE4ljRKsoqHmqWQoqXoYbknBgJhBcfmWonhXP9gx1mPBXMNiMgvbjsZzKY8A9lkl09L7t8Xc1Er+2wNM4yNUVzFE0c5g5qSst2OdBJZPWGP5DlXR/CfnZ0lpLsw1ywHtwWdgRQh</encrypted>]]>
    </text>
  </script>

</dir>
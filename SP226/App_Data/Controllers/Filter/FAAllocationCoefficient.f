<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\FixedAssetLockedDate.txt">

  <!ENTITY ValueDate "dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldFocus "ky">
]>

<dir table="vcthspbtsfc" code="nam, ky" order="nam, ky" cache="true" xmlns="urn:schemas-fast-com:data-dir">
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
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="1 = 1" check="1 = 1"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf21s0RqkLRL/Gff2E4FsevxU5Mmswo1O7JZYfct1nHvHsxndqWpmT7AFXgIbuvMIgNi5iUBbkKBkAH1XoaTg672lLYKeEsPj0LgobkO/eIVkJe51cXDHJFsfYE2oWJl2aK+K/JDg3ykjskBUZyu7vZY6B0hjYnXF+fDIu0uSNaRSApr19OYcCfVJ0euLtl4hkxTxRWLWbSXQ8zYwG1WWlCW+7YvAio2V2VjZuDgbvDS2n+r0cEAT22nJKgqmuWMwbSlOmUkp7pdnph08DNO64Yj3Lq3cacf1740wGSiOyhkBscTNYyqHlRO8dwaotvTGK3Dyh2Ox26TqtDmc1U5jYsk=</encrypted>]]>&ValueDate;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kiy6QynWS772oAvfpviuq1rApot/GMOGygevr/T2KE3nO5MiOwpD0ZAGCc/dTbIniX443CmPedDIN0Vf5Ke6cm0caNpDtOhiWZlB962cfehHiuC8NHX4hUQY5JnCyyGBSH+bSH60NKU2TJTu+Rcdl8E=</encrypted>]]>&FieldFocus;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf++GegJx1dzo54z3yORO6ga64ZHRPIyqM5s9F7LMO7iEYPbCibUE55CBYnvCLp/Jz4ssx8MLxtC/AQ3fccN8ulaR7aeddsdoGf2VGN9mCiklAK3x0MHalpCVhqEHttMJeWIxdtRjDwQka2qaFgLT+p30kEJcxSufP3ZccWglZknG</encrypted>]]>&FieldFocus;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf++GegJx1dzo54z3yORO6ga64ZHRPIyqM5s9F7LMO7iE65eOJCIPITYexOzDvkRgqjmYwIYcSnzpd/fbsEhUm89DMZ0ZqkxoWF3lOAxjojx4vBTahb8QpnLxzKatcJKQ5r6FiUW8I7f1wkRW+0pL4MSyRs47eDoJ/UdXUwgqlMbM7spOcP7CcNAYbAyy6rDH/g==</encrypted>]]>&FieldFocus;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf++GegJx1dzo54z3yORO6gZP5XFQtSR3BnVFuOx/rU0hfR6NEQQWigDxnHa6B2WVGr0wIubkua4FwcJcvkGLawUfvTcEbH9T+tnPHs00020alQk+Lfuftd7FJeNcLj5gjp0fPDtlq52pyHk8ee1jTDM=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIAHqKIPjsqYzH7vD+idkFBPNeOK3i4mnkBLc63wsB6h86q/rjE4gGG5YTUzX4WarmB6kKtII0xqcK5eIuBqgV3xVGdfeOiJOTKhzrd4J5mbC2RavhzS8dv+A+Hc0deHVe+kb/4MgsSFCYwoeQ7JvaZ1K5dSm+lopTgfDNvyiWXaecFFS219DRdvEmvAGqCrjN0yASqW7kY3MjZN1/JaV5FI28VxdLx8grfBDfuqMcqh8K+TWd+J5OoDth7BVgJbjUdJ+FB4QhIIccMQPmuHXuHOaFpeC4OxssHf/SZZXVsuuBFi9F6Gk1APQf0CkSP3anLY14wsF+qtk6x/HgZ7CX4gTBkGs2Ns/fLVdkLjDLGeyYP3nAObV5dygLAhCBXHoyhbP15UVt/ivYOOOkE8rlr8a7EXoXdJMD2lZM/NGd9nkSvsAxxf5TF/oHjCuelgasoGU8eMu+VYcB11Pcavs/QLWZUa8MzvDEcXSazTJ0u7aMnBqc10oiyOKzV7RQu5z3wqTaLU2U6WwQ+M7cxDBuZz/rx1bXOqHdiNzrcBUJV2gO6TpH2CDSHp6oowhsFNk05UscWvmJSNsyMzLUwtZQvBSIpCM/ZvyHrCrqEUgNWL5E7grNCA0krS/IvqsXC0m5yrB2NAJBjX8oVUfmVVh3eKlkzEvy6hRb7BDyJ96xV9QPebJBMXnI97p5jXZrPQo+fusXk0I+7lzyuPULhOn+6jhw7uVqS6rCKX7thAcucTCc5pEdfDbprls2pL//ck1FxC+R8hOrriGo0naCe8CmOCvFyRwxc5n0HotfnIROJAnspW8JfLg9BjMX3zLRY5sLeQa+Jdd1Pcpf+TYSSle0Ac</encrypted>]]>
    </text>
  </script>

</dir>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ValueDate "dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldFocus "ky">
]>

<dir table="ctslts" code="so_the_ts, ky, nam" order="so_the_ts, ky, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc sản lượng thực hiện của TSCĐ" e="Fixed Asset Production Filter"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 160, 230"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
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
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgOlG5itaPV3TNXCjeWH/GJqlprtzks19qwLJByEkytSfqLKbAP34+JLGXrtCQfnpcAR5EPW3uPrXObv4Mx3u3lEwySVAcE9QPIaSW7vFeJXwGLVCRQh3lyDJnCxwb31dKN85nnFR7GX2lpkaS0psS8+UTPvVzStZLkIiCbduPcjILiJXv/McjEaMVVnAY+ZcRhJwDHq4t709KeVQA7+K3z3jRDlJhpd7a9zO09PLAY8NsJvGByqH2CYM1tAFxsqGS/FQ0JBHFoxVn+jUDalgGCpm+t7Mexc5eY1CpoBgm6g07nCUBQok5Yj0FwREfWpMQBsZghZGJzuJbQ2I/4VjDImrKz2reNjaYAlnuthzBjPcT//N+CdzuHBsT7VWv+k6UefERul4RGHlpMmso4xD9ZANtWk583SWU+v4ntFB3f2Jc9oU5Iq4GUXz5QQqsibap6mY0ML0w0YHKD7GDuRnZboQqJpbtIixyW9qSsAc3N9kkU2+oHj43ewuneoCONFjK7ytyLrZRnGsMVC7rzxrTj7G1ckTFyAs691NxozThzEo4IBtW5/tto+CGDN+OxA9iTI/C15B3WpUCIoJp6sqpXg2dsHDDs//ZdHjUXBjPgdeO2JQAYzoHpRSb+iLB7x5x2qEecELRYy8ISz5lDpr3co/xeM7bMG0udqkJI33PvnnwjqS0dl6ysKrl1epebPKXU1rRQHKFr4pq8UrkqNCfVMJkrpzLi2jhBYbGPwEFbESLWcpvtSd17NW4d1BP/A8gdGsvRETBoayM1G26yBMRqSmlaYG3qrIGepbg8QoATekhZ81OQuFbal+l2Iedv4K/m6y6Td3DOXzWNrh2qBMRZkrHwUUjL1zhUFjHcrEPXZRBPrhJF3I3c5zYmVAzXEUQ==</encrypted>]]>
    </text>
  </script>

</dir>
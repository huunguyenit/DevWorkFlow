<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, ''">
  <!ENTITY Check "
if (@cach_tinh &lt;&gt; '') begin
  create table #t(b bit)
  insert into #t(b) exec FastBusiness$Report$CheckReportForm @@action, @@table, @form, @ma_so, @cach_tinh
  if exists(select 1 from #t where b = 0) begin
    select 'cach_tinh' as field, replace(@$updateConflict, char(37) + 's', rtrim(@cach_tinh)) as message
    drop table #t
	  return
  end
  drop table #t
end    
">
]>
<dir table="v20covvct1" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu KQ SXKD theo công trình, vụ việc" e="Income Statement by Job"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e=" Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten" allowNulls="false">
      <header v="Tên" e="Name "></header>
    </field>
    <field name="ten2" clientDefault="Default">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="kind" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="Default" defaultValue="1">
      <header v="Cách tính" e="Calculating Method"></header>
      <footer v="1 - Tính theo số liệu, 0 - Tính theo mã số" e="1 - Base on Data, 0 - Base on Formula"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZcxtb0TK4HhcIkqrvSEaFTHzDLRd6Udz4ZZ0yO0xADu8</encrypted>]]></clientScript>
    </field>
    <field name="ma_vvct">
      <header v="Mã chỉ tiêu" e="Job Norm"/>
      <items style="Lookup" controller="JobArticle" key="status='1'"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Loại phát sinh" e="Type"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>

    <field name="cach_tinh" clientDefault="Default">
      <header v="Công thức" e="Formula"></header>
    </field>
    <field name="nh1" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <footer v="1 - Phát sinh trong kỳ, 0 - Không" e="1 - Arising Amount in Period, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh2" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <footer v="1 - Lũy kế từ đầu năm, 0 - Không" e="1 - Year-to-date Amount, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh3" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <footer v="1 - Lũy kế khi khởi công, 0 - Không" e="1 - Accumulation from Work Start, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 40, 60, 330"/>
      <item value="11--: [stt].Label, [stt]"/>
      <item value="1101: [ma_so].Label, [ma_so], [form]"/>
      <item value="1100: [ten].Label, [ten]"/>
      <item value="1100: [ten2].Label, [ten2]"/>
      <item value="1110: [kind].Label, [kind], [kind].Description"/>
      <item value="1100: [ma_vvct].Label, [ma_vvct]"/>

      <item value="1110: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="1100: [cach_tinh].Label, [cach_tinh]"/>
      <item value="-110: [nh1], [nh1].Description"/>
      <item value="-110: [nh2], [nh2].Description"/>
      <item value="-110: [nh3], [nh3].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2+j97jlg+7FdtYzEuVP0WZTIHaGILeeju/2xMo9QgLt3jdNnFccosMebh5UJ/aS8yQCsUwdzqQb1HYFBunjJk4=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2+j97jlg+7FdtYzEuVP0WZTIHaGILeeju/2xMo9QgLt3jdNnFccosMebh5UJ/aS8yQCsUwdzqQb1HYFBunjJk4=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DFQdm3rK5K8JpimLnRaFlYRR2SOu98hJJnZP4GpFO+XmGC9qjDodou4wVI7EsK1e1PS4QoMQnYd/O5El0bzD9u2SlYLpTPkodeGdaprO6OJaQwN9CB0yyg0SChKLIbqoux6xx+hAkp6xISxJ0ZlaIKGdPhtEGBsZEMoPpH5NnCNNnhmFVQLglCMd6wcyyrxXZB9ET5qE4h7n5X8bzXXNI/dL0A8y/8ROA5mCXE9UP7QiHPPOXfiTJod9zvpdPw/+5P9RU3AhZBn+HCAS68niZ3nO4qxFLMVZYr9ItiHKfRZ1w4HQSpvTsfO+xZUyS7rdDfuSHc07i3fvc41XCXvjxhDzGam3pSjCb/aUGtiuFvAw=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nQdP0zAZ6momhEnrSLnvTzSPlj6DM916+RYjpzbScTLJNo55gtp/UiNYAFZmc/KQOiP6HkpT+cN23IaYW2/gIYRjtIOSD0AwmR2gkbpF0ti+skECpbx4v2TJjhjh3MYL2IH3omS9gWXpXfuId/bT/cZasRkFbi5JOmyUJc6lHEog=</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
      </text>
    </command>

    <command event="Updating">
      <text>
        &Check;
      </text>
    </command>

    <command event="Updated">
      <text>
        &AfterUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3c0rki+bzKhGYFTUZPHBp6T+YPpnVBv6er8AVl9Y5ffZEVdFZ8VwYIoMw8FAzCXqxpnWJbkKKjjme5ZNlBzc4Yc54yrO12MgwzUjCx8q/MvxVWfzOh1jEgFPvUnlTfv9XiNEHLYRPn9E+yyEWa1IE4xHGdWrYcg2DGpCcBTA2AbLym2KNQpGAKFTUx/Ba5pr2bHBg/hGqybaALcjEk/Oy57T3kD4z7QZuKJFJdryAUQIjRWH6MNxQuwyKuVJ15IiH1Y3kGrGdhz3bbMsuJGdH7+eJFtGLW019BjwBAEtWs0XlRiyA8vr2JRt67w7el0uh9VXk88G+ncOxlugSa0Jm+HWuwC97p+fNbWmMNeq9bnUrmaR3H1Q3kcboXM7hmDGLnrUEp7kRDynNaHnUYkcgZCoquqBg2xbrkM09vLBEPPgA=</encrypted>]]>
      </text>
    </command>

    &CheckIrregular;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmTYXLrpORlXTOav36v0txOyy2bpo2iI5m1otdgawgikndCTRcepSjt+rrgmSedY702aSZl/ePWg0TZqptYsa+bzd9QWYeofK2QuzzMbutDvI3HUVHsVnfSt8VP2exk9eidmVq2SlO/leihH44uvUMfxKiiJ502TdCnoEu4+vnKX9Mkepd6IVJLe2EuPURkK1zxrBG1J6K9fMtiqEU2lcSuIpdYD1MPnWvqBr3g7L/p/T835KKkAH13uo4qEACOXspxdvhzPDfLubL2EAc9JTIaPyCQTCDNqm7JyH8sjAYos0KDxtpRDsbJeDoRzpciDJrI84FRVXYReVVaiq9O9rkmUnYrRIOVqHujhxHbe4cBKEgeKUCVijSGz4XdCKCI45EPaEbZPGaN/CXKDyks7XglZiYQmaxbI+zyJNrNYrdxaMKmTD8RBcyaP9GqNGdbb5nSy+krpXX2ICRKwWaIScpvcatwRAJmnS8zbexP+GszpFtgSwBtz+/At0ZRdYAk+D+/+wNEXk2iF5XueUySb/y0szk9TWWwJilxv/zmPfcUHh1Hv3KbyQMLEyq528Q3C4m49ck8Qv+cYZl4LtZOC0OUM17QGp1C73aYT9iOUe1wejmv2WWNS15a5xfLJ6fC3OPqlz6suX3VzLD0lhBh+yK1ZDkD0oi7Eue77i0WcSo4FgYQdt1XMv3GJMiCyPZRySNfF9L67/BSAuSEMtq2/rdat7oIh2RH3mC9ZT+I9bLRipv/dGPQQsedyHNb8q1a+UdDBCqOPnh3uvjlrV5+aQJEkzlGv6/YRsP40CyKEDVdNkg==</encrypted>]]>
      &ScriptIrregular;
      &OutlineEntry;
    </text>
  </script>
</dir>
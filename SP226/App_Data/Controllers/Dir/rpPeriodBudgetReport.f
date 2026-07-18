<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "BCNSKY">
  <!ENTITY controller "rpPeriodBudgetReport">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c">
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

<dir table="bcnsky" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu ngân sách" e="Budget"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e=" Number"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>

    <field name="stt_in" clientDefault="Default" align="right">
      <header v="Stt, thứ tự khi in" e="Order, Number"></header>
    </field>
    <field name="ma_so_in" clientDefault="Default">
      <header v="Mã số, mã số khi in" e="Code, Code When Print"></header>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>

    <field name="in_ck" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="In" e="Print"></header>
      <footer v="1 - Có in, 0 - Không in" e="1 - Print, 0 - No Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="bold" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Kiểu chữ" e="Font Bold"></header>
      <footer v="1 - Đậm, 0 - Không đậm" e="1 - Bold, 0 - Regular"></footer>
      <items style="Mask"/>
    </field>

    <field name="kind" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Theo chỉ tiêu, 0 - Tính theo mã số" e="1 - Calculate, 0 - Formula"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="ds_chi_tieu" clientDefault="Default" filterSource="Optional">
      <header v="Danh sách chỉ tiêu" e="Articles"></header>
      <items style="Lookup" controller="BudgetArticle" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="1011----1: [stt_in].Label, [stt], [stt_in], [form]"/>
      <item value="101010---: [ma_so_in].Label, [ma_so], [ma_so_in]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>

      <item value="100000000: [form].Description"/>
      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="-11000000: [ds_chi_tieu].Label, [ds_chi_tieu]"/>
      <item value="-11000000: [cach_tinh].Label, [cach_tinh]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzmpDYmxp596m9Hye/cuz2dEHE0S3vnAqn84DnFWHGH1</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh30gADG6emiwAjxVR5B78NRDNtgHSLcH6+I55nyAi55BDTPdonHvqp9slQ/wfLLIukg==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzmpDYmxp596m9Hye/cuz2dEHE0S3vnAqn84DnFWHGH1</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh30gADG6emiwAjxVR5B78NRDNtgHSLcH6+I55nyAi55BDTPdonHvqp9slQ/wfLLIukg==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DFQdm3rK5K8JpimLnRaFlYRR2SOu98hJJnZP4GpFO+XmGC9qjDodou4wVI7EsK1e1g0KiHnB1Kh1oCmQrNCxo8NSbJuy7vb6oD6j+pKl/daHeJgPfZWmP3fcIyMOSaTfxHH/SvJl+Q3NsubmGDlEOnNVGy8jElfKm3hjmBO5LIamWcLDgTklDDfuC1brTqxAB++Pq8x4i4duXLzB+Z5hKTN8NrkRUSpfMp3xwWI5nfYsytFnWJl0a/OM4EJOXTaPPYuauVJMTDmuOCLT/UQg0RKNCvJlUD/0kBuTvnnwe+9gHyRydT3b6NjOhJXiRkIuJ</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &Set;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1II1gF//A0y1pxU7o4CQkhUBh4NsCSkNJPnfK6hCItHZCNdqIMkNLkqmz5wq0vU6sU887Xo+H86Xpa7mnQomRo=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf7OfC7KeRYm9GABRt5KYfWCrmv2Q+9a7QibH78xasLvUCrJ/SGC7ZxSDuCWSj6oEuokvd4ez9b4ci+pQqnXUGyD3Z5VuiFxDtyRKiNtm3krLlKYF1hct3eCSlZ/vet0eyyX6Ii+9nIhxcN2f4vv5TGkXbBTlbTGJoKj5nbrWGaJvb3tjAMOAIS0ua9a+eesALgu3uybPzfiawi03WNO5WfcnD/4bmVyagaM556LvShlAKDVFYOld98ft79t5uuBgXFzHnsDAXWGm6AnXEXBSbwxqcLrhL7jykODh/USLlSc15Ta9SJ2Zrw6oSfWGHrvmcG9GZRTWRRsg+Ty67xRoZFAiYOtPU823s3YX85tgslpeo91ganv7zH/GEfU8BOb/C2sEI9Kks/hYg4ryVpBBqHc=</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1QH6KGqJgn2hV4URa1oRnZdZzmIT5Djed+PtzS18R/5TGi9Sf1poQZnFhzPkPzQbw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &Set;
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NXTUuGR6neR027q67TKWhUWZpFTSoX1Kq3t0fD6DH94</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh39mkZKMOg8eVk5Y7Rau1F2RjMH14RDvnpEejZV6RjSIQQoF4ZmO5VpgoJdqUIMTY1qSM5nKzdERN1uM+NvvZBLg=</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xgWII8wlIu1VrVO/idcxtYlmc+ayM+5HK8GAzupEE6CQfUOdQ8WQAIzxwcgRfwYaX3cwnFAmrNQfMI0Zv87DdXGUsmhUjMe1k3oyZTNfaQj</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xgWII8wlIu1VrVO/idcxta0py3ssDWU5d2houmKiTW/hbcYba2xfFo0QttIENta8Q==</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/Aj8S6ZQizL4SDJh24vHl3N+uT2dbdRZpWXVdWkGAYI+w+JehGe3znIIYStgoxHD1Sg==</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63v1+3HOHiW6uQvLr3BQBhruOT6QVKZVU+edLdM3KVucDHu1Q1dKKnPMeMahjCdFbVgGagJlNkEUGkqSP0Kxw3sif4CFfBeh4ahfy4Zylonoo31l/8fjbs3u/2KnHPSW63iDmY8pvZGOJdGABwMCwNIiC/gG/hr9h/x9AGhZ1eVxWf9sFjiRCgqKDE7jU4NXIiSwK5vAzjqQljsCMBryMNv3oXSuD2i5z9ARPx2fP1YZZu</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AlC1mgtSaQb9s0tpj3llKV2YzETTXMkzicrtw2pt97m1KdRvUwcnlwnoGxzVX3LZ2c7Vj8rEU9AGXB1mPrc/UhD4mHKw6xpktZDFQXwLm2Wh</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/ArchhdFGPvg2H7MxRwIZoyBWS84hGe2gw2hKi36vcf9xtA240hvqR97qZKbrMBgYRETfezG6aBUjdcnsNKX3A/arPNHtDv+DK4TP3WPrRKCi</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AnrMAopdf5Pt3hEB+toP2dBPGo665C3/RMsJIETdks/fmaXgCkcLPrWsBFAkHw0H5VmrKgMdoBqJRukwYWDfz0oikW2zKugv4mgOhH8xCJb/GhF7zB1x3gmJrOyd/kHzyQ==</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AgjPE4WDyrFdFdOt2NjyN3H1GYrpTIPZgBRhplic6W2KC5zEUTxmO8CLcNjw9yg7S1aGyaurQ9UfxgGIPN7GPqLwOufibem1V2PGEknSCUlVFpXyy1FBmwo8QyVUBCG+1oYWwDxs4qlie4Xh3l5JuUqwbv8rZBvt7I9sci5StXqY</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNM3R4rZT5NUWUySuQ0kIb17Ei81jIQTN8TPTgCQGgkrthD/TXqWfCkqs2BNSE+fGNA==</encrypted>]]>&controller;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJalwO1PcMGhiPmdIcWJKHpEbOqT/dK8F7m7xB7g/SAT/7jL9sUdhZgvdsDKxKFcMs1w==</encrypted>]]>&controller;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJaizg/9juHe+oCAN9LCDNOrdE+4tweOrGCPwnMiLleuaZyG7FS774nU4iesW8qnWiJjd+pdbNXyvPUBgCvmo2tyo=</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh31wFhkhgmjjfNAJ4gFy/32+ZsIkteuxZVee1I342B+RhGqt7J0wuJMUHJZk6h2aeCA==</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh312p4tHmlMlEk3Qw2+dnjb6DyT/lZRpC6xJGeUJGyKBVvwHSuDcPnMs8xw9geZLuq9Q6nWpF+4AyY77JRVBCU04=</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNHQxtBnIYuzUkUJC9BQ7YvWY6dINOVixzsiLPOoakUvFj/fvrZINY9QaqP3vAl2xrYnA79NeIEW36V+IjRqiFi1EEJgxwYXaF78RB1/n+/NAW3QzamtKOZ5W9aOR1R9P3x0q3bCbjQbnhABd/4SvOad1JLGlpz1JNp4ICJ1nlHMiahr8gAsjgxu0CzlcKlSrG37qIETSdYg7qObftZ+SLEbgrGMbVRc8LcduFuxaLLyfxnnJjqVJToTcPj6nhMRAuB745iXRJpinPE9rW9YL+1YgQ99GBBzbkX9EbFZd2+a4</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh39w5kcgXkzfNhKcz3ib+yGFrx6pc4H9of8VamMVgPKKvqoPYmxpucxn4rcxUTvmYHEOWK10XtNcauN4YNcGu7fTVOiAOyslBcvR+vXi4D81+/mRa0MdFdxe7vGZ6CQ3C7Rs8Va6u+W/POFBBH4nsMJV4kT+p05+VhoRvJam6hJTUH1ZBupQWtLKtwwKqbPBE7AHSJKTEPWffVWbzyLIhMOPKEPidvKVH7uEnOTCRT6td</encrypted>]]>&controller;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJardr4kESpTGAqg8S0/mqntghlDu2WB/dJNF4RCM4P5pm6/6eRd3c0TbQ6txLRrBMezhryJrq3gGFpbEJqdG+xckLQ8cRiWR1O+lEU71xaKarbRGzMor5jW/tJVzsT8bAWnhvL/vyXrK3O11mw5CJjbgiDbYHPww5eHQdIXRRuetjZyESonYzuTQfHmsxiy6bgA==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>
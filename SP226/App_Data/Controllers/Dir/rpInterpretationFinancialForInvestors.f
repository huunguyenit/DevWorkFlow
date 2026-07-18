<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "V20GLTCTMDT">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c, @cach_tinh = case when @tk = '' then @cach_tinh else '' end">
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
end">
]>

<dir table="v20gltctmdt" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu thuyết minh tài chính" e="Interpretation of Financial Item"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e=" Number"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="stt_in" clientDefault="Default" align="right">
      <header v="Stt, thứ tự khi in" e="Order, Number"></header>
    </field>

    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
      <footer v="0 - Theo mã số, 2 - Theo số phát sinh" e="0 - Based on Formula, 2 - Arising"></footer>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>

    <field name="loai_ma_so" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Loại chỉ tiêu" e="Type"></header>
      <footer v="1 - Chỉ tiêu đơn, 2 - Chỉ tiêu dựng cột" e="1 - Normal, 2 - Crosstab"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="kind" dataFormatString="0, 1, 2" align="right" allowContain="true" clientDefault="Default" defaultValue="1">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="&lt;span id = 'idf_kind'&gt;0 - Theo mã số, 1 - Theo số dư, 2 - Theo số phát sinh&lt;/span&gt;" e="&lt;span id = 'idf_kind'&gt;0 - Based on Formula, 1 - Balance, 2 - Arising&lt;/span&gt;"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>

    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="dau_cuoi" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Đầu/Cuối" e="Begin/End"></header>
      <footer v="1 - Đầu, 2 - Cuối" e="1 - Begin, 2 - End"></footer>
      <items style="Mask"/>
    </field>
    <field name="cong_tru" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Cộng/Trừ" e="Plus/Sub"></header>
      <footer v="1 - Cộng, 2 - Trừ" e="1 - Plus, 2 - Sub."></footer>
      <items style="Mask"/>
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Chỉ lấy giá trị không âm" e="Value is at Least 0"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="tk" clientDefault="Default">
      <header v="Các tài khoản" e="Accounts"></header>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" clientDefault="Default">
      <header v="Các tài khoản đối ứng" e="Reference Accounts"></header>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="tk_0_gt" clientDefault="Default">
      <header v="Các tk không tính g.trừ" e="None Deduction Accts"></header>
    </field>
    <field name="ten_tk_0_gt%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
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
      <item value="1010-----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [loai_ma_so].Label, [loai_ma_so], [loai_ma_so].Description"/>
      <item value="101100000: [kind].Label, [kind], [kind].Description"/>

      <item value="101100000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="101100000: [dau_cuoi].Label, [dau_cuoi], [dau_cuoi].Description"/>
      <item value="101100000: [cong_tru].Label, [cong_tru], [cong_tru].Description"/>
      <item value="101100000: [khong_am].Label, [khong_am], [khong_am].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101000000: [tk].Label, [tk]"/>
      <item value="101000000: [tk_du].Label, [tk_du]"/>
      <item value="101000000: [tk_0_gt].Label, [tk_0_gt]"/>
      <item value="101000000: [cach_tinh].Label, [cach_tinh]"/>

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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DFQdm3rK5K8JpimLnRaFlYRR2SOu98hJJnZP4GpFO+XmGC9qjDodou4wVI7EsK1e1g0KiHnB1Kh1oCmQrNCxo8NSbJuy7vb6oD6j+pKl/daHeJgPfZWmP3fcIyMOSaTfx71JYCSjXREqkRi/JzbpRdbfItaj4NZECgHpPnGUfOMyGmttLFF5gxYf3STzrip2of9Q0IP1RbHBDpPtXtPWxTvv7BIdsQWzmpk/T+fOaT2Vk8t2FCGaqMJ/U4YAnsNC5qbeeZKceTlz4Uw4DPLBoCsrYiFMVw5rhubrmE6n6Zw0tTP0Wio/H3+b6rM5GBcJX</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmTEIaXE1zTHw8ONyzwRuZziv20VvGzzGRijnlW3vn07I3Pnfe3Yuku2y8XVyHMljLy9QDvflFC8EPdBpBYSWk4XFa3MHFesT7PIXDttFm+uL/+NhQnRYv/M5fAA0Qmh6dayvkVeb3P0odudk+Pc00yU5XgKd3wMKm6luXN9tGrhBCrndXX2dLgOg42bmY6oDFurT/iKriJIE71Vm+LNDgULNAZwxRXWhGj6UL8KlY8Mnvmvfn5kQwZbIo9XOREKkzCjfpFdz+svtr3tfvsoapWCSUtjloEdwhzepYdOkI74DoYpqu3sAi39oJXzUO8a3YZJaJ88C80y5QnV3Xohn3MhlyyO/ziiu2hIJ4g50MbhArFbLgtI78cDjeGdENrKxTtGYtXlM+7TxDVSpQHbnKpvaT9b7lbmLcxwqoZl2R6rho4iZZSL3ToOrKyZmJFPUBKACKLstHEBNkgIT+rExRmjrr3a8ZmTx08xeNYsnAaIDo3LWUUjbDJesI1YJXiLulIogkfSbEqW/yPov2rOx5cylAU0CfRjRNBmnYQgnyrqnHSzpYP/yjM3/schxXAMATiB/GRVEet/OgdvLthA1xSJ3XSuFR1/8pRe6LyedFBqUovNMTaBvmSe4o2LYMJRRxWAVpgMqNHULkwvooEsYuIIQ1sWhR/pTkmBJTVklypJb+i4mdf0s0tVEVra7o7F/PwhHnbsH7VkQDip+waCZnP5B3F4lDKmnkDDpq5fw7kiDhsY2sJehHkr4g3Y/8SSCcGoZptzqsKv0MbvdUOmr44TlRhsfG4UOehYXZYNVUuzdkAhCJ24hAJSlF8adg+GF3tPSntV8rjODTvrkPYF1uO1AIyeU7S/WpUWP6OqdI6jsHScbToPXx7dHHEaoD9H7E5lZGYoO+6FZNnPRJW7E/cOv3vFEd9uh7aAxU77d0XrwFJmW+MmckE7S6pbP3ChfMPyqqqPtAHCDwSxP26T0+ZHkJ5M0gvMFccGAP/hO3kkpE1tVMnnkB/5zIUfmuBeJXoA5px3LyAz9JbeaxAqJk3BOEkPY1vD328QrX639IcduwU3ZevKgEQ+Bz7InB10okITCvXrV9vpMH679v2M53QTvH3p+gMVex6eOKcZpdSGmw==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>
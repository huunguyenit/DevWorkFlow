<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "glthueqttn_28">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c, @cach_tinh = case when @tk_no + @tk_co = '' then @cach_tinh else '' end">
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

<dir table="glthueqttn_28" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tờ khai quyết toán thuế thu nhập doanh nghiệp" e="Corporation Income Tax Balance - Sheet"></title>
  <fields>
    <field name="form" isPrimaryKey="true" allowNulls="false" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e="Order"></header>
      <footer v="Stt, stt in" e="Order, Print No."></footer>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="stt_in" clientDefault="Default" align="right">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="pl_td" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Tiêu đề phần phụ lục" e="Appendix Title"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>

    <field name="pl_yn" dataFormatString="0, 1" clientDefault="Default" align="right" defaultValue="case when pl_td = '1' then '1' end">
      <header v="Thuộc phần phụ lục" e="Belong to Appendix"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
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

    <field name="cach_tinh_yn" external="true" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="Default" defaultValue="case when tk_no + tk_co = '' then '0' else '1' end">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="0 - Theo mã số, 1 - Theo phát sinh tài khoản" e="0 - Base on Formula, 1 - Base on Acct. Arising"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="tk_no" clientDefault="Default">
      <header v="Các tài khoản nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" clientDefault="Default">
      <header v="Các tài khoản có" e="Credit Accounts"></header>
    </field>
    <field name="tk_gt" clientDefault="Default">
      <header v="Tk không giảm trừ" e="Non-deduction Accts."></header>
    </field>
    <field name="ten_td%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cong_tru" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Kiểu" e="Type"></header>
      <footer v="1 - Chỉ lấy giá trị không âm, 0 - Không" e="1 - None Minus Values only, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="1011----1: [stt].Description, [stt], [stt_in], [form]"/>
      <item value="10100----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="10000000: [form].Description"/>

      <item value="10110000: [pl_td].Label, [pl_td], [pl_td].Description"/>
      <item value="10110000: [pl_yn].Label, [pl_yn], [pl_yn].Description"/>
      <item value="10110000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="10110000: [bold].Label, [bold], [bold].Description"/>
      <item value="10000000: [form].Description"/>

      <item value="101100000: [cach_tinh_yn].Label, [cach_tinh_yn], [cach_tinh_yn].Description"/>
      <item value="-11000000: [tk_no].Label, [tk_no]"/>
      <item value="-11000000: [tk_co].Label, [tk_co]"/>
      <item value="-11000000: [tk_gt].Label, [tk_gt]"/>

      <item value="-11100000: [cong_tru].Label, [cong_tru], [cong_tru].Description"/>
      <item value="-11000000: [cach_tinh].Label, [cach_tinh]"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmTEIaXE1zTHw8ONyzwRuZziv20VvGzzGRijnlW3vn07I3Pnfe3Yuku2y8XVyHMljLy9QDvflFC8EPdBpBYSWk4X6mfCk2DUdRe/VAvlPENJYpkoNXf7Avkwta0GqRf+o+K47CsolUzfwkOjuazJ7J/+necOkOskc3nLL0WsVyNqHdrgrWJFLIk1vE4Celu+m+J4tCQf51NNxiqTHUgvG+sqgnBnKkEw5ZkAdhtgeldpIday1MPNAbtYNHiUBOK3NPFuamZvCBbOP7TTjzLkap2taR2T0xUU+xlhr8+BM6O1VdAd8gIdax89MbIqwcMrfKygxJwUyCnEOjSCkYKZ616zysHbYuZzRDTDRQ/BOC63eS5ahK0bt3iR8WQNY3Lt7jNth0Hf5F2c/0rqwScwnrD7hmLMVpGsqtQGCppd3vK2sSiXnmzcJOdnBWQNOlKqqRInK6NB9jtBkwBgmZKqpDjOxwBHByeO2Ub6veMbTSBic/FxlkEGuAtwt25qWyQHoMi6uYHwXykjoV2B7jMKKHzTpu22s+4yrHP3MPx1nbGmxfORegMuso3ZyLDz0xpCRYMkxYKht5AGQ3oYiNdT8pNh6uUK7yhezTWOQ0papGRf7giMfvfRNVm56hXiK7NSI9oF9U62fji5efZax0IQVe0/bp1NoLkCveH5QoQNKOhw8ORTI9bQvD1QoQmPQ9zuBBwck0ohEpUCv+P5mvHokTNnTkszLmOhN7EfG3NB0hYLedVpErDFiXfPel+LsAodz2g02mUMUAXzi1z4zKWqIF+DL/4MOla9YUWwUwepfvrno3A/hBSutDCAsQV0aKTVoPv/T2R2/hxVrnbYBt+gX4qTTvWjJ7h4AsPbQ4yXba2REIMVyz8/aLdBDVGqmLhUdDhsT/uuZdSoJKm0j17r28FWAVt+RJm88c09JEkT8uobsDDPlOilfRB1oUAQGD2msJvURSYsO/4DGV5FsTe/iKUOY45hRC/3TFxneR0UmcA9mkyIEpZCjMigifphMWB61Fo=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>
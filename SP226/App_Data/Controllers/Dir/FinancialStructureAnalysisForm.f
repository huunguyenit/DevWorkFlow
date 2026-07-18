<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "GLTCPT11">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c, @cach_tinh = case when @kind &lt;&gt; '9' then @cach_tinh else '' end">
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

<dir table="gltcpt11" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu cơ cấu tài chính" e="Financial Structure"></title>
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="ma_so_in"  clientDefault="Default">
      <header v="Mã số, mã số khi in" e="Code, Code When Print"></header>
      <items style="Mask"/>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="dien_giai" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="dien_giai2" clientDefault="Default">
      <header v="Diễn giải khác" e="Other Description"></header>
    </field>

    <field name="dvt" clientDefault="Default">
      <header v="Đơn vị tính" e="UOM"></header>
    </field>
    <field name="dvt2" clientDefault="Default">
      <header v="Đơn vị tính khác" e="Other UOM"></header>
    </field>
    <field name="ghi_chu" clientDefault="Default">
      <header v="Ghi chú" e="Note"></header>
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

    <field name="kind" dataFormatString="1, 2, 9" clientDefault="Default" defaultValue="1" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Biểu thức, 2 - Số dư, 9 - Tự nhập" e="1 - By Expression, 2 - By Balance, 9 - Manually Input"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="cach_tinh2" clientDefault="Default" dataFormatString="X">
      <header v="Biểu thức (tuyệt đối)" e="Expression (Absolute)"></header>
      <items style="Mask"/>
    </field>
    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Biểu thức (tỷ trọng)" e="Expression (Density)"></header>
      <items style="Mask"/>
    </field>
    <field name="loai_sd" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Cách tính số dư" e="Balance Calculating"></header>
      <footer v="1 - Bình quân đầu kỳ/ cuối kỳ, 2 - Bình quân các tháng" e="1 - By Opening/Closing Average, 2 - By Monthly Average"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="101---1: [stt].Label, [stt], [form]"/>
      <item value="101010: [ma_so_in].Label, [ma_so], [ma_so_in]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="101000000: [dien_giai].Label, [dien_giai]"/>
      <item value="101000000: [dien_giai2].Label, [dien_giai2]"/>
      <item value="10100: [dvt].Label, [dvt]"/>
      <item value="10100: [dvt2].Label, [dvt2]"/>
      <item value="101000000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="100000000: [form].Description"/>
      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>
      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="-11000000: [cach_tinh2].Label, [cach_tinh2]"/>
      <item value="-11000000: [cach_tinh].Label, [cach_tinh]"/>
      <item value="-11100000: [loai_sd].Label, [loai_sd], [loai_sd].Description"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DFQdm3rK5K8JpimLnRaFlYRR2SOu98hJJnZP4GpFO+XmGC9qjDodou4wVI7EsK1e1g0KiHnB1Kh1oCmQrNCxo8NSbJuy7vb6oD6j+pKl/daHeJgPfZWmP3fcIyMOSaTfxHH/SvJl+Q3NsubmGDlEOnNVGy8jElfKm3hjmBO5LIamWcLDgTklDDfuC1brTqxABn702Cz3ANBqEGZgsvWExCjN/DVnLUsucNAi2zNn+Usnuvve4KRgCBKyUJ7rpNRjbJ37jbbWjcrzMTR92uI7YhYQZyVwCX0afZCtVGSQprj/6/KOcSxlxsWys2H2Vk9A4</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &Set;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1II1gF//A0y1pxU7o4CQkhUBh4NsCSkNJPnfK6hCItHZCNdqIMkNLkqmz5wq0vU6sU887Xo+H86Xpa7mnQomRo=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf7OfC7KeRYm9GABRt5KYfWCrmv2Q+9a7QibH78xasLvUCrJ/SGC7ZxSDuCWSj6oEuokvd4ez9b4ci+pQqnXUGyD3Z5VuiFxDtyRKiNtm3krLlKYF1hct3eCSlZ/vet0eyyX6Ii+9nIhxcN2f4vv5TGkXbBTlbTGJoKj5nbrWGaJvb3tjAMOAIS0ua9a+eesALgu3uybPzfiawi03WNO5WfcnD/4bmVyagaM556LvShlAKDVFYOld98ft79t5uuBgXGffWqvsoSGbH5flkq74eZLOsZHwFaBQPnIBcOTksBSEuzsry/a/jJOXTEtdEtiTjT4YtpVo1WgP3ZAnjmRlqKHYRvcuKVhrVSBS/c2Fhw7VFS6+leAsq7kkyCkHRhbvCQ==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmTEIaXE1zTHw8ONyzwRuZziv20VvGzzGRijnlW3vn07I3Pnfe3Yuku2y8XVyHMljLxYMIKxDLNzcLtGFxB2RFFVUdmG2TJQybYb7XFC2zqqBs0/YT10k1YGtKaKgtb4rO3MV+CvEp5GXZVDFVI8oZWyKad1LlZISWCh+BstHvnjxmsJuZLbcS/qD//uE70slbHqLcc2oTj8F6dLMOq0FKVDlcmBDBbQ0yQ7oLy8JhBGTjnTRFaxXXupNVo7BujWnHFaKoshoEeFc/A9koJFoicT+OI0jp+iKUBlUPkugoOyfQsXnyvLjAfCNoMBtczWoktmWVioTNgKUIldUfxAtc8z+kSL6ZHrZvGVQWvF6KuJohPOlAySjAcKx9NaRefuPxPSD745yR7IAduVGGVVR5tgmAiBO17CjpZfBBaCgH/CLh1tEkwX2JdFBsnxKbF+s/LHH9lgqCLaROBN1cFV2EyA+iAax34IMjtn/jLiP6NwEJb152aHERcRBp6SGnHuaO+ZGJpWDxQR9lyjPwIyV73UH2Ej98Yvec4X0lZtF/+nVcySunOck3vJcPN2qXePxDCfGpODDGgvc7d5jehiwopkxyxbcEyt+lZOzGNcWj3OUmVk6TFc/3ru7CM/arhT+8Z7XuqgOw2HWGotJjdS8CeVo2VjIzsn6C8sNUhOlvCa0mMWgRBKIRR996C1zI7INsx/u15ZF+kUFUom87/2Chwe/Vb6uogJIYBw2UX6ctO3a0PdulZGuinnZBf5vo0eyTyz6y601Nej4onGBam4nGA7X8iFx+GwxfW7VkiuwCmJ1WDkb7NSlCxbGm9C5MKoT3NTkrAcwesSUWTmVwv6k+yAusRNoIx63VMVIbzDVBD5GCbkK/cnc1NCqf0EpqZzM7tJGlRtocAjhvGr4vVi19zs</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>
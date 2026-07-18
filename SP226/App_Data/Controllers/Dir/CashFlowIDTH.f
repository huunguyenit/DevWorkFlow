<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY defaultForm "v30GLTCTH6">
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
end    
">
]>

<dir table="v30gltcth6" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="báo cáo lưu chuyển tiền tệ theo phương pháp gián tiếp" e="Cash Flow under the Indirect Method"></title>
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
    <field name="stt_in" clientDefault="Default" align="right">
      <header v="Stt, thứ tự khi in" e="Order, Number"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số, mã số in" e="Code"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="ma_so_in" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="thuyet_minh" clientDefault="Default">
      <header v="Thuyết minh" e="Interpretation"></header>
    </field>

    <field name="in_ck" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="In" e="Print"></header>
      <footer v="1 - Có in, 0 - Không in" e="1 - Print, 0 - No Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="bold" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Kiểu chữ" e="Font Bold"></header>
      <footer v="1 - Đậm, 0 - Không đậm" e="1 - Bold, 0 - Regular"></footer>
      <items style="Mask"/>
    </field>

    <field name="tk" clientDefault="Default">
      <header v="Các tài khoản" e="Accounts"></header>
    </field>
    <field name="tk_du" clientDefault="Default">
      <header v="Các tài khoản đối ứng" e="Ref. Accounts"></header>
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Lấy giá trị không âm" e="Value is at Least 0"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="dau" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Thu/Chi" e="Receipt/Disbursement"></header>
      <footer v="1 - Thu, 0 - Chi" e="1 - Receipt, 0 - Disbursement"></footer>
      <items style="Mask"/>
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
    <field name="cong_no" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Loại" e="AR/AP Items"></header>
      <footer v="1 - Lấy chi tiết một vế của các đối tượng công nợ, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" clientDefault="Default">
      <header v="Danh sách đơn vị" e="Unit List"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l" new="Default"/>
    </field>
    <field name="ma_kh" clientDefault="Default">
      <header v="Danh sách mã khách" e="List of Customers"></header>
      <items style="Lookup" controller="Customer" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>

    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
    <field name="kind" dataFormatString="0, 1, 2" clientDefault="Default" defaultValue="0" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="0 - Tính theo mã số, 1 - Tính theo số phát sinh, 2 - Tính theo số dư" e="0 - Base on Formula, 1 - On Account Rising, 2 - On Account Balance"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 30, 30, 60, 30, 30, 250"/>
      <item value="1011----1: [stt_in].Label, [stt], [stt_in], [form]"/>
      <item value="10101---: [ma_so].Label, [ma_so],[ma_so_in]"/>
      <item value="10100000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="10100000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="10100000: [thuyet_minh].Label, [thuyet_minh]"/>
      <item value="10000000: [form].Description"/>

      <item value="10110000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="10110000: [bold].Label, [bold], [bold].Description"/>
      <item value="10000000: [form].Description"/>

      <item value="10110000: [kind].Label, [kind], [kind].Description"/>
      <item value="10110000: [khong_am].Label, [khong_am], [khong_am].Description"/>
      <item value="10110000: [dau].Label, [dau], [dau].Description"/>
      <item value="10110000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="10110000: [dau_cuoi].Label, [dau_cuoi], [dau_cuoi].Description"/>
      <item value="10110000: [cong_no].Label, [cong_no], [cong_no].Description"/>
      <item value="10100000: [tk].Label, [tk]"/>
      <item value="10100000: [tk_du].Label, [tk_du]"/>
      <item value="10100000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="10100000: [ma_kh].Label, [ma_kh]"/>
      <item value="10100000: [cach_tinh].Label, [cach_tinh]"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmR9QHmjDjgGfOupwQvXIB59cK3l7FdJ2h/Z2E38zu/FDwPjl0Q3BLRY+FdEUrgC0jb2rEdd0mLs0ExbqiAII/cofk3Vsj5zEVifhCYuahp4f+6ZBlhPQCEVGdgQ845uSMJsToUzfvgYs24s9ttuVmhutEMAc01DkgDNQQ2wmGhae5DjrQmUDFdA7flNQXiqpM0gjnRwjknV/8aP8u4ZGqyQNpUPNRBc5UsR0dcJf4u2zo3DfWRR8tilRp1HzG3jvIo2uYkEGPTj0i9dbBSpqnU0h3e0cmO8shrgweIxyzHX9JV1JQceRUVdpjGYAp1SGZAQmI9ZXqxK8tQqKtOMpWxA+Ilm8dnS65tGebVuA7v+Pk3dOZ0dcWHCvo2vxl4BpKISAMYOXO0pRHhNIQ8vQLoblstJfRdXCCGEEugtrcHrkuv8lJMQMsmV5MT9uATdPP83ZwxDiAVz22mgKnppcRZviSRHUA2Pu4LpN3gTZvwPiI36o8GXA6NF/4wGDHl/PnBnC1JXykUixWt/7BbnnoN3BPh82YAEixJV/9oPQwXWKbHm8RTbf4MgK9pHn8N0T4XnUTRYZZlmHXZNqJzSFCcGu7ho47udSVFPKbDv0kALQCHqXv7gGO4PkoTTTPp0ORbW109NDmRFRVSOw/CzPeCkfmUXVT2F7KQTSYeJarnvudKcRVVidCvQ55JkQ5RVtvHtIdcHi6xFtDm0ljAdjeOkB3DBPawdcKvuh+4/ZOmECjreTgRPA4XRv8WhTB62n6o=</encrypted>]]>
      &ScriptIrregular;
      &OutlineEntry;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>
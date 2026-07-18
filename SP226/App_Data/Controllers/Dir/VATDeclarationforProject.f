<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "v20glthue3_28da">
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

<dir table="v20glthue3_28da" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tờ khai thuế dành cho dự án đầu tư" e="VAT Declaration for Investment Projects"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="##0" clientDefault="Default">
      <header v="Stt, stt khi in" e="Order, Number"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="stt_in" clientDefault="Default" align="right">
      <header v="" e=""></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="ma_so01" clientDefault="Default" align="right">
      <header v="Mã in cột tiền" e="Amount Column Code"></header>
    </field>
    <field name="ma_so02" clientDefault="Default" align="right">
      <header v="Mã in cột thuế" e="Tax Column Code"></header>
    </field>
    <field name="in_ck" dataFormatString="0, 1" clientDefault="Default" defaultValue ="0" align="right">
      <header v="In" e="Print"></header>
      <footer v="1 - Có in, 0 - Không in" e="1 - Print, 0 - No Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="bold" dataFormatString="0, 1" clientDefault="Default" defaultValue ="0" align="right">
      <header v="Kiểu chữ" e="Font Bold"></header>
      <footer v="1 - Đậm, 0 - Không đậm" e="1 - Bold, 0 - Regular"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_no" clientDefault="Default">
      <header v="Các tài khoản nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" clientDefault="Default">
      <header v="Các tài khoản có" e="Credit Accounts"></header>
    </field>
    <field name="dbf" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
    </field>

    <field name="kind" dataFormatString="0, 1, 2" clientDefault="Default"  defaultValue ="0" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="0 - Theo mã số, 1 - Theo số dư tài khoản , 2 - Theo số phát sinh" e="0 - Base on Formula, 1 - On Opening Balance, 2 - On Acct. Arising"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="lay_tu" external="true" dataFormatString="0, 1, 2" align="right" allowContain="true" clientDefault="Default" defaultValue="case when dbf = 'CTGT30' then '1' else ( case when dbf = 'CTGT20' then '2' else '0' end) end ">
      <header v="Lấy từ tệp" e="From file"></header>
      <footer v="0 - Sổ cái, 1 - Thuế đầu vào, 2 - Thuế đầu ra" e="0 - GL, 1 - Input VAT, 2 - Out VAT"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="ma_thue" clientDefault="Default">
      <header v="Mã thuế" e="Tax Code "></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1=1" information="ma_thue$dmthue.ten_thue%l"/>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" dataFormatString="0, 1" clientDefault="Default" defaultValue ="0" align="right">
      <header v="Thuế đầu vào" e="Input VAT"></header>
      <footer v="1 - Chỉ tính chứng từ có thuế, 0 - Tính tất cả" e="1 - Voucher with Tax only, 0 - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"></items>
    </field>
    <field name="type" dataFormatString="0, 1, 2" clientDefault="Default" defaultValue ="0" align="right">
      <header v="Kiểu hiện" e="View Type"></header>
      <footer v="0 - Cả hai, 1 - Thuế, 2 - Doanh số" e="0 - Both, 1 - Tax Rate, 2 - Revenue"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="1011----1: [stt].Label, [stt], [stt_in], [form]"/>
      <item value="1010-----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="101-0000: [ma_so01].Label, [ma_so01]"/>
      <item value="101-0000: [ma_so02].Label, [ma_so02]"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="-111000001: [lay_tu].Label, [lay_tu], [lay_tu].Description, [dbf]"/>
      <item value="-11001000: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="-11100000: [thue_suat].Label, [thue_suat], [thue_suat].Description"/>
      <item value="-11000000: [tk_no].Label, [tk_no]"/>
      <item value="-11000000: [tk_co].Label, [tk_co]"/>
      <item value="-11000000: [cach_tinh].Label, [cach_tinh]"/>
      <item value="-11100000: [type].Label, [type], [type].Description"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmTEIaXE1zTHw8ONyzwRuZziv20VvGzzGRijnlW3vn07I3Pnfe3Yuku2y8XVyHMljLy9QDvflFC8EPdBpBYSWk4Xf6u/012gv+tBXlNtCwwFJbgmIjEqANsaJOp/Drwd5UrZww1YoIta/ONv05CYMian7C7B0Khu5SqlvtbbE5iKeEQMs5Ur+qF8buRGntPNm+r4HWD0cGpm0keHT/Pqk2kxMK285+dBkxpoUklEFE+KTD8BpnFBNnQ4y1oAJjSzTE862PESpbDZ/inuN2CnXptguB9GtZIjc/Rn+7fM1fyBem+tOPHJZxAHs8TbFLnL+5RBeUBzfsg5twD6TJTe/G8EZBSob9kZbCErX26nqmesnMeWie875Bp8CQ8r1C9vXdh/qxmRQjg6mc8e5Jb0+lXwfR2L9JoJsIYR87yRuxvuRmA3EWHuvKS0aTxjQlKC0uwCsW/fyAiojGb7fevfghVAye+aDBCBC65mktiCH+w/Jzc/5eEz++7NhUj1LQHVB7GDEP2OwjGSeO3TWYo7ohsyHyL1adYFG6gYu7vW1+K2IGuaK+50EotcxNrhDblhTBCCj46siqc2jcxj/G8m8EmDlz5bfY+5uNXhRJnh1+CA0IgKPwR+9oziQ3Y1sRoGa8BGbBIyj68PqOCOBHYKYjQZv1fyq88/GPPyfYYI0hhITA4GzoJUEDGDxitegQwrUZ2DusB3nmTJNQ3kQDR2KP1S85X9Z8VyasyPaWAvMR0n1qJ2PLMAk63JmzogDsTXsl2+byRAFqs8b9Y72Gxk9DFKCpy6rPw6WIEndm+hEuaGp6RuYntr88ONrprmAkgKVjrKLqk0iVksB1xZAGFZfZzAOtozG2Suggse1fBHulfDr9lo818WPxhOmZlmI6sE+UIVun3lvpGpLBIjtGCaBHi03Zg3otdFJv9SWdK1Pzglw0efb7FljfetztmpJTkiubA5pvjubfJERPv4eCHNFTA13D/3aJJM3Tdmyc3QKWko1NJkY/5n+WPRV+UBDqJ4j0iQBCLw3DvWltVzRD522Ov+XnjDiMJMjfovlmEfSiBEk/5s4eCXeHYZvy0Ic8v/wnYwNrs9+IOfHwdFUugVUIklbcw1XuUReu22Ww7uHQ3/RypUYSvsC18cw3Bu160iwLAK6bg3pOgMZ/n7jw5M2OuvUkHGrMiQR3PdgbD6+bmpiNUkZN/x77qk0TD6VYe63Tv6NTeFIRCGQOczu6c8zzir</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>
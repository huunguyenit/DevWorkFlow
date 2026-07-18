<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "BCDTKY">
  <!ENTITY controller "rpMultiPeriodCashFlowForecasting">
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

<dir table="bcdtky" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu dòng tiền theo nhiều kỳ" e="Multi-period Cash Flow Forecasting"></title>
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
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
    <field name="kind" dataFormatString="0, 1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Theo số dư đầu kỳ, 2 - Theo nguồn dữ liệu, 0 - Tính theo mã số" e="1 - On Opening Balance, 2 - On Data Source, 0 - Formula"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="thu_chi" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Thu/chi" e="Inflow/Outflow"></header>
      <footer v="1 - Thu, 0 - Chi" e="1 - Inflow, 0 - Outflow"></footer>
      <items style="Mask"/>
    </field>
    <field name="nguon_dl" clientDefault="Default" defaultValue="1" categoryIndex="1">
      <header v="Nguồn dữ liệu" e="Data Source"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="1. Khế ước cho vay" e="1. Loans Given"/>
        </item>
        <item value="2">
          <text v="2. Khế ước đi vay" e="2. Loans Taken"/>
        </item>
        <item value="3">
          <text v="3. Hóa đơn phải thu" e="3. AR Invoice"/>
        </item>
        <item value="4">
          <text v="4. Hóa đơn phải trả" e="4. AP Invoice"/>
        </item>
        <item value="5">
          <text v="5. Hợp đồng phải thu" e="5. Sales Contract"/>
        </item>
        <item value="6">
          <text v="6. Hợp đồng phải trả" e="6. Purchasing Contract"/>
        </item>
        <item value="7">
          <text v="7. Kế hoạch dòng tiền theo tháng" e="7. Cash Flow Planning by Month"/>
        </item>
        <item value="8">
          <text v="8. Kế hoạch dòng tiền theo tuần" e="8. Cash Flow Planning by Week"/>
        </item>
        <item value="9">
          <text v="9. Đề nghị thu tiền" e="9. Customer Payment Request"/>
        </item>
        <item value="10">
          <text v="10. Đề nghị chi tiền" e="10. Supplier Payment Request"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>

    <field name="ds_tk" clientDefault="Default" dataFormatString="X">
      <header v="Danh sách tài khoản" e="Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="ds_chi_tieu" clientDefault="Default" filterSource="Optional">
      <header v="Danh sách chỉ tiêu" e="Articles"></header>
      <items style="Lookup" controller="CashFlowArticles" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
    <field name="cuoi_ky" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="" e=""></header>
      <footer v="Số dư cuối kỳ" e="Closing Balance"></footer>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 25, 15, 40, 20, 60, 30, 30, 210"/>
      <item value="1010-----1: [stt].Label, [stt], [form]"/>
      <item value="1010010---: [ma_so_in].Label, [ma_so], [ma_so_in]"/>
      <item value="1010000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="1010000000: [chi_tieu2].Label, [chi_tieu2]"/>

      <item value="1000000000: [form].Description"/>
      <item value="1010100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="1010100000: [bold].Label, [bold], [bold].Description"/>
      <item value="1000000000: [form].Description"/>

      <item value="1010100000: [kind].Label, [kind], [kind].Description"/>
      <item value="1010100000: [thu_chi].Label, [thu_chi], [thu_chi].Description"/>
      <item value="101000000-: [nguon_dl].Label, [nguon_dl]"/>
      <item value="1010000000: [ds_tk].Label, [ds_tk]"/>
      <item value="1010000000: [ds_chi_tieu].Label, [ds_chi_tieu]"/>
      <item value="1010000000: [cach_tinh].Label, [cach_tinh]"/>
      <item value="--110000-: [cuoi_ky], [cuoi_ky].Description"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DeqAqV5Mme2ArqLsX4ikZBr2WhthIYiT2Zq2d4g3ECEFuIqPQvFx8ij4BQZwSf1pebuyohK9NT3IjN1dL++v8UJsJx51gB1CRT0GSyj0E9R3gRckKn4FNYXp3/Evhpu6W56R3p2UTxba4C/bgwmyaK9tgoSAAEaQTjH8UnkKUEwYTFjQHBJC6FwT1jsAPRny6egjAzaglkl6eC50FSixob2ADvOcg+BE5w5WSXKOAQAqGi6c0qi2qgSQ4Fy3DjnVE1S277vi+erZvCmNn+kYPBWXDLM3v9gd4lkiPRA07TIuQ6gEkgSWgGPtL9ROzyeqk5CdrigxwJZZFrvURlZW76FQKaAaq2LLceDlKd4VQVIa5rq1z9bh351XkixUlR9ZgOoXgfSqnSLjucS4pTMOXuA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &Set;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1II1gF//A0y1pxU7o4CQkhUBh4NsCSkNJPnfK6hCItHZCNdqIMkNLkqmz5wq0vU6sU887Xo+H86Xpa7mnQomRo=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf7OfC7KeRYm9GABRt5KYfWCrmv2Q+9a7QibH78xasLvUCrJ/SGC7ZxSDuCWSj6oEuokvd4ez9b4ci+pQqnXUGyD3Z5VuiFxDtyRKiNtm3krLlKYF1hct3eCSlZ/vet0eyyX6Ii+9nIhxcN2f4vv5TGkXbBTlbTGJoKj5nbrWGaJvb3tjAMOAIS0ua9a+eesALgu3uybPzfiawi03WNO5WfcnD/4bmVyagaM556LvShlAKDVFYOld98ft79t5uuBgXFzHnsDAXWGm6AnXEXBSbwxqcLrhL7jykODh/USLlSc15Ta9SJ2Zrw6oSfWGHrvmcG9GZRTWRRsg+Ty67xRoZFAiYOtPU823s3YX85tgslpeZX9B2PvoMsZmPNvB5XYfy5mszVWuR636dgc7+pjsD2cgTQKKF3SuR6HDuAhFXYo25gZjVLd5R+PQE4bY+86xLyEH0kYLbdz98SYYEdPLKtk=</encrypted>]]>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dR0AaWSVp5YtnlDRMpmCg4q+/VOa4jR8bnj05rN7t1s/94gUV9l+xPsYEvzDHlOFh7Jky7ewPk/sfU8xbDxJp1P4Mj3Tcy7lhFhxaloNNzjn3kxc+MZA6Nko1sebv/BrbUX5dZ3qnORAlhXNNleMXf1udjXDe9qjH6SzA0oPigdslOe7NOy2lMjdKYqcAv5bjPiPm4Z4//uvBtMtuzJK/GuZc3z0WkLahIthXJXNsaIb/7e8Jp5cYwgHb5HCR3hjv63I4prX7UK0tnUvKdyj6rWza4zD/rocWg+P9W1easwsO7b2IaybL4SX9GCRC+lFbUDiL6RUqLLEm4fCot4z8I=</encrypted>]]>
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
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NXTUuGR6neR027q67TKWhUWZpFTSoX1Kq3t0fD6DH94</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh39mkZKMOg8eVk5Y7Rau1F2RjMH14RDvnpEejZV6RjSIQQoF4ZmO5VpgoJdqUIMTY1qSM5nKzdERN1uM+NvvZBLg=</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xgWII8wlIu1VrVO/idcxtYHJwww6j73GbEKrGZiQEtp8d2LmGAkDqZwfDvNTpzBOeDw72iZEv8Mco8oTmd0qgwiBAEdaEoaGGb/Xlb8y033</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xgWII8wlIu1VrVO/idcxtZnS55EPtrYtfH40X917G/ORwUuHsbiuakxvdByvRqMmbdlGAwtsP89duHyecEsTObsEUEz7EZWJgsASMCajtSS</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/Aj8S6ZQizL4SDJh24vHl3N+uT2dbdRZpWXVdWkGAYI+w+JehGe3znIIYStgoxHD1Sg==</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63v1+3HOHiW6uQvLr3BQBhruOT6QVKZVU+edLdM3KVucDHu1Q1dKKnPMeMahjCdFbVgIVRwX96zNtej92Lg0lxs7xRKY22wjzeylnqP1bQo/SWcGxDagZ3zCn+gONOnik26T1OM+feB0rsRLBEy5n3KibLrhuQXlrdC/LTQS3BE1Kfv3ykW+g9gW2kUeZy8z7zq/bEZda5d6ceieZ8aXabWfQ=</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AlC1mgtSaQb9s0tpj3llKV3op6DJtfQsP1AK5e/n21zZX7ffNEXZqI75C5lHwyc7WEoX3zy53RwJ9mtF+bbIliwQxPUxKNlKkdsNGpl4v2qB5WACBqFVpZLU+2ZFihTeGQ==</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNCheXXmUgEF8b6+7qKIR2VfJrzTy7o+eiehNpruZDRVO++airMgvvc14WxPNWGeaLpsVvfDE0EbJupYHOCWtnlbd7dRf/1nVCeqsGNGUygCD</encrypted>]]>&controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTG+CAolAjhdIUkXaEvT8QTvue5w+LBmbbkuzEySvscYRw0TIJCbNEViJSOWOfJlXD6tXw+tkiB9K/SgzHH3LOz1H8bCXqB+qK4ukJcp15o1q</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh312p4tHmlMlEk3Qw2+dnjb6NqMMxO3AEYwyMEIhE97N5jpQKue0+zb8OwyTUwbaD0oo8TT0Ozm9snvtlG+W4Nm0UE0WuI8gBZyQ4IukOLFrQA0D3iohsVVP4z3+gTo8uePUrK6zcK3DNrPCnRn17jfU=</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/ArchhdFGPvg2H7MxRwIZoyBWS84hGe2gw2hKi36vcf9xtA240hvqR97qZKbrMBgYRETfezG6aBUjdcnsNKX3A/arPNHtDv+DK4TP3WPrRKCi</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AnrMAopdf5Pt3hEB+toP2dBPGo665C3/RMsJIETdks/fmaXgCkcLPrWsBFAkHw0H5VmrKgMdoBqJRukwYWDfz0oikW2zKugv4mgOhH8xCJb/GhF7zB1x3gmJrOyd/kHzyQ==</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AgjPE4WDyrFdFdOt2NjyN3H1GYrpTIPZgBRhplic6W2KINsMit9tSD3TXHW6R3zk9jd2Rl0P/mAlC4wl3YVvaXTUM5hnsAK04EURma3jQ4d5bvhAIvge1zW1HVlZHxA1XuXL9DmJzxlZboNfyegPJHAvzMiF1yyjNh+0LZqTENM5GuCXFYAvQRAtmybSqaY7SQ==</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNO1ZTI4dsEbfmSV0//y3Sbt9E1lP9H3wJMAbOpr9k2Ievxln6KxXc6OiT35e44YIPG7r+95bAryRrpDKLTIMO7g=</encrypted>]]>&controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTG+CAolAjhdIUkXaEvT8QTvRFsoXqq8f+dVPh9aCPOsxZuw+2+KqrgFRs6npVedjgxZohNWMQXT85tH88e4fN4U=</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh30R6ePhFNQlJwg+OD+48QN8UKWiPI3fp6vW2Kha+o/2bXXYSC2miBUV4QbiG9CuYoi0eSItnWS/n8lUT18JfqFtrUeCt8CLesZIktGfsS7NS</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh31wFhkhgmjjfNAJ4gFy/3283kcYGgD8S3hZSHqlhMlhoAEiDSebFdSmtNI76q93erJ3VOeifUjxaVNljR66lvYU=</encrypted>]]>&controller;<![CDATA[<encrypted>%GK8Oop5VxPxemXR57MiHnm3UkippD10or0k/5+ziYe77f+yvmPCk/IQFBZJw3fDtPiMKEmypk/AGb5W2OPGh5f+fXOZ4mrquJOJB2F9O6cc=</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNO1ZTI4dsEbfmSV0//y3SbuZibohqPlSeZxCZAfnik7Ha99sBtgCwhhTMUIjKlty3fC2cZQMSilZej8lu+hz7M4=</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNCheXXmUgEF8b6+7qKIR2VfMVM+l5YVTZDPDKuWPFVahWON2yhyxTI78/D2e6ln9qRIvAIG/LwbPyvPjyLsP2dY=</encrypted>]]>&controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTG+CAolAjhdIUkXaEvT8QTvTWI6sW3AefalX0VzOlSAmudJdwOD3ONKccW36d1j8hHKU8iHqFY4VPl2Oanbphd4=</encrypted>]]>&controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTJsRhoY/nAfTyKy0FpBHP1b5TOJlJ3S7xbDmfL48/2XQWXHJdYJc/IXLnViBciNaiA6gQBvgQPyRm2gHI+xMszuPoHtNgoqcVd8HzXxFq5Hf</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh37JRSe9ABg+4CebxLv2g+TM7RKXk1/5afXbmk9atW8oTK1OZteLN2nxiwLm6xlE0zA==</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xHHCpTJvMdHF5sDk2XZLUnsX7GGrTnMhd131PfBQalZ384zM7vWS6tN//r2jmpogGSb7dliGyIkZJD2SxPXnRM=</encrypted>]]>&controller;<![CDATA[<encrypted>%GK8Oop5VxPxemXR57MiHnlSOaUmQm53rvfUMTdLjx4gMNlX/8QjNx3KbX/ZpftT57naxNcbB5oPluGquH+Ob2VtwiuoguyM255imKQsz+Y4=</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNO1ZTI4dsEbfmSV0//y3SbvUaSMf79ZHmDQNufn0OJ3PTgkQYrxXQrBy0BEzXU3ZpgyAlz4gKdCZEKIA9mw9Log=</encrypted>]]>&controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTJsRhoY/nAfTyKy0FpBHP1aNIsFoNT08S/MfQf8Kt8J2aTRrQrRkxZyzBD0e/oghpwUwnO7iT1QLG6lTQDmnIyI=</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh31wFhkhgmjjfNAJ4gFy/329jrBFVR7cGVv2etMCowIvwmc4681un1OJVu7pm8Jo5yZGvKsUHumjXWN6I7f3cWEk=</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xHHCpTJvMdHF5sDk2XZLUn5C2AYhQt/9Q4BBrUk3s5sKv8p24hf8ZtXE45cHei05YKRx7xa0Hxb5YkPx4yOr5c=</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63v646SRBakXLkyL7Jpks7pMG53YoBozN1Yo73+TdNhPCRWUPvcvz87crS0ccUpOg+2w==</encrypted>]]>&controller;<![CDATA[<encrypted>%GK8Oop5VxPxemXR57MiHnlSOaUmQm53rvfUMTdLjx4iHzoVKUbfocGaAVV3Xi6jiUkmeqDDNBvnE1zcreJ3z/L5FojaqpHV/LrIs96Uw7dTEyD2IkOcpruwOyGJw4j2D</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNMHu44EdzLd0+L/EucQ+4Lji/kUYg5PrdzUXsYW6BXaeKr62uO2YpSBspTW6Frp5XsmAGz6Xg2lsl+21xv6TYiN44r2ifITD+QqT/ux/jWTvj581QpxA+GnNt2ebnEMi20twj5+crg3CToYd4TjfjozPUd721hdOEG/utooMY0q+5+DCn3XKwKi8bCvkzzqRDmlp/5d2Aq0uKHCzyfX9nEeoVee7QIj5F/EJBnsl1EwMpIk3hbioojH8w6tGqsPd26hw9DJsEimfCLVrIcFdZuFbBwrss+jkTR0KDDWQ+XraY3WshFK6rXo+o6y1jgqnTHCuLTdDBLQdRL8w1Kx7JKI=</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh39w5kcgXkzfNhKcz3ib+yGFrx6pc4H9of8VamMVgPKKvqoPYmxpucxn4rcxUTvmYHEOWK10XtNcauN4YNcGu7fTVOiAOyslBcvR+vXi4D81+/mRa0MdFdxe7vGZ6CQ3C7Rs8Va6u+W/POFBBH4nsMJV4kT+p05+VhoRvJam6hJTUH1ZBupQWtLKtwwKqbPBE7GHjOGVmlcvarkq77sKQ7eqM0FlULprQ8LBr3Kl8w0om</encrypted>]]>&controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTBd8EM0z0gG5Bhw7jXL+b4qf22ptzxopkehn9aBZo+rXviHMLZcSVjyNNxSESPA1j5KvjQGqpybyTFlzlwHx+AQYW1ItMsEW7Ng5IGOYDLQoxVYk0RkwHNSkB+Qhw0FFbNaBBs2qFt4AVsKQDKV92rf8PvS5X6JJXMAI0HrUm7Ya9V3rjEOBTx5bizCKj+/iM6M9tKc6SbRzOb7zxSAJSZ4=</encrypted>]]>&controller;<![CDATA[<encrypted>%GK8Oop5VxPxemXR57MiHni4PsDU102sLnumBzXhQTXHibXT2tdmKdeWF12NK7PcK5xE8Wzh4yVIKkFx27tTfTOIE8Ro1y8I3v4HytQ4o8BrnYjvHYEpbvFTyzTh0BYWVBZsjvCyBe1KGCJNkON2nmg==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
      &OutlineCss;
    </text>
  </css>
</dir>
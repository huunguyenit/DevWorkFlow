<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "V30GLTCTM">
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

<dir table="v30gltctm" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
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

    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
      <footer v="0 - Theo mã số, 1 - Theo tài khoản" e="0 - Based on Formula, 1 - Account"></footer>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>

    <field name="loai_ma_so" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right">
      <header v="Loại chỉ tiêu" e="Type"></header>
      <footer v="1 - Chỉ tiêu đơn, 2 - Chỉ tiêu dựng cột, 3 - Chỉ tiêu tăng giảm" e="1 - Normal, 2 - Crosstab, 3 - Balance"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="kind" dataFormatString="0, 1, 2" align="right" allowContain="true" clientDefault="Default" defaultValue="1">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="&lt;span id = 'idf_kind'&gt;0 - Theo mã số, 1 - Theo số dư, 2 - Theo số phát sinh&lt;/span&gt;" e="&lt;span id = 'idf_kind'&gt;0 - Based on Formula, 1 - Balance, 2 - Arising&lt;/span&gt;"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>

    <field name="ky1_0" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Số liệu" e="Data"></header>
      <footer v="1 - Kỳ này, 2 - Kỳ trước" e="1 - This Period, 2 - Previous Period"></footer>
      <items style="Mask"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="dau_cuoi" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Đầu/Cuối" e="Opening/Closing"></header>
      <footer v="1 - Đầu, 2 - Cuối" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="cong_tru" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Cộng/Trừ" e="Plus/Minus"></header>
      <footer v="1 - Cộng, 2 - Trừ" e="1 - Plus, 2 - Minus"></footer>
      <items style="Mask"/>
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Chỉ lấy giá trị không âm" e="Value is at Least 0"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="cong_no" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Lấy chi tiết một vế của các đối tượng công nợ, 0 - Không" e="1 - AR/AP Items, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="cong_no_ct" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Hiển thị" e="Display"></header>
      <footer v="1 - Hiện kết quả chi tiết theo đối tượng công nợ, 0 - Không" e="1 - Show Balance Detailed by AR-AP Object, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="vv_ct" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Hiển thị" e="Display"></header>
      <footer v="1 - Hiện kết quả chi tiết theo công trình, vụ việc, 0 - Không" e="1 - Show Balance Detailed by Project/Job, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="phi_ct" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Hiển thị" e="Display"></header>
      <footer v="1 - Hiện kết quả chi tiết theo khoản mục phí, 0 - Không" e="1 - Show Balance Detailed by Expenses, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="tl_gh" type="Decimal" dataFormatString="#0.00" clientDefault="Default" defaultValue="10">
      <header v="Tỷ lệ giới hạn (%)" e="Max Rate (%)"></header>
      <items style="Numeric"/>
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
      <item value="101----1: [stt].Label, [stt], [form]"/>
      <item value="1010-----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [loai_ma_so].Label, [loai_ma_so], [loai_ma_so].Description"/>
      <item value="101100000: [kind].Label, [kind], [kind].Description"/>

      <item value="101100000: [ky1_0].Label, [ky1_0], [ky1_0].Description"/>
      <item value="101100000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="101100000: [dau_cuoi].Label, [dau_cuoi], [dau_cuoi].Description"/>
      <item value="101100000: [cong_tru].Label, [cong_tru], [cong_tru].Description"/>
      <item value="101100000: [khong_am].Label, [khong_am], [khong_am].Description"/>
      <item value="101100000: [cong_no].Label, [cong_no], [cong_no].Description"/>
      <item value="101100000: [cong_no_ct].Label, [cong_no_ct], [cong_no_ct].Description"/>
      <item value="--1100000: [vv_ct], [vv_ct].Description"/>
      <item value="--1100000: [phi_ct], [phi_ct].Description"/>
      <item value="10100----: [tl_gh].Label, [tl_gh]"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmTEIaXE1zTHw8ONyzwRuZziv20VvGzzGRijnlW3vn07I3Pnfe3Yuku2y8XVyHMljLy9QDvflFC8EPdBpBYSWk4XFa3MHFesT7PIXDttFm+uL9tDFgpW12KWn9n58ZAo49AHufmTvQpDaaFbVmUVB5h7C3Th30WQwjm/G97HQAbVC4Y+01J3BT9+E9BLrYq/8UAdCbVuq4xth6+7SURnkdjPf85WbgvvZZ+TVzdUKJ0WoDizf4AYVNFV1kD/iMTRoh8kNNAaHZOPhibJOm3wS4e41jEo+0VPxgDWsqVeOo6D9TvqNmIgILXxEuR0Ll03QG3AKey12Jg1wEjTUHGFnjrVSkNb7Tudzo4AQEmpBY3W3lh99aTh8gKT8aYcE/7gH2zsMH+Ob7iZidAu58MOfRcb6Ak5MZ+t2/AYb5AJHWblB1doWkcQ4/krnpioMFrgjRLDwaiPsiVnIYtX8P2h5OBGFEQoLmqv15WjL7fh+liQ/DHhQJBnJkLUFr5kMGrFfZpLx8HJSmQq4Sw5gsZIpozMor8erjcaePAJi8oEeou4lljEuW+i2rAW5C5XaMWJt19/cwOVHucIPP+8wn2/uZNlu3deVYoOYBqn6Y1PGUDgcmWt0dmDamLjemT89JzmncmVKGHOXRp9WZoVzngae9Tgsxs0bEu163Abxwpi4T1C3LSCJYgzA+GOeX4axX7fOpY1tFYWVov0pvPHC4nvYBhPPwZVbHsREqx6HlYRltE1rJ/bufG+NHP8TencIkcEphIRnBfxY9VJGXpu8jxekQLNBWL3TAD1XAD8DAnQnEZZX+O8UZ5xGTXMLb3soOLtpgc0AzU+Q9HCt5NxFTJ+TcjkiS+alhuxl5FquwQ7TGMu5FiWiXZLmT8puJmRycpj+wXRmrM90Y1p9vCi3XV1erkAuWGZelyIYb5AwvFg6HOGozzXTAuBReVvXqMrt6+K3+wfT71EPi8j5+jicN6PqjqvifIQG83uQly+nLl23pDFqboyiP/8tSiUbPZgjsKXwivmSMa3Icx4PAyxNUDtp0X69iO5LrsiowzOk54jDPEK7Ncw666QJ+buR4CD2J25bS4aYv1pxXqglgKAozrTRnXOAvEBIBLXanNi3gk1CJllQ2OxBljN2UP6e2+HV3GEsUDrdOqdIGNuymIqar1YSB2qhZp+DWDxlMfwPGs39WjqHe9cMCAT3x7nlFPppEGRKbCDjBvcxKmYHZzJSxoCJBjSdN74ajjfSUmwFxWOS/XXZoKeGw0/wyOiuWSfaPL/DHACvXaZMkmlYiKFbvwZIxztk/BYmHKpaf9UXhgUU0BQRJq8QlnBIxgLaM6/gvjuFuKiu8APG05EKnINX8uQXk0Fm1g9+jN5sRI6vdbz43PKTtLxRqPw+iVqs7xiNBZ1G62H8Sm9TExKn4+DB3O8VPstljzU5PgKua2cWh/GIx5Z02s/sdqdydfD5+U6W+Mx1JPWJMycob+zMwjaEDMuzq/LgPK+b9TUTI+2uDxbs/EdaH+Y8fAtendnycaX6hgfpBsEU+BQpNtsWnd8uctaG1r+0WNijAIokRhHR3u5R79+sHzypJAhQmiUfr3+RtZPlGc=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>
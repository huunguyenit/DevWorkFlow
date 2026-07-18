<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "V30GLTCTMTH">
  <!ENTITY Controller "rpInterpretationFinancialGeneral">
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

<dir table="v30gltctmth" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu thuyết minh tài chính" e="Interpretation of Financial Item"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e=" Number"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&Controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&Controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>

    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
      <footer v="0 - Theo mã số, 1 - Theo tài khoản" e="0 - Based on Formula, 1 - Account"></footer>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>

    <field name="loai_ma_so" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right" categoryIndex="1">
      <header v="Loại chỉ tiêu" e="Type"></header>
      <footer v="1 - Chỉ tiêu đơn, 2 - Chỉ tiêu dựng cột, 3 - Chỉ tiêu tăng giảm" e="1 - Normal, 2 - Crosstab, 3 - Balance"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&Controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="kind" dataFormatString="0, 1, 2" align="right" allowContain="true" clientDefault="Default" defaultValue="1" categoryIndex="1">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="&lt;span id = 'idf_kind'&gt;0 - Theo mã số, 1 - Theo số dư, 2 - Theo số phát sinh&lt;/span&gt;" e="&lt;span id = 'idf_kind'&gt;0 - Based on Formula, 1 - Balance, 2 - Arising&lt;/span&gt;"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&Controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="ct_dvcs" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="Default" defaultValue="0" categoryIndex="1">
      <header v="Chi tiết theo đvcs" e="Detailed by Unit"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ky1_0" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right" categoryIndex="1">
      <header v="Số liệu" e="Data"></header>
      <footer v="1 - Kỳ này, 2 - Kỳ trước" e="1 - This Period, 2 - Previous Period"></footer>
      <items style="Mask"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right" categoryIndex="1">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="dau_cuoi" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right" categoryIndex="1">
      <header v="Đầu/Cuối" e="Opening/Closing"></header>
      <footer v="1 - Đầu, 2 - Cuối" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="cong_tru" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right" categoryIndex="1">
      <header v="Cộng/Trừ" e="Plus/Minus"></header>
      <footer v="1 - Cộng, 2 - Trừ" e="1 - Plus, 2 - Minus"></footer>
      <items style="Mask"/>
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right" categoryIndex="1">
      <header v="Chỉ lấy giá trị không âm" e="Value is at Least 0"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="cong_no" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right" categoryIndex="1">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Lấy chi tiết một vế của các đối tượng công nợ, 0 - Không" e="1 - AR/AP Items, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&Controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="cong_no_ct" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right" categoryIndex="2">
      <header v="Hiển thị" e="Display"></header>
      <footer v="1 - Hiện kết quả chi tiết theo đối tượng công nợ, 0 - Không" e="1 - Show Balance Detailed by AR-AP Object, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&Controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="vv_ct" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right" categoryIndex="2">
      <header v="Hiển thị" e="Display"></header>
      <footer v="1 - Hiện kết quả chi tiết theo công trình, vụ việc, 0 - Không" e="1 - Show Balance Detailed by Project/Job, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&Controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="phi_ct" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right" categoryIndex="2">
      <header v="Hiển thị" e="Display"></header>
      <footer v="1 - Hiện kết quả chi tiết theo khoản mục phí, 0 - Không" e="1 - Show Balance Detailed by Expenses, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&Controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="tl_gh" type="Decimal" dataFormatString="#0.00" clientDefault="Default" defaultValue="10" categoryIndex="2">
      <header v="Tỷ lệ giới hạn (%)" e="Max Rate (%)"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk" clientDefault="Default" categoryIndex="1">
      <header v="Các tài khoản" e="Accounts"></header>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" clientDefault="Default" categoryIndex="1">
      <header v="Các tài khoản đối ứng" e="Reference Accounts"></header>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_0_gt" clientDefault="Default" categoryIndex="1">
      <header v="Các tk không tính g.trừ" e="None Deduction Accts"></header>
    </field>
    <field name="ten_tk_0_gt%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ds_ma_dvcs" categoryIndex="1">
      <header v="Danh sách đơn vị" e="List of Units"></header>
      <items style="Lookup" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ds_ma_kh" categoryIndex="1">
      <header v="Danh sách mã khách" e="List of Customers"></header>
      <items style="Lookup" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="cach_tinh" clientDefault="Default" dataFormatString="X" categoryIndex="1">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="376">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="101----1: [stt].Label, [stt], [form]"/>
      <item value="1010-----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>

      <item value="101100000: [loai_ma_so].Label, [loai_ma_so], [loai_ma_so].Description"/>
      <item value="101100000: [kind].Label, [kind], [kind].Description"/>

      <item value="101100000: [ct_dvcs].Label, [ct_dvcs], [ct_dvcs].Description"/>
      <item value="101100000: [ky1_0].Label, [ky1_0], [ky1_0].Description"/>
      <item value="101100000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="101100000: [dau_cuoi].Label, [dau_cuoi], [dau_cuoi].Description"/>
      <item value="101100000: [cong_tru].Label, [cong_tru], [cong_tru].Description"/>
      <item value="101100000: [khong_am].Label, [khong_am], [khong_am].Description"/>
      <item value="101100000: [cong_no].Label, [cong_no], [cong_no].Description"/>

      <item value="101000000: [tk].Label, [tk]"/>
      <item value="101000000: [tk_du].Label, [tk_du]"/>
      <item value="101000000: [tk_0_gt].Label, [tk_0_gt]"/>
      <item value="101000000: [ds_ma_dvcs].Label, [ds_ma_dvcs]"/>
      <item value="101000000: [ds_ma_kh].Label, [ds_ma_kh]"/>

      <item value="101000000: [cach_tinh].Label, [cach_tinh]"/>

      <item value="101100000: [cong_no_ct].Label, [cong_no_ct], [cong_no_ct].Description"/>
      <item value="--1100000: [vv_ct], [vv_ct].Description"/>
      <item value="--1100000: [phi_ct], [phi_ct].Description"/>
      <item value="10100----: [tl_gh].Label, [tl_gh]"/>

      <categories>
        <category index="1" columns="8, 112, 40, 40, 20, 60, 30, 30, 210">
          <header v="Thông tin chung" e="General Information"/>
        </category>
        <category index="2" columns="8, 112, 40, 40, 20, 60, 30, 30, 210">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4PuVsx8HPOHN9j1LElx/HzBMF52oDifsO9zk9U9uLH3</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTHd+MZkeC19dkcaNF4tTM4nXRWuwMcDaPA3b+e6TjgvNyjX95HzD/vyazICMUSuOJQ==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4PuVsx8HPOHN9j1LElx/HzBMF52oDifsO9zk9U9uLH3</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTHd+MZkeC19dkcaNF4tTM4nXRWuwMcDaPA3b+e6TjgvNyjX95HzD/vyazICMUSuOJQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTHd+MZkeC19dkcaNF4tTM4nXRWuwMcDaPA3b+e6TjgvNyjX95HzD/vyazICMUSuOJQ==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NWgzCc7+/3lgNH8KZtdEsHBSlxRCcmI+tHCJcDSni4l</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTJ+uUK1sBeRzo8CoGp3NpkYLs97RMZcLL08NBLOXwxdzstBUJcFuywe6O+xoOYyQ1EMet1UU2Z4u58SmqQBSbCE=</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WF8NgysVmttq94vz2xZ5nDXWh1eD/uHtUpK1nm5vve6ZX7AYw+CA7WISqf/ruZbnctOxPqb1Rg+Jvzd9MweIc1M5GM9Pb1w17TFM6KLhsAFpdPHDvsPdHELH2yexOJrF4nB3cloq76elyvN15entGXwSddStkbdt7aMn9tW5xvHl</encrypted>]]>&Controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/ApXCP7TrMBx0+f1eZbm59aWeeqGA8OQCLls5ucFc9mFa+5j0f/F5wHpKl3IHpoxINA==</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh30D2YjtAe7qAZ6wDUEPIadwHvozG8DsQw0IUxmVOtyEgzYAOBYh8NWVDHPCAVntNnQ==</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTPBVAzswyeIRcoeSNrsdf5VUnGtl5vL7DNaRuESltNy/mH1NQlMFamuW2MisDcCiD9N/no85enl3Z1g6PUM/zlZms6GkkwsAaNFakcn/4oN4</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WAxMoePBY8KOQHaSPlFv9uRUDJIUG0D+pKuicCK22ctnUsmA6+RJFRcRewtt19z1NU2gfnbe2HncBEAfuYGRzho=</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WPCz5Vth5jqqWqjJHiip1QRw5XhFgEBebBMbsHRzCaQlGWAOddU0wj1N0e98UdCXvAmcLnzuF1Jy7yfBIxhjSmxv0g/6vI7ovZVzqNsk0GohYffWNm+9i0GqT0WBR7VYL0rQAUHLDl3fLLAHmcysVtw=</encrypted>]]>&Controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63v1+3HOHiW6uQvLr3BQBhruOT6QVKZVU+edLdM3KVucDHu1Q1dKKnPMeMahjCdFbVgEe9cqVJgVhON8gNwgD5j1xV6fM8CObFnC2RJo0mzOo8GM2pSj34DfIO//+9+jKGref2rjxdwselIxfgwPSCgqM=</encrypted>]]>&Controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AriQYBo0fJrq9RBHcImo4VTXCw9R1938KijMeRB/f0wSL4H1lbSnsB2BsPnmpa98fcpwPqzmmqMR5VfmUJo+h1Y=</encrypted>]]>&Controller;<![CDATA[<encrypted>%rgVQH+4YPnyF7fZH0JOp0Zqjbzq55/AHLdPH/T010Mvv+1SCvFlBHxN3NSBHrKO7acOBLZ5gVxnngX28JDTtqqsQB7z7xdsm1IoWlZHjhNI=</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh32IOv8e1Abq0TW6q2M/6qMtBZx+q7oPUd0+qGgWaNS1rUcydzmVqG5GPb0p7AKHIG9ob/bu3JwuD+AtwZNiFFaEP1AUdz0wn80BpEhBapMcS</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3+8TnStLhIw8xM+AA7m75JBb4neXayILE3SIKKti4nu6l88YfHQtZsudCo1zZ9HvyRZ8xC5jJL1ru7xMN/VriMs=</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3+8TnStLhIw8xM+AA7m75JBb4neXayILE3SIKKti4nu6eK3/E9Gm3MPZYEDa17B0i6+72aWpYgafIET5azlVvwY=</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3+8TnStLhIw8xM+AA7m75JDybXxOR7g2nzhasVLZmrTnTDNRpCmaxUPZhqB29JEakSNwhI+WYMc2gjUXaKdnz+jBp3a/ZEKoaHtIxLv++S8I</encrypted>]]>&Controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/ApJHGr73SgIPqNAj7IPIkURP06TR0sz2ON+IvK5CGLM1AofPo68icTcAqJU0n//a3LIchX8Q7jFsHY3lkx0DG+U=</encrypted>]]>&Controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AlRa9N8NbKDmdpRKzd0wibh+u0+6koFiMRIoiTkRG4wFkLRvi81pgqVLgQfVU1e2ZdLr/YDHaNuJ5wKZrfU+pvAjh58AeZwbABa6CMLuhiwH9Ml67LJoSlXHBQggqPUhXA==</encrypted>]]>&Controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AqqJ4bWleLkMUY5uvE0pqo3oh3nF/Teedyzt45ewwCtfaWZ7N+cTBHu6mQhMziQVG7/102KH4xZJWKgXa7hY77EcDO+aR8L42ToIlva2dQC28Mw5jekKyJTFOaQkx8wCQJ2q7iYbTwap7Yp5VMRFAcCOCViBYki6XRB8gPEBkuBghs+g7/ZyESb9Ve2efaJhsLaz8DtsYENnghrHP8LNx9L6o6GecG4ia0hMncu12HThlODmZCt8rz8VccYNWeYBJGJNw/DDBZyaniy6cE3SKW/RL6lphyrUQjjyzXNM4UhGxywYa86OgaFG7W6VQbUUMSiSQCbwpv/BhP2E3rQ6EZLucCSweWUbbLCpjLp5F79EGR4kI9eXkuubdh0s682wPjowfZx9MhSkOMRKoRYwQK4stEjFRxH90yCcvAiKI0uH</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WO1fqm++sV+Pqhhig18+UtyLS9SrcjAumYeq5pz/fmUEVqVRqUCfad8UGTYTJLqOBg==</encrypted>]]>&Controller;<![CDATA[<encrypted>%rgVQH+4YPnyF7fZH0JOp0YsAfVfXFQ4J36lIDWJBXTWzXrt169h4wb4aKUgyeM/l84mXzSRMPKJyXkQqdEmtvF3fkj7RGObGXV1YsOt8dn/9MSxoTzJO9D1P9y93oMCQ</encrypted>]]>&Controller;<![CDATA[<encrypted>%rgVQH+4YPnyF7fZH0JOp0RDvPRk31lpBR4xL5sivqI9si5SnEC6FLNg0BlXD9ypgLVZJsGk3ZbihTJIlv9JX7+NSgklaagJtUHvq8/FmI2k=</encrypted>]]>&Controller;<![CDATA[<encrypted>%rgVQH+4YPnyF7fZH0JOp0XxzvuIdOi1nu+3sg5dh/heOtNcJMabIfwifq3rIxROn8A+qmqTNSL9c7NA2iBpOyfGU9sxlaVoNSoFlNveDW1gJZTXejyuv8dat48vLooA0</encrypted>]]>&Controller;<![CDATA[<encrypted>%rgVQH+4YPnyF7fZH0JOp0QEIpuEqlFBcZ5kRl/JoNeKJAFpI3ImYO8LZrxr6TVKnZyMzbcg5x/yf+kRyHIQ9ToZO40kqEgUm2GP2+M+VBuaGaSFKaoWDpJ5mvxdcrxibMr02aHo+A+BU8oLy5yadEjkv/b/KCgjqGXo+/YdSSL75ht2X0QWlXztHALXUkx7E/SMPQjHDrzMrqAC6iSKT9Hoe6IpZezW3j6NusUFnWejoT9mwRd02PHylwb8pzJJ3QDuuhBynifwR/hOoDvQcYKP1Mh41EVcOzjfhRG+cy25muqcQVMdlLgbvjuynY65vBpg+NeqN1WbaFcpWeVpVOOlRpuK/Bd6/q2fbVub//QFSM4m2WHOnjB+hEx1nEeQQjQmOpl4Tb1NXU42En0ToPN5ZVtK2pBlECOvR+/crDeUYYBTBOgD6YU+JK2WMbZ0CAOLfBYhlHsdDt4oZGpxxCtBK+eqIlJQEDdf3sPWENgCThstVtI12RjY2643o3XFA6dXzJCQHoqJbcF2eFqtIi55XsnjKZMuCVzMh9b+WirW3UAEtJlE6uNKMQjgGQVCbuTpqiUUAAQbwSKzS63TOyDRKN5QLvBMdxzEqLBGcCALgdHg+7JBTalMIQtq9RY9bx0MsP/s31enQ4w4KmYV0Q4j0ui6s//my/5zZawTTOlkPvmTpZCJg1oF/gWYW/8gfiTI2vi5S9CgysC2vHWbuk11s/UjKz3GUEcisI0t6rKyZmkRSQuw9jb1K6Dbi+vs2</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WO1fqm++sV+Pqhhig18+UtyLS9SrcjAumYeq5pz/fmUEVqVRqUCfad8UGTYTJLqOBg==</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh32IOv8e1Abq0TW6q2M/6qMts+YEdm5WDGd1Ts/p3NX7lojctWho+mprMJoDs2i7OpPPm2Wos84IoXD3Jr9tDQ4U=</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh352n+jCWLr0oVhbxB39eZqH3EbqVddsrZ0YJBrWNS+2CTVx70cIfENDCMkBTFKb4AVIj+8tuTYCLiyY43dRv+5bEK9X3nzkMBek0CSk9N11H</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3waYhumbFXodvJltyMpLH8vC9TVNlvS0+UvlHgsESwnQvjEACs881ritUdTdiZUmRxH1ZiYtEJ8VO0ZTXZ5kDhxDuEHt9IUqxYpST9JgxBJKBJXfOb1hPGcDye3Rwz1xig==</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh34TYmB23iX8YGJhSsnKAHThvGe6BFYN+/HMHvPuAjcTEBgl1AQhdwUk3QQLhL6esas8jWCdizGel9OoFqVWLytgnXsR+O9vqFkRyugeMLlAeMgD7kupuNGERvX7RQk+2iiIiNM3BmfBJVjXUhQtsgOZugS+5PI1WBQD3VE72vnonDamVTLwPKxXYgB8yIVl/+3c0u+6aFLjaDjp9GO0dMP/r2ds4NI7o4xOzU1gmjYTOEoH4AfQMKgAH7ysYHeuAyw==</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh375VKNb3+Z5NI1KQVYGYAz1OSrByIdHsEcintP5FMn0TgBmP/+YOxBZiw94l0tz2ZFUoc+UouGA7bTnm3cgoCpR0aQ3oFKmCJ5cqsoac9Efi</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh33oTWbks27VXnZO2F4g7fnDxJ1dY3Md41f59UIVICHC5oVnDvOy8s2J4lPsq4GaB4nAAwOIq73pnacH1ILJkdEG/osW4qpGAsNxcaC06GmLIauucuVqIJUB90YbPYHqmCA==</encrypted>]]>&Controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh30Qh8atodw/ywbX2Iymodrp6ouJyYIM0UFyN+T/ZpekCkY8yoUT/8OOtloqM8Cee7l94liNzT7ArQbbpCygJfkKaTdossthfObZKmdB6kZ1grOcfZqtXP+y201WsY9bwdALh6yWozZGK4SswDcWYEvEZQM4Plg7GK4UnAeVtZZ2aNe+/aZqnbyuHUswnqAgJjI7V3m2+2w3w4yS8ycMekKt9BpoDas/2KJoNhA1tl1Ij</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WNnW6DEgUpNGKeIFtLb7Q6/78AyZJ847G27fUrKRHrqJ6YfCkVDi8EeP3nxxzNvA3Wd1bcPv7z03QC9k17Z8mY5KpK1cBwfq63D+YCRI2kImtgZ7UlyaNKZCdAfPTsUutxPHaE8D4tkeKC5awxOTELQH386f+iShDrFgzOCY4hRb6fjYPZP3xL0aUL1cjAz5lw20W8Ekqq5+6ZZJ8hNa6mSXl+yhyumRfVytWdR+gAX+Im38SBWO76ciSDcSBdRKe5DkrbM78FAJpI3HC+CQuEi2w+4KzCGnZGkXwUZV8R4TqjQIJUJxOO0+vpF1KulgvaXw4+vq/QSqQDht4qgJXUm58WiksEbx01tZMTGvD+Ze5i/HRCCp56ZvqUkY1zs2ibj03/g+NOigAbbitL2xdTxPtvfclwqHi13GZrXTCvRa</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>
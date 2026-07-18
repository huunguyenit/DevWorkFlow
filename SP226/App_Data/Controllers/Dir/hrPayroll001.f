<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY defaultForm "HRL001">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c, @cach_tinh = case when @kind &lt;&gt; '1' then @cach_tinh else '' end">
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

<dir table="hrPayroll001" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu bảng chi tiết thanh toán lương cho nhân viên" e="Payslip"></title>
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
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Description"></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default" categoryIndex="9">
      <header v="Chỉ tiêu khác" e="Other Name"></header>
    </field>

    <field name="bold" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right" categoryIndex="9">
      <header v="Kiểu chữ" e="Font Bold"></header>
      <footer v="1 - Đậm, 0 - Không đậm" e="1 - Bold, 0 - Regular"></footer>
      <items style="Mask"/>
    </field>
    <field name="in_ck" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right" categoryIndex="9">
      <header v="In" e="Print"></header>
      <footer v="1 - Có in, 0 - Không in" e="1 - Print, 0 - No Print"></footer>
      <items style="Mask"/>
    </field>

    <field name="kind" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right" categoryIndex="1">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Tính theo phát sinh, 2 - Tính theo mã số" e="1 - By Generated Data, 2 - By Formula"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>

    <field name="nguon" clientDefault="Default" categoryIndex="1">
      <header v="Nguồn" e="Source"></header>
      <items style="DropDownList" >
        <item value="1">
          <text v="Bảng tổng hợp lương" e="Salary Summary Sheet"/>
        </item>
        <item value="2">
          <text v="Bảng chi tiết lương theo sản phẩm" e="Salary Sheet Detailed by Product"/>
        </item>
        <item value="3">
          <text v="Bảng chi tiết phụ cấp" e="Allowance Detailed Sheet"/>
        </item>
        <item value="4">
          <text v="Bảng chi tiết lương theo công" e="Salary Sheet Detailed by Workday"/>
        </item>
        <item value="5">
          <text v="Bảng chi tiết thưởng, phạt" e="Award, Penalty Detailed Sheet"/>
        </item>
        <item value="6">
          <text v="Bảng chi tiết thu nhập, giảm trừ khác" e="Incomes, Deductions Detailed Sheet"/>
        </item>
        <item value="7">
          <text v="Bảng chi tiết giờ công" e="Working Hour Detailed Sheet"/>
        </item>
      </items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZf5gVWcuSQxUdnn35BZAIPcWJxeTBHcPq8hL9GrlsBcj80qeuZXxbWZWv1QIcS8ktJ/j6PjpTqUlcfr5SdEL59sKznxyhhagizEs7fu7vckm</encrypted>]]></clientScript>
      <handle key="[kind] == 1" field ="kind"/>
    </field>

    <field name="type" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right" categoryIndex="1">
      <header v="Loại dữ liệu" e="Data Type"></header>
      <footer v="1 - Tiền, 2 - Số lượng sản phẩm/ngày công, 3 - Giờ công" e="1 - Amount, 2 - Product Quantity/Workday Date, 3 - Workday Hour"></footer>
      <items style="Mask"/>
      <handle key="(([nguon] == 2)||([nguon] == 3))" field ="nguon"/>
    </field>


    <field name="ds_bp" clientDefault="Default" categoryIndex="1">
      <header v="Danh sách bộ phận" e="Departments"></header>
      <items style="Lookup" controller="hrDepartment" key="status = '1'" check="1=1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ds_loai_lg" clientDefault="Default" filterSource="Optional" categoryIndex="1">
      <header v="Danh sách loại lương" e="Pay Types"></header>
      <items style="Lookup" controller="hrPayType" key="status = '1'" check="1=1" information="ma_loai_lg$hrloailuong.ten_loai_lg%l"/>
    </field>
    <field name="ds_sp" clientDefault="Default" categoryIndex="1">
      <header v="Danh sách sản phẩm" e="Products"></header>
      <items style="Lookup" controller="hrProduct" key="status = '1'" check="1=1" information="ma_sp$hrdmsp.ten_sp%l"/>
      <handle key="[nguon] == 4" field ="nguon"/>
    </field>
    <field name="ds_pc" clientDefault="Default" categoryIndex="1">
      <header v="Danh sách phụ cấp" e="Allowances"></header>
      <items style="Lookup" controller="hrAllowance" key="status = '1'" check="1=1" information="ma_pc$hrdmpc.ten_pc%l"/>
      <handle key="[nguon] == 3" field ="nguon"/>
    </field>

    <field name="ds_cong" clientDefault="Default" categoryIndex="1">
      <header v="Danh sách mã công" e="Workdays"></header>
      <items style="Lookup" controller="hrWorkday" key="status = '1'" check="1=1" information="ma_cong$hrdmcong.ten_cong%l"/>
    </field>
    <field name="ds_tp" clientDefault="Default" categoryIndex="1">
      <header v="Ds thưởng, phạt" e="Awards, Penalties"></header>
      <items style="Lookup" controller="hrAwardPenaltyReasonList" key="status = '1'" check="1=1" information="ma_loai$hrdmloaitp.ten_loai%l"/>
    </field>
    <field name="ds_tn_gt" clientDefault="Default" categoryIndex="1">
      <header v="Ds TN, GT khác" e="Incomes, Deductions"></header>
      <items style="Lookup" controller="hrIncomeDeductionList" key="status = '1'" check="1=1" information="ma_loai$hrdmtngt.ten_loai%l"/>
    </field>

    <field name="cach_tinh" clientDefault="Default" dataFormatString="X" categoryIndex="1">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
      <handle key="[kind] == 2" field ="kind"/>
    </field>

    <field name="ghi_chu" clientDefault="Default" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="281">
      <item value="5, 5, 110, 40, 40, 20, 60, 30, 30, 100, 110"/>
      <item value="1001-----1: [stt].Label, [stt], [form]"/>
      <item value="100100: [ma_so].Label, [ma_so]"/>
      <item value="10010000000: [chi_tieu].Label, [chi_tieu]"/>

      <item value="10011000000: [kind].Label, [kind], [kind].Description"/>
      <item value="-10100000: [nguon].Label, [nguon]"/>
      <item value="--111000000: [type].Label, [type], [type].Description"/>
      <item value="--110000000: [ds_bp].Label, [ds_bp]"/>
      <item value="--110000000: [ds_loai_lg].Label, [ds_loai_lg]"/>
      <item value="--110000000: [ds_sp].Label, [ds_sp]"/>
      <item value="--110000000: [ds_pc].Label, [ds_pc]"/>
      <item value="--110000000: [ds_cong].Label, [ds_cong]"/>
      <item value="--110000000: [ds_tp].Label, [ds_tp]"/>
      <item value="--110000000: [ds_tn_gt].Label, [ds_tn_gt]"/>
      <item value="-1010000000: [cach_tinh].Label, [cach_tinh]"/>

      <item value="10010000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="10011000000: [bold].Label, [bold], [bold].Description"/>
      <item value="10011000000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="10010000000: [ghi_chu].Label, [ghi_chu]"/>

      <categories>
        <category index="1" columns="5, 5, 110, 40, 40, 20, 60, 30, 30, 100, 110">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="9" columns="5, 5, 110, 40, 40, 20, 60, 30, 30, 100, 110">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2+j97jlg+7FdtYzEuVP0WZTIHaGILeeju/2xMo9QgLt3jdNnFccosMebh5UJ/aS8yQCsUwdzqQb1HYFBunjJk4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYYSI1CIqixZLX9YweM/zIWb4c01q6tfZ7w/nK2jckwrqvEejsEVLlBYdvX6XeOH3A8=</encrypted>]]>
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
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7tOaQVrB/a5rjrOEqTp51912AQ0m+CizCI3dmYlNcTklvcX94HfeiCfxvnL3z1GjUkjvgS4+eNHHvhwtL3FW+paC+AvCDIPAVgWs6oPnyiZpBM9XJrUoEDlKUjbh7RObUdmVJ+lqyGhLSMkzl45XaEYR7pMrleAp/pE2ADUosbtXOcPi8t4PwFdzbngJ6ffujC04LC3+9U5IHzCOifQnH/HRP6OvMxH3YXI9SPEIqAHCHTUgPFtptdlciGyemqJAVOQzOwSh184mBykazV4njGE5NtJB5Eq5F/c40y/6bO7tTbaJZ1xBSTvt5X5OGEvoxgvrnW6Jzgs9t4HD/wolcM/G2YwPGL7yk68dCJC9102m4tjHNla5OgEOCWBeF9H0hUCTqDWSTsCDIueslgHqdJAfd1nI5YowwbmkgcKop9p3ijQAgAKz7pKNoconjZj/84azC68g4vVVtMbMoLjcneXBNYfkqPLZqIE7SSrBa0qTb6mPUvUGG5Oxwzj+SLCdBv1Iz17F67+bdG4temUQM8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmR9QHmjDjgGfOupwQvXIB59cK3l7FdJ2h/Z2E38zu/FD4FRV/h5q3BAdiZx8YX3uZQq9YG+FIhG4xNT9t/RTOJU4leHbLPimhMDWcl0vxeKvd/MVb6IXXG+wdGd5YX3YlDTTs689K5c/2d/yFSim4uUjJHrde1p5Xs+/TaAmmtuUymF/KYbBqllJv5Gez6KRvkDGy6BMZ9Q0Tgw6A2DBlQuEBm9y2CxC55HvuxKnqNrCVuhhgoKXvXTpWlrejx7Z+Bes29trhcJnb4qBxBdYnZ7Wddx4dLaRFo0wJJnlaATWutRc/Mm1J2VqRYLUO0JntRhvfJ8FmWKcB1HXdPIjV2mEMbJp8PehymZM9UAkHOKKkTr3Armw2E//Sf549bFdp1IDEymfnQprKSXA3YPQ07iaXFTm8jkQFlKei1qdL3a+xEa5m4EH9+g3j4iSv5g1/M6OV3hRuFVNvzoxgr6jyS+mRogS9vAF++UgUChz+alHD4HV27ZGLnpvK130Be1BiQvkf69IjewHfmU/XtpVr7jSpFYYVIDPbmTmkEIG9Hj1I+lF+4aFnxX8czxRssL/zunJGUPH3V62qN+tYkbke3gjVvAEHneX8LDByyNKRaHWPBpaXSQqV8H/8oUXkfIsX9ujFcb69szhM1uK1WHfWemLbqsMFtSXMiP4MxZbiemZm+jvccm2qNvHSA2igIqh6/rP50k18x7xX/xz99aIB5Btb+yxORtZnLfEZ2UQapP9VdxW70Sq9elmKABWONzjz/TjpYA+9nfUl8o+Svr46TuOJNlAnfZkp7A227bFPV6DcVdlgINw3GFmeF8mzHhNUZI5SiRiybem52CNX4EzXn9Xswf9CycBZM87WffkPlPNmY/ac1gvX87mnGKh9uDtjbARxQP1qZ+6x5Z9quvDyA06vSTHXVTxe3SefB8z3C2noJpf0uqNILwrwwcsqFVagJlX/5sAqBDFDU7lWSSljfO3tKcglQaXXggYzBv/IrhT3SIJDaSpFJ5hp8DR5HHQoQTKEF6O+z7iyOR6yVFmSG9VdK149sqBox+uy1g4c0o3hTcz0V19lWFO+ufwZJjUFzN/1BGwSv8O5ifthb+KX3i1g0xmQ7j/Ew9WUWMdYRe1+zgHjOhVZA7jQJ6JzwkwGCr7cuxLwdCLfqd1UG6FtjnKb3mzJNf5SwayyBmxhrGLc5r3TnBwKB2+Snp7L0HROqpmiIacEnFo653s2SL7MZSAor1jZO+vTJOaz10HvzWGHW6svJVHkdlgDopp+UxjpPOsKa/n1WUE+ZXUEU2BqqGZiniqXM+NIwjBKPY5+AelcX68/vBnyDsdENQCfJRSt4xoX6EUBRfL4Z7swBgI3guuM5urGCVUsezmAka369PvYNYmedB3ogUAmpxklThQ15sCxK1rwYWLTS/OtdU6hc6EBphwsMGaSgXOgSuFQ4JKINvruO/HquYY4fpO4q6F/gW0z+kmOTmMa2mEhXYUQbtNjSfaNRWkvo+mY0ED4XdnVGIFqiMsepu89tQLpAnnjsAT/hZhnNori4x1DuEGuG/</encrypted>]]>
      &ScriptIrregular;
      &OutlineEntry;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5TX8TpvzODyEuhNpzVN6x99JCg4yxbDYTxmnA6HpBeECXV9z9A3LHLUm5b8CgVXHYylAz60DR7gn6n3nc3dqDtQ==</encrypted>]]>
    </text>
  </css>
</dir>
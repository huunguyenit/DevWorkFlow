<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY Check "
if (@cach_tinh &lt;&gt; '') begin
  create table #t(b bit)
  select cast('' as varchar(1)) as form, ma_ct as ma_so into #hrdmctluong from @@table with(nolock)
  insert into #t(b) exec FastBusiness$Report$CheckReportForm @@action, '#hrdmctluong', '', @ma_ct, @cach_tinh
  if exists(select 1 from #t where b = 0) begin
    select 'cach_tinh' as field, replace(@$updateConflict, char(37) + 's', rtrim(@cach_tinh)) as message
    drop table #t, #hrdmctluong
	  return
  end
  drop table #t, #hrdmctluong
end    
">
]>

<dir table="hrdmctluong" code="ma_ct" order="stt, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo chỉ tiêu lương" e="Salary Article"></title>
  <fields>
    <field name="stt" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt sắp xếp" e="Order Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã chỉ tiêu" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_ct" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Description"></header>
    </field>
    <field name="ten_ct2" clientDefault="Default" categoryIndex="9">
      <header v="Chỉ tiêu khác" e="Other Description"></header>
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
          <text v="Bảng chi tiết thưởng, phạt" e="Award Detailed Sheet"/>
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

    <field name="type" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right" categoryIndex="1">
      <header v="Loại dữ liệu" e="Data Type"></header>
      <footer v="1 - Tiền, 2 - Số lượng sản phẩm/ngày công" e="1 - Amount, 2 - Product Quantity/Workday Date"></footer>
      <items style="Mask"/>
      <handle key="(([nguon] == 2)||([nguon] == 3))" field ="nguon"/>
    </field>

    <field name="ds_bp" clientDefault="Default" categoryIndex="1">
      <header v="Danh sách bộ phận" e="Departments"></header>
      <items style="Lookup" controller="hrDepartment" key="status = '1'" check="1=1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ds_loai_luong" clientDefault="Default" filterSource="Optional" categoryIndex="1">
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
    <field name="ghi_chu" clientDefault="Default" rows="2" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir" height="281">
      <item value="5, 5, 110, 40, 40, 20, 60, 30, 30, 100, 110"/>

      <item value="1001: [stt].Label, [stt]"/>
      <item value="100100: [ma_ct].Label, [ma_ct]"/>
      <item value="10010000000: [ten_ct].Label, [ten_ct]"/>

      <item value="10011000000: [kind].Label, [kind], [kind].Description"/>
      <item value="-10100000: [nguon].Label, [nguon]"/>
      <item value="--11100000: [type].Label, [type], [type].Description"/>
      <item value="--11000000: [ds_bp].Label, [ds_bp]"/>
      <item value="--11000000: [ds_loai_luong].Label, [ds_loai_luong]"/>
      <item value="--11000000: [ds_sp].Label, [ds_sp]"/>
      <item value="--11000000: [ds_pc].Label, [ds_pc]"/>
      <item value="--11000000: [ds_cong].Label, [ds_cong]"/>
      <item value="--11000000: [ds_tp].Label, [ds_tp]"/>
      <item value="--11000000: [ds_tn_gt].Label, [ds_tn_gt]"/>
      <item value="-1010000000: [cach_tinh].Label, [cach_tinh]"/>

      <item value="100100000000: [ten_ct2].Label, [ten_ct2]"/>
      <item value="100100000000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="100110000000: [status].Label, [status], [status].Description"/>


      <categories>
        <category index="1" columns="5, 5, 110, 40, 40, 20, 60, 30, 30, 100, 110">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="9" columns="5, 5, 110, 30, 10, 40, 20, 60, 30, 30, 100, 110">
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8Dv35fRfFMZK4yvVTnNoFkHNCbgHKK5UcQwCkshzlajZjJrRotQiAis9fVsdhORIZUNRB4Itq80MqiFb95XDlNbjHI0G2sDwRmnGkwlnO+mAa5/2map4IdvB3KeNFBFV8pzRKr2/eXWLI19Tz144p2zqjdT6l1RvmtifZjxxGC518TEtW3nMBZTAB8dw4kKt+kOd/sp6Ec3ebxYq4781sjokXMPsowwOIX3Own/XTbmXPvzB/0g1PPokIzva4MYO8j5lNwKV7qVP+PsMJESlowqV7ILz6k0eGwf8RhUs4Nx+bm0QJzQ3CYev5fhylJrgY1CPcNnUvTuD7Ff6fGeiaxeKLmOoQhX3G/XoMV0v5ZYjwh537gMP0SQOSNZyLHXT5NTKTmXyVNoL7xArDwvPtrer/uBQUtyFqtALcpaduJoap9GK5b8rNxXZkeNx2Ghwea</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nXC+RpnYBzEExn9bx8V76Dlyd5FMGiTljx/n0EiCpoqBd64VdOeqg7LPXNFms2aMXfE6Fzkg8BZ7ROsCUcIzjEmWfe6XYwIPSa3Z2tkvk7CUrcLcSfOw5GmjUD+feiKFvfhlt0VIf4opXq4nSkfvg2rbIGumIVDknNZjEk0aR74dwqDUhDmtnHO981/8FLm3M/ybzDHdciUBk4nr8TOblgA==</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxtxepSSNU62CyaL+GWc4xutd1ZFFR2RfX1eDHiAuvmfP+wilk+rAtSyCr3YLUrfEgXZzCORJn37qNtXRsZWBjoUUxQeW6oLKB+pvTyqnWG7VIG0QMd5e8ZmVECbI4J8NCk5IfUnMLCto5KqbkOxC0s0QZIIcLh/Bmu5Gr4KV245iStcysChafRzRXo//+CLOTrX6wjgq74fbPBaL/F9PfeqObR3SqGMxOl4VMc9nmXp</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeiikR0KH1iTsKcqzpelumIspiZjVGjZEjNopiM3ayMbk</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cD5bBAJPoljwGk5C9G+UAKJVM8pQh3452JgpVZ6CnhoGmwhQhe1SxNOunGQEIdX9h6+8qQvK8W2td4HTCiN55KnPbh/mp6jPdt0sikvlLVEk91IsSdFy89Dkuz3T31eIagEQw5IRw8aPV0zNnuToyN2t5PlWl4yzMp2ID9nBlg36sVRvPH8UG4NrLWGGDYVwUDyszrmD3Zod7ZY2n04c8Uw==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmTEIaXE1zTHw8ONyzwRuZzil1SI9Z89unUcUQhJYzLf6ylfDkQINMJwrXWNTCQuIeiCFMGz2IZ/xpPlds5G5CsyXNNcIpS3C2wy756t3emT2rjNwvEoBg5apslfySUkUyrlUAKZRrv/ghBLHshX/qvCId1nOOjAbtQpgDqGonQHQIp0k35pYSbkzxxlBmPtYix8bVaSwvQV2HZyIo9R98wRlXVK+x4bwcPabgjnQfh64o/rI6YCg2pqiDy9EPtCQ6zOnju8Kl9h1woKBE9F9LySvLC6c18LiWKuRh7mlGleuXNaT3ksfka7gr/OSv7/6Nx6KYoq755zCNVFiH6t1AarV2Dsrc27J88NfztZXgrO783+7Tr57tqE7555+ctBfIYcPWM+M5LKS9vNlxYNLIT123oDDdUFGGns5ajsfE8rEJvOCH0HVvWmNEq1lffiCdiepRzUZ57UKcQpiIbkudGOdBuuoJh22ZQqtNFEr2ZqFW4IZ6RnMraX6LF/iL8YTYcJICSiA4sqE81oLIxdprU8zcx1NHbrBpumA3lamrtxokGhXdYX+kmBsPdSIeLCNQFi/2kI0B/KS1IrVqasmsxtvVPu0M3RtoaSoBd4/KXPrKRJpbj3m3YZ95gZ8h58PIkFN2iIJyEAhJx8rDNrLRXvACuuyctqeawcK0M8nZV8BttblDuEE5NPs5Vmbq4AbEiacvRmSzQdJR2mmqH3HG6bt7X27JT8JQbfW5nbTU4hjCCeiVZky+UTLn7gKqLVEKBOIYdWTxO6MPA5Q9nnMSXdN6pOfOH6MeZky2prXhO/PG7QUGoXWqlJl2lZaaaOGzkxgJUzAaPBopDn6xt7H8A1iGRkTo0ZaYS/w9kuu/TOhAh4MbZszbyNUSo9XunvInd1vG26NXkBgwaHvGcCKhEI+3cK2QLahG09xUZlZhNv0ZXi3lGaoUUtVmGN2am2hnJpNQc41I+wmyNMOc1jaIXfR8FZt0rCU062EN6VIImv+8bSfObAxyqne/5mom9UyaJ/3P5xXoFZxn8gWJcGDkqqqpXSiHCcwlZrWEJmYmWkAIGTSR5udz0kj3EqJxHbU4UcH7NCZOUW8fVTTKHIEZLIOeD4qjNRUkM1J4R/TINE8kJ1LzGV3kTEceE9aV97Gdk6+3yO/LgM83ub47IMi87M2cyJ6X4I/2sIkISFvVE2vhy8e5FAFB16P9RbL8k/xURwVa4XSZlpMB49sAE0ZLM1ZbG1JiHlkvxKBDWmjHM6m2hdPffaUwpcGjAt0HnSge/Wu3QuPF+r7oaq2MgideSMW92siBn6pobK4YTEgUDg/KUrviu6Mf47SgOJxfLkaPhslh9ngW1JD5CbJYgLykEOBkfUVio2A1bvuiohuteVj/klLEIFOSyETMjjZ743GCKqLcGhyLIxf7+vYrydVMmHG7hrODIGOagfpKCwJyO9/nPI8//5H9pzluw05NtO4vrMwtwi4emJeuJbodsQ5B0RmR6TvwDX4Z8v+cVz2ZmKQzaOuDnOnVqGU+hp9mnAy2mHyP7v9xvJN0gFyTWOnksZaDdRyOnTEdItCZHehDyNpVGT06NLk8tJZmaqT158T4X06R3iLJThP1U876RUuFxBT8wYfDfQ7bt+QcpZbCD0aQ+6H1X7yUWmqqyyltw6CMX8KbNObrUxwi91a4JB5eIDgbks9R4ZFwj8v8A6E1hDn76EU6I0rmMldYoGd4Azolw=</encrypted>]]>
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
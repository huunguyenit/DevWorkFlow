<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY defaultForm "HRL002">
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

<dir table="hrpayroll002" code="ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bảng chi tiết thanh toán lương theo bộ phận" e="Salary Sheet Detailed by Department"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt sắp xếp" e="Order Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã chỉ tiêu" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Description"></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default" categoryIndex="9">
      <header v="Chỉ tiêu khác" e="Other Description"></header>
    </field>
    <field name="ten_ngan" categoryIndex="9">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2" categoryIndex="9">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
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

    <field name="in_ck" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right" categoryIndex="9">
      <header v="In" e="Print"></header>
      <footer v="1 - Có in, 0 - Không in" e="1 - Print, 0 - No Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="ghi_chu" clientDefault="Default" rows="2" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="281">
      <item value="5, 5, 110, 40, 40, 20, 60, 30, 30, 100, 110"/>

      <item value="10011: [stt].Label, [stt], [form]"/>
      <item value="100100: [ma_so].Label, [ma_so]"/>
      <item value="10010000000: [chi_tieu].Label, [chi_tieu]"/>

      <item value="10011000000: [kind].Label, [kind], [kind].Description"/>
      <item value="-10100000: [nguon].Label, [nguon]"/>
      <item value="--111000000: [type].Label, [type], [type].Description"/>
      <item value="--110000000: [ds_bp].Label, [ds_bp]"/>
      <item value="--110000000: [ds_loai_luong].Label, [ds_loai_luong]"/>
      <item value="--110000000: [ds_sp].Label, [ds_sp]"/>
      <item value="--110000000: [ds_pc].Label, [ds_pc]"/>
      <item value="--110000000: [ds_cong].Label, [ds_cong]"/>
      <item value="--110000000: [ds_tp].Label, [ds_tp]"/>
      <item value="--110000000: [ds_tn_gt].Label, [ds_tn_gt]"/>
      <item value="-1010000000: [cach_tinh].Label, [cach_tinh]"/>

      <item value="10010000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="100100: [ten_ngan].Label, [ten_ngan]"/>
      <item value="100100: [ten_ngan2].Label, [ten_ngan2]"/>
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
    &CheckIrregular;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmR9QHmjDjgGfOupwQvXIB59cK3l7FdJ2h/Z2E38zu/FD7sACVNBi0/kxakFQX6X4v+J1n4cIPhiMGaADqXAXbYe/Px8hVripR9liyWFEBsWD2ybK56oqIuvq5a+j4hCd6IjI9CTguGT4+W+IAxHd88igaHieKAUk85Rnc+W/WosnDuN728cpZbXnobbfrxb4MBK13HDBBGhRWNqpMxvGOwOmLYED1fazdKIL9ihFByjHE1dyudwrsrhns0JFdDJj+wRdCSpK6KFWWkdV/qAp3sDpBrWK7zHgKrx3pN/ndBqalPSa+Ki5UxP8PjB3ZhFw7KTMZQm0qwuyb2DGFV31sB9XcO1KL+X2e8cJI0FE6JeTbeDlVmsXiH0OC8o7wecUosnIiBZHvTCVAsQNMENf8tLW9c+E83LeM9CChiMycA/WmlNPf2LBIZj/8MHFa9VuH/eYIYFxdl803Z4NR9lE/M2964DVjN02T0nRaGRtMaev0YS2j8L3gOW+mEKf45pc6SnXzOXQ235DLX1XxvAGjCdn+4aWG/y6GfwmGCB2Cn3sC3/nxEygOLH8y4j4kfvhpCG/bJK3h6BiefWsSmwaaJ46m8aR6QEINg2TbBNHrRNiyXMbfScr+B7zk2CthkzF5/waVZBkbxJA/oEDgIbI/wi/DYtT4IcK/WjoYAMmu2illCvWrAv9/jkjb0XG4TIDL3vyH599edSQ7BIpcEjuz3xTl0MquAgRr3XP+vGtiyxyqMJFjheHIeIX13VIOzMGe4nuqodtrkpckSMS1uSfFOQYASqwzLdYiPSmGtvBLlVKlTjGtpwh7OB798wKPZs/cBVxetIPV0YyOn7iDN/bYSwVdm3WgwemgwXUJg9+EoejXei4/O7TuvqDjfpupB7H0W23iw7ctkKvzf29trs7v81JMdNGxTgsfI53C/IKbKduhK+NNH0ONIzVr2149wNzn8j7X1gCVqX+inxpKynCzTvoPtY13FgU1teN9vX4hg4fJo8GyUk6t+1Pa2OhRsSIqfebSAvmpjaya5xhdpfrN2VCE7Vh29LVcqDc58zk9CU66+4x0aeBmrwb618KdveUyycfZnBh2JoBcgn7dca+DpI3j5pqyc3BryfBExdeWId6xs5w2KyR68XHWga/PFMyTJVhltcm03Gc4Kw7We+0s3uFgWtw5OA0WfRP8E0PSFqAs5Uj4M8OGJ9+ulkYElE3yCdtSrg9CnhnnVDZdtHPysd4JOjxsARfnLvnTPX6HjvC8o/OAFeK71MM4RzU9C7huMBktBNdAyQY61uHv3yLwJ5vALZXxRHKKlHD/1lxn+/JlupFJnKBNxkq4X7fbKDxyvTHnKXsS0poQqLEs9aW5eQDJssl9eLICp3ECygaCqBAo8+V0lGMu3oFlzQBkUuGZ5n3FnXIImG6XiW5gRs/4ZKuD+MR2SzFDPdcvxaPTuTyAa3yzo65Zi+IzpBBBF/CUlmwDDh+YvwbNb6hnIDXPxosjoE3wJ+I+c+T3DYe099Y6MnC0cF9UPcMGInym0RbPjHhGDNA3UCkDmwtiEks4Dx</encrypted>]]>
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
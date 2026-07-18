<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY ControlFocus "ma_yt">

  <!ENTITY CostingUnitRightBeforeEdit SYSTEM "..\Include\Command\CostingCheckRightBeforeEdit.txt">
  <!ENTITY CostingUnitRightBeforeDelete SYSTEM "..\Include\Command\CostingCheckRightBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormShowing SYSTEM "..\Include\Command\CostingUnitFormShowing.txt">

  <!ENTITY CheckAccounts "
declare @l int
select @l = col_length('xdmytct', 'tk_no')

declare @t0 table (tk_no varchar(32), tk_co varchar(32))
declare @t1 table (i int, c varchar(4000))
declare @t2 table (i int, c varchar(4000))

insert into @t1 select * from dbo.FastBusiness$Function$System$Split(@tk_no, ',')
insert into @t2 select * from dbo.FastBusiness$Function$System$Split(@tk_co, ',')

update @t1 set c = left(rtrim(ltrim(isnull(c, ''))), @l - 1)
update @t2 set c = left(rtrim(ltrim(isnull(c, ''))), @l - 1)

insert into @t0 select a.c + '&#37;' as tk_no, b.c + '&#37;' as tk_co from @t1 a cross join @t2 b

if exists(select 1 from @t0 a join xdmytct b with(nolock) on b.ma_dvcs = @ma_dvcs and a.tk_no = b.tk_no and a.tk_co = b.tk_co where ma_yt &lt;&gt; @$factor and ((b.ma_bp &lt;&gt; '' and @ma_bp = '') or (b.ma_bp = '' and @ma_bp &lt;&gt; ''))) begin
  select 'ma_bp' as field, replace(@$sectionConflict, '&#37;s', rtrim(@ma_yt)) as message
  return
end

if exists(select 1 from @t0 a inner join xdmytct b on (a.tk_no like b.tk_no or b.tk_no like a.tk_no) and (a.tk_co like b.tk_co or b.tk_co like a.tk_co) and b.ma_dvcs = @ma_dvcs and ma_bp = @ma_bp and ma_yt &lt;&gt; @$factor) begin
  select 'ma_yt' as field, replace(@$duplicate, '&#37;s', rtrim(@ma_yt)) as message
  return
end">
]>

<dir table="xdmyt" code="ma_dvcs, ma_yt" order="ma_dvcs, ma_yt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="yếu tố" e="Factor"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã yếu tố" e="Factor"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_yt" allowNulls="false">
      <header v="Tên yếu tố" e="Description"></header>
    </field>
    <field name="ten_yt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai_yt" categoryIndex="1" allowNulls="false">
      <header v="Loại yếu tố" e="Factor Type"></header>
      <items style="AutoComplete" controller="FactorType" key="status='1'" check="1=1" reference="ten_loai_yt%l" information="ma_loai$xdmloaiyt.ten_loai%l" />
    </field>
    <field name="ten_loai_yt%l" categoryIndex="1" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="nh_yt" categoryIndex="1" allowNulls="false">
      <header v="Nhóm yếu tố" e="Factor Group"/>
      <items style="AutoComplete" controller="FactorGroup" key="status='1'" check="1=1" reference="ten_nh_yt%l" information="ma_nh$xdmnhyt.ten_nh%l"/>
    </field>
    <field name="ten_nh_yt%l" categoryIndex="1" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="kieu_yt" categoryIndex="1" allowNulls="false" dataFormatString="1, 2, 3, 4" defaultValue="1" clientDefault="Default" align="right">
      <header v="Kiểu yếu tố" e="Factor Style"></header>
      <footer v="1 - Nguyên vật liệu, 2 - Chi phí nhân công, 3 - Chi phí SX chung, 4 - Khác" e="1 - Material, 2 - Labor Cost, 3 - Overhead, 4 - Other"/>
      <items style="Mask"/>
    </field>
    <field name="cong_tru" categoryIndex="1" allowNulls="false" dataFormatString="1, 2" defaultValue="1" clientDefault="Default" align="right">
      <header v="Yt cộng thêm/giảm trừ" e="Factor +/-"/>
      <footer v="1 - Cộng thêm, 2 - Giảm trừ" e="1 - Add, 2 - Subtract"/>
      <items style="Mask"/>
    </field>
    <field name="tk_no" categoryIndex="1" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Danh sách tk nợ" e="Debit Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="tk_co" categoryIndex="1" dataFormatString="@upperCaseFormat">
      <header v="Danh sách tk có" e="Credit Accounts"/>
      <items style="Mask"/>
    </field>
    <field name="tk_dd" categoryIndex="1" allowNulls="false">
      <header v="Tài khoản dở dang" e="WIP Account"></header>
      <items style="AutoComplete" controller="Account" key="status='1'" check="1=1" reference="ten_tk_dd%l" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dd%l" categoryIndex="1" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="dd_ck" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Dở dang cuối kỳ" e="WIP Closing Balance"></header>
    </field>
    <field name="th_bp0" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp bộ phận g.tiếp" e="Gathered by Indirect Dept."></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVnG71gUwso+deWdq+IC1SB+n3ORL3/SKnYb9nffLooK80Aqfs8Hx/G3fyxf/6cUZg==</encrypted>]]></clientScript>
    </field>
    <field name="th_sp" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp sản phẩm" e="Gathered by Product"></header>
    </field>
    <field name="th_lsx" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp lệnh sản xuất" e="Gathered by MO"></header>
    </field>
    <field name="th_bp" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp công đoạn" e="Gathered by Dept."></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVnG71gUwso+deWdq+IC1SB+n3ORL3/SKnYb9nffLooK80Aqfs8Hx/G3fyxf/6cUZg==</encrypted>]]></clientScript>
    </field>
    <field name="th_nvl" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp theo n.v.liệu" e="Gathered by Material"></header>
    </field>
    <field name="ma_bp" categoryIndex="1">
      <header v="Công đoạn" e="Section"></header>
      <items style="AutoComplete" controller="Section" key="status = '1'" check="1=1" reference="ten_bp%l" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" categoryIndex="1" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="hs_yt"  categoryIndex="2">
      <header v="Ds các yếu tố tính hs" e="Factors to Define Coef."/>
      <items style="Lookup" controller="Factor" key="status='1' and (('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}'))"/>
    </field>
    <field name="gt_ps" categoryIndex="2" dataFormatString="1, 2" defaultValue="1" clientDefault="Default" align="right">
      <header v="Tính hs theo pstk/gt" e="Coefficient Defined by"></header>
      <footer v="1 - Phát sinh trong kỳ, 2 - Giá thành" e="1 - Arising, 2 - Cost"/>
      <items style="Mask"/>
    </field>
    <field name="pb_yn" categoryIndex="2" dataFormatString="0, 1" defaultValue="1" clientDefault="Default" align="right">
      <header v="Kết chuyển sang tkdd" e="Posted to WIP Account"></header>
      <footer v="0 - Không, 1 - Có" e="0 - No, 1 - Yes"/>
      <items style="Mask"/>
    </field>
    <field name="status" categoryIndex="2" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" >
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="280">
      <item value="120, 100, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11: [ma_yt].Label, [ma_yt]"/>
      <item value="110: [ten_yt].Label, [ten_yt]"/>
      <item value="110: [ten_yt2].Label, [ten_yt2]"/>

      <item value="11000100: [loai_yt].Label, [loai_yt], [ten_loai_yt%l]"/>
      <item value="11000100: [nh_yt].Label, [nh_yt], [ten_nh_yt%l]"/>
      <item value="11010000: [kieu_yt].Label, [kieu_yt], [kieu_yt].Description"/>
      <item value="11010000: [cong_tru].Label, [cong_tru], [cong_tru].Description"/>
      <item value="1100000-: [tk_no].Label, [tk_no]"/>
      <item value="1100000-: [tk_co].Label, [tk_co]"/>
      <item value="11000100: [tk_dd].Label, [tk_dd], [ten_tk_dd%l]"/>
      <item value="11--101-: [dd_ck].Label, [dd_ck], [th_bp0].Label, [th_bp0]"/>
      <item value="11--101-: [th_sp].Label, [th_sp], [th_lsx].Label, [th_lsx]"/>
      <item value="11--101-: [th_bp].Label, [th_bp], [th_nvl].Label, [th_nvl]"/>
      <item value="11000100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="110: [hs_yt].Label, [hs_yt]"/>
      <item value="111: [gt_ps].Label, [gt_ps], [gt_ps].Description"/>
      <item value="111: [pb_yn].Label, [pb_yn], [pb_yn].Description"/>
      <item value="111: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 25, 5, 10, 60, 80, 25, 225">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 30, 400">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &CostingUnitFormShowing;

    <command event="Loading">
      <text>
        &CostingUnitRightBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwe9sIUu4CMC6ZWhCLacoTxThAa16f2t/C5WOPFNcS2xh2GfHoZMF0FeO9l9lFkyxJ0=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CostingUnitRightBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyKnXBmEw6DYKI2ILG6IQpCRxhJmSkzgU0m/PZ7IQwByP8fNgaPFAvhlskQaOW3M6kPeaxS9ZO6BVp8DYWHSes0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYYlmMHeL5xTK6V31wSqjF+ugmv83GSVP5NFZTUb6au5ZMlei7R9G8kZuRCgEzOqwNM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaTW7YzDip2AMPUpnT+6QJKUrQ22Xkb5nChQG0xIlxKpgUbP0sYqTm0I7e9PhuF4OWO6BRqPPsk5z9z6zUVe+0W/ptlk5N6y+/6BjhGvhcpsy/NswCljBfc//2i1hHQ5Aj1wDxlo+aLFzX4cJ7NZb8mjfdYA1cKb0/wy4n7w2W7IBQypKERc7pJw9phyPd0OwvV8dBkYAMrRsMKtfrXi0+5Pz+W+dDf5KZq1ZKvaWGzGB64DNC6E2y7twCtRnY9o4kFLtDMB94/yBDsXVZ7ToJwMfu+MGe28dTebdeALNBeIq34h+FwcSCqy5UYffG9mXv/7IS8bNoAas04BY9DcouFmiMbvA/a+UViSTYIII1mS/PtT2RpcpIqFPrDd8snIGaC4OiGfqL2Rdpg7jnI/F+dvMMk76IHCu38X9G8PqJpwH/uZo4/w9u+mSmP/mu59xZvrVfl9yq02Tk4AScqMDJXEmMPH3UfjiQ7KYRHA+8+Z7+SvTTvHX2gJ2F38laOLSXdq4vzwKYDNPoXW4MTJfHLMWxxJNsZVpJ0KFIj9pNWcdq0cavqs6yAIdKvSdy+RMo7yhBKfMgGGZld2FvXsxCdF0TuQx/fFvrln7r4Szv8wI6tOpIvh+YKHDopWo94TG0As29ISYhymIaIratNHR8hJdn4CiHCDV/t9Ju1uhsYDlzgLUcPEXTYQjjxIjOwrRw3x90qPBke41fr23961jvbM=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nS0Ignx/uQretofeaHgl1PGZq9/vR55avnlFEP3ryfkZmaRW+zc9kgQOpg8jUhSd2MlX2Guv6h5IRFnP1OT73kF/BX1L5rVPulGpmyT05lwF14Gul1cJ6OS9ErXyBgN9iTLHyDmukfKYsnlm7z2GFZwn2F4crdrrCsvKcQVOjc9eaTe+3D7hlNPsShvGXeJY8Qpq3aEbpWocqw3146hyawQ==</encrypted>]]>&CheckAccounts;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7h8osYYc/kevxIH7n6S1q468VAdudeVt/j95G0iuU0Wi0Pq/PEHTkwVHNBtHWFu+nA/uxJxWbXiEQPEnahLTnskwomBkKGA6/1qSPKkC2g68GbrJkmvZDtY6MS6qJwuVf7Q2+9OgPMXzisL+Rye291KMUPBH4BeTFlEi8RvoRNQ</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jPX+9//UVyVOvGC9jzOM6oyKHPb81IiwTZ+Jx3tcz14VDXKbtXCfiQszud8qBOg39rgINfNkArwZnqOWBMOOo3cx7w4znt79Hn9ay7geSHdjUV6LG+N43yVRKQSgRP/jRw2BMHd224L4hFAdHc0FnOp93YUlJh1ZiqdPKh9eHNTTtkxN2VZAW0lgihCBEaEBkh+1Yw3o/c4rN5R47S5RYYwkkFujW/Wa2X3OpVdETSkJIlDnIJwb8lCKDBcq7CCkHp7tPYpWMgT87ODnFdPmITUZTfxf6mpBlJeJLcrVHDTdnqVg2PHSpSOzmSVXAqJMMw73/GqD90EDYNBK09OJuuYItfrjYybG1cIlGBA38TLU1KyoO4wR37m5NEdOAvlA3PD1OUiAvVEUjN/JL8guBBBeiW+zyME92OTYUUWI0Tlo=</encrypted>]]>&CheckAccounts;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KrznVU5E9qADZ6LVnOyZ/eNQMqA2MWhDCJKcZuPsDh+m9Q6A2tmd3qDipbZA0H1NHo5G30tx1xbUooxqoVvsZnCGE0mcGHB12tGlKXBE4Zf4haM6VAXd6y5WwZNfzw+0C1xISiI+uHOWAiW0Wkn274ORLMafaiFtAPjNshvqwAVr</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesv+C/jFxUGlfBx+Qhj5YKDUY60aQCfl54+To0I4yet2PVZLk1LXw5l/bFzNm9h1zg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CostingUnitRightBeforeDelete;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6Iv8JJgCZOM3VLycGS1ZnzO+Gjd+RR4sMTNLC+jgLTl8sxscT420oD1GqMYLNysLZJJw9bhI3/zg//TftbNzAfM/1Rp1sdQuLRYSGXo1J0uGcquZDwatAPpV2mU98z+LvUQHRzK9nvD4uldzD/IG3WM3EWoo5naX239qxCy7ttbcnJLtKZS4bqEVj1P5ThY13P0=</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Zd9fVNuakNn78+l1MnpMhtFntPGhvppsskrwRovJKZNg+ANuyfE7OsRmbvlfMexeH7ZcucduoQ++TaYsokXZjw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PldN23+Zg3NpuDqAcd6ybQ/N4lBF2icWNN5xJK0KxksIU0cEeWAiGrpDVJdF9CmjM6vEeGgDVOAQ7paW6ILIUHxTDwveoH2NQJ+GFA4c7NxuQUOBankPX+4z7X5crfVcxLsprwxi1cmZb/vY6Pb6U1e0NL4/YBd8I4YO+VMhpsX/mDj9G3jEc4OIm/0WfeXmX/jNYaxNBXM8sXkzourQYzFFgA5ZUloPo52xQkVRivyrnUB0PAbpOUUpPbX0eZeg4RozY1r1BzNS2OmxS73UJvBLlgaqdMwkhpdeVhpzi1lbj4pzdCFPlIm5JyDZ1BcIPWqFJOMXU3f3/VjTHWrgIsFwXAJOPS6sgzLt75jCwbdw0DDQB987T8el2s/DUOG7muMni9D6W/5x9jjArGsx0zljaXRgZcOnZsZkhCLLYe3+zXYbMx4CKtdicUhHrTaCl1WkTJUykT7YoRHUChwqh6Mm3inDjLQi9bPyzLhGUmhAF620pj13mqALDJ0QX6zyX5LYrVlZlLImxL74aWgGWRwa/7F6hZsu44vN4Npa44Kb+yYvkzuqN6hdhKD1YJyqYyW4a6j6hS/JIRXAlO/kw8a4apsF9SOIgK5p3YKin6Koq264A7YrTk9a8K7RLPwym3IbJrYWpIDM+dYRSgjidiFAh+ytmRPHXCJ781t2mcowv0w+pkfYP++Lh4vWlCq/A+phaqTlZQJvgRVk3MFsXl+Ho2u2Q7gXwcsZVT0s+MIU94VQf2E+RD8PLgp6zyL7DRsRE1pqpJsDO4S50hALSvKGg4hN5Qv1tWtCkJLaYG1NPGdPSwYQiGWPMiORTdJPyfR9US7LMr8gFNbBlcW3Q9jUKuS2z/xXKgHX7Nj9So7PqL+4jpklOO+OkT0qnYgZ6y9WlhzhKQPXtlSZnJIAwzPhLudamufA8J6rjM5rxRICvWd3x+1wSYy2y/F9RNDlpcz2Xem3xXx7wNXDn1XJ8scWTPvnhi1aIi4dftm0ZS6mQFVyS9yTuAyKvbJKd6NUbA5RC4GaAhAUqGP3kssBuml0NCknu1akKZg7vXgCK/LjxjNJOPhBA0eJA9ivuq0juPrR07bJ8f8EkfGkTpYpMkrXWfTZvVXilWV4pH/dKiEHD9xJLJLBSSj9XzRwJAvaEIcsAcOUNezxFRjY3K6QbRheNRAu3jTsZhiaZ3pxPYw04NxD9f+VmPXnCwivDhTfXhjzgukrj0ooL+qdXBDnUsklMwqb1oppoLIAi4Qq5YrycroarseTRLSCwa+OQdPOBNl+kakKDu2yWMjMYzCe3g5dIrlE5MlzpFmh8kn8JTBU3LfN/G387Ve/Ur/dnwWKrMt7S4q00bPIPLmIiabQX4LqJ410rJhwcUl1cpms0uD9+6O8l92N66tN9mVtDV8j0F8Tva6fU4c7yHDa0gRPmapXQl/8qhtsFLTXz/mPcuLMwrMzPBmay8FjC83r2WIBitn346LGEBDCPrOpTvSAlW8UId7WoO0JbNJPsdbDL5lkVnTQTqEpVnce2Bud/0g6g==</encrypted>]]>
      &CostingUnitFunction;
      &ScriptIrregular;
      &OutlineEntry;
    </text>
  </script>
</dir>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrtdcthuekt" code="nam, ma_dvcs, loai_tn, ma_nv" order="nam, ma_dvcs, loai_tn, ma_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="loai_tn">
      <header v="Loại thu nhập" e="Income Type"></header>
      <items style="AutoComplete" controller="IncomeType" reference="ten_loai%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" external="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [loai_tn].Label, [loai_tn], [ten_loai%l]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ho_ten]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+s8TTA+ov9/yNBLWf63wo8Oulvy7W/0kzsUmRe3BALojvCGh4DTC4FuIt3rn3jzJuzh+XsHef/64OjBeyKL7c+FlDsxTvDCCXhsFn2u6ElBVfJnjehvjRAqTm3i7BkabcBZCNqwQxM7Qn0ER3LAJuWeP7MWEjDOlFx3H+rBTouIuV1Mq6tY+4HHgvDHeRWq/wcunu2BTVrbuvhec8MW3LZ3lUtvGwww89jwLvfOo+9rUjlPh692DAojhGaUbc/GSkN+HiYG2AsQIVbkR0VTjv2Posrmk8P8tnEDEWfcRINcof6I5hI9N0geSqPXfcqVeLXK1BnACgARpUJPlx3jowX3/eqnVVQ+KfAkuylUihE8hUWCGynXUgL7oWyWeOSzXM5ag03pcG84bPBn28tdx5K2sMpXloZXpE1I8AsWFa6YYK89skS4Way3UxNUTHl664z7VPlRGG+fBT3ccDF5iJZwUZbUdwcuN8W5+rkdAZXKlKkWjf5C6bPSOSEGqJ8beMjfWxTe5PNV+VhEuq87uckvfP/iL46UgvKq7gYL2a3BLarzbAa/O1IpgDr6y6U+AZyxg4UxreGAZgBkzuCEcKsJIThYjEhWOKpIoCVDsQ/CziHhFB2mFP7xpMT1+yRo6fLz6WGRD3AA03yHqKHP6i9hSStAQchyKVEZjaVuMEV2g==</encrypted>]]>
    </text>
  </script>
</dir>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "biForm012">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, 'biForm012'">
  <!ENTITY Set "select @form = 'biForm012', @cach_tinh = case when @tk = '' then @cach_tinh else '' end">
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

<dir table="biForm012" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu tổng kết tài sản" e="Total Assets Item"></title>
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
    <field name="bold" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Kiểu chữ" e="Font Bold"></header>
      <footer v="1 - Đậm, 0 - Không đậm" e="1 - Bold, 0 - Regular"></footer>
      <items style="Mask"/>
    </field>

    <field name="ts_nv" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Tài sản, 2 - Nguồn vốn" e="1 - Asset, 2 - Capital"></footer>
      <items style="Mask"/>
    </field>
    <field name="ngoai_bang" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Ngoại bảng" e="Off Balance Sheet"></header>
      <footer v="1 - Ngoại bảng, 0 - Trong bảng" e="1 - Off, 0 - On Balance Sheet Items"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>

    <field name="cach_tinh_yn" external="true" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="0" defaultValue="case when tk = '' then '0' else '1' end">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Tính theo số dư tk, 0 - Tính theo mã số" e="1 - Base on Account Balance, 0 - Base on Formula"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="tk" clientDefault="Default" filterSource="Optional">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="cong_no" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Lấy chi tiết một vế của các đối tượng công nợ, 0 - Không" e="1 - AR/AP Items, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu" e="Mode"></header>
      <footer v="1 - Lấy giá trị không âm, 0 - Không" e="1 - When Value is at Least 0, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="101-----1: [stt].Label, [stt], [form]"/>
      <item value="1010-----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>

      <item value="101000000: [thuyet_minh].Label, [thuyet_minh]"/>
      <item value="100000000: [form].Description"/>
      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [ts_nv].Label, [ts_nv], [ts_nv].Description"/>
      <item value="101100000: [ngoai_bang].Label, [ngoai_bang], [ngoai_bang].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [cach_tinh_yn].Label, [cach_tinh_yn], [cach_tinh_yn].Description"/>
      <item value="-11001000: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="-11100000: [cong_no].Label, [cong_no], [cong_no].Description"/>
      <item value="-11100000: [khong_am].Label, [khong_am], [khong_am].Description"/>
      <item value="-11000000: [cach_tinh].Label, [cach_tinh]"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0kgIJ85b/AwMJMmBIh3vMD2AQ1o/9KbkAQVz0rUoVTCVEKo4cQV5sFGSSwTIq0UbHCh7EWz6b89Rw6uGFLmnRu1BI4c/LDIDWGr6kCtkysHhLCrzy14Yk/3E64cwC9IF4RxrHpFyTJlWwGGbha25pA==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmTEIaXE1zTHw8ONyzwRuZziv20VvGzzGRijnlW3vn07I3Pnfe3Yuku2y8XVyHMljLy9QDvflFC8EPdBpBYSWk4XFa3MHFesT7PIXDttFm+uL7pMdA6QcAduyxEytwTyYPJ4J9kuJOsfZJ+3fV5e1xfGQdtcin9dvJUi/aodPRzfr/IFyWu8GINpPXDw4Tgtq7TE4UUVOsEGvUs/UuUO8ZLAmUJp4l4wiD2soxIZMGTFPDh3Te860cwH2E90zzMZfvlTPDh5CMmOaLGnpNCf6FJhh/ctQEQdBZv5eZoubsgR+GC1wIJ7tAqUn5guB6c7/pjengXHoCLOzvvG5AI5T6NKvC5KBJ38fLLj+bvF74/GP9FAriTGMp0QdCndZXLSEgz1ZpYQWpaHcgthgt+P9xp6YcKFtFRmX3Q/eWksIFOsAZwFCjQPqtYU3ekZZ5EOGtPHqiUhKk6lrVXNZiFZfN5mcyLnr4iJUPHjyfddBAA60F1F5k2kIPGrRFUaf/pv20XVfS3+KGVpbegGDuzmSzee4R4wKJLs4P8ueATTZUKE1GgmYX1FfOhz6bIZRq0EJTFfp3g8PudGvIWrro0007bo7qx+P8eBm5+czgNggLwVt3FiQqT/caV6oP77mTxRIUbU6WOpl+N4BkAOJkvv+GKHw3DI8O4UZNFGkA/8th1pOI6jufIWhU3vYP1/F/VzMG+mc69n4tFkFP/+OH21C/9iHX/god4pEEl3Yop+svLdO2merPdNOge6ie+EBlVNNYqRwnC5wScq8OHzeOYBFZlvlJ5ugY340tOZJwBEQfIjrzEqB5fcGDHEbAxNrIF3bCep/ZTrCf4RleIStbNibpAVh/krIOBZbui5tqQk4ogxaoqXrZ2/vYYXPUEMRaNjTiZq6ItUWA87o2LNj+T8DcoWbFq7DRfHmFxLUZO5e1EoGpgH2CcZ3eoRBmUbAjizimTaGf/SvLEtTFtPgIdMFYHOgDvDGnxXEKPVCKvd4pQoM436S7sZ+OSJI7mD649kjhQ=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>

</dir>
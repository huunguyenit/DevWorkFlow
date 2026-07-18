<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ControlFocus "gia_dc_nt">
  <!ENTITY LockedDateKey "ngay_ks >= dateadd(mm, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">

  <!ENTITY CostingUnitLockedBeforeEdit SYSTEM "..\Include\Command\CostingUnitLockedBeforeEdit.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormOpening SYSTEM "..\Include\Command\CostingUnitFilterFormOpening.txt">
]>

<dir table="xctgtsp" code="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giá thành sản phẩm" e="Cost"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" disabled="true">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" align="right" readOnly="true" hidden="true" disabled="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" allowNulls="false" disabled="true">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" disabled="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" align="right" disabled="true">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" key="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0'))" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="sl_tp" type="Decimal" dataFormatString="@quantityInputFormat" disabled="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_dc_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat">
      <header v="Giá đc nt" e="FC Price"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZbzJbrAGXOjDZ9jB5EZFRM4D5fxcdtdLPSqTg+C2eyGc0SWZZCo8IueZxM6+x7c54Q==</encrypted>]]></clientScript>
    </field>
    <field name="tien_dc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tiền đc nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_dc" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat">
      <header v="Giá đc" e="Price"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZTys8Vl9Lw4I8/MTP74lxZ7z8Wpq4piMbjVQ4u0PLlFmN11GrVdXMpiaeVC/RFgwvg==</encrypted>]]></clientScript>
    </field>
    <field name="tien_dc" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền đc" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 33, 27, 40, 20, 120, 100, 90"/>
      <item value="11001000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11001000: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="11001000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001000: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="110011--: [sl_tp].Label, [sl_tp], [ky], [nam]"/>
      <item value="1100-11-: [gia_dc_nt].Label, [gia_dc_nt], [tien_dc_nt].Label, [tien_dc_nt]"/>
      <item value="1100-11-: [gia_dc].Label, [gia_dc], [tien_dc].Label, [tien_dc]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFormOpening;
    <command event="Loading">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Q8M/QNyyhQgbtZ5e/JFp0dX8gtRO9cYmco5pGVoregweAmixHTyKbClsTA5l/hq4YIRKoKK2RiTUafgJHexSB6fPzTPnMgvX7unb88rNyEnKmWuA+W6eDMvJN3fTVk0dLX0Oon6ptHsFMxr38B4bpwOVeregD/n4jlVr2ogt5Ha0HNxnIwo0lzKglkL68eHBFryX6jMvsUdouMrsXzSIYZmEL+/FwHOxuvAJ9hNel3nqUz8HsXGZPfyP/r0QMq/OX1cNzpMW4mibltRKEyGMM2Dr5cTF9nsPoY1MHKo+koAIVAB6PAZ3ERRudwpUqT4s2+mNVaFc4mydxUyRoJxUX8=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jzydpBRLZc7FqA1Xm5nA40wHWjw0zM717GEbS2YLveKVDLIalDMyqw9XyudXVqSgZA1W216CsSAevIfy+He91v9m/oT0ntUHvRPFqz9g0P/cNXCMquuTQEhTYR4NHgyGpmEPirooodCdnV7ZjcWBXh9zO+giK5NsqAdZJrk1C/I9liRZrlboDwB+1qbHTimElKwTBe8Gjw4DaV/tr2qmGLw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoa0w+CPb4N3csANl6HRMO9+k5UbvuavP8ILz2sx3NAzZoAkVTpDt3RL9NZ4dQb+ilJBsuUdAVjQ3v8NZjx34/mKSt3iUCObqGsaQZspSBcT</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kw9xKZUg/hs/uweeYRI1UvitIGVbTn87j6cWtD+HV8ce+yOcrYp50Wj683vJ47RlY+Xe2/255y7qE4UkJ1rIe+hz/ix4z1Y7EMjGDk6Yr9NdMizQ9jW6il9vy8YSxN1Hawv45gkB0jYweNtMh5MOgrpb/Vv4bVywWAzFIee9/rd9QwbpGMJLZE2tiEq9AGdb+FHRgYvFs3Vf2f9tYJh0OJSkSuejdgfHwK8NOES0L5zi8HV9oTaK4GvIszYeVSVInFbJZ49jpEY2dAp7SEvNgQ=</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>
</dir>
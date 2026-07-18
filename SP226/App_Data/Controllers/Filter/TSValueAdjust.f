<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vctdmcc1" code="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" order="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Data Filter"></title>
  <fields>
    <field name="so_the_ts" allowNulls="true">
      <header v="Mã công cụ" e="Tool &#38; Supply Code"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" key="ma_dvcs = @@unit"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ts" allowNulls="true">
      <header v="Loại công cụ" e="Tool &#38; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai_ts%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_ts%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date From"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date To"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="111: [loai_ts].Label, [loai_ts], [ten_loai_ts%l]"/>
      <item value="11-: [ngay_ct1].Label, [ngay_ct1]"/>
      <item value="11-: [ngay_ct2].Label, [ngay_ct2]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTbGY7+hPQtiY/qWESZWj2yiGezz012sQ8GPtRtdXraWXNOXtjVRZc0H7AVRLHyUK9wWy5uwSLXEUjJgzAYqhoOx7CcdjnNTiUr92dBBHgnnNxdz8fESEq12C3sSLMoVv0dr2oGJKHwJr5Ltl5VOeRGZE2Q0vDm9HUEspj/nSoaIvhR2gbypBPlWKFVVfFOAkIniNTQVu2vcmBo52q47UM3UzHtVnxv7BdlJwrYtnCC0gmF2hjjhLHV5pSoWF2sTO9O1KRixrkh14UFB36z+ebMkg1OskgR0pOmDLpb+PkKB59MNQdLFKnPyoTFdDlyv7TgkEJwTEXF8D/ZH5MhDim2wRaZtu5cSE2Iav+BSXgIII</encrypted>]]>
    </text>
  </script>
</dir>
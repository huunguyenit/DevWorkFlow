<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir type="Report" id="0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày giao từ" e="Date from"/>
      <footer v="Ngày giao từ/đến" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày giao đến" e="Date to"/>
    </field>
    <field name="so_ct1"  align="right" dataFormatString="@upperCaseFormat">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength] "/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KlNXMkiUWplbBm2Ik2gtmo1quX+nFur7zQMAaBMCW86KzFu3azeZQRe71jK1j+iySurHGNiadBSxXPP8qZkfVmggY+G1v+sUAyMw4sydeYRir/gcTsZVgqAaRusENafPjA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE1dNbzQzOTn4QRiYLu+PlW1e4q+w6fZFnGauwiiH2Y1OCKUDLgg/zbYcbIuA/HatVDdGg/anvLL8eC81VFDQEo73mA6ASYwSUIgMh9lGxOrDs80squmLvCKKdlO29NelOsp8hMXdCIzXrTM/7QiJgroblxzasAESnVKtS5wyr7L9hOc92BeYxOepjK8WHaVgdo61K2Rf4+Pke4qdIcNUpfPf60Uum9rzqiJYpFr1G6NKh/sWoza8WQbNRKm+RT5yYzMq3Hpjn9CwCAcVLJglGXPspNC4+GrRi+E6K9vmor9oaHxArp6fLxOImmJDr/gUcUDyLMaLiBsQ62Kc8zqk8ts0XOyILOMVqXzao3UllmSkKB0A3JxKqRYh7gkHR2xK21zFABURXuYdeNGZ7rXFtPzwRM/mKUIEkeENkFbRh+Rw=</encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>
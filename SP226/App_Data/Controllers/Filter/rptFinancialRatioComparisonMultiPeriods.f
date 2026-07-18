<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "gltcpt01">
  <!ENTITY defaultForm "gltcpt01">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_ky" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right">
      <header v="Loại kỳ phân tích" e="Analysed by"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - Nửa năm, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a year, 4 - Year"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_ky" allowNulls="false" type="Decimal" dataFormatString="##0" clientDefault="2">
      <header v="Số kỳ phân tích" e="No. of Periods"></header>
      <items style="Numeric"/>
    </field>
    <field name="periodFrom" type="Decimal" dataFormatString="#0">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" type="Decimal" dataFormatString="###0">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ke_hoach" type="Boolean" clientDefault="1">
      <header v="So sánh với" e="Compare with"></header>
      <footer v="Kế hoạch" e="Plan"></footer>
      <items style="CheckBox"></items>
    </field>
    <field name="binh_quan" type="Boolean">
      <header v="" e=""></header>
      <footer v="Bình quân ngành" e="Branch Average"></footer>
      <items style="CheckBox"></items>
    </field>
    <field name="cty_khac" type="Boolean">
      <header v="" e=""></header>
      <footer v="Công ty khác" e="Other Entity"></footer>
      <items style="CheckBox"></items>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))" check="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))"/>
    </field>

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="1110000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="11: [so_ky].Label, [so_ky]"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="111000: [ke_hoach].Label, [ke_hoach], [ke_hoach].Description"/>
      <item value="111000: [binh_quan].Label, [binh_quan], [binh_quan].Description"/>
      <item value="111000: [cty_khac].Label, [cty_khac], [cty_khac].Description"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgrIJPOaPIZ+z63f3sdcWm2XBiS2OMPrmO/HZtrlxXovNPoGupmuZmPE51NlEpMpKsAbRLGCfcTjqr4MZSMbO/kqt8PVSDByzHG9aXC1/xKzE=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAinW8zZxXCDY8N+40iMgRKMGgcPGf2Qfh3vpmQumhd/7dmIXCDpSLnAFgtsb80UktgvOTn1UZ4nniQuSC6YtLgezgRZk/bSBM2XeKASWA0OvQ2M251Ba606aLokSbdtmyM1/NAChve3Tj8rsoP5tgNcgwmm9frYYjjhGRyUvyM6O4Zx0ZooJxqOqbaBjxWCA8AfRNPdDKiKZ/0C0bzZCYehvP2RfJCmeNnoaAOcQB2j6PDm/c3sf0zcf5Sr8lIT0p/08Pn/zARDNV0HlEo53ON7/BzBU3FHmprhDCnP15zv7uRMEJL/TWwYbUhNp2MDSaFx5XTBYtAXs03gzCqWe3R8B1SkPIY8brvXVfrEK/J20XeazRnJcCOFskWp9/8W75bLityxAkU7McSNIKdhEcA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yqMpJXaDvgMrIYdpITtoD555EYuzLZrQfj/N+SX3D5bLrzBnBmf98JtiHIidl/XKOvKHBY+qylrI6ZeThADzVdwKroxAkSpIuKNSPhwi6cmRfdlGVHR6acGeRHhoKQND+vp+gTuuuGOnwQPLmoi8S1GdiRZ0PJ38dpPu4M7byDJIcWqJlLFYWIFBtbAd7C+1qeORk6bx3zYcaks2jT4GNnLtst09cModSvK+oT9dlXeIctyQvtHCO/lqE2c2XGltYGSGNUsECPFbtZruawMAkvXQxjMGihe8/SmH4SsqvkTbrSl0j1v6kt0paKUkiFxiSFiayZ3PmNEOHE5ar8dLV/sKZaoGE8JJrg0aaR+hu6oYm9iyZQhRCcuQWXZgKLYg7TWySSyXeQyP1uG47kBCIq4oTJ9HHdSvTLGjbntTFeT1k464q3nC2/iAHQb5BehHLR/NENGSv5tiZNswxtL8vURAfdqx8Dgbw0ai5MUYWDACdR8/11bHkqPrvd4upe5hHm0dealBTzoGRWZelaLHmzQOKgYS6nzQ926P/ArethYzFeWJq4ewpVSUDjfXjpploQSqWQlxx2ykxSoK1gGxb1P6rsk3RoNsF+na31ATTP5WnqNRcDXqK6C0iGyrhOgxXjf1elJpmzZfTxQPGPx36Gb9tAXuNY6fBPPfje6OSi+H5oknQ5PNuCMUL40KNvwyOcfWMxfh8QdNK7vhQHnZSTv2fsJgp9GJ102fVBzmgZyHbZrVp5r7OY6OtCyE3wqYWYp2JQuxCjsGC7LDvCUP7gRBOislPnm9GdbD0gHy7QkEz5dgN6tFPGPIfzXJyWds4YHWOciWnwRCIV2xu6xm6WMOH30igpGQtHCPHCZXGhcD9WV2/hlDZ64qxeGCWhMEegPOjvTh9crg1IfmQWNhplvkJvgW1jWowOTnGc+8BoMqQaehU5RX+CRkVThbixpgryJuDGsAOLaZ6g/t9OcR4w2DO4hu1WwU/ozY4i78+71LlSUIZ60SOZFyaGce0cCcrc6648eXeqlDcXbDMU/ItNOtUq0WHFpUiExJA0ENhMzA=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
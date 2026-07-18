<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "gltcpt11">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="so_ky" type="Decimal" dataFormatString="#0" clientDefault="2" allowNulls="false">
      <header v="Số năm phân tích" e="No. of Years"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodFrom" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodTo" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearTo" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
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
      <item value="11-----: [so_ky].Label, [so_ky]"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="111----: [periodTo].Description, [periodTo], [yearTo]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgk2YBlEPgZ80abpeUfVOl5JfRqXsW23jsovsZzz2w100Mq3bSCCVaw9Hkzd0dLDFiffhkC3kpm3YmuaKOCHKYtyvumsbZCFzpcc710Toyt98=</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAA2yLSlHLMIpNRbXv95PEzLcpXyvZZ1194114mb0OWgmmpeILgT+2wcOBheYdXB20qz/KhotBabHSH6LY37xWXtPoodgb9pItQmxZ6EH1gjHFS3bGDK/307Wcmgav3fAU2Tq3BCNbdoL2//dtjdkEzUl6RgDSEpflrfcfCGwb+/M3y4No7Gt+wVbyLQHwK7xPjbdFvhd3aKPKLaH8zt/iQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9zY9AhuYUjQ0f5+izEkBIGXrK8f97dojMN5rH0H1QDVRhvB3OUzuc3SeTqYO8UWdumczd6D8CsCkBo6vTg8Ix1zrQYgO1WxlS8sKEalfDw+0QsojALEvNMjRLTYedLndHBtjclsXu/EL97Q3THkOjE6S3Uf5o5goOMYo2To+TbYEXagjVKlBWYgy6QZxWRFiYn70KbkmJBUsvd5X//xNmlHaruqp6s1B/+kUpSFdR+CqHjhowvWnTRtFz38vgfmo6dV+VH32s5T8zYjsArNV7McF+gfo/o+TnyDNMKzJ0X/INoqRM7rDsBg65W1MtH+xEbFZ6jkTIqIira4NyC6GzVoiR4hk2qC0/TPCCrCy/ZHzR9YSga2R3QddbhpVmKXRERq6X62IUdKtSPViibiM73UUOOE1Sy7+uuJKxuem4sZ3leLr395obkBPra32K1syALw2WPYOcEKAey3bsBG50R3qsgLcClP1eRiT6v42Z0NOXZGaZEU+VxC0m33aF1wV3Pck/Te1Q/1beYjdiZjptc2Bo6qEW8iM3RpWuZRXFM3iiiT3J45NRGQXwJTp2UcX0qH8dvsNlxfjJhHuBtMIdKlaJIpJhEtsUNaDOCkwmlth8Ha0/W2poSgKyEYI1qIJLrnRwX7Oi5xEf3wwEaYDgdPbbY52XSkRmKJtVy53mYMh8tkR1+kVT9bQFffoWofV+tiUS8gfYdClGyf9N4te9qwkrkwBwTRHDriUa1T0KycU1I1IV3uKQJGM2WNDzOcWKbv2sc5RJwaIxWcOzvOFRMpmUFGVkMMWF2zjk98uwfHI1RZv6sIt6MFwu1S+/KZUgZq1TlXw9U/OApMSaA6lQBZSZn3Sw4GBbwwQ8u/UydrXw==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
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
    <field name="loai_ky" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="2" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - Nửa năm, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a year, 4 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="2" allowNulls="false">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
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
      <item value="11-----: [so_ky].Label, [so_ky]"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgk2YBlEPgZ80abpeUfVOl5JfRqXsW23jsovsZzz2w100Mq3bSCCVaw9Hkzd0dLDFiffhkC3kpm3YmuaKOCHKYtyvumsbZCFzpcc710Toyt98=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAinW8zZxXCDY8N+40iMgRKMGgcPGf2Qfh3vpmQumhd/7dmIXCDpSLnAFgtsb80UktgvOTn1UZ4nniQuSC6YtLgezgRZk/bSBM2XeKASWA0OvQ2M251Ba606aLokSbdtmyM1/NAChve3Tj8rsoP5tgNcgwmm9frYYjjhGRyUvyM6O4Zx0ZooJxqOqbaBjxWCA8Wc+2l/9pLkqaoR3atqdeOJJsWZltf0gfyOh/OkB3Bs7a1YmYG15ttrvwqCB3ZzvfYcY2zXcBctvBq4u7F/lerHQ39+QJlqgEZftCmYyy0O</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9AlSqlh2Ee8xpjy7xUmoU9gT8SofNM6LuJ/1yW/3P4td0MteN3BT/LE6mXV34dHPmc8hajvS5jLLVW16qhfFOU4WZtVdQr1bbAMFvKO4LnZfNH+AFyVrqW85pi/vANIm615OgtCS8eXVDhgYJiLCzlp6pRC/qV+Myb3shVK0KKlYQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yqMpJXaDvgMrIYdpITtoD555EYuzLZrQfj/N+SX3D5bLrzBnBmf98JtiHIidl/XKOvKHBY+qylrI6ZeThADzVdwKroxAkSpIuKNSPhwi6cmRfdlGVHR6acGeRHhoKQND+vp+gTuuuGOnwQPLmoi8S1GdiRZ0PJ38dpPu4M7byDJIGm5AFoWNY0EItKfkfwu0fg/DBHuJf45OFYGZYyegI6PzSdfm0YNUgGoLjysxJOHCQxf0ow0+Kr/DpmyBcp/Cq5KnTAk4Ie9TVE3KPJnGpFx91woHrOSbdCz6sD5nqs9wJE9BC7qNgSSW4aKe3IMb3nLagmRVjtAkBvHp5lkguePUmjJG4i8x6wTdeDb38fGp+v9mYcHWSaq8/S3xyuhDJXeysGpD7G5WIIBaSIpKvaxsn5giLazF/R2TF7opYyGQo0nSyLx0/952rW/OHanXVTmBKI5TvNgvuhOeDHxZYHxMMNmQd9DdhNNTCPsPzoeHypSbUZ7cFfQjAUH45yW+p5j1fB3C7AA2oTaDALxEGLmngd8Dt8uFPBemraI4bsZjJQp5SX7Pxsd+MTGPAQtGYP/nnxXs1cAvVTkBSOTPSdhAEnu6vjzF5mh6I1o0NpqGMIRl8QWifGeMeaWzveKHhFFoSZbGTT3pdyaeW0Q82VSlcJT8zEiXra2MLKgpyUK55LkJPeKD3PqnzlMz8CfZvJIn8BJWYK67c5UlRTbmev2iRrN2/Lw5FgFgnNko5MZ3HWDT5vr9Ee+u5DSUVL5FAJSII9wMgvW8jC0vHJl/oq1f/m9kzbmJMEfCDcsx2q2ptrcpImRuQq5ah2wsu/KclcafJVBw9KEpQmSnHfeTiZ+2GctZ1Y97CI3bli+QcuOno1iR4Fm0oZIv5U4rLnhqHnqVLWQRO14y0nn4hXeI1WA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
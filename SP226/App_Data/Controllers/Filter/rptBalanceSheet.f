<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY defaultTable "V20GLTC1">
  <!ENTITY defaultForm "V20GLTC1">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9aBZKSpltVQIuTV7bxC/Os4kJ3uhs0hzU8Jcyq2cVNGjw==</Encrypted>]]></clientScript>
    </field>
    <field name="ky" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="1" inactivate="true" align="right" maxLength="1" aliasName="Quarter">
      <header v="Quý/năm" e="Quarter/Year"></header>
      <items style="Mask"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" maxLength="4" inactivate="true" align="right" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear();">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="kieu_in" dataFormatString="1, 0" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
      <header v="Kiểu in" e="Print Type"></header>
      <footer v="1 - Tách biệt tài sản và nguồn vốn, 0 - Không" e="1 - Separately from Asset and Capital, 0 - No"></footer>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
          <text v="Mẫu chuẩn - năm" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu chuẩn - giữa niên độ" e="Standard Form - Mid-Year"/>
        </item>
        <item value="30">
          <text v="Mẫu chuẩn - bán niên" e="Standard Form - Half-Year"/>
        </item>
        <item value="40">
          <text v="Mẫu ngoại tệ - năm" e="FC Form"/>
        </item>
        <item value="50">
          <text v="Mẫu ngoại tệ - giữa niên độ" e="FC Form - Mid-Year"/>
        </item>
        <item value="60">
          <text v="Mẫu ngoại tệ - bán niên" e="FC Form - Half-Year"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="1100---: [den_ngay].Label, [den_ngay]"/>
      <item value="111----: [ky].Label, [ky], [nam]"/>
      <item value="1110000: [kieu_in].Label, [kieu_in], [kieu_in].Description"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cGdegLypqmJGFbjqIbmcX1IYjsgb+Gte8TQj412JLiDGAp0Nb5anBsvUTqgWJD7aS+5ksvyziC325Dwiu+CfHXlwt6rBQjGjyG1Z/RvSUUzLl2kvNMpslLlXddb0Z3Q6CnB5Ue0SspwyO3CnluSme9RJckzOm67CckPhxeX3PBBtPyWSC1TnvfYKwZb8gC2Knt</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBtYb2AJBCBWuxiBr/ztuzpiAsPr9gzOg30Khp1hYxyxoQMnIPpZAbfid3qySbDGm+c/kEIQODFODJ1pM+iLoVDLb/+Eg9wnB2opkYZT+gn0ELUbPbXT9iP2gd+LHfjchJptM/oiSJ43t1X7Sz0Z2fTzITSp0K9PKEqahHjmydDWvyHeae1W1foQTXhSqBNUUf</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBlOkkfRjgeyjrf8bceGIXQKjAE2mIkK8qpeJ2qy31ao8wJLLdHcAwLytl5W3RQqc9RAKV3154zHX4+kynwg9C2TBGYLImRy/4aI7q+oe/3jx1hbJVmYdeuQfermnxD4q69wppVDVYZ0Kxa+bb/6dIF33WeUrhktXFGH3hLIjTafu1JBddxRWFxoKAyAgxcsFhkMkOcTm5Nm0BWhBfQCV8JO1uYaBr6Qbwba0bjuySAwllzSpFt1EILyqegOU/3Yvs</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8B+ClTPuqwDYiWOMK7SNxZOTxW20jNI3snN6PJkQy4eb/J/w+MIfCGXmrpIZH/axVbY/X2osy2VrOop/MgrARQUWq1o/KAjpQRcAUWExaY7QMClk0vXP/3ALevXWTrs4khyCYWGVEE0wnzXHqZ7f0de01yLkzTZwY7hMTdMhk2loO9RsnYRpaLXSWu565fgxSSOGNniwK2xXU5LkscgWRTikqdkrZKJrSFp/lXFX9oNyBspn9vvu9IZr5Yvfivz0jcbZvZpIrRD4bz0/4+iObgkVCBllz/k2t40Xuy4XvUZP0aI9ge5o8257GDPkKG4xw==</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNPJ4Qxd2nPNUOW/sUYLUK1eqh2x30g+oJyuCKIG7Od/zaUDJfU7WUshPCgaoAV9l+QlGTbzCWdFoZCIZTaXWGd+DBykavuxY1Gub5vJd3ocqJ+4s0GWoJTVbUyf1rcPnCgRHDuiAyENCq8rdm15nb25UZpbqiTJW19ZoRsv2EEduoCeULTikWtXUS4wR6woN95dEmrNKbvJY4n19o+W65BOohm+psFyOOpfQF8cW2a+XeEiVOjgPEj33KPPpbCa00m7aXysjriaftL9AUWi/NhabSXHWePG4in3k4SvdEvGv1d8q24xggyAx5xHRwkwx3ZhbDbryP2FRLl7qtrWzej+324WioJc7Xsg0xMjLAG+gRzOCaCR3WwXJXqr7KNrZBQm5QCki1cgS4FjeZJWf9NDE6KrkwwJHBQSHBCKS9u5yPfhrDhx+vnX1BQZc62FklNo2ORC2GT6fO9vbxyfm6d0ufNNZBuyDpX+RV5S+Mnc5RVPGEdEB/T070SR7HLtPwhMxZN/ZFALUhVAM3Rckrxs=</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9B/2wAHL1et/QE2epWfGqU3u97paTktWsvWGk0yM0sng1rCf+X6u7/WRL0vkMEnm5EonHLQZ1kasMSYJT9hkaKmaCQA/Bkk2qGL8SAv+4o3Y3uZ8c6BW4308ZaY9zAHx7o=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAv11pTV0o8Ksa6RoUBgt1lOYHjCXmfSkA4EMvWTBSMHx9h4roLIeIC33CE5oGMxP/Slkm6VK6ErI191Oiteot9UXtxjpMLqVaqjEbS4X/kIVfkhjNTq05/KV6g3gW9DpTOq4AMG6UK2KCpFVQ1hUCspiRUVQZc7oKIwgOUXLzYWBJrfTLEaaK/ckcFV0BaNP6h+Wpdg1ulnjf4YC2E68JtGxh6lvIOA2mAhzZ2AoUxWE0M0zZV03TKjjbcPaKcMRJPuNeXxMPzW5XR8mW4OlFOGYjkNlfE7h38k4sUBsXJduMY6bM8SXajGlZce2XPmbRcjhSIZWVLYYxmvfnddUM8wGT5016v80Cf+zg6n0Cuqzx/5dC6oyyjqUMbY/Hjr0Z+iDxUEu4zD8gpQuamKVyhBByUplJVl1xNlsCTMvHmPRboOgixpmspsWt/3L4qyQ4nlo7N+/tMiZECEOGKOekBRbF+lu7BG3EW9ZYtk/1FrI8zXpFA4ax2d769enkdYPZ+rvKnWX2RBx/dv7TqaU9/mpv7zg6BQJNKC66GsEH3WKlQand4qtgg9wtnvDn8b64I7HE5zUVXeLZeVp+amovD5S/hcKYS87P9lu5Jj2N1o84WFBug5QxJrgMq74Gpb+mniIVyVtwFDElJAUk2kRSGUjSokGTHkZWrVy95rTfgaq0q3M/Y9Q17H8TKfLJB8oRZw/LfKrNQKwFroRbuKC3Be0Olerwb57G8XIKUhKn4iZLJkQj+I2naQz53jQsFcuoRc5Qql8UYd5UCmJXt0k8INIM/WOktPKKS74o5Fa1UxHlnrgu/3HLK//E5eb7ruzw4r7B/kBEfS3V+JkChLyYKBBh5HTd2nVEaBcMPWh6m2XtLo/wZr2WooGklx5qTustFChAh8wTlrUntCkwMgQON6YNKQpqMgEFamU+lcHfwnFiwgiI/rW6f2yGYfeDoppyzkNEWX4z+PfKnYPS+YoV1ZV36yYnUmdWilgS0SrMwMHeTaEC4Z0Gre3zYSnhOZrxeWKc840oK5ILc62uJdfsQLboQA3eOwsudKZCzYiJ49bF5Xymx0bliA5WcE/nTkwg6kiY54XY1lXspbUH0U+T4GT+UHXY+XDk7F5YStWZ/yDyW6I+h5PDD+siHrxGWA5+06T3jPtmh/WEXsZJ5LcYSRpTTGEOzlM1a6Q9uABOKT/</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
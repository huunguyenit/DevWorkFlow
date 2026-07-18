<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "V20GLTC5">
  <!ENTITY defaultForm "V20GLTC5">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="kieu_bc" dataFormatString="1, 2, 3, 4, 5, 6" clientDefault="Default" defaultValue="2" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Ngày, 2 - Tuần, 3 - Tháng, 4 - Quý, 5 - Nửa năm, 6 - Năm" e="1 - Day, 2 - Week, 3 - Month, 4 - Quarter, 5 - Half a year, 6 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" dataFormatString="#0" allowNulls="false" clientDefault="Default" defaultValue="4">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu" e="Start Date"></header>
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
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 30, 40, 100, 100, 130"/>
      <item value="1110000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11-----: [so_ky].Label, [so_ky]"/>
      <item value="1100---: [ngay_bd].Label, [ngay_bd]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP7h2GfJqnNKET6itpAfLTdNxqpmrkHCGwTVMY4fj8gEsyRYVF0hqov+hgKGlW7Ja4GqGi3Za2zmC0yLKtRcpJM1Am2zBaLNMf7QYoLJ15nV5rVOBAzzVRgbYhbVSXbSZcNd8fCdqMzPkrCViHGmR4WT1aS8leord/YDOO3DTlXZqyEfklGPSLrTBuZBoK2J1bBsWKQVjWkMrA8ZKsYeg4d9TAPXCaX148Ti4i9xvQoQr5F9/3WoMK7zbT8aM7ooBK/cOXhgJi/uidLTdkV0AV5v7LgoXK39beLLsXdlKfWvr0j36nbYUQtP9K0J0CMIwmZMlvYTXRBXOKYdrr9hAlWgHT6fEfyg4n5LbxsOFNooykQFvRkjksZV4XYwbTjhzJOCf9hNS2yFXdpgLkHy6J8=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX602dKeB3eFuuyLjkQ7dO2/3AYINWanYyyin2aYxE5fbh7gf+i4bjGZiXp7KlpuarvF1lfP9RiaOV/Podh+qcHdPkjjgp4lLhL0xDIL6xoeaaLSIrhyPLYnOrDLw6HWsH1op783zMEqKLzxaHNdZ4hCmdLwHAmIt30rM4oMQI/HS+FsvKsKW8bH1/5RwNAYPS6Li0qGqKnL4RD7qd8pp282D9JW72J2U4tPN4xYuBxRZNxnL2QP8ifmhdrvWmrjjYJ2/5+/9doHhyF9bEgNrn50mF1yDK7p47KlVySdYt3IgaTwApi6oD1tptQCVN6mU4GmfnOmIHZSJ3itEJHzB4yDWp947kd7PnXUMmSZOOxEjezYvjqnKe+g8pGI+YSRhxm3gXhJshYq9V/0Z3oin2KJX0Zfr5M7oRoUaawjgjtJSLo9xqsS6XB7r+zN9kx8Be52uDC86AfqS6W6P5tgeSw0qfoo0fmGkGCy0o7q3YqeA5bEPO+JkBSz5AMciRjqrVjf5pC+2siZIxR2SYQRuHEwx+RDE9XbRWJT9wJ4HyCOXguSjuTwAtM+xg1YjWvoCWII6v/xfLVXBrI9nUo20odoiFZbeuaOsOZMzKxV0iyNnJDNWUGzBOoXfOyQ3uKktzk59M5KSq5+/b0j9hVkCOAmAOG7U1zEAHDh819WQPRDhQmNX5C+JzUy1v6SsZh1Mqak5cbvEusEkZMGdFkcxT60yBeyMBi13eeHTApJGoayIk9yVfYiZ8hNOFKZjygcXKlGXddVt+Xh1xotf7VmGmOpd/wd9CANEGexzBaaLUOWv6fkRLSMqMui7LeUGKLztAU=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
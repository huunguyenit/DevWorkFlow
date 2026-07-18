<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "v20GLTC6">
  <!ENTITY defaultForm "v20GLTC6">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>

    <field name="kieu_bc" dataFormatString="1, 2, 3, 4, 5, 6" clientDefault="Default" defaultValue="2" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Ngày, 2 - Tuần, 3 - Tháng, 4 - Quý, 5 - Nửa năm, 6 - Năm" e="1 - Day, 2 - Week, 3 - Month, 4 - Quarter, 5 - Half a year, 6 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" dataFormatString="#0" clientDefault="Default" defaultValue="4" allowNulls="false">
      <header v="Số kỳ báo cáo" e="Number of Periods"></header>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP7h2GfJqnNKET6itpAfLTdNxqpmrkHCGwTVMY4fj8gEsyRYVF0hqov+hgKGlW7Ja4GqGi3Za2zmC0yLKtRcpJM1Am2zBaLNMf7QYoLJ15nV5rVOBAzzVRgbYhbVSXbSZcNd8fCdqMzPkrCViHGmR4WT1aS8leord/YDOO3DTlXZqyEfklGPSLrTBuZBoK2J1bBsWKQVjWkMrA8ZKsYeg4d9TAPXCaX148Ti4i9xvQoQr5F9/3WoMK7zbT8aM7ooBK/cOXhgJi/uidLTdkV0AV7jyDhy40bcWjySsytoSg/PKq+gqsxQB/LloHPdh2JONE1QRu4L3poctESGRb+L2iIyQs2ngxbATE8fSHfyi7pyPopiZFeSk4sWFre8t7cMsGbwng9b9naQ4z7mcmP/jLg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX602dKeB3eFuuyLjkQ7dO2/3AYINWanYyyin2aYxE5fbh7gf+i4bjGZiXp7KlpuarvF1lfP9RiaOV/Podh+qcHdPkjjgp4lLhL0xDIL6xoeafZPxT5PR+B/6xbiLORXyzF5V3426VB1bxf0LpmW8v/6ZLevkW/AaWwAbmXy5Y/sC1DdGa4WOHRUgLDSR8R6JhQvLVm6okJoLpZrkhjk0fkyZi/OQf029ZSFssKBIVkP2vVpN95u9UaAGPCRcolZbwf/ogpF8yqw+a6XLafY2/ucMh3owkEWHrAFpvZSZwP2JUdiFKBfqXZAf3G9Netgx5cgCvae2/O/pBLXI1LmTaViCZzqqKUFe5VgIz6lWF/NG0DQ4wOBqzybrXLhh8XS3TMLHX3Wl4FCoebfN98n9ow/QISCPCf76mcwOZkH6mapJg7YFsTvLicV6gUpRTYwa7NjBgVczz06YWEW2Jd6tvUeCrUtTR9kbiJAHIx4g8CnrgPYATF50dTNK4hXmqesj91SY8oxc8k2vsg7r23xeHKaSA1dfpaW1aoak3bf5iNQ8EvRZ+B5zkt5zxz2DXR5hnFNa7Sx0y8O5mkpVEPADrkK6ddyIimgXJFK8ySthItXIcKaJUX6B7PKfpIWyC45chG2+v7x7dHragB074lJjk7dWzV5WMa/t4x4Qx0079hGRyu4jHa4w2S39rGb2h4jt45vqt+iNIv+QFtQ1PQTQIpBiRvS9Duay7jZLfwYUSwYv1OwQIUAxj618BrY8mM7kSUA0LWWgzP+e88NSby+EjF2v3MXOgmbzRzCSB4PT3xtPw==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
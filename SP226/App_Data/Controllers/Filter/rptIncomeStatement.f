<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY defaultTable "V20GLTC2">
  <!ENTITY defaultForm "V20GLTC2">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky_nay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Kỳ này từ ngày" e="This Period Date from"></header>
      <footer v="Kỳ này từ/đến ngày" e="This Period from/to"></footer>
    </field>
    <field name="ky_nay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Kỳ này đến ngày" e="This Period Date to"></header>
    </field>

    <field name="ky_truoc_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Kỳ trước từ ngày" e="Prev. Period Date from"></header>
      <footer v="Kỳ trước từ/đến ngày" e="Prev. Period from/to"></footer>
    </field>
    <field name="ky_truoc_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Kỳ trước đến ngày" e="Prev. Period Date to"></header>
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
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn - năm" e="Standard Form - Year"/>
        </item>
        <item value="20">
          <text v="Mẫu chuẩn - giữa niên độ" e="Standard Form - Mid-Year"/>
        </item>
        <item value="30">
          <text v="Mẫu chuẩn - bán niên" e="Standard Form - Half-Year"/>
        </item>
        <item value="40">
          <text v="Mẫu ngoại tệ - năm" e="FC Form - Year"/>
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
      <item value="11001--: [ky_nay_tu].Description, [ky_nay_tu], [ky_nay_den]"/>
      <item value="11001--: [ky_truoc_tu].Description, [ky_truoc_tu], [ky_truoc_den]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cGdegLypqmJGFbjqIbmcX1IYjsgb+Gte8TQj412JLiDGAp0Nb5anBsvUTqgWJD7aS+5ksvyziC325Dwiu+CfHXlwt6rBQjGjyG1Z/RvSUUzLl2kvNMpslLlXddb0Z3Q6CnB5Ue0SspwyO3CnluSme9RJckzOm67CckPhxeX3PBBtPyWSC1TnvfYKwZb8gC2Knt</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBtYb2AJBCBWuxiBr/ztuzptg3ysyH29AFd0gGER19UPcM2VV0YFkJQZUeaYQ+lT2SHZ2BIwYtmMpP0xLuvlyLKx06QTaKEXpPuAcjW5JwSVt2Eqhme4az/qKQSRKtSp5eNMzrMTsG1Gbx6cfyA1Lj087yKurTo5T08Vagnvhm+sJfIvu9cE5/NxBfACj9p6Ln</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBlOkkfRjgeyjrf8bceGIXQKjAE2mIkK8qpeJ2qy31ao8wJLLdHcAwLytl5W3RQqc9RAKV3154zHX4+kynwg9C2TBGYLImRy/4aI7q+oe/3jx1hbJVmYdeuQfermnxD4q69wppVDVYZ0Kxa+bb/6dIF33WeUrhktXFGH3hLIjTafu1JBddxRWFxoKAyAgxcsFhkMkOcTm5Nm0BWhBfQCV8JO1uYaBr6Qbwba0bjuySAwllzSpFt1EILyqegOU/3Yvs</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&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</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9A9vfNBAMOTOWtXpkv9tsbMHfDd1cDlueignab9OnDq2/bSX/zVxDJ599prjmTp6Lhm5EFx4bj1o50xflyU6NKC8JGkMdM1/LnIXZtIBAv3Moigb8x9nCxsAhq7QHLxadD6zuA849uzyw1L0KeMpLbG</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAges8o4N03bR8+GwFVqH1UufTuMEQNRJ1iTmzWlTKSefqVNLCpJUcYZexoghw/lh7eYfyhy0Nshyif8RpD16aZp66H5BLkHcFtPHoBhB2XWhHzLAe+wcKRWH/6UHPWgkYHyd7y8IUBQsMKlYIQID/ssIo/ENDY/Wq79Mi2OpmNTp/E9QEXAxh5eWpMYFGFJaWC/YQ8abY8E1a+mFx3mbOM1BHv8WLijZJkBUUBROZwSgdrVceVY3cTkf+WUHZQCtC0UM4DuvDWPNc0jprn/birwTP65nqMYIyNILnT2sM8JbrsgTCw3081Mx8uVgCiosJd0a7NZwchv0xz3naZokS7d1LKq1VEbc7XwhvGaVxlf+iTQv2jnJmF9IE/ssl6SXS8vSwMeUbHW7wm/rLlbgMqwlugRGlj0nFsh/KUS4g/NFlhkHwfowego1HOtmFyr6lfrJtGY6ty1D6FgaRe/1GT2hTHV9ultQLkYB7eTAYUqB5rqlODy1gd++wKeAZeqesMWTL7eYmIOgn+RHvaRvHDqPoWmqFYWfkaZ1tdHrZZJ9FGmjMYZcSz9po6ixcYgReIW3Vokt+/TTtYcGXc2rerVzCdA6unLSg24WB8andZxPIsBBhd8rOoYG2NvO99a42083qT1HydY1b+k+PW+ZOK8j0LUCfC5Kr0g7/m+U3a6n3rqIf8CZISWGHtn0s3EQPstpf21riUZ0GUQG71PIfvYfCQI0zNGW4nDK6RpafRijx7ruLhARE/zYbkzvsiTs5d+AuxO7Zll/WpCmGPqhHiRfI/UUxd6JX/T6CMiAHwT0WUmhI1e8ubJkXP4m4HSiAIOUA1g7Mr93Zq6G9RJ9tCgdZ0gXNhILS6oUtyVJoDqoBGrK2zX39Ts/qxsGGnwZIlZQJQqazZYBxhzsuPyG6wJ/l8khw7epHYs1fZh0CAHrE3SAtvJnrjU+9laXR4vGPiOt45nHPUCQww6MzageGBwKXAhyTmEH5wvVz9LfvILPXpjh4PEMkn7mBIVXOSt76g==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
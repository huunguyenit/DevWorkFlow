<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY defaultTable "V30GLTCTH5">
  <!ENTITY defaultForm "V30GLTCTH5">
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
          <text v="Mẫu chuẩn - giữa niên độ - tóm lược" e="Standard Form - Mid-Year - Summary"/>
        </item>
        <item value="40">
          <text v="Mẫu chuẩn - bán niên" e="Standard Form - Half-Year"/>
        </item>

        <item value="50">
          <text v="Mẫu ngoại tệ - năm" e="FC Form - Year"/>
        </item>
        <item value="60">
          <text v="Mẫu ngoại tệ - giữa niên độ" e="FC Form - Mid-Year"/>
        </item>
        <item value="70">
          <text v="Mẫu ngoại tệ - giữa niên độ - tóm lược" e="FC Form - Mid-Year - Summary"/>
        </item>
        <item value="80">
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
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cGdegLypqmJGFbjqIbmcX1IYjsgb+Gte8TQj412JLiDGAp0Nb5anBsvUTqgWJD7aS+5ksvyziC325Dwiu+CfHXlwt6rBQjGjyG1Z/RvSUUzLl2kvNMpslLlXddb0Z3Q6CnB5Ue0SspwyO3CnluSme9RJckzOm67CckPhxeX3PBBtPyWSC1TnvfYKwZb8gC2Knt</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBtYb2AJBCBWuxiBr/ztuzptg3ysyH29AFd0gGER19UPcM2VV0YFkJQZUeaYQ+lT2SHZ2BIwYtmMpP0xLuvlyLKx06QTaKEXpPuAcjW5JwSVt2Eqhme4az/qKQSRKtSp5eNMzrMTsG1Gbx6cfyA1Lj087yKurTo5T08Vagnvhm+sJfIvu9cE5/NxBfACj9p6Ln</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&KgiT2k4AdcxFxW1gK2q66hY2Q8s18wMZY/spWLapXuNMp84vLgEey6QGSEB+UzDHo+Kgc2UJrqDWMGkf4DPTKQQ1hpImQmxbUDCW1abYndQ4mQ+RASDIwY4lZRJ27t6E/PxQ76AWsaR8jDc1X8pKym2Y+8WO3/wYMhTmkBZxI+kVmwr4T0cl7bB/2zWvx8x+aA49L995RzG3bY0nNy5208R18HjvZ/OGLT8ektOuXvzcnTKfCITfPPxefu8TOcNjEYuNEfDPpIrKce2n8pdYA0vR7IDNdj17/NQ7r9xX1qNuiHd1Wrd0sDZKx+tZVr/Q</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&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</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9Cg3CFoFNXMx8Cm3rF8wKtYayiwMOxWjD5eCXPApy+Qqvl2YP+uN8QQOx8iPkDh8kPrqQr0Ny5e1r5TUK7SYZ+NKYVSXZAiY6P3gnRehC2FYvwTS2TprZc9Q9uxc8XqTj9eF1pI+lezbDN6feJ8EYQO</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6x4QygxhydwROxlqHlW/1g1yknnY6PXzOV/Pv8VuNuyY2/cgbj/mLkF6Zx0Zt15DNeOfH5+QZpZqWdteM2+s3DKEMeNw1dyy7Q5zmIBKKsmLwgvnLvxYHkh+VUVEuxtSC1RXmVjVwEBMQU53A7nYgTeEQg+FgA7sEYZj1rqbW31IqZkWV7VXripR9erbDyYGakJo6SYsMEh4bTZddfkr1RBXnpGhd11VmyqCLmLdaFwc2HOBTkHGpHoOt3UPFFPT5t6hzVRAyeoB/wUrNO19Z9duVbpT2aljZIV3SOD8WdDYI5j7T9BVcRrmm/3fLBLDtKqpaR/Q60t5UUjs0hJzq00jCridV1qhTY6ZUkOn81BwlmMdg7XTfKU4xBkbSDl5zWmNcbfPHAEi1MuZhBK9EBTaRBoHuDkpW/lSlz9aONIFg/cH71mraU+Q8p8rfH1PnmEuvUzMk1jAKmrN+7nGrCA53w/FzTOgshC4tYM99AcuiZ6MtoY2Jj0295c5noJJZl6f0QuuDMh5/YsqQuHxmIIm2czDwOEJ5FeJxQNwWEWUzlLfhCZreOwEAjQs6a1OpTzXdk2avUONZSKGl9Lgi1aPT1yC57cI1QbF67H4vvLWGFjd/Km7AO03BdQfPN69echLxnGVh+dcwDGGYpz9y7RaWOA8SrPO2mv9ctys+ADbjwy1q2RQUQY0VMz8lnWvpb+Hg4qu9AX/kDtiyD4ZlwBYD4tqN7Ae4bP+HPdhC2qwUc12PTD9x1yxE9bt/nfXc1sQI3Cz9LBcOpXkeAC9/PgfARj51XLywaPjA+3EWfK3kRwv0I5AirbOntthRlsXtLGHIsgYlRyXaVbxawwb5w/MxXbTSPb0KYG1hEdsJTJSjdaGOMck/TI7YT7Wry6NIIrci1vCw1fsjpsAedIu6dKKlz2uCC7PRb506QF4Pk9TyaJQ+Wk15+Wgwg9uCCPA8P48vBhXFFIGKO3Pz7Sryd1PgJqtS+DmqbqxYtQ7vkjoD5y2qbXJwdnRjF1QBmok9UxPF/io74zrPBQDw1ZdTpE3D6xHAwK9CjuHqQak1Kl1LCXXKJ+IphEDkEimUSntY2tqEYbpXHow89C33fg9cx</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
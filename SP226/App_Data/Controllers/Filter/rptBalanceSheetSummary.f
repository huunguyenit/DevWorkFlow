<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY defaultTable "V30GLTCTH1">
  <!ENTITY defaultForm "V30GLTCTH1">

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;
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
    <field name="nam" type="Decimal" dataFormatString="###0" inactivate="true" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear();">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="kieu_in" dataFormatString="1, 0" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
      <header v="Kiểu in" e="Print Type"></header>
      <footer v="1 - Tách biệt tài sản và nguồn vốn, 0 - Không" e="1 - Separately from Asset and Capital, 0 - No"></footer>
      <items style="Mask"></items>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2dtqZ4606yQZBQ1Zij7PMO1L9RMn+jAoSXllhXeevR2eFJ9wf+HvE4lqVUrC47hGSMkj7oV8H2XSuPhzrDvRsb+pvze0hEpfUdPbd00hnrIbMgfW2TXGRpVVuvBkgYrTtQ+gDCbb2fEKh/KsO0eKv9S2lokxH1mlP9mh9R1HC3oDn2+r5KMmpujbjiUotQvrad/8clWeS0ee/heo8Oobq+qkpdgeVoYls1fpuqzfcUeUqpcRXWuYTwAMiAPVV0FRRrQWkLOa8y/HMwLvH/RemurUvXcERyyHGRy7qmIQ6opwPQvq5WcZ/uG5JtnVlQvBw==</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNPJ4Qxd2nPNUOW/sUYLUK1cOGTwIjN+puV1rQmpzArskhpgsMVC3EZVZdOXWqgO0TK89Er2I3iHjuK0JluzU2lLf+xnsXnGToihnM3XC0TPouWuTs10BZcaIA1yDpocVQiEAtGt/OBJYaArm7LfRlHfgy1/75Dk5xOD2RFUig41W7bdTDEHEtpCNk0GpqHqLs4JqdxWuJuTmoYcmrm4i/A5HsJI2IO/YpVfecLourN98pD1d1+73jneVm3aGfK/NhAnqqLR5IsWU6gfFTGQKr301Ms6z9WQhNnTV/EdFhAhMTOelSvLa4kvyLT4sWi3M74jRhuEKMYGsTBYEF49ngiuaiTyXFullPPUkiHc1BeiWZiKhMjOIQHhH9730G9mtFzRwhOCaUfkfZRJrTu3YOw5kIiqGwppxEn9f/MvB5uNqpzkA5KZbtecuVgM5qV4XBKGoUBH8StaUWddy9FEUIeWWIryV1TCJLacwEL/vzA/6BlmJUbZitJXw4g7tSLp6oSLaA4l+rnEMaheQRGzzKNw=</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9B/2wAHL1et/QE2epWfGqU3hS+Y8wv4/3qgU6vmzyyvEPS5J/TkamlIzTbC4E3hJcbtFQAGPcSXRQiX/4Y7SCsWbnmI2rcU4xJJwnvjCIY3mpGBOC/iXt/AQEJqpyZjH6k=</Encrypted>]]>&Customer.Nested.Report;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R7rTe97TOMdgy6JbNGw171KCou2ilwdWbx9ncjIB/uOGe+SEPdtwC3Q3jPRKIlCa1sZmJVIanBCkJcuKvrfSJZQ4df6NWW3B5J3/I1UP3WtoJ3H86nh7WXBqhBs6/4/HGOFWBTRDZpNtt0atAERKlpmjeE4JDk1hxSSLuZ1sKJKaTEyak4uDsroN8pbYp3klBgYcXV3yZ/5QMVezFJlrNMj0oKO93CnZkUREo4c4JqL03zvMxZoN/7QeneWjh2jYDPmmWcjhQPI43cQX3ScilgyUReOLqv6chwrLx4QFtawt7HTI62h/x/Jap1ek6Pi95tsJBAhh331P4l13Z7zOgsEJXwHP2m+IrRfP83iOMlZo2kkv3RDd4JCCVZinVBv3TzKZWVgiZF3HrpeExb0/oo+oXF3CwyceFVUZ1qc/M00q55FmBB8icq9SG2zzo3Lz1gHiLC/PJHoawwKVDB0zKD5Y0uhURffWg9bezvMXtIqY20pLLMpLQwwnfjqhhw5g2Vqwmqu76fFPkbxc9rl7GmjbuT22L1wgzyLfWiOC8Y8oBQLk1hYzrNoKY8DtsL8DTQZ6ZBd8VIkVA0xkwOxYiGp+I6G84wXsiPafZqL37W0nt4a3Y294uVYwMo1aySroeG2Eg7UUYj7evLH1n+60mWHU3tNNyDDmP+tybyR72bdVKtgWKw4UGkB+Q8ISwIZtFD88qOvtBav1BPTC/g8cNViFrEYBbVnbH+dx5GUZdRp8mWAy6xexgs8OgQokTYWSHKdAWGklnBwxhkQitRxFWCGusLQXBbR7mIXmubRw55u7xgIHSRztIl4OuQbbEthZDhxD01CDpaGkjpvFBk5WhOnE8CNEUpt7x+GlJDEeOrhI5PZ/1hws8v9k2q/jGEy6JqI9et2nuRHtZZJpUUsKgbmzJCGlo0pNAhyfW+xCSpOObD813QsY1YNS1q+G89849Wan5KmQ26xyfevGcmyB1Wo8YM3K4Z1W/kANYex/df3+ccp2V4agsgwTne6jvi1MMx+P/E4HpVgrzFNRx9RwRjmASwy2mjwbjlR+058wjl0DqmpyQm5uCRGdBPTbIxtipyF5/qdyfG+Nuak8cy47gyiUbaOU3vWRGFBL2KvVAzIasPxkVLtyIo10oDxd0SXEL+WJu2u8/oufZ6zixujAT8oCEJSi8abpMRTB8bAYWTGNQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
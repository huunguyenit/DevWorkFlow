<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
  <!ENTITY defaultTable "V20GLTC2">
  <!ENTITY defaultForm "V20GLTC2">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Kỳ này từ ngày" e="This Period Date from"></header>
      <footer v="Kỳ này từ/đến ngày" e="This Period from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Kỳ này đến ngày" e="This Period Date to"></header>
    </field>

    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="Lookup" controller="Department" key="status = '1'" check="1 = 1"/>
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
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="110000-: [ma_bp].Label, [ma_bp]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA6csiqmA6uWUbWt8Rlc5KdJS22C2pBUMoJRGVvpxdGc/JmB5AmK14lp/IdKOKjbq28BBzujg/mlE4+iGu3gPDk78NKURVDmaKKzlA2QuKYbDbC9s8cWmVn0Gvw7ukolOv1XSLP6x+BC6hirjZN2BQYtSs/uRfBAYqVq1c5A+ieeUg1R3GzRd9cD4iPWePQEqg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUZ461Ja+p8w6zFuFjnXqXnL+cJ4fsOZcOSswKn3RyTOUOUm62lPsKADDRCpv2TdkkFWApNWM+6ntyLO5CdiW7sBf1SPxJ5pqLl5X1EbBNVZlB1edGcz89cVNLV0irfZqCG/BQP8aWp3Iyx64KowMxTX9CIwr5bWDhfbGfas2BP7cnLHSpCf3Dlexwa9XtqrkhWGNJecFikGfkJXok6TI2ZXIdbqfNCeEa/SXu7fIxRxd+fbRMovgW7u10UKCJ5hfr+iwv3ykpqwiHIosBGOAohjPEQRN/APEHG+adktKZGN8klAyIXah+fOV9jcNUiwhMsxvnXSvzsSbKyphevc5PeERSESLnb5jbzFCYZHdG+36ns7rptOdKI15TrT8sZN0bQDFNLZI1JP8Ed4kXu4wv3bHQ8EeA3ixNyA1Xrze6ErHgs9wDeHqDItRdT6nZyrFkccuGiR9o7xM1fBBaXU/D2bEsvpplhvAMNnd5er8zYzV34Yh74ip8C1k0jYCsiz7W8iaPCj02bVXr3iCwM2oQk45e74Nly7Ei1RzKMAzQkLMD+Ip4FtKqtw9XjZXqzWqUP3owEKOmldoiuo0REJwCk0vwLRIRB8Rj0Cr38/OORVSCanLbr8o/qo5fVtLNn1sO</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
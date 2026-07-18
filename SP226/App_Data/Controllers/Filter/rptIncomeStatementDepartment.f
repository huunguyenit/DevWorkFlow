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

    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
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
          <text v="Mẫu ngoại tệ - năm" e="FC Form - Year"/>
        </item>
        <item value="40">
          <text v="Mẫu ngoại tệ - giữa niên độ" e="FC Form - Mid-Year"/>
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
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
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
        <![CDATA[<Encrypted>&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</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAges8o4N03bR8+GwFVqH1UufTuMEQNRJ1iTmzWlTKSefqVNLCpJUcYZexoghw/lh7eYfyhy0Nshyif8RpD16aZp66H5BLkHcFtPHoBhB2XWhHzLAe+wcKRWH/6UHPWgkYHyd7y8IUBQsMKlYIQID/ssIo/ENDY/Wq79Mi2OpmNTp/E9QEXAxh5eWpMYFGFJaWC/YQ8abY8E1a+mFx3mbOM1BHv8WLijZJkBUUBROZwSgdrVceVY3cTkf+WUHZQCtC0UM4DuvDWPNc0jprn/birwTP65nqMYIyNILnT2sM8JbrsgTCw3081Mx8uVgCiosJXLWTPh6D8WcKrGre0M9jInLyee1cMIw9nDP/lW/Zv2MVQDgURiL39kqw93/IrWwMnlI4xoZZSI9EDc3pOa8MtvGnUdevxNhD+Oymv6Ej6baUtuVz+RsFKCO8YnQ2axS+Y2fdyGHDxXxgxbeJJYYMwV5cqAF9i+1G+T0X161Ib/F6u54QAA8bFyM6PBCBjT0FoYXVyrMlGR1ReZUqpIX67MKp29kkYlLhh5fmgx96IcwyZmsaFfOD+1QF07Zl+R1ha9L/p7swMZGecK+AVbfLCiRJcT7aInU8EIGxwXHTyORmxI5qtkOdafItqB8/DOt9KfhXEWW/NMIAzVsT4B9HVhWTm0sCQ/3mAh5hqUF2qRLuZx+5xBf3xQkmtlCLEQ5B4ex7APWRGbQRINyJaqXq/kWJRbB+eWX59iB7Q49e9JjmdvsukUvpwUeIuOCGx/89wo3V5BzMXxULqGEt/1vmesSq5WkoxuBqy8uzGFyDEG13I5R3S/6vtGf6ztaB8nNB1hrfWN7vOKMUgGb6eRgkJB0ndL8LKJvT81bnJudatf/coMw07BLmaMLBXNu9iX2pE7lamWlBqbMYFiFlC3zLoTQlavjg+hM7I8by2XlGnXb+mxu3fUwSTIjGFdvGNVi95Xj2DFcx1vLu3VzCAuXAU8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
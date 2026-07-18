<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY defaultTable "V20GLTC6">
  <!ENTITY defaultForm "V20GLTC6">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cGdegLypqmJGFbjqIbmcX1IYjsgb+Gte8TQj412JLiDGAp0Nb5anBsvUTqgWJD7aS+5ksvyziC325Dwiu+CfHXlwt6rBQjGjyG1Z/RvSUUzLl2kvNMpslLlXddb0Z3Q6CnB5Ue0SspwyO3CnluSme9RJckzOm67CckPhxeX3PBBtPyWSC1TnvfYKwZb8gC2Knt</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBtYb2AJBCBWuxiBr/ztuzptg3ysyH29AFd0gGER19UPcM2VV0YFkJQZUeaYQ+lT2SHZ2BIwYtmMpP0xLuvlyLKx06QTaKEXpPuAcjW5JwSVt2Eqhme4az/qKQSRKtSp5eNMzrMTsG1Gbx6cfyA1Lj087yKurTo5T08Vagnvhm+sJfIvu9cE5/NxBfACj9p6Ln</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&KgiT2k4AdcxFxW1gK2q66hY2Q8s18wMZY/spWLapXuNMp84vLgEey6QGSEB+UzDHo+Kgc2UJrqDWMGkf4DPTKQQ1hpImQmxbUDCW1abYndQ4mQ+RASDIwY4lZRJ27t6E/PxQ76AWsaR8jDc1X8pKym2Y+8WO3/wYMhTmkBZxI+kVmwr4T0cl7bB/2zWvx8x+aA49L995RzG3bY0nNy5208R18HjvZ/OGLT8ektOuXvzcnTKfCITfPPxefu8TOcNjEYuNEfDPpIrKce2n8pdYA0vR7IDNdj17/NQ7r9xX1qNuiHd1Wrd0sDZKx+tZVr/Q</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&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</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9DzSci8ryXU0K+0u1wWelNQFTCzjfSBwt/SpWn8zLCFW5zCBKklLcHsgPXgZaPqUttLbqvJJ96LqLeSz4uc18xtLgRWNhFKNrqO5fNc47HRxigrJpZAN24AUDzuHU0RnzA163ZFVQEMRqUIWoO0ZUfy</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAges8o4N03bR8+GwFVqH1UufTuMEQNRJ1iTmzWlTKSefqVNLCpJUcYZexoghw/lh7eYfyhy0Nshyif8RpD16aZp66H5BLkHcFtPHoBhB2XWhHzLAe+wcKRWH/6UHPWgkYHyd7y8IUBQsMKlYIQID/ssIo/ENDY/Wq79Mi2OpmNTp/E9QEXAxh5eWpMYFGFJaWC/YQ8abY8E1a+mFx3mbOM1BHv8WLijZJkBUUBROZwSgdrVceVY3cTkf+WUHZQCtC0UM4DuvDWPNc0jprn/birwTP65nqMYIyNILnT2sM8JbrsgTCw3081Mx8uVgCiosJQu6CXeOpeJL1fec9/xiBzwjrg57xIk5bHHQaMOZ3jhCVgBqJgz3DXvlnZBg+YGO7dESX36tshbzgHMQILL8Isy//DOzrcPFEnKvp7pRIscT7J4ODj3TXlwCN2kZsZwsLTYzYnG8OJ6K+dO5/drF84RwmEiQ3uHlUTJgSFL/GQ4E6dUa+CFmO2jrZc6YWHFYPvDmmIW76/eflUS1mn2m4iUDMUpUH07/Y3ejwViwyK2k1hsAUwYvyhTX5E9qYRoUzc8qsyz5qkbXYZee8RgVwh6NI9QVSQTqD7FR2ERm7hZKKmoMvONKXnfewzPEOTCYHbnrrM8GzZEVsYw2aEdvqTdG69DDu+ZI1Uilz7y+7hBDv5ICdaKDlLU3HAtmXGRbO6Q1om0YcgNsuXzkEDC3dxHp6CTE5SLePaZMCqvN18Vaco1eijWEftEqWc7oxWLb3uigRMtx6unSD2y46EFus8P2WzkyF2h14DxLKcz+zLn5CrFOXVcwY6tTilms32FKnqgqPzXBOM2qWdcQoe6yiWvmRTTcVBVhO7nx4BMWLQ7p3dxm8zzo4s0rpIMoHCxYg2boYACOAdASlznlp18cDuddq5rIYvvwEWO2fEkE+NRMnnD7dzJKZtmfVYiSFGEumcFvceEx6U5KElmOLVqZSIhHimVDPH4v114jh6yueeE8l6sidiAMpzIpuFT+qvLJLQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
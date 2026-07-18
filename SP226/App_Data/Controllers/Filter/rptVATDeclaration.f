<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A0126\ReportCircularTypeField.xml">

  <!ENTITY defaultForm "V20GLTHUE3_28">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky1" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ tháng" e="From Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến tháng" e="To Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="bo_sung" type="Decimal" dataFormatString="#0">
      <header v="Bổ sung lần" e="Addition times"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc">
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
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11: [bo_sung].Label, [bo_sung]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [form].Label, [form]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgRsqCwntXP0WJGnqD/KX1yf6jhaytSurzqZp3cYgi1qhMOR+RFr1RxqqMoDaJbXwmtryCQiXj0VNE6R7IHguYtAZj/MMQU6xtNpMs8dPekKp3JMGdTArcunRzLPCSJl6k</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>


    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLCheckProcess;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7ZPZSIfFn2kAsVs8WBYjCI1SknMpo9YtkLYMBWHXIkMe+fpHuipMMZnaiGLdKmgvxarmXsMRBjM1+ztGzSHoRsU2w70OoY9CKTxgB+/gSQvDAmjcWuNo2WIyno1kUa1Rc/F7TesH5iJQINIkD2zBPr5aTKc1psWnzhnZWOj1iqzbN045BnwNDjz3aL7rIeTQwGhpUBfy1afz9sTE7GJzB+/KhQYlBjpHU3obv49GW14kN//e9Ivjda9ikGPocucl3yfN05UOVzRQl5c9CfJoS8PCKk1h7BtNWevajHMLnHVyvpnRH8DxOXorvf4kc+cJWxv0Cg6subw+BX2lnUo/vAck+QDSldWdXUrkGiSSw+18FTtR23KU0nOopawx0CkKn8KhA5Brtu9DRmY+E3mF0qNc/2bL1wuQ+3N2ykaKa/QNFT9EL7MCKN0PnQWa3UPtALYXCZAum2whz6jqEOQwybLgnYicUF3rPtMQyJDM3dmGYs56f8Xvysz2d0JtFaVywIhaOSlkns+OgIQsXXgF7JY2RYWpwCUxV/G4YZG5Sdf</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9ByDwM9nYSHG58S39hQ/bi5OYv5PC1AcoHFGMTp4au72eHLCXa8ztODEMrBiNlrEbCcwjhiTr6t9ECNDZBDbVTDLCbiGjBkKiAv400CQV3+dydAfIsuFQ53wgAFLc9Ut78=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KziuitzclMLZrbpfolDPlQxVqJa1ncuTa4i8l4r6mXQ9AJrujWLk+9Nth4VOxGjI63zz+XeSjVSlmLi2BxNOtnbvzZifLjQ0WG50FIN+5BYYuwUiXQRy9F8ZX/IbLKvu9Ki2RJm3MZA0whN8E+68adSA8zBKjQpxXX5GpGnNkKw6p0BMorJVqb0UAkNo2LHkpgo8SPsq2QY66RaB7J8k1B5mwjmtj5V825dsx6MNe5uqbHet3mapEE5zIhbW6pW3+VmKmvvN++sdId5b1UtioJmC0AaCkjM51mhHjW0KDpfh6DJdMH2sPOSffX4GD1HUDn8rJuxCVzT7L9E55UfknX6ZKm0+T1nnI605JoAPeFzJNeZS3g+ma821XvzEZYbEv2QWjGFCYzFQYMKAHhwdqjvmM6H9wRPrMhGJkk1EAfFJ0bFh+1jHU2Vftn7mg+KRiqPUG78wUqU5BQAtgD6BfhM4FPLqobqypMOS6l1gAzLtC3yiFhV0LbiU2IpPZzd3rgIAX2AEc3HW0e08iX7TLlarcHF5S957zyE6xKnuFQXZRaS84GIm9VpShEVbHM68YDhqouppBSIKAXlTs/ztlX7kNO5BCY+5kXibR7jWPSd6hZkH0DV5D5AEsqg2kPnjVuHe4MukX9s0WAZBGUxxwnBKN2d17s/ZVEunAVySkfYyE9MZX+OwEWd/eCGPhsNTwuIdUizqpxAfq7PFvztvhF7UU0fJraW6MLq8YqSAFcK+5wR7JxqBQG0jyasWSMX8QCjyCW9B3oFwsa4fA8KLkw0s=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
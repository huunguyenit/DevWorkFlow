<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\ReportCircularTypeField.xml">

  <!ENTITY defaultForm "TAX01_28">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="bo_sung" type="Decimal" dataFormatString="#0">
      <header v="Bổ sung lần" e="Addition times"></header>
      <items style="Numeric"/>
    </field>
    <field name="chon1" type="Boolean">
      <header v="Loại doanh nghiệp" e="Business Type"/>
      <footer v="Doanh nghiệp có quy mô nhỏ và vừa" e="Small and Medium-sized Business"></footer>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJWE3puFMBbdPzMPkt1V6q8sYqEIcQzC9MPQtlfGzQs1FqESuH4WJGN/p3hxQUlID6A==</Encrypted>]]></clientScript>
    </field>
    <field name="temp1" aliasName="TaxBusinessType" readOnly="true" hidden="true" filterSource="Cache">
      <header v="" e=""></header>
    </field>

    <field name="chon2" type="Boolean">
      <header v="" e=""/>
      <footer v="Doanh nghiệp có cơ sở sản xuất hạch toán phụ thuộc" e="Business with dependent accounting units"></footer>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJWE3puFMBbdPzMPkt1V6q8sYqEIcQzC9MPQtlfGzQs1FqESuH4WJGN/p3hxQUlID6A==</Encrypted>]]></clientScript>
    </field>

    <field name="temp2" aliasName="TaxBusinessDependent" readOnly="true" hidden="true" filterSource="Cache">
      <header v="" e=""></header>
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
      <item value="120, 30, 30, 40, 20, 80, 100, 130"/>
      <item value="110010: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1111: [bo_sung].Label, [bo_sung], [temp1], [temp2]"/>
      <item value="11100000: [chon1].Label, [chon1], [chon1].Description"/>
      <item value="11100000: [chon2].Label, [chon2], [chon2].Description"/>
      <item value="1100000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100000: [chon_tt].Label, [chon_tt]"/>
      <item value="1100000: [form].Label, [form]"/>
      <item value="1100000: [mau_bc].Label, [mau_bc]"/>
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

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMCcBHcMp7P4nk26g24rLvVfjyQAtvnW46n6FD29+Z5zm6gne+tDXrld+ETQlwiccGKprDHoz4kpjSxARSEZErIHPZGr8cgwKt0pjCxyybjJLuaqzmRbVsvQuEuYT55dQzkWaoeYmLFw9bJoPGrxKYKS0qBOhP/cAiwWVwAAoMtVYARFpltkHFjmnO8rAtWqdA==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9APw3zqQ5ej+gaaVzZDI7hIM0+FSGl/tkuXgtZjGtrhQAGOnXUCRUB0rHQIAxeOlfwfC7YzbIklaJiP577x6tehPIwOm49mKu2R7veiYTQvu5twHFfNcbwwPJ4BLTYHeCgnRIWnBJBw2KYLQBCkNgOo</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUMrItpiyP7Bb5Jgp91q4M2cE5O7aACmDI1yZAq0INfxNTHAvznMfs5667ccsdbagMw3D59hqP6IkmchxMlKTvHgXlXCjhdA/4fkcbkDpEVEusnVtgt/rCWwHWqO3oi1/Q9K0M2IJDaeY1CrojBOZLAZpHaeg14CNshpT2PvJV2O2Q+9xAA80I+OSJacZq+96rjwuteq8yxClRiT3fT8QB4Xk5i6w4XJ9KfysHkIrW6KLvJgy7L8gPL6ZERG6RspCfxaw97esGQ35TglJpRUWMmZeA/9Uwe8WYr54MVrWWh/NabAZ0bMNWY1Qb2NEbdTfulqndq+p7dYzEYWPzgllOc55TZTypfRn5gFou0QvEIE6/aFnGfvzn/ToXZRKidGNjNyhM6eVmA8bQ3GdPyIkOowpJgl8RWUSMZGWGxdhjLhFoWT64m3N78NflWlyEtOAjv1c5x55aBcVvWPwyfhDqClXIi2gJvniOInVt1wq9C67PXkfID9iFwxdhjJeD3fn0HvTr1+7CPDUNh7xKVOjYAAl4HALUir9Xw1PjKv/vmqLGvSvY79xf+SrAkEWvTzGhsplxikqb8N7VMcZ18kRR/57n6mgyn2xTCKkC3HsUB/8Kf2mLBrf5rumP8S5cy7Nj+IeF+KTboSrXQU9/pWxbb67xNsh1Nhz9eLbLNcAH4QJ56A3L897bAl+pg30GFdDbdki0cy/Pii0mf5xCDcIv+WGxejlDk0MMzh7dzKZRpaUITlJTJYcZ9ww7tMmr/Wna</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
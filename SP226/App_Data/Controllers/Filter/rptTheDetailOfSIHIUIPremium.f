<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="thang" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Tháng" e="Month"></header>
      <footer v="Tháng/năm" e="Month/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Chi tiết theo công ty và người lao động" e="Detailed by Business and Labor"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="282">
      <item value="120, 30, 40, 30, 100, 100, 130, 0, 0, 0"/>
      <item value="111-------: [thang].Description, [thang], [nam]"/>
      <item value="1100100---: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110000----: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000----: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/jKkG5+juQ32FWoXv5ZUqcZyP6djEjx2RcOK6rJ3j2WiHYg4lTEY0SdMoEjLAkO1WyI7Or4Ph3q/iQIZCkUfR45UIpo8/OszfhU79Y/exZmV7cBXDqfQqNlPW/zqlSJT8gXuWc4OMsJ/bXyPWKnczVS5S7YvdTIkUKyhzGkFDiopeXjM/Xxo7NxRwMQOXgmNw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpG58M8j4M/exu0F3QaxJyg7CzRmOI1c+V537zDhYve3NaHLYpJJVw+IlCSX6HAFvA1OHAsPZo9op/zb6kBNffoPg6mMK4TrgKgHEhFYQzXwJJHEtJo7k5atz/oOUd8pE1FUjwGK82BVN0HP+rM+ESH0TeT7l4dgUTGz9CRVR7/Dn+QD9aSA7+s1kRLSzKfSwSI3qmJZArJjczbGd39SoYQgreK3EeUsjZLupLIZ89rK6/S8Qh5rdFtfFT2fSG8EUwmrhAm00Eot/Gv+RVsvnRVi+K6Xc4kcRKmuyNlM7UrEK/66imN4yvMHqJLU4tKWaIG0vN/Fw8ADjKzWTSQ2ySsGlzkvnNI1F6cKCQ7RVSwwArE/9w4nmNvRK4eDN0Qlv+c5T57YKggmmeQ8WlfVMsfLFXO0OxHrJs3niruhDA01fh9mw4IJ9r6f1molz40jAAOeBV9ZZLi5yu8jpAzhp+2f+/9lq48+souVZn2YIEFvTV8ds4/NR2QlqOI+H22g9oPNn+5X6DxtprW2v2hssh93eVGebKABpZr11SflP1269kUUghVe37opEjZYyuHtXa</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY CostingUnitFilterSetReadOnly SYSTEM "..\Include\Javascript\CostingUnitFilterSetReadOnly.txt">

  <!ENTITY Control ",@$control = '1110'">
  <!ENTITY CostingExternalFilterShowing SYSTEM "..\Include\Command\CostingExternalFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY CostingUnitFilterRespone SYSTEM "..\Include\Command\CostingUnitFilterRespone.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ/Năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Đến kỳ/Năm" e="To Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam2" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_loai" allowNulls="false">
      <header v="Loại yếu tố chi phí" e="Cost Factor Type"></header>
      <items style="AutoComplete" controller="FactorType" reference="ten_loai%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l"/>
    </field>
    <field name="dien_giai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" reference="ten_dvcs%l" controller="Unit" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9Z6UP6zpWBOTFy2wGWvxit3Ff5Nh8jMoxLotWzVzgBrkQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="hien_cp_sp" type="Boolean" defaultValue="0">
      <header v="Hiện tổng chi phí sản phẩm" e="Show total product cost"></header>
      <items style="CheckBox"/>
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
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [tu_ky].Label, [tu_ky], [nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [nam2]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1100100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="-11000: [hien_cp_sp], [hien_cp_sp].Label"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &CostingExternalFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+74KXi5kE6utKDVVixC3CdK+vki0J1Lp5rAu2iaOiveOoWfiTU27KftFQozHWR+Hw1ACYGQjtHtq+9H/+h1muagt39QYuaIVEJZieZPN7CVjOa0k/xTKRvlsF9oxRjZwd55Z+D63LgaHZRmxCf7rceu+eFSaKlLvM+4u/vHKRqNGdkLUBCOK8kgNPcJkNcUK9ciL7FR4Ay4ELSBocS2RbIT/Md8atKCNGAdpqti6QWG+w==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &CostingUnitFilterSetReadOnly;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKx5zU/IemPobMgthyfNBoZh5V0wbvlx6QAU7VrRjFpihjaTtbhXFxw3OF0vCZNVi3K5RmvRr5npSZvrcKewO3U9wxAr/ijV5lwjqZYE4PwSmoY2l092o7P0Eivt2SkcDqco0cixrFbKsgYwtkek/9utIJUqWJ+zIgv7yrB49SPhyu5wuDkFsi+XQqrTVbgyufyqpwm+v1FplKD4QSbnpO507z8GGP94+WbkWUCtOKpYNdp6JZ+cXGhER384cAnTRL+CLDlzOPtovpd4iZrC7XPnEwEKRl9BaCcDALFOUhzucBAjHYSMIhaIQihmNEo7QkqdCjatxpH0AnXc71gtZ3ISDuXI+ZE4FWAfm1CVNPWIIRPJ8Y1zt+OEkmjNeRerHO8i3o6gLGzgL9dkhVXp9Ni1WaN7C8LZNkGhPh+Li+dESG4n4JLf+qATmSGsBy/Aj1xZM6b+QpoCRsjg0zSLl8HJsslzClBLVGcSirtIxQYzehl3uQxdMO2YB+szhIErx26PoQOW++n719MHHpXmBcoySLiucOKWcv6Q6i8URg3VmQdFKAtW4Cscdwx4PcAZmYJg38U0/UNeg3T2COhNT9QnyV0tEeBUdOF8inwl7x2evHjPuVldAgtc1gEuFeyr7u54EvMl31lnZHLq71s3y12OaOZlbXHKCGfxxXO1wFGAHrt8V1WmobuNGlTATIgiygMVR+qN/d2cDZ1FRBihU4RGT5M7SwxY0ilNfEH/MgvkfA==</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
  &CostingUnitFilterRespone;
  &OutlineCss;
</dir>
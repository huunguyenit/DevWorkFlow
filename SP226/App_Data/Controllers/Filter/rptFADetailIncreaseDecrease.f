<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_loai">
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nhom_1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" >
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

    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tăng/giảm" e="Increase/Decrease"></header>
      <footer v="1 - Tăng, 2 - Giảm" e="1 - Increase , 2 - Decrease"></footer>
      <items style="Mask"/>
    </field>
    <field name="nhom_theo">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList" >
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại tài sản" e="FA Type"/>
        </item>
        <item value="2">
          <text v="Bộ phận sử dụng" e="Using Department"/>
        </item>
        <item value="3">
          <text v="Bộ phận sử dụng - Loại tài sản" e="Using Department - FA Type"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111----: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111----: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>

      <item value="111000: [type].Label, [type], [type].Description"/>
      <item value="110000: [nhom_theo].Label, [nhom_theo]"/>

      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+74KXi5kE6utKDVVixC3CdK6ZBEtlDIlF7Ri7WQ4NkcxcVZKZRsRbwdwFzgF/uaXQoMm/Z0Rjo2MDDGInBqfPp1E/c1k7jNq553H0iEDDloqp6sPwgy26c7Pig6PZJCMQFhuvOdV/DIYoc1XWUK/JHhGTXTr4Z0lzHbV9902VQJSrOh3P6yapJtA9zqFbeKIXC58ynEGxSsw/FRzQM7gutuO+Hbs66x7IAL0JO4KFfG6gg3nZbTqqKKAGXbs7ok07jE2Ad+Z0rXzrqXhwXjeRjCRdcdNvpM7o++LgvoBA0CqoImlKslGp/74QMsmA9i9OHG/xTV/nrZGlumyc0CNVVXKZZiVBcn0/P02Gd/P1ACww==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzlom/ZibwT1RDo95di5msVHCyPErcrNMbewXznlm6nanMXTap1mWWJVHVnpwfjnBq/7x/vM4w7gmA70hksb9IpmGKDCyUPiiffMn/kcioXY+J+iuaWIa/Ave8Rp1whvWdqAT6FqzQ4fjxpkuOuWPSQ+W7BSlWxfvx2+7bdUArf0wec98wHpoBFwB4ZpROqlJVwfrwn4VIvPtWFLWjC+BrDj1oTL0mOOeb33MQKXcWjDmjsKuL8v6+PvKyXA/tkxL+LGEuzmpgUAzJXpANOlAYkiOY856XsPb0GjeEr9PTiMEcwodVTy386PduQFATrGB4xNXCUslByamQ2BMNU7KPyaiiOgOB0cfV/NADulUg8EyfyB57PQ6oL1YN8tMC7VgNbdE5Mv2UGdgpjX1gJXwkCy9dqBV6BfOPFPmtm6tWNuCgOSIHtwbSq0OMVO3QQuA1jubdltV0I/m6VtEFI8XlpkP4WymlWYjgFbZuIYO7QhvEW5DD02xr/QUfmmLNmxFQA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
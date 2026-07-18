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
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào cty từ" e="Date in from"></header>
      <footer v="Ngày vào cty từ/đến" e="Date in from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào cty đến" e="Date in to"></header>
    </field>
    <field name="loai_tn" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"/>
      <footer v="1 - Tháng, 2 - Tuần" e="1 - Month, 2 - Week"></footer>
      <items style="Mask"/>
    </field>
    <field name="nam" type="Int16" dataFormatString="#0" clientDefault="1" allowNulls="false">
      <header v ="Thời gian nhỏ nhất" e ="Minimum"/>
      <items style="Numeric"></items>
    </field>
    <field name="khoang_cach" type="Int16" dataFormatString="#0" allowNulls="false" clientDefault="1">
      <header v ="Khoảng cách" e ="Step"/>
      <items style="Numeric"></items>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp1" onDemand="true">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_nv1" onDemand="true">
      <header v="Nhóm nhân viên 1" e="Employee Group 1"></header>
      <footer v="Nhóm nhân viên" e="Employee Group"/>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_nv1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv2" onDemand="true">
      <header v="Nhóm nhân viên 2" e="Employee Group 2"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_nv2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv3" onDemand="true">
      <header v="Nhóm nhân viên 3" e="Employee Group 3"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_nv3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai" onDemand="true">
      <header v="Loại phân nhóm" e="Category Type"></header>
      <items style="AutoComplete" controller="hrDeptCategoryType" reference="ten_loai%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9Zrik5qNNm9lOOYGrFCPvBbdWdZyxxTsfeMEIxRiZjMzQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_pn" onDemand="true">
      <header v="Phân nhóm" e="Department Category"></header>
      <items style="AutoComplete" controller="hrDepartmentCategory" reference="ten_pn%l" key="ma_loai = '{$%c[ma_loai]}' and status = '1'" check="ma_loai = '{$%c[ma_loai]}'"/>
    </field>
    <field name="ten_pn%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_bp" type="Decimal" dataFormatString="###0">
      <header v="Bậc bộ phận" e="Department Level"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr1" onDemand="true">
      <header v="Nhóm vị trí công việc 1" e="Position Group 1"></header>
      <footer v="Nhóm vị trí công việc" e="Position Group"/>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_vtr1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr2" onDemand="true">
      <header v="Nhóm vị trí công việc 2" e="Position Group 2"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_vtr2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr3" onDemand="true">
      <header v="Nhóm vị trí công việc 3" e="Position Group 3"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_vtr3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>
  <views>
    <view id="Dir" height="282">
      <item value="120, 30, 70, 100, 100, 130, 0, 0, 0"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1110000: [loai_tn].Label, [loai_tn], [loai_tn].Description"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11: [khoang_cach].Label, [khoang_cach]"/>
      <item value="1101001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp1%l]"/>
      <item value="11011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp2%l]"/>
      <item value="11011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="110100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="110100: [ma_pn].Label, [ma_pn], [ten_pn%l]"/>
      <item value="110: [bac_bp].Label, [bac_bp]"/>

      <item value="1101001: [ma_vtr].Label, [ma_vtr], [ten_vtr%l], [ten_nh_bp3%l]"/>
      <item value="11011-1: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l]"/>
      <item value="1101001: [ma_bac].Label, [ma_bac], [ten_bac%l], [ten_nh_vtr2%l]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyfhDnNMf1Xswv69ZqyKYqaD+gnyTK1Gh1WToOvfnHArpK+wxQloZEMdL9wkpUUcLJcDv0/doNb9J4r5q6fDapk3cLYlzQQwOh8bP1/IIS3T1TQOOI7xM8cxlTrkXEXndJ+l0riJPao1b6yT9dmjFhmMIdmDzC4tq0/4KpP1Kr3nL9a0mN/JhC07tI1wfhSFUF+pyAVUtQlErPJFYbXVyPUjXYWtmJqHXspBBDcOSIadGVXuqmFzwrwgmlJt8sWWDZdwIg43i8UHlQi4Nu4FoQMMflNVMBeH5tGJfY3UDYVM1LrGASquR8lSaEpmtXww58AbTQiWw6zx+pwjFoCRWcKcdMv3XpBbtCWwWMNI0n2L60kYQrx4wO1U2ZiwltpceC9H10pQTaUnWbLgaGXKsV4i9xJ5eEgFB2pNxeibZZeM/Nu/P1yl966jO5xlnG1GfKkPkro44JzPhFTA4sAlsmyQ6uy/lhle4MMz1OIPxdEwQyh8eDF6Yyl0ns/X5+n/coq04OrZvYKfeGfMYA1209Yr8h3kw4y5kue/OUe/4oPLkDwgkjL/5VS4ukPyT9tgj73IhUe5m38pc4L+cwRhd0svcDiwC5KPajFI3smd8clYwB2k79HDXdwh1EQcH4KmYiVgQ6pbUV/lFcKDRuq+QMI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6oVqgI+1J5dAPNfBxh9Xe9bz2DGQj65H0UYlz57mw8KYrafXX86VngGoLj0XAANhBVRoFuO/HdMgT9QfsBFcTUnLdKDPz/32ADJtixkZ9TkXv2ZnVDaStb870j9a/T3/2tsRP7lvG2yXvvLyFzYR0UN1uDFQaAOVa6StjYNkHgR8vKDeGOtsW00qHUZKA9P5xNnVcrCti101nH+vJSZl4AKTANFesheDlZXVBZcpJyDCtyctm89HiSJ0A80l9Kh4Kj2zoRQKkV7i694FB734WnoWt1b6XQDE/7byDWyUGh3CbOanF88DwlLRryG64mMa61sALxwOQ63WeAOdX5cWnyaBV5j1EHS3eE6TAJwHgjzG3/T+qp9qqbjcUM5E4WvHiJjqV4McPV/X0feXvAzAdqgJ4Cip1iqmbLqDIooAGZ6CLkkWYsynafTe4Tq6P2kPzqL9y04caoZrBm4wy4nyD2mFTOhXOTW7PzndvgZ1BUQg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
  <!ENTITY ReportMarginViewValue "110000">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_mo_so" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 100, 100, 130"/>
      <item value="11--:   [nam].Label, [nam]"/>
      <item value="1100---: [ngay_mo_so].Label, [ngay_mo_so]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginViewExtend;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu36ECrgFJlVWaQDXBmEeq98SeIoo/lWQEIpFP0B8lmq3+bz9CQmx6jnTq5fRY8q+RmMrWd/SLu8yVzY2EfIcEWVHL2A4oiQGFZ3fNuv/9pWDa+Ud/2RjLNsMzjyNbn8eMEeZye0txDpXItWovchAHLsFPPR83+OAF1E+TX2s6icQ4vYGJbbEIh0ixAGfbk9g5PQrc1G6WWV4lh+2dQ/qTgaQD1Gb2Wxldq6DKXIH+ffeNCdOyO/zQ0wroDQ4adHVs6+97qTuxCS3vsXqpZQmi7zqMCJyqcDfWXB/wB8P28jj3kOqFa02luh7Xbl7P16ml/EER1zEyTsSwnR7shNYgC7FlgyMcoLB0nlODyMW4FL6iKBeDEL7G83qUeXud0WhCmZ/jhwDL3AcyKTzYpWutcw=</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzmi7WXJlolvPsln1aGLnWHDtz2jCzVRWcG5MhLGNdjxfyuPd/BstrV7dDddUgUGCWcAJczhka4/D1iYJL6PBIffDhTSxpV6JpU8S3WvkyGWvjE9HV0TMnH3+wf0zzOLKnUmTOy0TpY67qRhIVjKJ6JCma2XGz1FqnNx+Wi2CyIjXz92Dd1xGsYPgVT8dCQ7/8ZIZuQsTKJY1i68vB0TqbKTOIK/+4BoIyK62E0gqYHm3a0tnT84TrCncxR62hdxQer2zRDoz7P/aL1hNf5/pbUO67xjgr0DIpkfCqQdQUrgsT3x+vnDQTIXcKlt62BG7Bt/eFtzgWlkBvg1cIMHqcDJDx8OvZWdX4b6IbzQZk0fKyj2lpA/3ASbcdex/Z50eO5K8oAZM3+70RrU2ChDgQX9UtQ4CUnP2rlYUJzlzXHr6WhKDWv5jqw1oQfHNvGWY15Yc1sJX3oyAEuIl/D/r5WfJZ5c7ZiD7uzzPFfcqQ1lc</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
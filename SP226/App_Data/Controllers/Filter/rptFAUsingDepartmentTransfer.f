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
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai">
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'">
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
    <field name="loai_bc" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại báo cáo" e="Report Type"/>
      <footer v="1 - Lấy tất, 2 - Có chuyển bộ phận" e="1 - All, 2 - Transfer"></footer>
      <items style="Mask"/>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 200, 130"/>
      <item value="110-:   [nam].Label, [nam]"/>
      <item value="110010: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="110010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110010: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110010: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110010: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="11100-: [loai_bc].Label, [loai_bc], [loai_bc].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKBqqJeBFhuOpLkf5Z3TI1FMi6ntas/anmI3yjEMXoqQ+n8DsHCFhi2d9xcLwreWh3G6l6nJvP4rVxcck8ggOI/YKnsCiRtS8Dm2vS5eTxhNVGx94XxO5oJhzwye6znedPvj+4YMTnMw4+RCUQy4fl9sq84SvHXl20rdMTbJY6vBsE4mbvwmz+4X6iwH3izw3A==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzmi7WXJlolvPsln1aGLnWHDtz2jCzVRWcG5MhLGNdjxfyuPd/BstrV7dDddUgUGCWcAJczhka4/D1iYJL6PBIffDhTSxpV6JpU8S3WvkyGWv0jnrUIQvlZnhwQ6bq7I5CK+mcZ5gqnERxR2W7tLP6JlfcAfcfeKUDt31uY4SIbm2JL7YPYz0vP2ig1CnzIxRatoHwn1AN/bzAnoQLku2ViMIYSPX/WIvXmZBxLZUQdGf/+WtD0TGcVD0tU2bWIrQSGlWQay3Q7Qq+Cxc+6BVpsU4YEN1NHyjzMtPfs+VeiUZGcIgu343EMTU7CYpFLqoI2wked8xLtlJxt/S6jUIG/7VYjN2GSE7lnVxhrO1oueatcVekEEHE4DveZuCUMCk2D9ywcRFVHwbv4f8gPICLF4=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
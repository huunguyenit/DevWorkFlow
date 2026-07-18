<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
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

    <field name="loai_ts">
      <header v="Loại tài sản" e="Asset Type"/>
      <items style="AutoComplete" controller="FAType" reference="ten_loai_ts%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_loai_ts%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
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
      <item value="120, 30, 40, 30, 200, 130"/>
      <item value="111---: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111---: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="110010: [loai_ts].Label, [loai_ts], [ten_loai_ts%l]"/>
      <item value="110010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="110010: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110010: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110010: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCrCL8dvQUbsLGGckDfGKLjFI2HiwRHATBcI42ukMzuAXu/fYpuc92LpJcUwVWaVdPuJ9a8Bn95ET2O1L5jDCbEQfA2TlnZz6vteJn4lzAZtqbBrnM3y6MYKz9fJ09yFiSOBMtkakaOlphu465t4rCkQnl2n94LDPeKdpSNa7LiWeeRzCR8uum8tq+xyQrT/Jw9LBtbXSKUNwjU8TLztbTB7v1QFkBkJ5wvZmKeAvvsgGOJ6uT9e8TMLETt8ggopemskM4v9tzDGtXBXJfK3owg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzlom/ZibwT1RDo95di5msVFHmufPKnBbcngaIivFad6ZB2FMh67lVJwbzbF3atwmp5MCWXcdHaATaGVvorpopkLEfGNPFKu1p5e87032zRAUVks/L5nJM0XO5ostSKss/IVUIcCmUif6Ga1KOLLal/aNyFBMToN/S1r5hEDivaioRdCFiT8SccQRXJXXyBJE2Gw32MY3WVj6wKz9p1edmjNcmLXUJcm4LJmAMhtIYCn3DaxAykwzDroouJky8XNG2GjZvFH01Byw28NoIX3QL4U0u/cAsEhQomQ7lpJoQcFY1mzwpJ2oskbifSz0nhBKH2FTsRrRdDqHLeIkjdFIZXZpwe/HqNiwKVDLXgXEBZDvh7SFjR+lj0lS+bcEaOeUXwdKWTxMxQO8vBDuNVRkjEH4kqBEFtuZNMv9mo2mj/bz</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
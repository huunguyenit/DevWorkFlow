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
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dau_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"></header>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
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
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="1110000: [dau_ky].Label, [dau_ky], [dau_ky].Description"/>
      <item value="11001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="11001000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="11001000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="11001000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1Z8DwWGvVjzz8J0guTsOoclIgELzLklmxggqSkTrixtAn6YK77PtgMqAyS3nlgYibMRoNaEDAHYwNALTp5sDBDKdSOILsLpNM5+bxS2fgOyl42DvVvfJjGw0xD+6041df5o/OUQ/Ap1NC/HEnmVQ0fcTkxWzuIJ4hRIbUGIRHluplHr8l28QyEp3MNrMa8L+8O8WtFKvZZdw6dPNGN+KFRHQo2clq62kH1puO+ErHWN3pgbJVPT8MspnTSV//cZkDPzv6geEdYmL5KXVPfCfBaTYslvzPa4mGnTgOuYa50y6rIirPczGNbSs+gqZXeXV1E3gN8Xu5bgVB4BQ1qnRJCGmLGEAyrnDw45eTexDcAawzHDSsxDK9MdKKIBGk/2k9cxViBlcaYeBe+EyR6DFoo=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAv11pTV0o8Ksa6RoUBgt1lOAu8pQ3kvKhbr5smibnyDbxakje+IGL+CJUXyXM63i3OitP5K+YJBbkQPKskxpKa0LWobfgmsZ9C6cL6U2Fg7Jy3nKd0gzGJJFzM8zH0e4s9Tv/LETlDj8mosnZTSBymow4gPGEo6mcgEqgta3S9JGgnt3vso8yfWOm/yIjTRwZpJvb/g2zjCNFjMVV8kQDoI+QoBcL1UA3V/Kr7GRtaJ4WCmSzKFQZWsIZDJD4ffTln/h7PUudDXXaFfnTz8ziClYKDlh2UzDWAhzhyxUMhVfkH3g95ybVSYIqU9lNP0YfjJNIWwYMyzzqFgTQwStOvrvfDVHwgcl4Mm5HuHycGiHq3pe+7/seT96MHu0rYGrYNHAcoyAxdyZCg6gdJtTkshrS4CowD7Kiu5HVE3TXdj0saIkXSWLXDf/VLZW12NhOrb4Zsk3wWxjDUf85JYi3P9cWhVIqZOgeqkVlfj9pCEbm2UYiBCJW917A+cen89XAN16Tl2ZHrpZ9YoJdzXLFtZe65ghYchd5aKHUNQ7y0mO</Encrypted>]]>

    </text>
  </script>

  &OutlineCss;
</dir>
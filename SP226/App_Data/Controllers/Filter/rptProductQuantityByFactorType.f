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
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_sp">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l"/>
    </field>
    <field name="dien_giai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai">
      <header v="Loại yếu tố chi phí" e="Cost Factor Type"></header>
      <items style="AutoComplete" controller="FactorType" reference="ten_loai%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" reference="ten_dvcs%l" controller="Unit" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdUWAN8Rv/3qEiFFUCguYvduUmqX92hd9FzdNmMrsCUVNE2qZxU+II5PSV+43MbweA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 200, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="11010: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1100-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &CostingExternalFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4Yh0jkrk7L6HV0VzT0qMA5HTcNb7YdTAUQa4MuRCF+2wGK4SBuZzntO9HFoxkP2C24KrdBq+RU5JKIIlGb4H+kXnbnKsHnkMrV6qZ027ieoVbzgcxRXBARgSGS74j47lzh8L01rITHs4o+URG0oVKGjzbgnsXDWuM5H7inYVz4WdvA/7y5oo42Ib1XqFzXAhlbKbh62YlLN+sxfIxa1BxY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &CostingUnitFilterSetReadOnly;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4/hsnZegtNy6p0KShejHlVzs1tBP3KNsbaQQCL2/+8evZm52wttNudKxbt48DGStn8zhORGvZXn/713FphmL/N/PvEXiFJmvwFPkjUpfOdU5K95F3DrwwtsfQ/vZpGU4Es6ILX77ML0lVFfBosMYYgpZJ+c8Vfqg7N15VFHwiGNe2NPtnAP9pOLXDLRJ74hhjnxh1zsr1p7PX9XRg5Gx+CRSCGtQongWbNvuK5d/G7MZJwI0iMVDVxD/4H+fQrKZHDgr+ctDJNBpaeDhGMNrKOfSWIaUXjP/5YTsxcOpDB10oMWlJjfp0u7N9H/TV8PoJ9ai9ny8PehnKT6ACH6utRLAJ614pqGRptqHnf6VDVRKzEWntXwpG3V1s/a1D+vxu5yRFloNwwyYcGBeYuDRLirtQTaFEhIbWsrR777dauphDa8nFdbqVXNAvCy8bPvuN+KyQrDOz4V+8wtosBeSZbF+hzGcyvRbA0V3lg66SHz8BYdFF7L+TmJXb2Vt8IZAhERtXJJDlLcck8OGp1TCu7e5O76nLsWYotcdFJokY5zmqjzCp6U9Gdb7YYKPznYRLhz+YdLWnQ2mMuTsMZpzJgQ87rdeVUk3aaWVlKoKowTXoSFcIV3q41PCX35jjkP2kbczA1fiRNLC6Kz++1EW5bl15zcsibctrB8udj64t2Fqw==</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

  &CostingUnitFilterRespone;
  &OutlineCss;
</dir>
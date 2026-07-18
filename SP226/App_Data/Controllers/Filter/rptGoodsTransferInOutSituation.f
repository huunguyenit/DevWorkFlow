<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptGoodsTransferInOutSituation">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormStockRight SYSTEM "..\Include\Command\GetReportFormStockRight.txt">
  <!ENTITY SetReportFormStockRight SYSTEM "..\Include\Javascript\SetReportFormStockRight.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày xuất từ" e="Transfer Date from"></header>
      <footer v="Ngày xuất từ/đến" e="Transfer Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày xuất đến" e="Transfer Date to"></header>
    </field>
    <field name="so_dh1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Phiếu xuất từ số" e="Transfer No. from"></header>
      <footer v="Số phiếu xuất từ/đến" e="Transfer No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_dh2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Phiếu xuất đến số" e="Transfer No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_vt">
      <header v="Vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho xuất" e="Source Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_khon">
      <header v="Kho nhập" e="Destination Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_khon%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_khon%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_theo" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="1 - Theo số phiếu xuất, 2 - Theo vật tư" e="1 - By Voucher No., 2 - By Item"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101--1: [so_dh1].Description, [so_dh1], [so_dh2], [maxLength]"/>


      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_khon].Label, [ma_khon], [ten_khon%l]"/>

      <item value="111000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbbrp5Syp6f/e3YeiJhaAd9FaR/n1jmzGHMS2OUVGJsS9sI8441xUQbbTUkE0Fm+Hw=</encrypted>]]>&GetReportFormStockRight;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4oK4vNsIHGGSlKfsdiNxhepoS0iFeBjNFquvbryMSM9yIGpezqRHzc039oAH7G0zZCCxyT6+6qkxQIXipGPbxejjReFYXjJPfpoMQI2YeGW/dST8a4saY/eVOhnMFQ8GOWhc9SxUEEzjoHu6uDEKhglEgR1gvhJNJ/YugS+CVIXdxqgOY2i/K9je/rpJ4w/Ef4iYmHKQyvlQdEjzBUrjt5Pb5N1iTMSTVj6a1sAwbs6</encrypted>]]>&Controller;<![CDATA[<encrypted>%yLooQnL9xQeLYF/0lD7Rzu58mhNsDnC/nFSIVh7H/GVkhu8xJuUsfrMgzS3SsXge</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &SetReportFormStockRight;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtfxq8fJmlvt6YL0Qjga92rXHIR+JEp0nGBXovVNo8U940i0f4yOB6w/uoZB3Q6VIzWz9pnsNx2B4bvahZpqWtCTDx2k2l6gSSUuP0RY1sckstRwZduT4cQnQBNOmrI5rJCwNpStzAbj124Fg664t1jI0f21ZsLtCXLCXIH2sQgF5CHwLJIlsk/dL7dUt1516ugTjXAPFi3JEtKynHZ8FI0gzPru/qBI41eR6O6XSjWvXsFVRi8GqONHizyJE65T9jvwkQbLWDjvneaYMMdFDHaIwCuz3FaPtucW83389whhp4KyXYt0fJpOG8HIjENs8B+ktZ3Tu2GbUU30PUIARcjzj8uWE5rhdkNRWbmPNvbevBOw5SkDTqGm0Ff6SYyje+BTPZwAhWfa/O1rxbDZfcUK5hALeKheRMSOV2uojroRkr48SMe+XAnunuWkbZ0oiHlU2ANhmI3WdVzDvTT24D+7ZVUIcZKsCE2F/xpOghNrGoIs8m9qHeEaLxDlUVHVfSRhyVJKUvILdwCvY9yLI2hXnVy3nwdHg6AifHfZebqyLYT5OXoSEe3fzmnvvEfSvgw=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
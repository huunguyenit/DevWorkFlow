<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptInvoiceStatusReport">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY DynamicFieldFilterPara ", '#$query'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="so_hd1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Hóa đơn từ số" e="Invoice No. from"></header>
      <footer v="Hóa đơn từ/đến số" e="Invoice No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_hd2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Hóa đơn đến số" e="Invoice No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho xuất" e="Issuing Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="status" dataFormatString="1, 2, *" clientDefault="*" align="right" categoryIndex="1">
      <header v="Tình trạng hóa đơn" e="Invoice Status"/>
      <footer v="1 - Chuyển kế toán tổng hợp, 2 - Chuyển sổ cái, * - Tất cả" e="1 - Release Later, 2 - Posted to GL, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh_theo" dataFormatString="1, 2, 3" clientDefault="1" align="right" categoryIndex="1">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="1 - Theo số hóa đơn, 2 - Theo vật tư, 3 - Theo khách hàng" e="1 - By Invoice No., 2 - By Item, 3 - By Customer"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="185">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101--1: [so_hd1].Description, [so_hd1], [so_hd2], [maxLength]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>

      <item value="111000: [status].Label, [status], [status].Description"/>
      <item value="111000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130, 0">
          <header v="Thông tin chung" e="General"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMW+XntGmAJtwDWfMtn031zlk778VT9iX7ym32QQ/JIboo7HU+qMiJWXrWvGymdhuV4Ab4l9wZWFNpn1jhADCpCDQfYALfYUX7iz3aB4GlwVPqHCkV12ScgzHUR5DG7A+PnUSV+kpANWvQpQrTvaBobsUnuy4mrpgjzaYzy7fZHiaAEDstQeYpTYN+bEYS+NYwef18Bb96uh2VFVafZWykneaUtpyhf+yUBdq7PnTV1I4gCU5SzO4zOnzd5wWZujE5WMpqig/+IB/MqZOZnUo/KBeQSNJ0LIEIDHeVcDayLx6oR/fmvyuKVSOa8os1QgnajFQ3y8ohhkezTwvYRiaRUGnuFVvJMpzDjvh2DXoUrk</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>&DynamicFieldFilterPara;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9y0QuIYPMIWvLaePUtJ/sEXLfwx3nOXnZzsY0Jgey+z98ooCO5irhauLLOSCF7YJmplstnreTUfgf6hbr58noDwUEHoSvtu+UBbyK2ppK9xQJcVbtyagJEcxG+paTwwXxwLR6pfRZic/nbjuQFomGiPNj5Ku9E4rU+TjqALnYa3Mh3YDLqRkKK6FlUcZTxfThHBA5W/cRWAGVd2cFtymZz6aE+hl8+kpM9kgo/3IvI2MDCQOqN+jYl43d24j/iISPFVhe/VcrqnkQqjkZnA/tl5C0UdRcEeVxPQDXQsurczw84blKcRnehu33BX8glxWoJBtIe/E6a7yqQVAQViHsyaoVlYiJA2btsmOCSkNfKBIldBRsTysM0Fhalh7zm+ZSE+of8+rzkmnm1V9KMCzOZeM69pA1oKQ8MeB0IDVeQq+10pqYxLgg3KYg5rOKC3gji5HFCND39QqGGCx6A9QC6MsCOkantQpTBcnz1OGWY5TbdkpNdAnvrCj63ckKhwCSCdS2IHvvGG5MCIxYlTvIuAjQ5xVCr5SKTpBK6L/jzCzmrkZrFGzatncC0zD1HWOm1kAomrGqP6BmzVgttxBrzL2UO+ViDYd8HOR9ac7CQJwdovm+YRWmUDxwQE0tOtsR+NIpLkE1qvlN/KrETv+1TalrKB1rLHUzSbfr3ofkqrtQj4vDnUhMdpMDGW+fa8Ip1RarHv4/rnThcILIZtgbTzDtAloPr7Fm+OxD4Kk94iI/EXE7RUjIWKC9jEw4RmYvoItvHssC6HTKgzKQFEZ+Oo</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
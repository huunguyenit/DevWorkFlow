<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY GetReportFormStockRight SYSTEM "..\Include\Command\GetReportFormStockRight.txt">
  <!ENTITY SetReportFormStockRight SYSTEM "..\Include\Javascript\SetReportFormStockRight.txt">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="Default" defaultValue="2" align="right">
      <header v="Kỳ tính tuổi" e="Age Period"></header>
      <footer v="1 - Ngày, 2 - Tháng" e="1 - Day, 2 - Month"></footer>
      <items style="Mask"></items>
    </field>
    <field name="chu_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="1" allowNulls="false">
      <header v="Chu kỳ tính tuổi" e="Analysis Time"></header>
      <items style="Numeric"></items>
    </field>
    <field name="so_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="3" allowNulls="false">
      <header v="Số kỳ" e="Number of Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
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
  </fields>

  <views>
    <view id="Dir" height="186">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [den_ngay].Label, [den_ngay]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="11: [chu_ky].Label, [chu_ky]"/>
      <item value="11: [so_ky].Label, [so_ky]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormStockRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAinW8zZxXCDY8N+40iMgRLZv8K8dhCPgUhOZ0gKG7hb1B/qav+kjgIPlHdS2BgFhe2vHuhT868Npn4gQcOxIPQYdJ5RA3vCGrT2gC9dNBYIaGXRuifzGVtRfR0+AWG3rk6lV/RX5XNp50TeRPs/GSTINyGLPQmF/CCOkqdGhjNMeaIf1tha44GEcWjJkOWrX5D+/dAKuj2EjmH1kWiU6XeeeFWca6iKVnVWYXVZrHOrt0kdEXBSj/XESIoTtb6dLaUrHzGLCdLf2bx7xSUle60yAPkqQ3rk6CWa56haiXgr7gR8/8MGP6XOCNBXtO7Z2oXfA9DR3nTktZ2wa3df/wQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormStockRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAlKXNAh5uHC583Q4ZjFychAgQe4IfG6VYQhdmb3lkbitieD4AnKSk4xOkcNUl5mcBb0+MFwOiBi9JHllnXARQBSW5xQ++lGR+bvrdZh4wSM2f/Mk1dEGYFI28HAExSJb6MiZPPLJqGHpuWhnGcymRWx2emxXklwztfeBZgQ3w/arSIwDFso2N+iG5fmAnwqNGJRMawB88bo/ImVjyBuxPyHV6ieS7WuQStlBAXUkhlKfvLJVwQX3mmGmAFLGBwGd0VqvDkSKZ2hZzjZQtZOB+QqykFkXAXNQoD+3mLOxGuQ5/MK0iPWc0MYULZsP/ZaL14h7OdG9uQ3W0Uy9cs/T5ys3oAG0Aq91+rQcfJ4bwYwMUCX+qbSuDq/erObvXahYl9WEBtgcHYOPrXHzxcme4RE=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
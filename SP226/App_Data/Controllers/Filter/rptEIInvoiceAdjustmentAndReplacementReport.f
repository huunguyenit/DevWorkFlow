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
    <field name="so_xt1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Xác thực từ/đến số" e="Reference No. from/to" />
      <items style="Mask" />
    </field>
    <field name="so_xt2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="" e="" />
      <items style="Mask" />
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại hóa đơn" e="Invoice Type"/>
      <footer v="1 - Điều chỉnh, 2 - Thay thế" e="1 - Adjustment, 2 - Replacement"></footer>
      <items style="Mask"/>
    </field>
    <field name="tinh_trang" clientDefault="*">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="*">
          <text v="Tất cả" e="All"/>
        </item>
        <item value="0">
          <text v="0. Chưa xác thực" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chờ xác thực" e="1. Pending"/>
        </item>
        <item value="2">
          <text v="2. Đã xác thực" e="2. Released"/>
        </item>
        <item value="3">
          <text v="3. Điều chỉnh" e="3. Adjusted"/>
        </item>
        <item value="4">
          <text v="4. Thay thế" e="4. Replaced"/>
        </item>
        <item value="8">
          <text v="8. Chờ hủy" e="8. Cancelling"/>
        </item>
        <item value="9">
          <text v="9. Hủy" e="9. Cancelled"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101-1: [so_hd1].Description, [so_hd1], [so_hd2], [maxLength]"/>
      <item value="1101: [so_xt1].Label, [so_xt1], [so_xt2]" />
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11100-: [type].Label, [type], [type].Description"/>
      <item value="11000-: [tinh_trang].Label, [tinh_trang]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQTkrMbhmDd1bdnSzWA45DRdbCkc+48Kp+QKurUY7l/UEEFeUCSzHGYabSlh8e/HsAlbnfwsirvxwLzmQ7QnMogimNdyzR1MXi97JpwREG/tLPibzh80ulgg7UymhaYMqcjllewIcrvrDECr59CE82F6f7MoCDlXMgrUXCtQqUCTp/f3OU8kPqDFYXYQezGT/jGN0M1X2Vh3x/v7hyHwZFePhAGfmJIOCM+26+KxErgq4NSManb7BLODBh76aOBE/4=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKwcL4fHJYjbClncl285aR1NeKQrGRuiCmEKXhD6Tkzn2HL743GGT0H+UQ2Bx9sp4vtgLcZJ4a66+5V1oFaZrRFt9NaTVZ8lcX1c8dOJvsLzwaTlPLbWKtPBO3QbrAYNjDHDtzgsSYVpIhVhHeYyEo2LNbSTroqH2oHZhlT5cadEq2F/UtN1A+yjtesuyYCMdeWRz1VSPE/7QPlSU+UJQxaxpnk6pf+VRZjgL/JC/rn+GsRPTMYXR161f8P45PRBrOQShSHsVBTnR2XYowoMutwHK1epPkhF+VSSDklt7mnM5HRsb6o4W6ImBT1PNX9qJl0JTsHAtwNK+qGant29qFkXg2+x8DKXFEo384AVg3QgTiFdY0JLyqvoYuGmNmmpVoOvXZN31SRlK5E7iKWuSEZcSzEwYkJJUXTIBJARYhxY9s4VtNA1FN+RjoEJW00zovhoqo8s+T+B4X5LX9arcGtiOTWzXF8cwEDkFF3czvhaXkfwaAwaeIR9sqUI3g6c9Gw=</Encrypted>]]>
    </text>
  </script>


  &OutlineCss;
</dir>
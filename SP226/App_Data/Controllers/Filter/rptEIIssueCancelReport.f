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
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQTkrMbhmDd1bdnSzWA45DRIm45dznU0EMZflx7heSDgnygTJr1NMxdPPvbYi7CRzNfZxW+vlnW/wEgJoa2ZqxLhSNPn2MJ5ST5eRKpFtD46RMFydRHEfx/dRz+FbwaTVJA2HUIDNX8p3mNkn7A6mbYxXtAWRkCFbZPuU3/SI2SFqRfZIan+hGkpCist/UWklBQS8jAPf8VjIug0jlQx97k</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKwcL4fHJYjbClncl285aR1NeKQrGRuiCmEKXhD6Tkzn2HL743GGT0H+UQ2Bx9sp4vtgLcZJ4a66+5V1oFaZrRFt9NaTVZ8lcX1c8dOJvsLzwaTlPLbWKtPBO3QbrAYNjDHQmYtEL7El4dR2KlY8gZKR/J/ScbA1PZT5okM93VfEIgynICe0kpLEjTy7C8cs/XkgWutRqRyJQCkMi8Vu8W+SIY4B35fdsiCLp00aOx+yGadWC5Px00y+LAGazB7fJ3/96KDCcz0x+aaSfS/2bWLHb+rnZF7jE9VEVV4F4Xvgd6fOH2VojuEhLtsuVeL5bkOQei39xO0AW8aJZ2g6QNi6</Encrypted>]]>
    </text>
  </script>


  &OutlineCss;
</dir>
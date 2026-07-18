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
    <field name="date_from" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_dot">
      <header v="Đợt tuyển dụng" e="Recruitment Period"/>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="status = '1'" check="1 = 1" information="ma_dot$hrrmdot.ten_dot%l" />
    </field>
    <field name="ten_dot%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" external="true">
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_dot].Label, [ma_dot], [ten_dot%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOfExZ33TM/SCIg1uNlHGL9BEvl81TGPf+5d+1fhBEq9KziSwableED6ckSCT4b+9XpQLP8kp1NQrqN188uarUo13qQ2wry9/vGhRsrqqCYXzwY+qyQrmaLVP5Nnl0uduT4QlNJhIPbGTPXny/vPn3oIbtEWUb0us50D0969ap8ofg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX6vr/CJ7+SGZ/ownc9aCkOiZd+8V4FRL0HPx9z6PKU4m5uOCA1b8QO0HxeV8cmiS8Lt5DeFNwUPuzy28XBhcXMbJ63gMNc00Ump0MF3cVTq2AkHxrHEdttSljjN13/9lrdAdUFoBSOkUz2qwS0voow3H17/B5Nnu+PyeycrZwfKnw9B+YlL6G2ZyFjf00Dej/krmGTngaP4xyTcgWg5O4WHBKoonVV93/AY/5N/6oBDTGAMzhmHu3izHlYY/RB9ih8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
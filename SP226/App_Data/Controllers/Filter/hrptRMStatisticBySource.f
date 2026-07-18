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
    <field name="date_from" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày nộp hs từ" e="Date Applied from"></header>
      <footer v="Ngày nộp hs từ/đến" e="Date Applied from/to"></footer>
    </field>
    <field name="date_to" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày nộp hs đến" e="Date Applied to"></header>
    </field>
    <field name="ma_dot">
      <header v="Đợt tuyển dụng" e="Recruitment Period"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dot%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vtr_ut" onDemand="true">
      <header v="Vị trí" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr_ut%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr_ut%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="kenh_td">
      <header v="Kênh tuyển dụng" e="Recruitment Channel"></header>
      <items style="AutoComplete" controller="hrRMChannel" reference="ten_kenh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kenh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nguon_td">
      <header v="Nguồn tuyển dụng" e="Recruitment Source"></header>
      <items style="AutoComplete" controller="hrRMSource" reference="ten_nguon%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nguon%l" readOnly="true" external="true">
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
      <item value="110100: [vtr_ut].Label, [vtr_ut], [ten_vtr_ut%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [kenh_td].Label, [kenh_td], [ten_kenh%l]"/>
      <item value="110100: [nguon_td].Label, [nguon_td], [ten_nguon%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOfExZ33TM/SCIg1uNlHGL9BEvl81TGPf+5d+1fhBEq9K2zdy6Vq0QzNkXSDzPFmA2jC4Su5UMGjIxW6s0EooEgaMoojJc6tbbewH1lZQpivjzrz9S4dVhERupxbOSsCLcLOUjsWTfh036DjNED/EjPl8UbGl4Ao6fLMhh+o+6rEShpKQzwlu9Z/j2mrQA6gqtDpF9oCmDtbBXKmdwHptHpp</Encrypted>]]>
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
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
      <header v="Ngày nộp hs từ" e="Applied Date from "></header>
      <footer v="Ngày nộp hs từ/đến" e="Date Applied"></footer>
    </field>
    <field name="date_to" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày nộp hs đến" e="Applied Date to"></header>
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
    <field name="gioi_tinh" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Giới tính" e="Gender"></header>
      <footer v="1 - Nam, 2 - Nữ, * - Cả hai" e="1 - Male, 2 - Female, * - Show all"></footer>
      <items style="Mask"/>
    </field>
    <field name="tt_hs">
      <header v="Trạng thái hồ sơ" e="Status"></header>
      <items style="AutoComplete" controller="hrRMAppFormStatus" reference="ten_tt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true">
      <header v="" e=""></header>
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
      <item value="111000: [gioi_tinh].Label, [gioi_tinh], [gioi_tinh].Description"/>
      <item value="110100: [tt_hs].Label, [tt_hs], [ten_tt%l]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOfExZ33TM/SCIg1uNlHGL9BEvl81TGPf+5d+1fhBEq9K77RKrWopKk/P8vjSKsAUeiccx+wPBSvnVJ+Pnu93+Iz1TfRKf+R7Qv36mQ2yf0rxyUD1vrG7SBkLEp7VNIYBybRFZCUJ+9FscPftdaz/u8Ufb/QVlHNUtISOM2gA81DLcUBph+XrO4vdPE93aHt9oENVzknByvFHMUvGOYCX+QMPCPnwhES9eC1Xzbx1DglgQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iP7HVMHue95bF+zlx4TNyZf45wvKVGozYXGQlng/Kt0Lc52UCn6IuaISyxAh1rgBXeWOyzdiHvR5F6cfLoARGHZB6IT5VMZNGrJ87ESIijsslLYzJzXoklyym9+Y30vv0xXEAfZXPG8JMne5htnedl26yXU49anPllzWrRC2MjwpVZMvWG9SmyWGx12dGkwL94qbhnWWd8OV0ZSfbEWs6NOkS6xKrXOdrVSdn1xj5dMe9sdjECLb1L8sL/1Tfaj7NnnfQZ9Mo6889feXV8JmHAg0gFj/6u5xpwwnaZAaUcksdkCp5vTpTtPxkq1+aM+u8kMl4sz8ZDjhjWcdALETsbA4yCmb0c1KrNDG9YSVOfgxnyDvGh56JWgFlEmSKH+tww1K+L/+njTW9Wf7k/sfkK5rGr21bvIbxMM/d0yclPauyAm1MH8V1CiLfESZtVQP4y</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
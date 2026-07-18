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
      <header v="Ngày lập từ" e="Request Date from"></header>
      <footer v="Ngày lập từ/đến" e="Request Date from/to"></footer>
    </field>
    <field name="date_to" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày lập đến" e="Request Date to"></header>
    </field>
    <field name="ngay_tuyen1" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày tuyển từ" e="Recruiting Date from"></header>
      <footer v="Ngày tuyển từ/đến" e="Recruiting Date from/to"></footer>
    </field>
    <field name="ngay_tuyen2" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày tuyển đến" e="Recruiting Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vtr_yc" onDemand="true">
      <header v="Vị trí" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr_yc%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr_yc%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1, 2, 3, 9, *" clientDefault="*" align="right">
      <header v="Trạng thái" e="Status"></header>
      <footer v="0 - Lập chứng từ, 1 - Chờ duyệt, 2 - Duyệt, 3 - Đóng, 9 - Đang duyệt, * - Tất cả" e="0 - No Action, 1 - Open , 2 - Approved, 3 - Closed, 9 - Pending, * - Show all"></footer>
      <items style="Mask"/>
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
      <item value="1101--: [ngay_tuyen1].Description, [ngay_tuyen1], [ngay_tuyen2]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [vtr_yc].Label, [vtr_yc], [ten_vtr_yc%l]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOfExZ33TM/SCIg1uNlHGL9BEvl81TGPf+5d+1fhBEq9Kw99Ld4KRcE/NN6HgJTIR6rny3afCiz96B42xIvJYAgS4tJzmDIb0dwc9q9H0NHtJcWCwnpsI9rhE89gkEvPvtTDehHIEdYe9oXaFgiu6kfFnhNRKtoQDf8nUH3CFxtig3jAFrfOqpX/xyjWj3mqGLA=</Encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Int16" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai">
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" >
      <header v="" e=""></header>
    </field>
    <field name="nh_ts1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111----: [ky].Description, [ky], [nam]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [nh_ts1].Label, [nh_ts1], [ten_nh1%l]"/>
      <item value="1100100: [nh_ts2].Label, [nh_ts2], [ten_nh2%l]"/>
      <item value="1100100: [nh_ts3].Label, [nh_ts3], [ten_nh3%l]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100001: [mau_bc].Label, [mau_bc], [keys]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RRSyZ7q4t/WH4QP+FY+c/P7RXDtz/ODku0A6InT4acSU1VotLLW1pKxx8wQe4C7DixwjY4kvVkkhBNC0mV2IfV3KiDM7SLupOsVMVVM9HeQZv8h2caeLdpUaLVoPt7ADv1DkNO9Op+sGy94+Qawlik=</Encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkDov1cHj5PI6sEEw0XuZcC/bQxcvo3Y8Y0QLVGF3pxGo0pvOi6s1IDJoIFkobr9BWBrKRpGOZORfwKYrPPuDSF0Ab+TvoXKcRCYEE67uuDMKQ2QHGZoy+zFqrhfDOU9o231PM13bpvMW8hP1VtDRFLG0MbQGWNpPBUHFVotNe5CqhLznIMGwycEyLgaw6IJsq8Zq7v/mfjjbzyIw09AJ5NIxJ5k6olTdwlO5DEogsAxax4APt3bZEQJrFn6wqGgg2odAktIMNBO85ylfcsGYVftbvfi7NecK28XpsXHkfl/zzuIr/XBccpjS2i2NnUg6X/U4mnqBe0DTtuxJK7O8Pcb</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAv11pTV0o8Ksa6RoUBgt1lOAu8pQ3kvKhbr5smibnyDbxakje+IGL+CJUXyXM63i3OitP5K+YJBbkQPKskxpKa06fdJqJjPh+tmRcpO4JI0Q3c4zZItaxt6Ce7hYTkqF7C2Ubz8AoL7nXoHgCPXxb3+5JHHbZ6xOiXHRhhJsYPg7ckz4mLggkYcmob1r1H7XJtNnz/VKKkuIlnBvAD36CbB2O/nFKq8vIZsk2vJTLJdfzHLRdhOXBpELADcKgadfa7ElBGgQLCAuw/fdgoZEmm5yCSw45/zEzN02jfMkzD0GkiiocI7mYaZEYMPkK6GopS0ti2LoFt18LnQkqb21cENTK/mcpxNL8C2A4bZMQM0alrZwD7EtHjeuMcpZPKbYo9qRiNi0XgHRMJNkOlIoxgHvbD8L6gvDlviql9weusvbA7gkKFyFKSN6fn2WrEdxz3CFpvX2/Bo3SkPcoYHyDfaR4WrDhKiPhCiSvwMQMShTRwc1rB6gXlgbEJt/cUBxVuPQZi1ZZz8vVQJlGCGAV4k=</Encrypted>]]>

    </text>
  </script>

  &OutlineCss;
</dir>
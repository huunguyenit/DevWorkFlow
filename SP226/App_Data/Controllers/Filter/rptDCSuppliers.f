<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A08200\ReportCircularTypeField.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultAPAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách" e="Supplier Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
    </field>

    <field name="isbalance" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có tính số dư, 0 - Không tính số dư" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="kieu_bc" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Kiểu in" e="Print Type"/>
      <footer v="1 - In từng trang, 2 - In liên tục" e="1 - Eject Each Page, 2 - Print Sequently"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    &ReportCircularTypeField;
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
    &ReportMarginField;

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110---: [date_open].Label, [date_open]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>

      <item value="111000: [isbalance].Label, [isbalance], [isbalance].Description"/>
      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WCGZxiuX7895hQTYseD//HvVEiNk3ugCDczk+cW8OmPhUxZGoCUXIryiHqb5n+NJw44yrR2gvBVpjZHZqJxMsLdUueDD+2GpXcDX82+3sohOVNxOR25/5cM2enwjX5kBH2Pnr+fBcG1yZiQKrUHCz5mXtCqjF2gYuSn9zxB5Oqd</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzovGjX8PqAdTr/BMqZOmhD21/kcC4L+SaJqqrhB5BWWvZL9ud38/F4FoVNsFtwoIezr32qRPjDQRKQrSED5B5LSiTQgHGg04u4Jc8em0NfZtMVz+aoicqI+mS+yhdbF/ycNtxqfy/xiwq+kfb9leVw35Hytn7jhIMb9tDuiKfKgZF/t5igXwreVVVp2JYIjn2XzRxTEtk/OYU4ZfHpXsDKeKFKp38mxmEMgrX1YYXb+icuHI+E6pkAWj8Ex1pmrlMwq5ajzSGjpDhoEQA9w+bbRqhecCvgcOXCz7GUTd+KDXv0BBN38J65wfoEiezDrJhbTIcskyRb7Q9t0FXpcN1yN+n5aySi5nBoL4s8Rhnvg2/JxWcwXDUpzxvtUvXH4n9f/M1tszDhtQH6kbRGWyd/9FGH2M+wUUodjRctmpbgJjCCGeEsxApUf2HK03R0prCjQ7UWMnmxbjVQMSRjfhlezr/lGDyaL5V6hkC/1KvJEwc3jMxj8nct2kk5laC2SP4D1et7qEeap8CYTXZ11Cpphx2RirR6vZMCTtS/myJeu/+QXgKckmL1988Y0dVjaCImXKIIcCE+SjA8F5ICU3FpWM5DJEyQcMftQfMNDB7OYZH99m5gczi5HNb8R67ZDebxX/l28UviM/mR79nT7DEFzEqlfhrwGyPpLfI+u2jY9h8nb2ayNQ3El1BntQJEbNihems6IJ6jZAkOrnchUUQglEceHJrX7Z7VncyPcw7nZiFfLLQ+gKvyv/Zd1ewhIjUJrXHYEP5WTQPi2asXJk7kUnZxgacSpXkOs94JxaSMsXjqGZZHKUu0AyFtffRXw+ssYR4YPjV8bijYl+oMFXp1Gsxap/xDDTt0EyfZXWuW8sc2PYCNSypHkAioZF/XAVa1CB33vu3bGt33emfmvwYa1gC9gI6Vy8GQqTBWsG0RILJXLV25klPjS8eAT8kvLerfxH5WM/gtShQcqguVouwnpB5cw+9A5n6vs/volCWJZsbaX9AuteLKcgRjBp3VSFQQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>
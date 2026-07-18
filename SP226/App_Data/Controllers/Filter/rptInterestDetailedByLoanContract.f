<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="interest_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày tính lãi từ" e="Interest Date from"></header>
      <footer v="Ngày tính lãi từ/đến" e="Interest Date from/to"></footer>
    </field>
    <field name="interest_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày tính lãi đến" e="Interest Date to"></header>
    </field>
    <field name="loan_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vay từ" e="Loan Date from"></header>
      <footer v="Ngày vay từ/đến" e="Loan Date from/to"></footer>
    </field>
    <field name="loan_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vay đến" e="Loan Date to"></header>
    </field>

    <field name="date_pay" dataFormatString="1, 0" clientDefault="0" align="right">
      <header v="Tính cả ngày tt" e="Including Paying Date"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk">
      <header v="Tài khoản vay" e="Loan Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ku" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại khế ước" e="Contract Type"></header>
      <footer v="1 - Đi vay, 2 - Cho vay" e=" 1 - Borrow, 2 - Lend"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Ga6Hgm9ZGvvGEmRrkOThrs0CaJNcG/2FlHGilRpcn54W+9QF1RVAXEAKcboE18Wdw==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_ku" onDemand="true">
      <header v="Mã khế ước" e="Loan Contract Code"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="loai_ku = '{$%c[loai_ku]}' and status = '1'" check="loai_ku = '{$%c[loai_ku]}'"/>
    </field>
    <field name="ten_ku%l" readOnly="true" external="true">
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="1101: [interest_from].Description, [interest_from], [interest_to]"/>
      <item value="1101: [loan_from].Description, [loan_from], [loan_to]"/>
      <item value="1110: [date_pay].Label, [date_pay], [date_pay].Description"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj33cdCqc6PCmjEuTsNaDmZWQtGLrlpqXs5aq4r7DiH7VL06Rztb0edwX3906suwlkVSWcO+s6+4H0R627vPxDmP4uSVd1EdP58rB9BzYl2J4L6Rh5HmICEAj0zFRQox+CH6cVW7JnukJjvyDstOJjqTmttaw8G8EWh5HeZ5owUQLMwu7BQN2BBoHxYVyIIZPAHM4IqPY/ewibcxdQhUPyy/qu78VIlSDjpQgRcOmpN6vsPUJJ9NJW/NKgGQO2AL68YyvB0NTWkV6U7/L9ex04Smg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUblTcNy7/zgc8aBm7FSSt5/giBYxf55WeUQse8543Ol94CDbyofOxnNyBw87ecIMoRK9qJLAzMvbsFF01LrZIY5cgU2i5sZSvEqODn2kRJyzFhPqYFZUdGDGNzI2SAlnRB/Gb6u5JwZVxmkVsuM6IY+oG7lNEZAbJQTw/oYUBJ0tFQVaR8Gw395Cx5qR/5ov2FRfUb12LgXUEFp1jObamWgpyLElMPP1mnQfW9T9gTs12q3J1mhU3QtkNeyGu8Gy9zHpwvUSoVoOTyd+e05qP0AkYQk6Z3D7EL3B9OGNOByZWOvyf8PW7jJh9KjDy15qhbWxEAFCttDb29qXDFgNKNM5oU5pB9Mp/GSxgT9g7LcQIk99nmTjmx6ePjVdz8qPdfBlZjvhBPWpN0HHmOImwmrfwy5X2eZiDgy5Dh8mII6sxJvxcryGiY0t8thtLHgyOKINXslX1BTNuthOywPgSV7VSNJRkdRt8VgQncjP+31AguLixW419f70N7uCoyJwmLfD2hz3tW97HRPILA6WD2w==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
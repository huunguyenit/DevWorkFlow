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
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày vay từ" e="Date from"></header>
      <footer v="Ngày vay từ/đến" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày vay đến" e="Date to"></header>
    </field>
    <field name="ds_acc">
      <header v="Ds tài khoản vay" e="Loan Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
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
    <field name="ten_ku%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Mã vụ việc" e="Job Code"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd">
      <header v="Mã hợp đồng" e="Contract Code"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="status" clientDefault="1">
      <header v="Danh sách trạng thái" e="Status List"></header>
      <items style="Lookup" controller="Lookup" key="type = '001'" check="1 = 1"/>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="11000: [ds_acc].Label, [ds_acc]"/>
      <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11000: [status].Label, [status]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOfExZ33TM/SCIg1uNlHGL9Bdz+aiKWIHMABs/k5FchJHT1altx3B4ncw45Bv0bFfwQv5RXCx9Ebx0O/L9SvDGpzShYaP24ukQwJNyZJZ15XIVNAccEI1Oy+MmAISn6IfeCr1QOHKxJTl2WAPwJmrucRfczc7FiQjc8pkMpde5C0bw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUOOqJGZi6LAD63pWGKNM9OZWp591IvnxzD6lFH/PAmfhc+PtMkLmBeO7KRiiLjYBJD8Ba3I+12anyC+WuvJ0ZP3OBDSTHvUFKbWdes+4ODzN5osvpkWJaUT1JWHw1l9QNTlWPqrJLHCdjDmZ1yoPoAu2YRfm/SVYgbUzZMN9f+aQ8Vlq6RaEjeJQP2zKV3+6HZ811h7pYjFNbTCRalfHdUEqvMOcHqI48MLZUjlA+a4oj6lKZrOZ2OaxiMk8+41vNahcoEFVuqnUw8pi//3FJMB0B1tJd2hAJOeM0AtQ2Lzmoc/p2BsXQxmhAt0r/U+SihobT8GU/YP/n7/CtCI4rxXZMsVd26zLY5uvQQfLh05weelib+yrBfcZbAaW4hpGWy4NPIfrG2ntHN55UJDeKej49cNRpO9NVjJpq0JHWmUtSXzHr13Po/5ChL56tRzHA91WlEC7Xe2OC7VJy4jZNbQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
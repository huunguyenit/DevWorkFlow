<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Voucher Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_vv_me" onDemand="true">
      <header v="Vụ việc mẹ" e="Parent Job ID"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vv_me%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="kieu_xem" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Xem vụ việc tổng hợp" e="View Information"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bseyu3udp1J3E1UeJbpMFe+XBSitibBfqVEil94NeMLwsaWlaAPldl6E6RRSZFqBw==</Encrypted>]]></clientScript>
    </field>
    <field name="kieu_nhom" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="1 - Vụ việc mẹ, 0 - Không nhóm" e="1 - Parent Job, 0 - None"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [ma_vv_me].Label, [ma_vv_me], [ten_vv_me%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="111000: [kieu_xem].Label, [kieu_xem], [kieu_xem].Description"/>
      <item value="111000: [kieu_nhom].Label, [kieu_nhom], [kieu_nhom].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHXojy5noBgKx3Sg2+EUbM2JC+T6j2bvYoMZKxvBSdheoIPa90R2KRKxF+7yZLEf1bOV8IZhzlatqRGabnfVHhTA5x5Jw2MPwySx+0ZYpqmHAr4ACqXoP4L4hsmLc+ZehO62fJ8+/3qdJ1w3v6LXfL3xH8bXPnOcaLN2/eu/Kes3kQe+Oh9GLCXrbtkSgRMhMA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUdE56h0QqITUNeiBj4Y/6pGn97JAf2/C7SfNUNfJHvNLjGCiQ2Pk/C0G8MAIYaQlBQ+TGWkgZRjYL4Zopp6MBH9SbRzLm+jj1s3mI4CsquF4a18NjrJzjiR2zYEJgw0y5Spb6uecxxnceK0uNl1viIJ7PW5IbAO2AEqXrpjGAY52sVL5mlDbpIfI6VRXFqacA/GqRxeMbH754Ak8yZ0v4shVrLYbXnYCuFy9XkKKVuTlgvZeF7/CvjsRjf4y7x95665tVfJsyyFz2/BMLCdDpXI/Wd1+0dgETwOdzHah5ZXO4SlHS/BbeYQZeTQpIuli0ja+BjWlcZr0h0Uu6jRFAqdkF7LfnIXYoJF4CAH62bpxrpOQ+tn+FANqYgUMG5yLQnvR07rVK6C8dmypijgwR+BHMnaRLN0haXEOndWV70awnHo+qWmC0jaNgLdXD3G5XZdLNXOSRPq7M4NoOxcKF4O1ehPjH+UiSi7Gwrzmb6MA5ufLCnkjawiBlWkfpBr9IZeFtejGQbV5GgqpewhSG+Zs4v8P1OnPKtRP1xTOQ7U30VX5v1Yu4C12hbGs1nBuKZ7kdPFQLva2xX7/CQdcRXe5NHA21COrr5/eIykTqGmZBGCXVrSdjsRtn5NXTuGSTfkwG65xxmzWw5uzxuBhjYp9UyzMD2xj91h1B5ymcsbLZPykYnNY3Km8SGVOvSXRNfMShuD5GTBIFRIsuA2Z++Q==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
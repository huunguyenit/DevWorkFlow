<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" categoryIndex="1" aliasName="defaultARAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true" categoryIndex="1">
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
    <field name="ten_ku%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()" categoryIndex="1">
      <header v="Ngày từ" e="Date from"/>
      <footer v="Ngày từ/đến" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()" categoryIndex="1">
      <header v="Ngày đến" e="Date to"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
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
    <view id="Dir" height="209">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUnzBTZWbVQtaaaGqIFDfCVJdH4PHp/2BoLXe26PXrbxXzf6uuG7kb0btllqka/+GQrdLAuFxgDvtla8DW2tbp3MU1QCWKFX2EGm7/2amiK98SmZJJ/HF1S5eVPLJx1TpmepS8vrxcBAWM2bklzfoAYmo4vBbY3X89M+h0Q2LzIueLjKWxCvRP2HrYxsmvCGUz8ktiPdXPFcnGNP9+vbrDiz/e5p7sK6VFChThFDAfWNgM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzovGjX8PqAdTr/BMqZOmhD21/kcC4L+SaJqqrhB5BWWvZL9ud38/F4FoVNsFtwoIezr32qRPjDQRKQrSED5B5LQHOjcd2TIKd08i5TiUC/ERA++x3orXJbwwIph65gv6uF+5ucV4kB3CxRYxw/akU8Ew5TqkwjTCS3dJhF6dcGSLAR/fdp/hGELAFuBdTiGtBnUfwjfMCUEdiVsScifXMKq3xtbhhkWa0Us61voOvVzVXmjAwUqCFlkT162RqPbQgd2kFNtIWll22XMWw0zXGoYuS0Z65MNIp7XVe/CUFCowie+BVQznLzZ/gFrJpRZSyYRgoT1lb1r4y9pQfApvbPejmTKui4X1l9tQL3b3TUXz4dEghjU+/NzZw/SsQU0Q14Bv6sWfcza+L12reXQgb9xfV8xvTT+Z8uqiD7NtQX46/cyvcTho5U8eYInaezLik5x69TnlavWp3/+O4njHWUAsuU1jeDUJca1a+pfiGuaLAcDPr99F8LfUlHtF0R3nu7DXKi/u/1vTN1xLsONpWyEH0stc5B1xuDoQR1dkWt0PUQf41Fm2IWN+/V9MTZllmiPJLwdO2qd/oZP5E9xi+UBWqrh2eIITzycJpj74GkNB6Ygsye8H3WkV+MxInoXh847zsi7AcNWu8YO7koT0XkgKqCKunH60H9TuAuzpt8HlMxvXnZX/BDvFOpQ/9IipmskfrX2Kgqmdv0MtrSeu0c49bDYNvF56W9jxu0YmC5p4mTT2m6rhi7uGYSZ2hYw4jReuG3Qn8YP0qaHCqqjcwvha+QouPQxabi3rWV0T+qDw</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
  </response>
  &OutlineCss;

</dir>
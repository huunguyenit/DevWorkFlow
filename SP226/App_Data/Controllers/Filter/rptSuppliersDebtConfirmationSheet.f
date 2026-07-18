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
    <field name="tk" allowNulls="false" aliasName="defaultAPAccount">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hạch toán từ" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hạch toán đến" e="GL Date to"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hóa đơn từ" e="Invoices Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoices Date from/to"></footer>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hóa đơn đến" e="Invoices Date to"></header>
    </field>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn=1 or nv_yn=1)" check="cc_yn=1 or nv_yn=1"/>
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
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
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

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101: [ngay_hd1].Description, [ngay_hd1], [ngay_hd2]"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>

      <item value="111000: [isbalance].Label, [isbalance], [isbalance].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WCGZxiuX7895hQTYseD//HvVEiNk3ugCDczk+cW8OmPH/7InSjCddEEfwF07oSe7YLwkzxUupxR89o2C7CY0Wj/6HGea+0rvbgPIuak/cBeYVbM3dDGHAV8jlL30L1Fa+8xxSHJ3oLT/yLg6Iw2U03QMRISDXGv3XglMZc2KQc1</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdjFLPLSJ4Up4iT+ga4dV+TP0yRIvsXL+fJfS1UvhmbKKHv+SpzPTHcx2bGvSSp8O2vcK7DQpw18np+ofJm/pzsFJg6759rEQgzkq7A4QLcr8+pDGqaLIUm4NdTSav8b7Q1LxeIxDlfL2nPFetqslVuSf8611MwqkeBTH+EtDaI2fPoZtGUaTddgH2Me6GKPCOqwB/oU8F6I1HvZ2tj974RwB0NVNcOuhUuqCMr5Z/6M4MJZFtXWJ3NcFiVIfHdmLZPVzY4D2snOle8kBAu2JIUggNTv8o9KwJdE50WIPQU1fLTntvG62BUc8x5nXxIr8SvXCP33DIghR4cFUIKGxwmPZWqLjloXTq97XApZWsVSF85eNOQnWDrmYeL3GWRtAt7wHzHxN+RP4DC92nxQGGCYILZFHXnQIw5dTEamq1qQ/2+ZBPzHLzv9Q39BoSmNnod9Mp2B08rHGgR7SZmtgwv3z2aHjbWUU/mgf3SparHgn893zInq4v3Vel/d9sS4nEJJgx0Y/KLSMljnvqLvzY0KYzUmb1tSrR8VpyO93nGXt+z8bBM+KPqpjHmAgP4MHDf3eDPCotvcqi/sG2wGomO1iRv644nyGCeg6sc1GrMRrDF3AtScJr/ucQN5pNZF1ojD5EKaW7IV8VOvOzVeWQcwzJ70SynKB6h1yaLJLi4JzCcyKNN1H2GZswWpA41RH0bCVYwawasqoTlASkHH1KHc6+F2xvXph9vbob7g/t5jQnA0L+m8F1oG8014qtWlDkUAsGrf6Y0TPC00liyTJL42hqv3iy09ED0aGjMha6ilrEkg5G+YHTHA3oZQnyvadkr/wOQ9H+6qMTmrLS+IvWEoDd/xM8GMobgGHLEl0QNfbqAf9PLKcyZsOLvAoa8JBZS2JDNRUzTe+01G6JxjBVveASyEaC407Rhw+uUDr0/pKYVbv7ykIjqSvKe2PrgFr8AnQrH9zBjpnRjUFtaonW6fBo5v/kU9A6OnYm81wNKOw/cZpaU1kJM6ALhApGznwdkXXIoRyUrScvCJXLOl8LlGamQhYot0VS5eTG5zlfWGNmML8Tba2yANTAUR72hfbuiTzQZucXKMVjs7dg/VuG9aSb0bZsqtunUu1fx6mMXZeR6E7XrYYbBX1KPn5Sy07/MBuw/ioA2ReXyCDCD8iww1xY+zlsGhBa+z+0TP6IEOYcdtsyYbkhFJCw0v6zZ+c+B6x6SC8lPaZFlf+rJwpRxEKvdG9rGPq6WE+J/zlKeLxjMGpbUD14V847SXVKHREjbZJWzvTHciwABhlNUTlTU=</Encrypted>]]>
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
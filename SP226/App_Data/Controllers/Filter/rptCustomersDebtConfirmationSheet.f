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
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hạch toán từ ngày" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hạch toán đến ngày" e="GL Date to"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn từ ngày" e="Invoices Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoices Date from/to"></footer>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn đến ngày" e="Invoices Date to"></header>
    </field>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách" e="Customer Group"></header>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdjFLPLSJ4Up4iT+ga4dV+TP0yRIvsXL+fJfS1UvhmbKKHv+SpzPTHcx2bGvSSp8O2vcK7DQpw18np+ofJm/pzsFJg6759rEQgzkq7A4QLcr8+pDGqaLIUm4NdTSav8b7Q1LxeIxDlfL2nPFetqslVuSf8611MwqkeBTH+EtDaI2fPoZtGUaTddgH2Me6GKPCOqwB/oU8F6I1HvZ2tj974RwB0NVNcOuhUuqCMr5Z/6M4MJZFtXWJ3NcFiVIfHdmLZPVzY4D2snOle8kBAu2JIUggNTv8o9KwJdE50WIPQU1fLTntvG62BUc8x5nXxIr8SvXCP33DIghR4cFUIKGxwmPZWqLjloXTq97XApZWsVSF85eNOQnWDrmYeL3GWRtAt7wHzHxN+RP4DC92nxQGGCYILZFHXnQIw5dTEamq1qQ/2+ZBPzHLzv9Q39BoSmNnod9Mp2B08rHGgR7SZmtgwtL3lc4/PQitQpQsVjGeLAt4e/jLx1+Whr+QGCZYJdhTWFj/Q386AYVY/5syV6dQ5fpAtIHObGmX/lQgvBnR0n8Ry8i7sKP0nszb/MDLAMeuE3SlH+ehNiVlr7U5kzATGGOQf1+kfwuWZXRIDSNuX9uEj9yQFzXvDWs25qahcUMSYwjE5eyr/AxqHx7xdxMwuthzHQaDveY9UndFCoLHIcJDiOoId0Gm4YOp110Ero46FcPpzPFiZGnKdi/FuRrrjyyoyl3dIoyMEeR2MwuK8uwey/bXLcwMoaSHUJbIZkZf8qWUAadlZGt+aarOLUHQHDmN8LWO9KRzoTdCgX/JydQWwgJVTLzb59PjcXvqRuES1qvO7mqP8F9SPRWPZ2Hf/2jrGZXeYTYEXfkTBbhC8QN6mPD8TnVpDFvXE3kvM6oUU6D6pQ4O/w9uZWIrY6A9t3hd+ttZNvVKQcN7WirzhBpy92UapqNaepdtKr/uIBz3m7yo2wqkemj36iDh+7/ySygENdcZ5zSGLPmgCiklEbH935PSfBgLePyTMdFVvj78BbzCDu+1xTFuuElfMh4gwe+1q9PUZy/fjRw4QK68TvQqMTZHr7KZqHkDlHdARXCloOgcbXizLvr61sXdC+vSKSEx0aqZUgdVoCETk7m/cFOK0c3qazZOzNosKbkIiNOez3kHORR5tmIMQA90TUXm5HOULKEJC2jzhKFdUV9pcMULBm2UC/xXWlYu775BGR1ZOuBaWX5tE8kN4O2T7icl5UIQh3Q/6o8y9YShcyUrhbljVkcbAztFqnYrIEU7tP+MkxQRrveoyVzaULXxY9cYa+DUmP5sf0L263MG3liBcta</Encrypted>]]>
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
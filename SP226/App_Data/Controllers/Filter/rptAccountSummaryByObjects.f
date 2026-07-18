<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY SelectPrint "case
when @ghi_no_co = '*' then 'rptAccountSummaryByObjects_01'
when @ghi_no_co &lt;&gt; '*' then 'rptAccountSummaryByObjects_02' end">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="nh_theo" clientDefault="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Theo tài khoản đối ứng" e="By Reference Account"/>
        </item>
        <item value="1">
          <text v="Theo tiểu khoản" e="By Sub-account"/>
        </item>
        <item value="2">
          <text v="Theo khách hàng" e="By Customer"/>
        </item>
        <item value="3">
          <text v="Theo vụ việc" e="By Job"/>
        </item>
        <item value="4">
          <text v="Theo sản phẩm" e="By Product"/>
        </item>
        <item value="5">
          <text v="Theo bộ phận" e="By Department"/>
        </item>
        <item value="6">
          <text v="Theo đơn vị cơ sở" e="By Unit"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="tk" categoryIndex="1">
      <header v="Danh sách tài khoản" e="Account List"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="1, 2, *" clientDefault="*" align="right" categoryIndex="1">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có, * - Tất cả" e="1 - Debit, 2 - Credit, * - All"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NtysGKANauXvU09qoqGeESGiI42fU+zf1/s/0tiLB+JD8P+GHRdopXECTv6jIfUIw==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Danh sách tk đối ứng" e="Ref. Account List"/>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_kgt" categoryIndex="1">
      <header v="Ds tk không tính gt" e="Non-deduction Acc. List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer"/>
      <items style="AutoComplete"  controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_ct" categoryIndex="1">
      <header v="Mã chứng từ" e="Voucher"/>
      <items style="AutoComplete"  controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nt" categoryIndex="1">
      <header v="Ngoại tệ" e="Currency"/>
      <items style="AutoComplete"  controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="dien_giai_c" categoryIndex="1">
      <header	v="Diễn giải chứa" e="Description like"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>

    <field name="ds_ct" categoryIndex="2">
      <header	v="Danh sách chứng từ" e="Voucher List"/>
    </field>
    <field name="ds_ma_nt" categoryIndex="2">
      <header	v="Danh sách mã ngoại tệ" e="Foreign Currency List"/>
    </field>
    <field name="ma_vv" categoryIndex="3">
      <header v="Vụ việc" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="3">
      <header v="Bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="so_lsx" categoryIndex="3">
      <header v="Lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="dien_giai" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_sp" categoryIndex="3">
      <header v="Sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="3">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_phi" categoryIndex="3">
      <header v="Phí" e="Expense"/>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_phi%l" readOnly="true" external="true" categoryIndex ="3">
      <header v="" e=""/>
    </field>
    <field name="ma_ku" categoryIndex="3">
      <header v="Khế ước" e="Loan Contract"/>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ku%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""/>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="257">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11000: [nh_theo].Label, [nh_theo]"/>
      <item value="11000-: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>
      <item value="11000-: [tk_kgt].Label, [tk_kgt]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [dien_giai_c].Label, [dien_giai_c]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <item value="11000-: [ds_ct].Label, [ds_ct]"/>
      <item value="11000-: [ds_ma_nt].Label, [ds_ma_nt]"/>

      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_vt%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110100: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>

      <categories>
        <category index="1" columns="120, 25, 75, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="3" columns="120, 30, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwKPA9yYc3aN8iIEUXydDksxZ6FpEHcGP1GZATTLXBtIjznF1s9QgfJMTz3GpSUbsCtqWfK2GiZC3A+M/dcKOmPzV8MBUO2jdfLCfG9W3VRyXm5m6J7VnNZY6gZw05rOOw4ZPUNlQdOv6Sh3UJW7dnOMKN0wJoH2lfmzApUI1q4Old4YkyT5f0EVtBHMQe3YBU6fG8F+pJircoeonBiWq/4lUUJKABn2e3dwT5dCNBVl6AsS1WrLSJXp0XOPbtJkoJv2o8XxmDPm+iOQehjOKHdVYzIbU6Wau3VV6GTCWyayGKerIuwXk05BNGJ1jFQDWvNFGPGIMKvx5EnJf8OldnAwf2LVYA4QVsD7LmifhU34a8UDTmFUK1/PjtpQalP02d3BP0YWnZqpR+HqFxewjl6f1Vxm+vXTzoKOyYrTmzQBDqDWC6VOziHVEKXx/0oiiqcsqCh2CRv9gLmAIJZYUDi0</Encrypted>]]>&SelectPrint;<![CDATA[<Encrypted>&4ZPjJCDV5/vla5iUvMOC69Ys8biTa76rm7apntF447XvxwvIj+QiufKiOyQEIZOl</Encrypted>]]>&SelectPrint;<![CDATA[<Encrypted>&4ZPjJCDV5/vla5iUvMOC6y/QGS/TL1Hnzb+wektVlgY07I0oV7J4nBOKCfg5f6my</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UHS3kY3miLmR6xKl1hPCEm53Ik/zlxbJiAV5gQcm/dRAf8nxamzJ0//QaMEiMjuTLeVrTVJyYd+pn1v1InhKftRH1ZQYPmnsQc60otK+u47V7kfzUxJyurwVoIa+CvolMzc8X1fCqmBFWxsixbTfhsMF/dKFbtHAkvjNxoumiZSAMPYdqdkbeGKUd44fxzdXGUgFvRXMDRpf5N5iieRzQ2CvowSM7FjOnzPC+SUCFle7vupUHrUiE/z3nU9wimtW6u7dTAoB2d8/8EyvwevBDquSqo1ScEPry1poiHwCB70AmclZz9kJ30whHc1P+M+ITvPyLZJ2lRASidYnsPNlfEzP5nGELCexJbpz1T/4RFyz6tUpzvP++viWexMpGXtwU8vDm1RUkJn50o1qVZvuHU4T1QA88u90AucFyGPZluA7Oq+8afJhmZ+xwvMyYQ6P2A72R1aUCeGUc0CSisgjNWRpQudtdp+ZefiQwsKYp+pK9YAYjvdOeFK6uv1BLm1XaSr6RHhsBb5gxqZ5bmAfkkEue3hyYejUdOoJp7Fsoxqb+3LZ3OW+l/7E/822qKyqe9BDEAzBwwbaIPBNR4wXRWlQfFagRgAFo4VheoZKDKWBBlfwZVPjS7q9FcUMZuFhgKmumHmsaFfAmbQIAdtWPf5sQEHpvnCPbmiB7qit2ddbvaMS8eKwvSEiG3HJjIrP+WvQIvfGjeytrnZ5iAeXEODhRYQZOqUNqzmPV5Q2Gnqd9/seQ6XHboWZLgBTwndeMpoVlNxh+0sMdehcAyTAXYOIGfsgghnkEURdrUuezkmtNXPMabDSZmSGsaOyW9zyOAHkA0dgWtVqJ6UZJUR2rtKI/D+0MHP3OYACJ04lJtBQplVnCdX0sdBmXCnStEiQqvdR1YSgGL138atwBTGIMiZcK+N+1iRv0FhaNeFYORdqCt8VwcrtH76Xfw0MPMD0RB7UARgIIiD6YLlnMnFDtce4ep/BbpkXb7GqQtkyXX/HmyJQNurRRboSP8l/+lJo+rQ60ixPXNTYxzTFG+z+aW5H09LvvlrKycLUsVJ3dOYMB0Xi7z4Fzu2B8g7WW63JzgZFUXE7xuR5W5BgMw9sGQY=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY SelectPrint "case
when (@nh_theo = '0' or @nh_theo = '1') and @ghi_no_co = '*' then 'rptTransactionListByObjects_02'
when (@nh_theo = '0' or @nh_theo = '1') and @ghi_no_co &lt;&gt; '*' then 'rptTransactionListByObjects_04'
when @nh_theo &gt; '1' and @ghi_no_co = '*' then 'rptTransactionListByObjects_01'
when @nh_theo &gt; '1' and @ghi_no_co &lt;&gt; '*' then 'rptTransactionListByObjects_03' end">

  <!ENTITY Controller "rptTransactionListByObjects">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
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
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Danh sách tk đối ứng" e="Ref. Account List"/>
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

    <field name="hidden" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="2">
      <header v="Hiện các trường khác" e="Show Other Fields"/>
      <footer v="1 - Hiện, 0 - Không hiện" e="1 - Yes, 0 - No"/>
      <items style="Mask"/>
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
    <view id="Dir" height="233">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11000: [nh_theo].Label, [nh_theo]"/>
      <item value="11000-: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000-: [tk_du].Label, [tk_du]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [dien_giai_c].Label, [dien_giai_c]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <item value="11000-: [ds_ct].Label, [ds_ct]"/>
      <item value="11000-: [ds_ma_nt].Label, [ds_ma_nt]"/>
      <item value="111000: [hidden].Label, [hidden],[hidden].Description"/>

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
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6Y77jtr0ZckXZS/FsUzcFGfBZ+gTyjpEN04KQ/ifo+U8tYCJjMrH391JKV9HL/Ymcp8Ju9Dvfn/j2EfFR+ZbDqy2g9LMHMRcQeZjB9tXYxAFJnRU+ChZK+j2Nj8mJGrmtxvBZo9sJ7fi6GkJcKnMLfBqDDxM+utfgQpMH2xZihq6PFXSeIRXNUC5XsjsPz2ZA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ2Tv/gbubIcLbkP5lrRVfjV+PPj07EMiURMv/HqyNpDn1iKWpIf7lcOExQ1wWirONHXr4ILbx3j016IQ8MCOiAQhfKnlNuSDzKEtiY3YJqiqhWx5WSHJF2yAssfLST1RQIWK9JwPlTAi4FRXFBG9ikU=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMCcBHcMp7P4nk26g24rLvVfjyQAtvnW46n6FD29+Z5z4AF82WhCObXBQg2qgeIKPDnbVTC6sV8m2PSMrxj3D4uGOa1YF6j9CYvtpPbvcej6AHz0NEd7SjwQcZU28Gv0oN0ov88EH/TS/zXbxWtzGt4remACkmp4Ec5Gkh0eYuNXWhOq25HHE4w4/Ezp9AuvJc6cpA+yslpTIgmJWX8EbuERoLTwTOG4To0ukozIiVvaw45/8DixrYqa7ANaDRPxC9uqJB/yNlnJXyBZGsBW6NmzWA0eHZIsH5tZoyxGq9wTEgoGQ4uoUcG78TOy+m4JWqG2NCovar1BXI5ZWbJZ5BY=</Encrypted>]]>&DynamicReportFields;&ReferenceParameters;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22S8KBl6gSc6LKCJtZHGfjeunOHKCtVqYvInJRPcypb4C</Encrypted>]]>&SelectPrint;<![CDATA[<Encrypted>&4ZPjJCDV5/vla5iUvMOC69Ys8biTa76rm7apntF447XvxwvIj+QiufKiOyQEIZOl</Encrypted>]]>&SelectPrint;<![CDATA[<Encrypted>&4ZPjJCDV5/vla5iUvMOC6y/QGS/TL1Hnzb+wektVlgY07I0oV7J4nBOKCfg5f6my</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UHS3kY3miLmR6xKl1hPCEm53Ik/zlxbJiAV5gQcm/dRAf8nxamzJ0//QaMEiMjuTLeVrTVJyYd+pn1v1InhKftRH1ZQYPmnsQc60otK+u47V7kfzUxJyurwVoIa+CvolMzc8X1fCqmBFWxsixbTfhsMF/dKFbtHAkvjNxoumiZSA8Dqv//PWck8Mcm1SRCSQ/5ISe4eNVVPnjc+/Q2A+SXey7eObzZVsOG6q2ewdhF6GR1BLEF3gJSQwFblETUbPnR+eMunuP6OzHJdyulNeAOFn2RFI1ZWy1hO74gqAMOkLs1U4+XBJauAZC3sl4M5lbLRN7Lw/WgFqqima0hEHpn8+1ymtTZ4uelq7qQn1I9hT8LHbrhIpPSqOc9DVLWoSVaxl8w/p7xCSIGoGTRHAYoDdJSeSjiUNUGNdRPaNyT8El/AtVefEGKE7nwSRMaCMv90tZW4VoA/M/TNFHWEHK/TN5qPN4ZcBOrw27iY2VHhUKji6MHm4QBUnoAVf6whCDs47lL6GiteF4VT4FKUUb5D7cqAcxREEqk4/KTFM6UtUN0HQ+Mrz2N4J1Tfi9H5lR8xvlP/uazr2s9Qh3rXumKzRspEgljYYKs5+7mgJhflw8wp4yfI74y+WI/ab9sgsDOq1IqvvmeKQl+MIunHlJIxVABaXJ7YFhedpwDW5c0bMtLzzmSiaDN3j/jM41RPFQJXI+rDr/lAdDvzX/wBA7dQ=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptDetailedSalesLedger">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
  <!ENTITY GetTransactionParameter SYSTEM "..\Include\Command\GetTransactionParameter.txt">

  <!ENTITY GetReportFormStockRight SYSTEM "..\Include\Command\GetReportFormStockRight.txt">
  <!ENTITY SetReportFormStockRight SYSTEM "..\Include\Javascript\SetReportFormStockRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
  <!ENTITY ReportMarginCategoryIndex "1">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
    </field>
    <field name="ma_vt" allowNulls="false" aliasName="defaultItem">
      <header v="Mã hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_nvbh">
      <header v="Nhân viên bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách hàng" e="Customer Group"/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_kh2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_kh3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_nx" categoryIndex="1">
      <header v="Mã nhập xuất" e="Reason"/>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" key="1=1" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="1">
      <header v="Mã vụ việc" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="1">
      <header v="Mã bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="1">
      <header v="Mã hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày mở sổ" e="Date Opened"></header>
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

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="177" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportMarginFieldExtend;

    <field name="ten_dvt%l" external="true" hidden="true" filterSource="Cache">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="237" anchor="6">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>

      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110---: [ngay3].Label, [ngay3]"/>
      <item value="11000-1: [ma_dvcs].Label, [ma_dvcs], [ten_dvt%l]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="11: [transactionGrid], [transactionList]"/>
      &ReportMarginView;

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>
        &GetTransactionParameter;
        &GetReportFormStockRight;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterQuerying;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7S1FN4LnI67UEpN9mQn9PORZYKb+4U76L4D6lGpMDLVgK3fIqxEJirSInNOAPFYNv+42JZ4biYOmFoE/Puz7jj95mTzoNAqkK7ilZrEZG1lDRzMZnXaqPNJroWeSRxxtkcINTEY4aKpbzjbkYbIu3e3Isiq8SOnCXSTrKVCTs49Lebl1s09DU+KGI/09noV7RbOfugp9oUSDJnz2oDZfnc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR79/omRC11rdr8yNnJme+aRT6g+mx04xnXmjYEf/eVaw11Ib0PeMU2Mtjb2+3nKN86Xt2dhrG5I/39s/7PvXE5GE2sac3BnMC9xUscupsC2aGZ5S3Pcv9YNJXxgcZ/NSGDdBklEigMzdq/sHW16UIfqou0YODjdFfoXFvQqbRCxHmoygtqtVR0+BXaTu+KlJXi7w2LbM3epicckTMF92Gq06tfm7xTyoA2NBx6iOdnnledz8/20kXDV/keZyPOrHnmNmlScOYlYKezYCNd35N8691uN8lw6fhvioNrMQBUY06Napn9vXgQW+82b47WFfmsciN4d5Sb/oiuV9DYvtM2oB/GkbZ51Qcldwcp7Xn76TAFLX/KYvDgp7zJw9sUiLVmnkBbBKC3JXZ2a+HhmmD3sjFvLQ1TnZOxAKFqBK8J9abOe9dO1hwddvincU3RvlZRtMh1UCKQ24KciI+XBuQ/C2gHE7krkU/cUTydIRXx7erEPwtT7kLMTPjS7r+nJjP/lR91IvQR4E1h+Q9NzLq7/KZMC6OEgaqAFGDpykt03H2E6Pvi8/oOTOda1y4Dv3PTQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
        &ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &SetReportFormStockRight;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwAfTphtOVHHiWlBPODaozFqO4UQ2LDUmmIC3oO6lso/zN0HYpQgD3cbCbImc+TNwfXrY8K2jJJBfZLtEwBC217LtaYXmbQZQ8TXyqstbBAVcuuoXSo4DhyD99HIuSDiFyoe0Ws6uRP+GlCQZUl1Kb6yHxsERVBTyt3jrjkVLpCMESimyGqBfseyMI20XVzPiDl5roYztUGSVv+CPu9GMZDH</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4frKKWuUoibC4rgEc8bC0Rpa0WB17u82+76RO6sdvnNVo9b9l5KMVEYzAe4k3yPKbdZWpH6UTEPgNu3HTm6qnghToo05xbWSVUFQAVelZfZHeGmxnxN7XrqFJbUNc7f+DOgeUDavyGQIfu8+yjtLkr5ExN2FCeSHsA9FXjKTcELyrp3iO1qJLYSEM7mS6yv2oD8xZYB7iuarY8kTmDa9LRdY924HuIY8YykP1Z2/tckEljxfSAxWpsBG6SU6S7O+VxhBI9tv8UR6j59XrOy+umxaDDduLXJxJJzPwprli25OfFDX2+729Wa2gzQLenZvaLYZDUPRfoENks79X84FyadYIscDE73AgP0ynniS5wwmPR66wdVsugOLE0kJvk8yA1itanSIXOqgVClqDKc6Wd+nz2Wr7VxWmMswZq4ASlQqDp6cJ3pWp/1zvRyiis9ulDlzj1ndrxvdjVPlRN6hWpMTVF1w/AG36hzeKtJqzhUlUFtDxmfGrHeDxoYzTW8qATkJQSuxkui5NokbkRYD0qyK8Dtym8C8pUciMqv9EBXfH+tpKdul55bxiDEw70kNVnN5tblBSILcf6n66554WWNI5/wM1GwVFgBiEPykqBjP51iFAQ/SA0PkQ4OQO9KHDN9ae5JqGgkMec4rRkDyiG0QqFUaUJnq//1KvXVMfLXmpe4qQTiOphuYBHRPdY5NQSoZSd+ofVLb6UdmXjxuANi/vwaNnlqEYKZvKxJ3eCRjNRoDggTpc079ADyCOJwrcqdJYem6xmwytXO2k8/DqJ7xZVEV5Evy5Nl13ddoTJ5sy1WQRDKU3G3QuHkrdABj7bFZwTwe6CLiYRee4IPNCct9XTeJebeRv9Tlvvd7HjwuokjqLKdmbJwcgnSvwueE85l3JUiNpITICB3Oi5DoBRLqWVM+uCS2h4Ezgj02kLgQXH5m++YwTSybMPa09hrz1l/XcpnGdYU2yRtNl0rjXwFvzDL6NGEQosudMFqeM73dP0VPS813anM9T2S+qbuvXT6K/+WTbtyaLIYEGCHTuMcSo4pnoc0CfWza4hxnp/SmVkZ0ZjfW88Nh844dbXSWWA==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetItemName">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMCNMMxDeTYhdwftWQa3hYnyUZODJG3o9oSklbtVRuOdKfvo+6ea68BZW2flk7uBvaJDHKkcPrgBWMSk6Cvd8EJ+rbnPmtXCoSJPYdW9rON9lOOjI3WLKyNgF9iNkVs/90TWCUPUqOh4GIERSHa36okoS+9VGnNrKR0UvjML3Duzw=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
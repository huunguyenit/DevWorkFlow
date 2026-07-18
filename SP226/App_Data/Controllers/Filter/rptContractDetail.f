<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % ContractBalanceCustomer SYSTEM "..\Include\ContractBalanceCustomer.ent">
  %ContractBalanceCustomer;
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" allowNulls="false">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" dataFormatString="@upperCaseFormat" filterSource="Vacant">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      &ContractDetailCustomerDirView;

      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCuUnkuO1EYX5KGtC7i95FWpNmexE86a5ee2eIRVY3ZCdYzPEP4/u7NtK+SH/N9vA5Utv75wGozstE+gxa7eLrQZliQ4FRzxwIxWETaYyFBFg7Jynh0mVyj6Vm8nyHMmTQ==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3k123Y372eET4qXL5WlXZM+Z2NH8YzVy8o4cCQNY0rvRrvAiRdUJSiiEFic++KstbQZGKVNP5obL2AEVpuT9LK5fXGXEVbWgWGIjiGR3K68PZQXAx9ckwqKzil4Ideekd+pk8z9eg7lViur1h0CZVjhYhivcIgWE8zSvXQLT6H9XZWeuqhcEGRTQNu4mfS1w7CtzmKmsqr02o8vxpA/gvGDplkhA99ffVCLEw/vRbNlAfhlfzkNkDnQ2JX8olpYgo</Encrypted>]]>&ContractDetailCustomer;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0yxPtGAejyllq04+BCQtmUYKPdKT9GqeNqXbKC2wy3+kVHRh6A9K0FS/Sr4+fCOrFQ==</Encrypted>]]>
        &ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9y0QuIYPMIWvLaePUtJ/sEXLfwx3nOXnZzsY0Jgey+z98ooCO5irhauLLOSCF7YJmplstnreTUfgf6hbr58noDwUEHoSvtu+UBbyK2ppK9xQMcQ3hM1x9S+GvzuPiMdUm11p4ERaHCBjjABvu4YYdGWwL8EmZ8wfctiQjD97u5QJCAkr5vLk6Y+VZ1KBJkQkCF5HdI/QPpX4N0jUswpNmWqLGv/No0W4wADuXjAlmOZSRHrfix/yPBs/fAFliSq1faslnYjHzQamrjR41R9EoVLBbHjtKoZ+7GXN6k04iE+iD4ah1aX8G3yB4I/WTWdJYgzz5GXTxEy6j3nkP3K0GrGI2LDY7aFVxG3MGwNu+rDeE/VNZjVAycbBz0JbtM/ip0mr+F1/BBwNDHi3FCq1556Qi5ha3G7Sn+QIjiUAomXsvSkOevJmK6IwP3gq1k9sO35tx+QQtIi72zf2JycKaSsIxkRoAehCOVB0OrslsgmqqCjPT04jRQF9DA+MF3iOjwcJLAYiq86dHhgFHjDETOyc2HBoYKIZXJOLgUf8XAzkGdtXAuGcnrDES8GhujXz/Nqsg9qLuc4obQyjZ2IaoyFQxUv5B03KvY3fBsAFoB12FLpCjPSoTsLqxNrKGNKM9CJgqN6GipNimKmKcFPVnYIMGmdveDmFdLo+Wn3bCxyO9e6ItlEpHd1DIfsESNOk/vc8Fa/1OkkCuPU/oZ7ndlI8F5TIy4zUCsrQ4R2myRXCUPbpz8+/pdOs4lqG54NFePfipo1dAD/mSbsawU/dDlO44KJox2tLbKmso0qgKNl3PSzw9Og8VwdqDUYT+K1tMaYIZdei8VjDy3MsJIiE8DLoFuTpVVfqgQTj8GuI0FRoQ==</Encrypted>]]>
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
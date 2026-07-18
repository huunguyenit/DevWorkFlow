<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % ContractBalanceCustomer SYSTEM "..\Include\ContractBalanceCustomer.ent">
  %ContractBalanceCustomer;
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
      <clientScript>&ContractBalanceAccountClientScript;</clientScript>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_hd">
      <header v="Mã hợp đồng" e="Contract Code"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_hd%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd1">
      <header v="Nhóm hợp đồng" e="Contract Group"/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_hd2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_hd3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_3%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã hợp đồng, 1 - Tên hợp đồng" e="0 - Contract Code, 1 - Contract Name"></footer>
      <items style="Mask"></items>
    </field>

    &ContractBalanceCustomerFilterField;

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
    <view id="Dir" height="186">
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11011: [nh_hd1].Label, [nh_hd1], [nh_hd2], [nh_hd3]"/>
      <item value="111000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>

      &ContractBalanceCustomerFilterView;

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUn+d1vXMP3nj/Wu3BrDpVTuDjNSGiGUgBqxsmCef99//Kh56lnu82PScOOnnpY79CB1RKaqUXgYwVKXi3erTO+hTEFB2UPoyNIWdDk50g9sS2Qt5cVcHmsiO1nH4mJfbphHio1k4l8M00NXxYxZEzZqyjm9D6sYOI9R2rR2kxjLO7Nba+52cTLcpK6Bsq6/Ho629WogIizBiDPGyj4WIOvKFxkEgN0i8/KfanqV1Uc1GaamrKBv5wW/ouUad9dH/Ks</Encrypted>]]>&CustomerGroup;<![CDATA[<Encrypted>&mQBD6a0uVELcoo2mxEU0ggRo/AEcMkuaTpa8fLeAy6oIS1kwx09Z0eqdyRGd2g8Q1O6T5P/EzWkZ3Pu4XbtJyp41nuO9wKkl/sMZwTVwwIskUY6I9f4y0xk2gdk+VrlLzAPfzUsapth56pGQx/OnUPX/uBBr+MzwtuXQWpjrRGI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6QZTNn4WmmCN/z1ZK0MX3ZQ==</Encrypted>]]>&ContractBalanceAccountLoadScript;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RHYxqdRJiHSynSMaC/Oma4Ls0sMNCmV5Dvk98jO5BTjiJWyunNlnWEAvXSAmtfRJmHADzxdcECNUlJx26YQzGUE0R/ur6JAGvJQ3K7WVrQiAZ048JufcvWRIL1BTFizvCcs4WpXw1reLf8BChkiLg4sA5ss6vtejt7uhkD0fDA7fOhDz9q6QDuusJ8AxTU/aXaRyIVX6+3gY4DClD1sHzCgpvzQLpDAViYlIugsLyBP0hflBh21jMM8jg4biOLNCwq1RZ+8o6F2qoFR75WOpX0BVXhoEteaq+8YFcSUI01Tnty2LFl/9OccmswWLzbsQZcgUGmkPyb3+bP+UYE1NIuPWkeIPuQ5d/bq1OkCr1OwzL87qBbxv+6H5aZhKsDEdQ==</Encrypted>]]>
      &ContractBalanceAccountCheckingScript;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Wr7KSpkCOlMGCF7Q3DURS1Ty0+pDOZfpYL6fAqz8EqGvpFaj5IQq63c7Gz0rMIvk0txoPZ8i/1R0Qu5+5Ox2W7Jsej1t+MQYN23xwDwQW4Fbz740ap9GyQjOr8qZDuYyXJJgUhM6KKPEQnrEMP0J91qafgSgVQYmGIMY8fuXrHLwT12cEHXqLezXK5JFCGRYMHf75kObXoClpplUCIdJjePYW3e6yGDXe4EeIuUdPbEhIpyjgbVm3RKGP6VXZGgAzTnKcAc0RZ1/Sh7jg+5dNVVwKeerdtA2Z6mmBv76khy6ZgtOsFoIqGhKPZdZS/1I4kW8hUt9OE50mMMVVXhSXSRLsQSLThyOTJ+3qPvPUuG41+yQUmsezmoVtcnvuELlr+a41yCizc3KAW2rIh2pLTr9fBXBWjzRD3NrINdti+qcvdGCu5FEN+N5dcb8EFfxr20WwdkkqhjoSgcLLoz/6KLTv5mmPvvK5VNAjnAY1uPpXbLRph4OMqV3HsJldX6WgTb8JfbWR7DWvBuVPHRIGCgTm5rzXXGn93DmlAkVmH0a6ykdvgIjt8C+Ddbl45dChhvf+HVuonibcwRfH/jgBRvCRdnRC89OdQ9wggKo9jn3FRmyhOURG7XHo57TXAjIjVNYdvv2LEdtR6ND8idWXGWlUr6AzE5n5LxNF17glfnYSN9XQhH0VL/JhV3OoehNvyd8Wv2gCOM26UoyEEbSEgYMJD5gtMtJ1SBAS6yc/HllchRFLGDcr+LJKIxFHw7FHjyCLb1sucwiyBzqRAUrpPsePpSXZUNpVF8pKY7+6BV</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>

    &ContractBalanceCustomerResponse;
  </response>

  &OutlineCss;
</dir>
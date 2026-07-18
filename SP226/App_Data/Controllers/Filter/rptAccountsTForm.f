<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
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

    <field name="tk_so_cai" type="Boolean" clientDefault="1" categoryIndex="2">
      <header v="Xem tk số cái" e="View GL Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_so_cai_1" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="" e=""></header>
      <footer v="0 - Xem tất, 1 - Chỉ xem tk sổ cái" e="0 - All, 1 - GL Account"/>
      <items style="Mask"></items>
    </field>
    <field name="tk" type="Boolean" categoryIndex="2">
      <header v="Xem tài khoản" e="Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_1" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_bac" type="Boolean" categoryIndex="2">
      <header v="Xem tk có bậc &lt;=" e="Level &lt;="></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_bac_1" dataFormatString="###" maxLength="3" clientDefault="99" categoryIndex="2">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="xem_tat" type="Boolean" categoryIndex="2">
      <header v="Xem tất" e="All"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_chi_tiet" type="Boolean" categoryIndex="2">
      <header v="Chỉ xem tài khoản chi tiết" e="Only Detail Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height ="112">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="11001101: [tk_so_cai], [tk_so_cai].Label, [tk_so_cai_1],[tk_so_cai_1].Description, [keys]"/>
      <item value="110010100: [tk], [tk].Label, [tk_1], [ten_tk%l]"/>
      <item value="110010: [tk_bac], [tk_bac].Label, [tk_bac_1]"/>
      <item value="--111100-: [xem_tat], [xem_tat].Label, [tk_chi_tiet], [tk_chi_tiet].Label"/>

      <categories>
        <category index="1" columns="120, 20, 80, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="20, 30, 20, 50, 20, 80, 100, 100, 130">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+YUa3VUwXVfPnv/KdvG847f2znxDCrSVaFiohqX42ukKexJWZ3IY4qais7bbtn9ZEhydDRS4rc7us+g6P+bUAyfT64XRbte2P5HQQ8b0H8piDYpJgfBDBTpOnEwQBHQNI+YAyuIO88MLeLFAZEo+0XtmRUVg5/CgJO1Seg9VHLSif2bFiiV5EaNGO8o8fcJ6J02A8xk2LpHzvtuEZ7JZ9qh1ORC1piAfA8ZMLAyLJ61</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD7LkTr6EVa6C5cVPNskRLly1PrSUUFX4X5XQzf8p2oyZOhqiZ4FoWBPF9FpedlAnLfKtGPDgTQ9uQynzzFMQhU90Tqv/IhRxzRVfKb+9FX7yxfKXkC5r6UIRlPYlsGr7Xq0i8MxEC86izXd5hi3l1JhSIx03fP/1C3AAbeW6leisAhfHN2DB7Xr1sx47Il813znmW7+bCFjJ3GhxlT9VJM0rRUSjxipFNXBNaI2yrgUML6xiZF4HzQEX95FdcsFFg3/+v9jFvROUNYwUQEMw7JFyqfxP7klmB8FcGjCX/C76dlf4tKt30YoNoWqGnRSQbloXlyU9YdiOUCQwArOj6QwidALwmfMA7tlwsU51pkb5yBASx40YdITkw7M8vqxdYjRXnsjw78XrXRt5n8h8abQg1Y/iLc+sJQlv2JumzElpQW4AGwA00pYZOsA8v4aTTiJxAxfkpWwLH8zDqPsMcD2MpNvsjdvowIy8sb9kHO7CIf3CHcqdlprELzn2/PWOar4950n/MdTNni1vLyKvXWZmrZjo06xuUrtZqXT10zLOHEKGqhtkJiTXT21X5iAfFDPrtXibeEdZTfwSrwESbmqzUEcbyjqQC4zVPGFbelJIXF5j4pexZtQa7ae9RlOikTIv88htl3r86wvJVoc+7aqZPvixAfZJG7WtvfP+HgIgcKoDj1K61BaLnuTAChQnzr9FgGrLLi1gJw8keIBOgUSmPGpDFkgmm6a2ghVEZqJfKzh34oTl4s8LpPpMUdEJgJOKFhJjX7dMZluXjCxIbf1fHaBLH4Xkkdj6zhZvIH28Xto8MA6WZHVvVDzA9yROJAnO44LtQcfwSKn4Ab+8wq2kpofr54Vlf0Y3B789syWkGkotuUuYRvKhECmjHKuAMHol/3VAGOqNGs3FrJLOzcAfugn1s0CVjdWjx5fGgoMz64bMsnpIyi1pVvjXchwwl7jbWO6dkOrgfHi7iv/gwQOi3Rly0pJ+DWKfmp/cQU6i8OA/1MwzspsZJM1v3nG9/p86l9aMzhgpuSIoJVIXvszxIFxNwMXDPfVAq01LZ1LF2wTRt+u45sLlh29i6nVvGufEc41iT50W6F+k604EbOjooT2lWxvED/k+dNn7Os80Ie1uXU5YJvDQefE9D/L4ERKZpC/lixoyhmee6wkbO/vTCvue7O5Ue+dmgTgf9WH200NqcZLyP7+cS9+C1DhwR67EsrvDvJdRBGf9nxXheCYn7NmXHlfMlRzp/WOa53xV0z6+T9eg2oLfJRrGcHqOgC2o6syXHDWrTGCGvkNoSIpwBYUaZLK4AJBcd9QaM3g4WN8eljLJ6zc1GpEUQ6b/Ck=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
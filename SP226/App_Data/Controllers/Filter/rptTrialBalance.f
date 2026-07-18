<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="bu_tru" type="Boolean" categoryIndex="1">
      <header v="Bù trừ số dư" e="Clear Balance Amount"></header>
      <items style="CheckBox">
      </items>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="001">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="002">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
        &ReportFormAccumulationFields;
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>


    <field name="tk_so_cai" type="Boolean" clientDefault="1" categoryIndex="2" hidden="true" readOnly="true">
      <header v="Xem tk số cái" e="View GL Account"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="tk_so_cai_1" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="0 - Xem tất, 1 - Chỉ xem tk sổ cái" e="0 - All, 1 - GL Account"/>
      <items style="Mask"></items>
    </field>
    <field name="tk" type="Boolean" clientDefault="1" categoryIndex="2">
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
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="1101: [ngay1].Description, [ngay1], [ngay2]"/>

      <item value="11: [bu_tru].Label, [bu_tru]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="110010100: [tk], [tk].Label, [tk_1], [ten_tk%l]"/>
      <item value="110010-11: [tk_bac], [tk_bac].Label, [tk_bac_1], [tk_so_cai], [tk_so_cai_1]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzde2kthMF590dkc+XNNEu31bj9tXia0LKcJqWgTTwCv+8rEuFljmNjLiywKiAm1YOMJSwVuSLWVNzpLrKd1RfjpfS5eIVMTthZ4eaONjgWck5AkgxydmuZ6As7AotkCrec96Pc98wspeLq1YGgiQeRfDbk5K/d3YIIhl73eXTc5kLmvpZHJjwn0KfD/ENGWRmC5pqqZsEOmD8LKLxSdkz0qVPT233GuPP/Vbu7FhsBOA9kEPS1ge+ozvfyRBd6o5kywLDiYnXfvop/3PhGoPv8ZYgK5k2DFn0gWSimlxj/CcGVan/0JnbenIs+OC9QP/Qr6gch96sHhOVVP3aIYXvh0Rp1E7h0oxTC5wsrfTKYwmaFLyFwlD48fXgYAn3kkbNH3+z5+jGx5WriLAKq7EGel77SZ3mCrZ9l1tPQpDM2Xf6w1eBXrDa6sv5/ofsT4MicGAaNyxu9wVVHFAuigzfVmZMn5kGYJn2PJ7SYDF44fajP1BRM7ZSmZZVfPusJQx09ySsBkugwjMZSe6jOO2DimCGfkQy8UiUaNMJmkWz1wcefFInTEBBCey11VYR93KPiI0xDQVGqXKT+Hh59ykPDV4vSi1Ufm6yKTkunVM5oJ2bYYJAjpn4PGVUyxZKm5BjaEKH3Lw7JmJPp4mh+Rn2Lz3iPdVtcbkupJU0rbhcE0</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYJpV44RZE9wdWrAZvF+6Is1vwTTh84UxKIodF5nQOB15XdYh5HKmBsT6sWLDyJF6TzF4IWUuhVXl0F5qxYm5KJgqLEnxV/VwxQclHBbC80MQ9K5qAwj5ff2GA0Hh92mI/w89F4uO9m2oKFYsODNMCSII7uUeVo1qb/l62Nf1s6jwKiRv3Fu5FlYH4OAGHxfLTXUdmJflXdilnokkT0F6R9NFypXBk0p7Bt1leCMxAAGuS/shpkNMh3rjdFPU0pZT+L0gl2/CzZ7qXXsLSM+GVd1zmRHM1vjOkLZ5OMseltYGA7ZBMo34Y/1dI1Sp7mKxMYvJa5sPqoUGCeLIURzHPVK5KRfO6j8iLcsGPZFw9SZX7AxmJzt+o5s5YOTvJQ9qT8MmqF3sgqQF1rZzcwybJrkLemT7nyNjKBZgsQe2kqH3fo8Ehg1yn6PLLA+ZAqPQJ+BNLtbVJubW86yfSlYH/s+8Dx4efet1BxvQt287JdXhbnICyfhzRQDv73PfqUEbdTBRDSHWVob6GD7L2fLji5YwD2wRcztdxRKptPG867No67pB+MXlQKBRqEtQMcvFaOfBJOhhzB71N8OHh+oKAu2srD3dGTwpCH5jQQ9nTLc4jGUDpcUPrRuo5a3g85aTY2z+d1vtg1iCLfSG+DJvfB8yZHvu+vO+xUbX28HI/OQhq3n2m1TDRzJ0AEluTdT4NJRVPWBHA5onv5CQyCXQit3cmenWzKQ7fYAgCGNrc0IVlkEAo/1yf9iAqTM7o7FQ3+0S/6oo1nfMdsXKbTQ25g9TFEtUaM6vmAXR4IjKrnEqIkqZ8JFJ/qUsQSmiSe0wl/vCdhwkPp0pEcXwyGHpbLrbUJ7gdXeLJmIYndXZJmTy8zzmFxL/Rsdowa22srwCrX7dBdrl9t+y9wVFDirJ++/7Hnhv72gglQzVmq8t48nwqUiK+k3s77Kf/r2D12c68pSTN1QAY2POAIGI9ni4icAWwdoamWJjquEat6QkPugwt56Fg6cLsSPhyNtZ3tma2u5kA2z2kzQYFPQOZmao2l4dZZ+iUszNUs+NM73BpYP6oPCBU2Nyh32BqsEGPjasG+OvHwLUL2OZz5hxOAqfKtUg78bscBHMSdI8/ADN9IwpAO2JdFsCaGkhW+yA3IEYWQPDLb29TeYt3grp2hZH3hsuRausrn0wx25nPyOrv/PyWdv/6uehEsDROFtjlZ+V6hhblU7y3Oi81yCBjyUb8tcvMcrAsBxN1jiynDvwMccCWx6EnAPcYPvfoLWx1M6By0UOlSS9oOLQUY6laE577ZYloKEdM4PJ7mprhjqL0x0MW/VXJUy/j3X2NZJDUZzT+/DakVehQr3Y5YU2zbuym9ciyozpEqpLyamLzxjeuxA4SET9kMNtaGoDppqAMbSiaKzllWcsITgv5G+t2IEYfk=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;

</dir>
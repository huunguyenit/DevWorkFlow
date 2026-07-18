<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
  <!ENTITY ReportMarginCategoryIndex "1">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày mở sổ" e="Date Opened"></header>
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
    &ReportMarginFieldExtend;

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
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110: [date_open].Label, [date_open]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+YUa3VUwXVfPnv/KdvG847f2znxDCrSVaFiohqX42ukKexJWZ3IY4qais7bbtn9ZEhydDRS4rc7us+g6P+bUAxqnV/sWkMG4GYKK7mbJnYr6EZ1bFSov6CCILCFJoACpzcTXeSHQeEFtCOk+wRhEtVg7X9wD6/4BZldMMlpmHstlipCR94yyiPE7pmPGpcjmGKbWoGfKl/+Fsj8opP060mC/Yo5jCfA4Hu4OCTAs1KB/ph1DJKEdkQqCiGag2pkPQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9zpe9+n7TNZox7zQGh7IHc5Yx/nEf419Ehr4HQHe6jiIzpbBSm6w5b6JQMlikaYtthwNq4hNvkd1XEGZLCWnSWzSyNQ/mX5rxc03LQQ3dZzfHctPcxMQYBaNgl0eE3Pul/W3injyeouBOzMHuSliLB/el4bdQq+iojBn8PZcUAyKkZViNgv9jm+weWBW1h3yCx+6m/WtcuXzt3y7ay5Jq0IGfEyPyDu9YSfiL1/yPQCasZHlUzORgSwvtRfnWKRZfU2Y75lQe9Z9+vEBJrlaJCk2ky6cm9pv0U553CTiaapA7ukH5j/ZfRkAruCXu4YS9ebGxirVwkst3CmwHrcdY1rb2+n31RxHYVFlmq+KTlu4SNOe20eAnP85n4zqWsHqpttO25PAP3rlPAzdR4GophGNbeV9Rn0YSQXeKZYn7cyfBYObtFuO7cXRMRbco0g6+fpPn5NS1MSYWgEwnyOEhE3QSwoaZ79wB5UQFMuzac/ClvpqLTexiYvezzWwY7BCWMuZDpovC291KRBbuQoelyGTrN1mW4zE2W5Y8GLC11R0DdpxRU7n6zo4FkK6QbjqQPlRSae6qyfMNDW9SZ/dytXtYEXC49WIdEV4cN2pDkxwYie26hIjFurhpCoJh3BFHNbyEL/rvBywTOZvkAFCYlL63WhGiTNyPO1vnKi2LY3m6Kdi5JVbMjFGceGn9tPOSsgyNTDIhUGSYNMGiPdUyvbd5hFFBjQyqqyeSB0fQu18TPGwkwQevuzTmTiiScAvQ8JYPq5DqX1uJ13KqfPqx/olOxRvRr8I3bZvJt6Rd0cO0sP8rvtKEBVjRp3C8Ofvi6q1L3LBEmVqHShL2VYqf+Mm8g8iJjtprbljeqH0xr1mW3gvabCS3rdlXbv8T4o0kGA5C+fU4ajhsnKjuaKSSTuegKq4A9ejMioKZs9laU4AqnXoM0Zt3rrC5QRBZ5a9XtPrxdU8wz7XrqXt0uxvYbEs6Ti/9IoQYbJDAgBaYMrKOXkqPtiCEWUJyzxDuTF3mMR9fqzQXDizUgCtqudZfEm/OwE6WzlglFomM1Bz1Nbudd7BLASd6H9aaqrw4HCz70JoEm2S9e3d75GFWKKSyZxGiV0fJrmB7uBOd+G+wgt1Y1qFhk8m2sPEEhCfegzGx+whViwy95sqrcvMZQHN8TvyQtkuabfC6daXVQ0HgxclqYjO4Hxzq88drMZ0zKmv780UTWsvZQ2fYVc6nkaUeIrp6e8Eid+zpeJOiqamuzrepr4Gysp9K4bpr+OV2C2MyGspF1v31j/ymUineInCzTWiC+nnL9UV6HzoCWJrgOW9FJIjkOiL6RmSpuwLs4d1Yp5X4BDXXKRnSwxkHE8Y64oML2uushamCuo+T3X+2vO2A==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
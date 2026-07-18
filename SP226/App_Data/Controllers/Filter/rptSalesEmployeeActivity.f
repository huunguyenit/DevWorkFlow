<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;
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
    <field name="ma_nvbh" allowNulls="false">
      <header v="Nhân viên bán hàng" e="Sales Employee"/>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
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
      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3lQ8AoV//AETffTPi3+FCtg3k+X0SmdUK8cE1lSvn9pQ7JX/004VWoes6NSWhLVsE4qRujPdPHzZ/OtbHATn9tYsri6dkjMJQVOxgDSKpCAmIt6bYBt2OMLY2oX0wDUpmAEiHxmXTQMUFwLZyMg/bJjhP9l9whjyVfi5praVaPKCbGhDgzKGJ7LiCl/nFVqj8e8kfEg1EnXUcZnnfCMdGwi7AcyXG7+TbJKyI3UX6zNBVyEoMy1Uv+hx5OMMhQUHLhFLZpPmj6JKmkagPYsWW5EzOgIa4Np1AurLZklvcDFgoeccuFgSQeqhTB642cSX/nKLw8Ih7/xNBXUjtNcjYAENEU+UBUtKvj48ZQr1ODjE=</Encrypted>]]>
        &ReferenceParameters;&Customer.Nested.Report;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9y0QuIYPMIWvLaePUtJ/sEXLfwx3nOXnZzsY0Jgey+z98ooCO5irhauLLOSCF7YJmruSmAR0iLUB3KyAGjQ0c3JBTAbEgz+/2qwoRepyaxBbjuIfZbBN0ZI4XC0yTJ3ge2JqhOlZAIXvujRJYGnofA6cyp2mQ8Fyo0Yi6necusp5zhlo+G3rsydGGIVVu7PTBtl1+YtofXU5ppkJzQtaJ4I78mgSNvEuk4zZ03npbtO+hFkZ91XkagNH/ZkiwJwV+tDmJwOk/bDhAic8Oi4aio6Qu10ZpJ4yr6qhamEN91ZyfLqXTM11cKX1JvzZgBTMA5wk0Tb3LLUPCCLTJJXagTGkhgzTjjWwWyocMFTDQYPuMGJ6u5CyFH7Mvo9mh+y1prM/zdMbsDMPpAo8hJXmYZM1FMjnIjDSvDTA/mqjkNywHlvSXC4PHsDTizvFYeZBQmbWHN4uiRa6we5iSK4q2uwQcN3liwt6XPlZMdoDpp5+IrmGacL+3jSQgN9xl6bmZGvhlEEnOX9KbfAVck5uMRBQm6tBJFHM/LSp4iHRJCau1w/0arpPOlLjPyQAJgM3UIVxMJWF9DJgwosqotsIpiCjjktjy7kAVrNq55k/gvS0O1RhLNs9tUkHrhfCWN7UPGNzfK8xfRtXQZrIp8Siw1K2NLVLWY6ne4/nK93i8fPGZ9VmNJOU/nu5cK6lUSbec8/JNsZ5QPVZ59fQ7cT/strbV+0mx+n3InZ55yYi7r9PSNsIandhAXYLHRFXxfnoFIaExhkETtnGYjlLAETgHVywIfw0zF6xsgzjJ+/TNjrkBP19dl39l63o4ukR3D5ba2tepa57WdvNLqEzf6CjVmdB0VMDhAWxKSFsKXeqqOsleICb/7SHUQSJrvsNw3qF2U=</Encrypted>]]>
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
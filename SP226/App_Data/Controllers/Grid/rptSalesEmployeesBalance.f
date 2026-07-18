<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.005;" repetition="&Repetition.Key.006;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng cân đối phát sinh theo nhân viên bán hàng" e="Sales Employees Balance"></title>
  <subTitle v="Tài khoản: %s1, từ ngày %d1 đến ngày %d2..." e="Account: %s1, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" dataFormatString="###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nvbh" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_cdpsnvbh', Controller: 'rptSalesEmployeesBalance', Name: '[ma_nvbh]', Value: '$func.trim([ma_nvbh]) + String.fromCharCode(253) + $func.trim([ma2]) + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="" e=""></header>
    </field>
    <field name="ten%l" type="String" width="300" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="no_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Nợ đầu kỳ nt" e="FC Dr. Opening Bal."></header>
    </field>
    <field name="co_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Có đầu kỳ nt" e="FC Cr. Opening Bal."></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Dr. Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Cr. Amount"></header>
    </field>
    <field name="no_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Nợ cuối kỳ nt" e="FC Dr. Closing Bal."></header>
    </field>
    <field name="co_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Có cuối kỳ nt" e="FC Cr. Closing Bal."></header>
    </field>

    <field name="no_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Nợ đầu kỳ" e="Dr. Opening Bal."></header>
    </field>
    <field name="co_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Có đầu kỳ" e="Cr. Opening Bal."></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nợ" e="Dr. Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh có" e="Cr. Amount"></header>
    </field>
    <field name="no_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Nợ cuối kỳ" e="Dr. Closing Bal."></header>
    </field>
    <field name="co_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Có cuối kỳ" e="Cr. Closing Bal."></header>
    </field>
    <field name="ma2" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nvbh"/>
      <field name="ten%l"/>

      <field name="no_dk_nt"/>
      <field name="co_dk_nt"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="no_ck_nt"/>
      <field name="co_ck_nt"/>

      <field name="no_dk"/>
      <field name="co_dk"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="no_ck"/>
      <field name="co_ck"/>
      <field name="ma2"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idiT9+TckNl1Si1k/XSaraQlxRKzxu+s5xLMLIrCNkEQgMJMVzJr+RFsIj6oBBfkMJb5rYOXF9yI68NzKBxIf2UukM/HIGHLEqv5J881cIUdJcVALghRYVQeIeAjL+WdhuTLLEZyxT4Zo3x9TRgdSyS/sfbwkOkpZqwi+KKmSwCfSt/HRlxjL2j6BJcLWSpijagpOvdO0B82pVt8Vpg+1tpKz9UbKAGboHqCp8x5YYeOAmYI+Nb1a3Ev4NtnFQphiFAzG3edsH3QwEKXGZiQiCEukK7bvgP5now8t04s7kfk8ITSB4EVawUrB/7YxfrsSS8KfYeVWwmUv5BaQuu33/IlJywzWW/2kwVchF6HhLeioQ7eEMr56OsP+kKmtZG6KcyWoyvJBvFKJEjIbMAQRjta</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
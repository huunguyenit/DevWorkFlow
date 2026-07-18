<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLGraphReportToolbar SYSTEM "..\Include\XML\GraphReportToolbar.xml">
  <!ENTITY CSSGraphReport SYSTEM "..\Include\Javascript\GraphReportCss.txt">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" filter="sysorder &lt;&gt; 9&Repetition.And;&Repetition.Key.012;" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tổng hợp chi phí" e="Expense Analysis Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <pivot rowField="xKey" columnField="xCol" dataFields="ps, ps_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="3"/>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="### ### ###" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="xDetail" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_v20glbccpth', Controller: 'rptExpensesAggregationReportPivot', Name: '[xDetail]', Value: '$func.trim([xDetail]) + String.fromCharCode(253) + $func.trim([groupBy]) + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="&lt;span id = 'idf_detail'&gt;Mã&lt;/span&gt;" e="&lt;span id = 'idf_detail'&gt;Code&lt;/span&gt;"></header>
      <label v="Mã" e="Code"></label>
    </field>
    <field name="ten_ky" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="groupBy" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ps" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="ps_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="xDetail"/>
      <field name="ten_ky"/>
      <field name="groupBy"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFobGUnhwXmtkFvkz1zQcjIviKhBbO9U42vNsFd0HFdGai7Gkq3Xr1imoc3md7WlHoehJKjNc2T97CYAnXkW5gnQVczo3DXJOn/0oPxIOJTYvb7rhPwoJbU8Eygr1/8m/Il7+zmDPi29Srv4gA+9s1VqwT1d3PhyCtItr/2dMlDXKG7slH4Kvuhhw2NDJsQG7tVEV438jmycEnZyGxi7JHm911z5LC22WowmKhII9di1DVOel3/sYZ69OhD03UIFWbdhf1VPOi8QmEyjZnyl9Yppsbe+q25iwen4YRns+FBff1LXEMwNjHtlIqTDDyAzDtG0GPAz5xN18i+G4pSTL36LHmsNCzgY1oZeMuFprHnw2hcgtlYy6qvAruKrmYJB/HxfFVb1uxsoCjRMR8rXAJqJxBZGgqyL6oDpp4ObteT62wN4AIQ1rl6WgiphHffB1ix4XDNpxF2oG2QbahPQWw+P7XdLj6XQg2+sXqLCCofWSMtBkrvSbvORaKfAd8TT4zmCYZdbgLzjV9K4HsmwRJvPbK3PYsdSSdS+T8JCoiecse8JcR6FX+l9bUbRREGtJIqc4jTpQvOGbePQc6woju0QNwN25ds2JZoTkYfP06i3xA==</Encrypted>]]>
    </text>
  </script>

  &CSSGraphReport;
  &XMLGraphReportToolbar;
</grid>
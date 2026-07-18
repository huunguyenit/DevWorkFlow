<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" filter="sysorder &lt;&gt; 9&Repetition.And;&Repetition.Key.012;" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tổng hợp chi phí cho nhiều kỳ" e="Expense Aggregation Report for Multiple Periods"></title>
  <subTitle v="Báo cáo theo: %s1, số kỳ phân tích: %s2, từ ngày %d..." e="Report by: %s1, Analysis Periods: %s2, Date from %d..."></subTitle>
  <pivot rowField="xKey" columnField="xCol" dataFields="ps, ps_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="3"/>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="### ###" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="xDetail" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glbcthcpky', Controller: 'rptExpensesAggregationMultiPeriod', Name: '[ma]', Value: '$func.trim([xDetail]) + String.fromCharCode(253) + $func.trim([group1By]) + String.fromCharCode(253) + $func.trim([group2By]) + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="&lt;span id = 'idf_detail'&gt;Mã&lt;/span&gt;" e="&lt;span id = 'idf_detail'&gt;Code&lt;/span&gt;"></header>
    </field>
    <field name="ten_ky" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="group1By" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="group2By" width="0" hidden="true">
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
      <field name="group1By"/>
      <field name="group2By"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQM9HDz/sV55eKsIcXNLATLtepTYGGsKVEZzw7lN9yfL88sMOlADNy81RhPu0nbseP0+H1/aSzihDyRbukt/XBb6l3EYwk/RCEyncuU5dQzbg11kzzy2eLz0Cw+cON9BNsmqd8Gr9mzkF9gi2f2WJ6lfrvspdEOjpMaKMVFckx9bp2GGFYtOD5vePvBLyuuYCk/xwbkfGKG0Tf9mlx9TXpt7fqdfstm6aoKTLPPDeO1QFkD5GPCk48+h8ddy5pTijVf/ov3e/7+PJmQmUne/P6VkOnCkovJqfe2Atc1NshBaRptiZrn5Qqo6q5r/BvUSw+EQ9hiIagDXwDiwB6ddoWwdCWGI0TeMvn6q8Lx/EqH1ImbV9cZQ1DofxEjv6wS/t20</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo bán hàng nhóm theo 3 chỉ tiêu" e="Sales Summary Group by Three Criteria"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <pivot rowField="xKey" columnField="sysColumn" dataFields="tien, tien_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="3"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>

    <field name="xRow" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_sobcbhth3', Controller: 'rptSalesSummaryByThreeCriteria', Name: '[ma]', Value: '[xRow] + String.fromCharCode(253) + [groupby] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã" e="Code"></header>
    </field>
    <field name="ten_row" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>

    <field name="systotal" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="sysorder" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="groupby"  width="0" hidden="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="xRow"/>
      <field name="ten_row"/>
      <field name="systotal"/>
      <field name="sysorder"/>
      <field name="groupby"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteSFht8yuUiTj8eqyrjtrQDQ+RC6HyVx6YuEzOkJjzGVtuO3ZWkRR+M99yGc+nqjM3bXXc0s8mB1nXyFsTg3neDk94fuRVOcVaf6x3ME9mAvmeICwP1QbanJPeCKxIdhn2X4fFUeavQg2xfhlSNeqsv/rnlz4ZZ59LABnQhuR283IUk0loOhAGOLhOXkF8w9WQ==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>
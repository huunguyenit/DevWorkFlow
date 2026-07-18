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

<grid type="Report" valid="systotal = 1" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sổ đăng ký chứng từ ghi sổ" e="Journal Voucher Register Book"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ctgs" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ctgs" e="Batch Date"/>
    </field>
    <field name="so_ctgs" width="80" allowSorting="true" allowFilter="true" align="Right" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glsoso2', Controller: 'rptJournalVoucherRegisterBook', Name: '[ma]', Value: '[so_ctgs] + String.fromCharCode(253) + [ngay] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Số ctgs" e="Batch No."></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="ngay" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ngay_ctgs"/>
      <field name="so_ctgs"/>
      <field name="dien_giai"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="ngay"/>
    </view>
  </views>
  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>
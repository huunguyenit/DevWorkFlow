<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\SessionReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\SessionInit.txt">

  <!ENTITY k "tk">
  <!ENTITY f "mau_bc">
  <!ENTITY v "Xem sổ tổng hợp chữ T của một tài khoản$">
  <!ENTITY e "View Account T-Form Summary Report$">
  <!ENTITY Url "~/Main/rpt_glth1.aspx Script: \'passQueryParameters(this);\'">

  <!ENTITY Memvar "{Name: '&f;', Value: Array.contains(['001', '011', '021'], $func.findMemvar('&f;', g._memvars).NewValue) ? '10' : '20'}">
  <!ENTITY Fields "ngay1, ngay2, ma_dvcs, tk, ten_tk&#37;l">
  <!ENTITY Seprate "3">

  <!ENTITY Parameter "">
  <!ENTITY Session "">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" valid="systotal = 1" filter="&Repetition.Key.012;" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng cân đối phát sinh các tài khoản" e="Trial Balance"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tk" type="String" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glcd1d', Controller: 'rptTrialBalance', Name: '[tk]', Value: '[tk] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>

    <field name="no_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư nợ đầu kỳ nt" e="FC Dr. Opening Bal."></header>
    </field>
    <field name="co_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư có đầu nt" e="FC Cr. Opening Bal."></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Dr. Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Cr. Amount"></header>
    </field>
    <field name="no_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư nợ cuối kỳ nt" e="FC Dr. Closing Bal."></header>
    </field>
    <field name="co_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư có cuối kỳ nt" e="FC Cr. Closing Bal."></header>
    </field>
    <field name="no_dk_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư nợ đầu năm nt" e="FC Dr. Opening Bal."></header>
    </field>
    <field name="co_dk_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư có đầu năm nt" e="FC Cr. Opening Bal."></header>
    </field>
    <field name="lk_no_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lk nợ đến đk nt" e="FC Dr. Accu. to period-opening"></header>
    </field>
    <field name="lk_co_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lk có đến đk nt" e="FC Cr. Accu. to period-opening"></header>
    </field>
    <field name="lk_no_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lk nợ đến ck nt" e="FC Dr. Accu. to period-end"></header>
    </field>
    <field name="lk_co_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lk có đến ck nt" e="FC Cr. Accu. to period-end"></header>
    </field>

    <field name="no_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư nợ đầu kỳ" e="Dr. Opening Bal."></header>
    </field>
    <field name="co_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư có đầu kỳ" e="Cr. Opening Bal."></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nợ" e="Dr. Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh có" e="Cr. Amount"></header>
    </field>
    <field name="no_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư nợ cuối kỳ" e="Dr. Closing Bal."></header>
    </field>
    <field name="co_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư có cuối kỳ" e="Cr. Closing Bal."></header>
    </field>
    <field name="no_dk0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư nợ đầu năm" e="Dr. Opening Bal."></header>
    </field>
    <field name="co_dk0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư có đầu năm" e="Cr. Opening Bal."></header>
    </field>
    <field name="lk_no_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lk nợ đến đk" e="Dr. Accu. to period-opening"></header>
    </field>
    <field name="lk_co_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lk có đến đk" e="Cr. Accu. to period-opening"></header>
    </field>
    <field name="lk_no_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lk nợ đến ck" e="Dr. Accu. to period-end"></header>
    </field>
    <field name="lk_co_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lk có đến ck" e="Cr. Accu. to period-end"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk"/>
      <field name="ten_tk%l"/>

      <field name="no_dk_nt"/>
      <field name="co_dk_nt"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="no_ck_nt"/>
      <field name="co_ck_nt"/>
      <field name="no_dk_nt0"/>
      <field name="co_dk_nt0"/>
      <field name="lk_no_dk_nt"/>
      <field name="lk_co_dk_nt"/>
      <field name="lk_no_ck_nt"/>
      <field name="lk_co_ck_nt"/>

      <field name="no_dk"/>
      <field name="co_dk"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="no_ck"/>
      <field name="co_ck"/>
      <field name="no_dk0"/>
      <field name="co_dk0"/>
      <field name="lk_no_dk"/>
      <field name="lk_co_dk"/>
      <field name="lk_no_ck"/>
      <field name="lk_co_ck"/>
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
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

<grid type="Report" filter="&Repetition.Key.007;" valid="systotal = 1" repetition="&Repetition.Key.008;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sổ chi phí đầu tư xây dựng" e="Construction Expenses Journal"></title>
  <subTitle v="Tài khoản: 241, từ ngày %d1 đến %d2, công trình (HMCT): %c1 - %c2, ngày khởi công %n1, ngày hoàn thành %n2..." e="Account: 241, Date from %d1 to %d2, Project (Work): %c1 - %c2, Start Work at %n1, Complete at %n2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày gs" e="Booked Date"></header>
    </field>
    <field name="ngay_lct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk_du" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="t_ps_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng phát sinh nt" e="FC Total Arising"></header>
    </field>
    <field name="xl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Xây lắp nt" e="FC Construct"></header>
    </field>
    <field name="t_tb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng số nt" e="FC Total"></header>
    </field>
    <field name="tb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tb cần lắp nt" e="FC Plug-in Device"></header>
    </field>
    <field name="tb2_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tb không cần lắp nt" e="FC Unplug Device"></header>
    </field>
    <field name="cp_bt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chi phí bồi thường, hỗ trợ và tái định cư nt" e="FC Compensation, Support and Resettlement Expenses"></header>
    </field>
    <field name="cc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="CCDC nt" e="FC Tool &amp; Supply"></header>
    </field>
    <field name="cp_ql_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chi phí quản lý dự án nt" e="FC PMU Expenses"></header>
    </field>
    <field name="cp_tv_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chi phí tư vấn đầu tư xây dựng nt" e="FC Construction Consultancy Expenses"></header>
    </field>
    <field name="khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Khác nt" e="FC Other"></header>
    </field>

    <field name="t_ps" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng phát sinh" e="Total Arising"></header>
    </field>
    <field name="xl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Xây lắp" e="Construct"></header>
    </field>
    <field name="t_tb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng số" e="Total"></header>
    </field>
    <field name="tb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tb cần lắp" e="Plug-in Device"></header>
    </field>
    <field name="tb2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tb không cần lắp" e="Unplug Device"></header>
    </field>
    <field name="cp_bt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chi phí bồi thường, hỗ trợ và tái định cư" e="Compensation, Support and Resettlement Expenses"></header>
    </field>
    <field name="cc" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="CCDC" e="Tool &amp; Supply"></header>
    </field>
    <field name="cp_ql" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chi phí quản lý dự án" e="PMU Expenses"></header>
    </field>
    <field name="cp_tv" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chi phí tư vấn đầu tư xây dựng" e="Construction Consultancy Expenses"></header>
    </field>
    <field name="khac" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Khác" e="Other"></header>
    </field>

    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ngay_lct"/>

      <field name="ma_ct0"/>
      <field name="so_ct"/>

      <field name="dien_giai"/>
      <field name="tk_du"/>

      <field name="t_ps_nt"/>
      <field name="xl_nt"/>
      <field name="t_tb_nt"/>
      <field name="tb_nt"/>
      <field name="tb2_nt"/>
      <field name="cp_bt_nt"/>
      <field name="cc_nt"/>
      <field name="cp_ql_nt"/>
      <field name="cp_tv_nt"/>
      <field name="khac_nt"/>

      <field name="t_ps"/>
      <field name="xl"/>
      <field name="t_tb"/>
      <field name="tb"/>
      <field name="tb2"/>
      <field name="cp_bt"/>
      <field name="cc"/>
      <field name="cp_ql"/>
      <field name="cp_tv"/>
      <field name="khac"/>

      <field name="ma_ct"/>
      <field name="stt_rec"/>
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
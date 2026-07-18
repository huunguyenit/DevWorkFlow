<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo ngân sách" e="Budget Report"></title>
  <subTitle v="Kỳ %d1 năm %n1..." e="Period %d1 year %n1..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ma_phi" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phí" e="Expense"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>

    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Ngân sách" e="Month Budget"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Trong kỳ" e="Actual"></header>
    </field>
    <field name="tien_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chênh lệch" e="Difference"></header>
    </field>
    <field name="pt_nt" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
    </field>
    <field name="t_tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Ngân sách năm" e="Year Budget"></header>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Từ đầu năm" e="YTD Actual"></header>
    </field>
    <field name="t_tien_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Cl từ đầu năm" e="YTD Difference"></header>
    </field>
    <field name="t_pt_nt" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
    </field>

    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Ngân sách" e="Month Budget"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Trong kỳ" e="Actual"></header>
    </field>
    <field name="tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chênh lệch" e="Difference"></header>
    </field>
    <field name="pt" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
    </field>
    <field name="t_tien0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Ngân sách năm" e="Year Budget"></header>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Từ đầu năm" e="YTD Actual"></header>
    </field>
    <field name="t_tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Cl từ đầu năm" e="YTD Difference"></header>
    </field>
    <field name="t_pt" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ma_bp"/>
      <field name="ma_phi"/>
      <field name="ten_tk%l"/>

      <field name="tien_nt0"/>
      <field name="tien_nt"/>
      <field name="tien_cl_nt"/>
      <field name="pt_nt"/>
      <field name="t_tien_nt0"/>
      <field name="t_tien_nt"/>
      <field name="t_tien_cl_nt"/>
      <field name="t_pt_nt"/>

      <field name="tien0"/>
      <field name="tien"/>
      <field name="tien_cl"/>
      <field name="pt"/>
      <field name="t_tien0"/>
      <field name="t_tien"/>
      <field name="t_tien_cl"/>
      <field name="t_pt"/>
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
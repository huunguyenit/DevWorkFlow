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
  <title v="Bảng kê danh sách các khế ước" e="Loan Contract List"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk khế ước" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Nội dung" e="Description"></header>
    </field>

    <field name="so_ku" width="100" allowSorting="true" allowFilter="true">
      <header v="Số khế ước" e="No."></header>
    </field>
    <field name="ngay_ku1" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày vay" e="Loan Date"></header>
    </field>
    <field name="ngay_ku2" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày đh" e="Due Date"></header>
    </field>

    <field name="ls_t" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ls trong hạn" e="In Due"></header>
    </field>
    <field name="ls_qh" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ls quá hạn" e="Over Due"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền vay nt" e="FC Amount"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền vay" e="Amount"></header>
    </field>

    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="ma_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Hợp đồng" e="Contract"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk"/>
      <field name="ten_tk%l"/>

      <field name="so_ku"/>
      <field name="ngay_ku1"/>
      <field name="ngay_ku2"/>

      <field name="ls_t"/>
      <field name="ls_qh"/>

      <field name="tien_nt"/>
      <field name="tien"/>

      <field name="ma_vv"/>
      <field name="ma_hd"/>
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
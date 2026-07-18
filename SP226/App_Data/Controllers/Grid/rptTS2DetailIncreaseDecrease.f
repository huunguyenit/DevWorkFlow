<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo chi tiết tăng/giảm CCDC" e="Tool &amp; Supply Increase/Decrease Detail Report"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 to Year %y2..."></subTitle>2
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ten_dc" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên CCDC" e="Tool &amp; Supply Name"></header>
    </field>
    <field name="ma_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="T&amp;S Code"></header>
    </field>
    <field name="ma_bp_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
    </field>
    <field name="ngay_tang" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ky_pb" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Số kỳ pb" e="Distr. Periods"></header>
    </field>
    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="gt_da_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt đã pb nt" e="FC Accum. Distr."></header>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt còn lại nt" e="FC Current Value"></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ giá" e="Ex. Rate"></header>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="gt_da_pb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt đã pb" e="Accum. Distr."></header>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt còn lại" e="Current Value"></header>
    </field>
    <field name="ten_ld_dc" width="300" allowSorting="true" allowFilter="true">
      <header v="Lý do" e="Reason"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_dc"/>
      <field name="ma_dc"/>
      <field name="ma_bp_dc"/>

      <field name="ngay_tang"/>
      <field name="so_ky_pb"/>
      <field name="so_luong"/>

      <field name="nguyen_gia_nt"/>
      <field name="gt_da_pb_nt"/>
      <field name="gt_cl_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_pb"/>
      <field name="gt_cl"/>
      <field name="ten_ld_dc"/>
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
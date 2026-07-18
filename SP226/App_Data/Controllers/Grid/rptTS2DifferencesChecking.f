<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="sysorder = 6" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Kiểm tra chênh lệch giá trị phân bổ" e="Allocation Value Differences Checking"></title>
  <subTitle v="Kỳ %d1 năm %d2..." e="Period %d1 Year %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="####" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_dc" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã công cụ" e="T&amp;S Code"></header>
    </field>
    <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên công cụ" e="Tool &amp; Supply Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="gt_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt pb trong kỳ nt" e="FC Distr. in Period"></header>
    </field>
    <field name="ma_nt" type="String" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>
    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="gt_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt pb trong kỳ" e="Distr. in Period"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_dc"/>
      <field name="ten_dc%l"/>
      <field name="so_luong"/>
      <field name="nguyen_gia_nt"/>
      <field name="gt_pb_ky_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="nguyen_gia"/>
      <field name="gt_pb_ky"/>
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

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
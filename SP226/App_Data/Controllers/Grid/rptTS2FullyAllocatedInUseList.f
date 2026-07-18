<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v=" Bảng kê CCDC hết phân bổ còn sử dụng" e="Tool &amp; Supply Fully Allocated in Used Report"></title>
  <subTitle v="%c %d1 năm %d2..." e="%c %d1 Year %d2..."></subTitle>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="TS Code"></header>
    </field>
    <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công cụ" e="Tool &amp; Supply Name"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận " e="Department"></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="gt_da_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt đã phân bổ nt" e="FC Accum. Distr."></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="gt_da_pb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt đã phân bổ" e="Accum. Distribution"></header>
    </field>

    <field name="ngay_tang" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày tăng" e="Acquisition Date"></header>
    </field>
    <field name="ngay_pb0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày tính pb" e="Distr. Date"></header>
    </field>
    <field name="so_ky_pb" type="Decimal" dataFormatString="# ###" width="80" allowSorting="true" allowFilter="true">
      <header v="Số kỳ pb" e="Periods"></header>
    </field>
    <field name="ngay_pb_kt" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="Closing Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_dc"/>
      <field name="ten_dc%l"/>
      <field name="ma_bp"/>

      <field name="so_luong"/>
      <field name="nguyen_gia_nt"/>
      <field name="gt_da_pb_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_pb"/>

      <field name="ngay_tang"/>
      <field name="ngay_pb0"/>
      <field name="so_ky_pb"/>
      <field name="ngay_pb_kt"/>
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
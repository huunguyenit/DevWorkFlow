<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục CCDC" e="Tool &amp; Supply List"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="T&amp;S Code"></header>
    </field>
    <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên CCDC" e="Tool &amp; Supply Name"></header>
    </field>
    <field name="so_hieu_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hiệu cc" e="Notation"></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="gt_da_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt đã pb nt" e="FC Accum. Distr."></header>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt còn lại nt" e="FC Remain"></header>
    </field>
    <field name="gt_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt pb trong kỳ nt" e="FC Distr. in Period"></header>
    </field>
    <field name="ma_nt" type="String" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>
    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="gt_da_pb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt đã phân bổ" e="Accum. Distr."></header>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt còn lại" e="Remain"></header>
    </field>
    <field name="gt_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt pb trong kỳ" e="Distr. in Period"></header>
    </field>

    <field name="ngay_tang" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày tăng" e="Acquisition Date"></header>
    </field>
    <field name="ngay_pb0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày pb" e="Distr. Date"></header>
    </field>
    <field name="ngay_pb_kt" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="Closing Date"></header>
    </field>
    <field name="so_ky_pb" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Số kỳ phân bổ" e="Distr. Periods"></header>
    </field>

    <field name="so_ct" width="80" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="Voucher Date"/>
    </field>

    <field name="tk_dc" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk công cụ" e="Tool &amp; Supply Account"></header>
    </field>
    <field name="tk_pb" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk chờ phân bổ" e="Allocation Account"></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk chi phí" e="Expense Account"></header>
    </field>

    <field name="ma_bp_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ma_phi" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phí" e="Expense"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_dc"/>
      <field name="ten_dc%l"/>
      <field name="so_hieu_dc"/>
      <field name="so_luong"/>

      <field name="nguyen_gia_nt"/>
      <field name="gt_da_pb_nt"/>
      <field name="gt_cl_nt"/>
      <field name="gt_pb_ky_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_pb"/>
      <field name="gt_cl"/>
      <field name="gt_pb_ky"/>

      <field name="ngay_tang"/>
      <field name="ngay_pb0"/>
      <field name="ngay_pb_kt"/>
      <field name="so_ky_pb"/>

      <field name="ngay_ct"/>
      <field name="so_ct"/>

      <field name="tk_dc"/>
      <field name="tk_pb"/>
      <field name="tk_cp"/>

      <field name="ma_bp_dc"/>
      <field name="ma_phi"/>
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
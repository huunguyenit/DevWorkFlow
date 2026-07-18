<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sổ công cụ dụng cụ" e="Tool &amp; Supply Book"></title>
  <subTitle v="Năm %d1, loại công cụ: %c..." e="Year %d1, Tool &amp; Supply Type: %c..."></subTitle>
  <fields>
    <field name="ngay_tang" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ghi sổ" e="Booked Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số hiệu" e="VC No."></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC Date"></header>
    </field>
    <field name="ma_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="Code"></header>
    </field>
    <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công cụ" e="Tool &amp; Supply Name"></header>
    </field>
    <field name="nuoc_sx" width="100" allowSorting="true" allowFilter="true">
      <header v="Nước sx" e="Made in"></header>
    </field>
    <field name="ngay_sd" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày sd" e="Using Date"></header>
    </field>
    <field name="so_hieu_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hiệu công cụ" e="Code"></header>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="tl_pb" type="Decimal" dataFormatString="##.00" width="80" allowSorting="true" allowFilter="true">
      <header v="Tỉ lệ pb" e="Distr. Rate"></header>
    </field>
    <field name="muc_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Mức p.bổ nt" e="FC Distr. Level"></header>
    </field>
    <field name="pb_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="P.bổ nt các năm trước" e="FC Opening Distr."></header>
    </field>
    <field name="pb_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="P.bổ nt trong năm" e="FC Current Distr."></header>
    </field>
    <field name="pb_lk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="P.bổ lũy kế nt" e="FC Accumulation"></header>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Giá trị cl nt" e="FC Remaining"></header>
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
    <field name="muc_pb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Mức p.bổ" e="Distr. Level"></header>
    </field>
    <field name="pb_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="P.bổ các năm trước" e="Opening Distr."></header>
    </field>
    <field name="pb_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="P.bổ trong năm" e="Current Distr."></header>
    </field>
    <field name="pb_lk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="P.bổ lũy kế" e="Accumulation"></header>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Giá trị còn lại" e="Remaining"></header>
    </field>

    <field name="so_ct_giam" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hiệu giảm" e="Decrease No."></header>
    </field>
    <field name="ngay_giam" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày giảm" e="Date"></header>
    </field>
    <field name="ly_do_giam" width="100" allowSorting="true" allowFilter="true">
      <header v="Lý do giảm" e="Reason"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_tang"/>
      <field name="so_ct"/>
      <field name="ngay_ct"/>
      <field name="ma_dc"/>
      <field name="ten_dc%l"/>
      <field name="nuoc_sx"/>
      <field name="ngay_sd"/>
      <field name="so_hieu_dc"/>

      <field name="nguyen_gia_nt"/>
      <field name="nguyen_gia"/>
      <field name="tl_pb"/>
      <field name="muc_pb_nt"/>
      <field name="pb_dk_nt"/>
      <field name="pb_ck_nt"/>
      <field name="pb_lk_nt"/>
      <field name="gt_cl_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="muc_pb"/>
      <field name="pb_dk"/>
      <field name="pb_ck"/>
      <field name="pb_lk"/>
      <field name="gt_cl"/>

      <field name="so_ct_giam"/>
      <field name="ngay_giam"/>
      <field name="ly_do_giam"/>
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
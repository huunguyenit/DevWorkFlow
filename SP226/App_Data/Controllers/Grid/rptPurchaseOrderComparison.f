<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo so sánh kế hoạch và thực hiện đơn hàng mua" e="Purchase Order Plan and Performance Comparison"></title>
  <subTitle v="Trạng thái đơn hàng: %s..." e="Purchase Order Status: %s..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct_in" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="status2" width="100" allowSorting="true" allowFilter="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl kế hoạch" e="Plan Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá kế hoạch nt" e="FC Plan Price"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng kế hoạch nt" e="FC Plan Turnover"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá kế hoạch" e="Plan Price"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng kế hoạch" e="Plan Turnover"></header>
    </field>

    <field name="so_luong_hd" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl thực hiện" e="Performance Quantity"></header>
    </field>
    <field name="gia_hd_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá thực hiện nt" e="FC Performance Price"></header>
    </field>
    <field name="tien_hd_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng thực hiện nt" e="FC Performance Turnover"></header>
    </field>
    <field name="gia_hd" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá thực hiện" e="Performance Price"></header>
    </field>
    <field name="tien_hd" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng thực hiện" e="Performance Turnover"></header>
    </field>

    <field name="so_luong_cl" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl chênh lệch" e="Difference Quantity"></header>
    </field>
    <field name="gia_cl_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá chênh lệch nt" e="FC Difference Price"></header>
    </field>
    <field name="tien_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng chênh lệch nt" e="FC Difference Turnover"></header>
    </field>
    <field name="gia_cl" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá chênh lệch" e="Difference Price"></header>
    </field>
    <field name="tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng chênh lệch" e="Difference Turnover"></header>
    </field>


    <field name="ma_ct" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="ma_ct_in"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="status2"/>
      <field name="dien_giai"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="so_luong_hd"/>
      <field name="gia_hd_nt"/>
      <field name="tien_hd_nt"/>
      <field name="gia_hd"/>
      <field name="tien_hd"/>
      <field name="so_luong_cl"/>
      <field name="gia_cl_nt"/>
      <field name="tien_cl_nt"/>
      <field name="gia_cl"/>
      <field name="tien_cl"/>

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
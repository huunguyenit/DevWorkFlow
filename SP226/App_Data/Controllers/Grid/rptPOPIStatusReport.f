<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tình trạng đơn hàng" e="Purchase Order Status Report"></title>
  <subTitle v="Báo cáo tình trạng đơn hàng theo %t, trạng thái đơn hàng: %s..." e="Purchase Order Status Report by %t, Purchase Order Status: %s..."></subTitle>

  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ncc" e="Supplier ID"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ncc" e="Supplier Name"></header>
    </field>
    <field name="status2" width="100" allowSorting="true" allowFilter="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="ngay_giao" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Hạn giao" e="Due Date"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Đơn giá" e="Price"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Thành tiền" e="Amount"></header>
    </field>

    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl đặt" e="Q'ty Ordered"></header>
    </field>
    <field name="sl_nhan" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl nhận" e="Q'ty Received"></header>
    </field>
    <field name="sl_hd" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl hóa đơn" e="Q'ty Invoiced"></header>
    </field>
    <field name="sl_tl0" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl trả lại" e="Q'ty Returned"></header>
    </field>
    <field name="sl_cl" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl còn lại" e="Q'ty Remaining"></header>
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
      <field name="ma_ct0"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="status2"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>
      <field name="ngay_giao"/>

      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="gia"/>
      <field name="tien"/>

      <field name="so_luong"/>
      <field name="sl_nhan"/>
      <field name="sl_hd"/>
      <field name="sl_tl0"/>
      <field name="sl_cl"/>

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
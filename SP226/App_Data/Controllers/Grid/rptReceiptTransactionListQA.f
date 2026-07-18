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
  <title v="Bảng kê phiếu kiểm định chất lượng" e="Receipt Transaction List for Quality Assurance"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

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
      <header v="Số kiểm định" e="QC No."></header>
    </field>
    <field name="so_pn" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số pn" e="Receipt No."></header>
    </field>
    <field name="ngay_pn" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày pn" e="Receipt Date"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
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
    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="ten_kt" width="300" allowSorting="true" allowFilter="true">
      <header v="Kết quả kiểm tra" e="QC Result"></header>
    </field>
    <field name="ma_nx" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhập xuất" e="Reason Code"></header>
    </field>
    <field name="ten_nx" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhập xuất" e="Reason Name"></header>
    </field>
    <field name="ghi_chu" width="300" allowSorting="true" allowFilter="true">
      <header v="Ghi chú" e="Remarks"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ncc" e="Supplier ID"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ncc" e="Supplier Name"></header>
    </field>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã lô" e="Lot"></header>
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
      <field name="so_pn"/>
      <field name="ngay_pn"/>

      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="ten_kt"/>
      <field name="ma_nx"/>
      <field name="ten_nx"/>
      <field name="ghi_chu"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>

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
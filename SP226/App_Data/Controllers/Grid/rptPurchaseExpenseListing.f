<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY TransferID "rptPurchaseInvoiceList">

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng kê chi phí mua hàng" e="Purchase Charges Listing"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ncc" e="Supplier ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ncc" e="Supplier Name"></header>
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

    <field name="cp_vc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí vận chuyển nt" e="FC Freight Amount"></header>
    </field>
    <field name="cp_bh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí bảo hiểm nt" e="FC Insurance Amount"></header>
    </field>
    <field name="cp_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí khác nt" e="FC Other Amount"></header>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Tổng chi phí nt" e="FC Total of Charges"></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Thuế nt" e="FC Tax"></header>
    </field>

    <field name="cp_vc" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí vận chuyển" e="Freight Amount"></header>
    </field>
    <field name="cp_bh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí bảo hiểm" e="Insurance Amount"></header>
    </field>
    <field name="cp_khac" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Chi phí khác" e="Other Amount"></header>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Tổng chi phí" e="Total of Charges"></header>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Thuế" e="Tax"></header>
    </field>

    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true">
      <header v="Kho hàng" e="Site"></header>
    </field>
    <field name="ma_nx" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nx" e="Reason"></header>
    </field>
    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ma_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Hợp đồng" e="Contract"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct0"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="cp_vc_nt"/>
      <field name="cp_bh_nt"/>
      <field name="cp_khac_nt"/>
      <field name="cp_nt"/>
      <field name="thue_nt"/>


      <field name="cp_vc"/>
      <field name="cp_bh"/>
      <field name="cp_khac"/>
      <field name="cp"/>
      <field name="thue"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_vv"/>
      <field name="ma_bp"/>
      <field name="ma_hd"/>

      <field name="stt_rec"/>
      <field name="ma_ct"/>
    </view>
  </views>

  <commands>
    &XMLWhenGridShowingPrintRight;
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      &PrintRightScript;
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
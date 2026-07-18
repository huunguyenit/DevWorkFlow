<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.001;" valid="systotal = 1" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thẻ kho/Sổ chi tiết vật tư" e="Stock Card"></title>
  <subTitle v="Kho: %s1 - %s2, vật tư: %s3 - %s4, đvt: %t1, từ ngày %d1 đến ngày %d2..." e="Site: %s1 - %s2, Item: %s3 - %s4, UOM: %t1, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ghi sổ" e="Posting Date"></header>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date" />
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    &ReferenceNumberFields;

    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_nx" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhập xuất" e="Reason"></header>
    </field>
    <field name="tk_du" type="String" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Giá nt" e="FC Unit Cost"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Giá" e="Unit Cost"></header>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng nhập" e="Received Qty."></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền nhập nt" e="FC Received Amt."></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền nhập" e="Received Amount"></header>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng xuất" e="Issued Qty."></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền xuất nt" e="FC Issued Amt."></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền xuất" e="Issued Amount"></header>
    </field>
    <field name="sl_ton" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn" e="Closing Qty."></header>
    </field>

    <field name="so_du_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số dư nt" e="FC Balance Amt."></header>
    </field>
    <field name="so_du" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số dư" e="Balance Amount"></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>

    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ngay_lct"/>
      <field name="ma_ct0"/>
      <field name="so_ct"/>

      &ReferenceNumberViews;

      <field name="dien_giai"/>
      <field name="ma_nx"/>
      <field name="tk_du"/>

      <field name="gia_nt"/>
      <field name="gia"/>
      <field name="sl_nhap"/>
      <field name="tien_nt_n"/>
      <field name="tien_nhap"/>
      <field name="sl_xuat"/>
      <field name="tien_nt_x"/>
      <field name="tien_xuat"/>
      <field name="sl_ton"/>
      <field name="so_du_nt"/>
      <field name="so_du"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_vv"/>

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
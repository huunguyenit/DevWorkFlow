<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sổ chi tiết bán hàng" e="Detailed Sales Ledger"></title>
  <subTitle v="Vật tư: %s1 - %s2%s3, từ ngày %d1 đến %d2..." e="Item: %s1 - %s2%s3, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ghi sổ" e="Posting Date"></header>
    </field>
    <field name="ngay_lct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date" />
    </field>
    <field name="ma_ct_in" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    &ReferenceNumberFields;

    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá bán nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu nt" e="FC Amount"></header>
    </field>
    <field name="gt_thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giảm trừ thuế nt" e="FC Tax Deduction"></header>
    </field>
    <field name="gt_khac_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giảm trừ khác nt" e="FC Other Deduction"></header>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn nt" e="FC Cogs Amt."></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="gia" type="Decimal" width="120" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá bán" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu" e="Amount"></header>
    </field>
    <field name="gt_thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giảm trừ thuế" e="Tax Deduction"></header>
    </field>
    <field name="gt_khac" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giảm trừ khác" e="Other Deduction"></header>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn" e="Cogs Amt."></header>
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
      <field name="ngay_lct"/>
      <field name="ma_ct_in"/>
      <field name="so_ct"/>

      &ReferenceNumberViews;

      <field name="dien_giai"/>

      <field name="so_luong"/>

      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="gt_thue_nt"/>
      <field name="gt_khac_nt"/>
      <field name="tien_nt0"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia"/>
      <field name="tien"/>
      <field name="gt_thue"/>
      <field name="gt_khac"/>
      <field name="tien0"/>

      <field name="stt_rec"/>
      <field name="ma_ct"/>
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
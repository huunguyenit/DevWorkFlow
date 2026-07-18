<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY TransferID "rptPurchaseReportByObjects">

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;
  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.012;" valid="systotal = 1" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Báo cáo giá trị hàng nhập theo nhà cung cấp, hợp đồng, vụ việc, mã nhập xuất" e="Purchase Summary by Supplier/Contract/Job/Reason"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2%s..." e="Date from %d1 to %d2%s..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_poth2b', Controller: 'rptPurchaseReportByObjects', Name: '[ma]', Value: '[ma] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã" e="Id"></header>
    </field>
    <field name="ten%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>

    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt0" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá mua nt" e="FC Price"></header>
    </field>
    <field name="tien_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng nt" e="FC Purchase Amt."></header>
    </field>
    <field name="cp_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Chi phí nt" e="FC Charge"></header>
    </field>
    <field name="nk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Nhập khẩu nt" e="FC Import Amt."></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Thuế nt" e="FC Tax"></header>
    </field>

    <field name="gia0" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá mua" e="Price"></header>
    </field>
    <field name="tien0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền hàng" e="Purchase Amt."></header>
    </field>
    <field name="cp" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Chi phí" e="Charge"></header>
    </field>
    <field name="nk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Nhập khẩu" e="Import"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Thuế" e="Tax"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma"/>
      <field name="ten%l"/>

      <field name="so_luong"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>
      <field name="cp_nt"/>
      <field name="nk_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="thue_nt"/>

      <field name="gia0"/>
      <field name="tien0"/>
      <field name="cp"/>
      <field name="nk"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="thue"/>
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
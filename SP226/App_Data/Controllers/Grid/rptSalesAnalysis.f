<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.012;" valid="systotal = 1" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân tích bán hàng theo thời gian" e="Sales Analysis by Time"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_soth4', Controller: 'rptSalesAnalysis', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="so_luong_kt" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl kỳ trước" e="Prev. Qty"></header>
    </field>
    <field name="so_luong_kn" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl kỳ này" e="Qty"></header>
    </field>
    <field name="so_luong_lk" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl lũy kế" e="Accum. Qty"></header>
    </field>

    <field name="gia_nt2_kt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán kt nt" e="FC Prev. Price"></header>
    </field>
    <field name="gia_nt2_kn" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán kn nt" e="FC Price"></header>
    </field>
    <field name="gia_nt2_lk" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán lk nt" e="FC Accum. Price"></header>
    </field>

    <field name="tien_nt2_kt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu kt nt" e="FC Prev. Turnover"></header>
    </field>
    <field name="tien_nt2_kn" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu kn nt" e="FC Turnover"></header>
    </field>
    <field name="tien_nt2_lk" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu lk nt" e="FC Accum. Turn."></header>
    </field>

    <field name="thue_nt_kt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế kt nt" e="FC Prev. Tax Amt."></header>
    </field>
    <field name="thue_nt_kn" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế kn nt" e="FC Tax"></header>
    </field>
    <field name="thue_nt_lk" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế lk nt" e="FC Accum. Tax"></header>
    </field>

    <field name="ck_nt_kt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu kt nt" e="FC Prev. Discount"></header>
    </field>
    <field name="ck_nt_kn" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu kn nt" e="FC Discount"></header>
    </field>
    <field name="ck_nt_lk" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu lk nt" e="FC Accum. Discount"></header>
    </field>

    <field name="pt_nt_kt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu kt nt" e="FC Prev. Receiv."></header>
    </field>
    <field name="pt_nt_kn" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu kn nt" e="FC Receiv."></header>
    </field>
    <field name="pt_nt_lk" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu lk nt" e="FC Accum. Receiv."></header>
    </field>

    <field name="gia_nt_kt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn kt nt" e="FC Prev. Cogs"></header>
    </field>
    <field name="gia_nt_kn" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn kn nt" e="FC Cogs"></header>
    </field>
    <field name="gia_nt_lk" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn lk nt" e="FC Accum. Cogs"></header>
    </field>

    <field name="tien_nt_kt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn kt nt" e="FC Prev. Cogs"></header>
    </field>
    <field name="tien_nt_kn" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn kn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt_lk" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn lk nt" e="FC Accum. Cogs"></header>
    </field>

    <field name="lai_nt_kt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi kt nt" e="FC Prev. Profit"></header>
    </field>
    <field name="lai_nt_kn" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi kn nt" e="FC Profit"></header>
    </field>
    <field name="lai_nt_lk" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi lk nt" e="FC Accum. Profit"></header>
    </field>

    <field name="gia2_kt" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán kt" e="Prev. Price"></header>
    </field>
    <field name="gia2_kn" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán kn" e="Price"></header>
    </field>
    <field name="gia2_lk" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá bán lk" e="Accum. Price"></header>
    </field>

    <field name="tien2_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu kt" e="Prev. Turnover"></header>
    </field>
    <field name="tien2_kn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu kn" e="Turnover"></header>
    </field>
    <field name="tien2_lk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu lk" e="Accum. Turnover"></header>
    </field>

    <field name="thue_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế kt" e="Prev. Tax Amount"></header>
    </field>
    <field name="thue_kn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế kn" e="Tax Amount"></header>
    </field>
    <field name="thue_lk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Thuế lk" e="Accum. Tax Amount"></header>
    </field>

    <field name="ck_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu kt" e="Prev. Discount"></header>
    </field>
    <field name="ck_kn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu kn" e="Discount"></header>
    </field>
    <field name="ck_lk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu lk" e="Accum. Discount"></header>
    </field>

    <field name="pt_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu kt" e="Prev. Receiv."></header>
    </field>
    <field name="pt_kn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu kn" e="Receiv."></header>
    </field>
    <field name="pt_lk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phải thu lk" e="Accum. Receiv."></header>
    </field>

    <field name="gia_kt" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn kt" e="Prev. Cogs"></header>
    </field>
    <field name="gia_kn" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn kn" e="Cogs"></header>
    </field>
    <field name="gia_lk" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá vốn lk" e="Accum. Cogs"></header>
    </field>

    <field name="tien_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn kt" e="Prev. Cogs"></header>
    </field>
    <field name="tien_kn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn kn" e="Cogs Amount"></header>
    </field>
    <field name="tien_lk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn lk" e="Accum. Cogs"></header>
    </field>

    <field name="lai_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi kt" e="Prev. Profit"></header>
    </field>
    <field name="lai_kn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi kn" e="Profit"></header>
    </field>
    <field name="lai_lk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi lk" e="Accum. Profit"></header>
    </field>

    <field name="sysorder" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="so_luong_kt"/>
      <field name="so_luong_kn"/>
      <field name="so_luong_lk"/>

      <field name="gia_nt2_kt"/>
      <field name="gia_nt2_kn"/>
      <field name="gia_nt2_lk"/>

      <field name="tien_nt2_kt"/>
      <field name="tien_nt2_kn"/>
      <field name="tien_nt2_lk"/>

      <field name="thue_nt_kt"/>
      <field name="thue_nt_kn"/>
      <field name="thue_nt_lk"/>

      <field name="ck_nt_kt"/>
      <field name="ck_nt_kn"/>
      <field name="ck_nt_lk"/>

      <field name="pt_nt_kt"/>
      <field name="pt_nt_kn"/>
      <field name="pt_nt_lk"/>

      <field name="gia_nt_kt"/>
      <field name="gia_nt_kn"/>
      <field name="gia_nt_lk"/>

      <field name="tien_nt_kt"/>
      <field name="tien_nt_kn"/>
      <field name="tien_nt_lk"/>

      <field name="lai_nt_kt"/>
      <field name="lai_nt_kn"/>
      <field name="lai_nt_lk"/>


      <field name="gia2_kt"/>
      <field name="gia2_kn"/>
      <field name="gia2_lk"/>

      <field name="tien2_kt"/>
      <field name="tien2_kn"/>
      <field name="tien2_lk"/>

      <field name="thue_kt"/>
      <field name="thue_kn"/>
      <field name="thue_lk"/>

      <field name="ck_kt"/>
      <field name="ck_kn"/>
      <field name="ck_lk"/>

      <field name="pt_kt"/>
      <field name="pt_kn"/>
      <field name="pt_lk"/>

      <field name="gia_kt"/>
      <field name="gia_kn"/>
      <field name="gia_lk"/>

      <field name="tien_kt"/>
      <field name="tien_kn"/>
      <field name="tien_lk"/>

      <field name="lai_kt"/>
      <field name="lai_kn"/>
      <field name="lai_lk"/>

      <field name="sysorder"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteSFht8yuUiTj8eqyrjtrQDQ+RC6HyVx6YuEzOkJjzGVKT0rQtj5clppatNWIKo9nhwsit4/RBrbp+77wTcOmK1Ht6T4xrXkO7a2Ub1eRq7WiMC7nph6TyQaFPAt4Ldl8Obg3soJe9FYuWxCeKCB1XVlSblMf91b+X237jxKEXg1</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
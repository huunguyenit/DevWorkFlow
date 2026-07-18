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
  <title v="Phân tích mua hàng theo thời gian" e="Purchase Analysis by Time"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_poth4', Controller: 'rptPurchaseAnalysis', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="so_luong_kt" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl kỳ trước" e="Prev. Qty"></header>
    </field>
    <field name="so_luong_kn" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl kỳ này" e="Qty"></header>
    </field>
    <field name="so_luong_lk" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Sl lũy kế" e="Accum. Qty"></header>
    </field>

    <field name="tien_nt0_kt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Giá trị kt nt" e="FC Prev. Amount"></header>
    </field>
    <field name="tien_nt0_kn" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Giá trị kn nt" e="FC Amount"></header>
    </field>
    <field name="tien_nt0_lk" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Giá trị lk nt" e="FC Accum. Amount"></header>
    </field>

    <field name="tien0_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Giá trị kt" e="Prev. Amount"></header>
    </field>
    <field name="tien0_kn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Giá trị kn" e="Amount"></header>
    </field>
    <field name="tien0_lk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true" aggregate="Sum">
      <header v="Giá trị lk" e="Accum. Amount"></header>
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

      <field name="tien_nt0_kt"/>
      <field name="tien_nt0_kn"/>
      <field name="tien_nt0_lk"/>

      <field name="tien0_kt"/>
      <field name="tien0_kn"/>
      <field name="tien0_lk"/>

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
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

<grid type="Report" valid="systotal = 1" filter="&Repetition.Key.012;" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tồn kho vật tư chậm luân chuyển" e="Slow-moving Item Report"></title>
  <subTitle v="Ngày %d2, số ngày luân chuyển: %n..." e="Date %d2, No. of Slow-Moving Date: %n..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ### ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ngay_xuat" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày xuất cuối" e="Last Issue"></header>
    </field>
    <field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ngay_xuat"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="tien_nt"/>
      <field name="tien"/>
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
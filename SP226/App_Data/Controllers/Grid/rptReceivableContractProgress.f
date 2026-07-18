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
  <title v="Báo cáo tiến độ thanh toán hợp đồng" e="Contract Progress Reports"></title>
  <subTitle v="Hợp đồng từ ngày %dc1 đến ngày %dc2, chứng từ từ ngày %dv1 đến ngày %dv2..." e="Contract Date from %dc1 to %dc2, Voucher Date from %dv1 to %dv2..."></subTitle>

  <fields>
    <field name="ma_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>

    <field name="dot_tt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đợt thanh toán" e="Payment Phase"></header>
    </field>
    <field name="han_tt" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày đến hạn" e="Due Date"></header>
    </field>

    <field name="so_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thanh toán nt" e="FC Paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="con_lai_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Còn lại nt" e="FC Remaining"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thanh toán" e="Paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="con_lai" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Còn lại" e="Remaining"></header>
      <items style="Numeric"/>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="ma_hd"/>
      <field name="ten_hd"/>
      <field name="dot_tt"/>
      <field name="han_tt"/>
      <field name="so_tien_nt"/>
      <field name="da_tt_nt"/>
      <field name="con_lai_nt"/>
      <field name="so_tien"/>
      <field name="da_tt"/>
      <field name="con_lai"/>
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
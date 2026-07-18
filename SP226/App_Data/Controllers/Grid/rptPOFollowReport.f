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
  <title v="Báo cáo theo dõi đơn hàng" e="Purchase Order Tracking Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>

    <field name="ma_ct" width="80" allowSorting="true" allowFilter="true">
      <header v="Loại đh" e="PO Type"></header>
    </field>
    <field name="so_dh" width="80" allowSorting="true" allowFilter="true" align="left">
      <header v="Đơn hàng" e="PO Number"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày đh" e="PO Date"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ncc" e="Supplier"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="50" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="ma_nt" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC"></header>
    </field>
    <field name="ty_gia" width="100" type="Decimal" allowSorting="true" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ giá" e="Ex. Rate"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Đơn giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" width="120" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Đơn giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_suat_nk" type="Decimal" dataFormatString="#0.00" inactivate="true" readOnly="true" width="80" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Thuế suất nk" e="Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" clientDefault="0" width="120" aggregate="Sum">
      <header v="Thuế nk nt" e="FC Import Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="nk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" clientDefault="0" width="120" aggregate="Sum">
      <header v="Thuế nk" e="Import Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="#0.00" inactivate="true" readOnly="true" width="80" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Thuế suất" e="VAT Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" clientDefault="0" width="120" aggregate="Sum">
      <header v="Thuế gtgt nt" e="FC VAT Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" clientDefault="0" width="120" aggregate="Sum">
      <header v="Thuế gtgt" e="VAT Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" clientDefault="0" width="120" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;" clientDefault="0" width="120" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_tt" width="60" allowSorting="true" allowFilter="true">
      <header v="Hạn tt" e="Dr. Term"></header>
    </field>
    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày giao" e="Delivery Date"></header>
    </field>
    <field name="sl_nhap" type="Decimal" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Sl nhập" e="Q'ty received"></header>
    </field>
    <field name="sl_cl" type="Decimal" dataFormatString="@quantityViewFormat" allowFilter="&GridReportAllowFilter.Number;" width="120" allowSorting="true" aggregate="Sum">
      <header v="Sl còn lại" e="Q'ty Remaining"></header>
    </field>
    <field name="ong_ba" width="100" allowSorting="true" allowFilter="true">
      <header v="Người y.cầu" e="Req. Person"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Req. Dept."></header>
    </field>
    <field name="dien_giai" width="120" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ct"/>
      <field name="so_dh"/>
      <field name="ngay_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="gia_nt"/>
      <field name="gia"/>
      <field name="thue_suat_nk"/>
      <field name="nk_nt"/>
      <field name="nk"/>
      <field name="thue_suat"/>
      <field name="thue_nt"/>
      <field name="thue"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="ma_tt"/>
      <field name="ngay_giao"/>
      <field name="sl_nhap"/>
      <field name="sl_cl"/>
      <field name="ong_ba"/>
      <field name="ma_bp"/>
      <field name="dien_giai"/>
    </view>
  </views>
  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQM9HDz/sV55eKsIcXNLATLtepTYGGsKVEZzw7lN9yfL88sMOlADNy81RhPu0nbseP03PMdXgyuJwwTPia4zeDtbQiI8C3Op3LSVs8rghzXrnekTiDo+aBQ0NUFLrqPEuuL939akeK41i/jKSaDz5tBD8o6UOepwgy3JiPrHz3dSehKq8iWO/pRt20ZROOmHeaOoppGb7omq00GkfiZHfJrdjzz34ybWhi7MMYfEml+/uolzK99o1aF3PfTdUMbzztyfk/BNSd6ODzL5rSXMZKKA08yehCA/aeP92J4JDuf+Rar7mZa4C4UNPnYM53BIuqZIezTiZGkwMB3xSzGHPDHqg==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>
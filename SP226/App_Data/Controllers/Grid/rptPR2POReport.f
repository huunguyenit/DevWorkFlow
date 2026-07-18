<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>
<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Kế hoạch mua hàng" e="PO Plan"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="80" hidden="false" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng" e="PR Quantity"></header>
    </field>
    <field name="sl_dh" type="Decimal" dataFormatString="@quantityViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl đã đặt" e="PO Quantity"></header>
    </field>
    <field name="sl_cl" type="Decimal" dataFormatString="@quantityViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl còn lại" e="Q'ty Remaining"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="ma_bp"/>
      <field name="so_luong"/>
      <field name="sl_dh"/>
      <field name="sl_cl"/>

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
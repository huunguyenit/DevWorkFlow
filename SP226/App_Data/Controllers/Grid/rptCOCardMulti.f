<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thẻ giá thành cho nhiều sản phẩm" e="Cost of Product Card for Items"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến %p2 năm %y2%s..." e="Period from %p1 Year %y1 to %p2 Year %y2%s..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Int64" dataFormatString="### ### ###" width="60" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã sản phẩm" e="Product Code"></header>
    </field>
    <field name="ten_vt" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" width="100" align="right" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>

    <field name="sl_tp" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" readOnly="true">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" readOnly="true">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Tiền" e="Amount"></header>
    </field>

    <field name="xKey" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt"/>
      <field name="ma_sp"/>
      <field name="ten_vt"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>

      <field name="sl_tp"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="gia"/>
      <field name="tien"/>

      <field name="xKey"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFeceF5sjWEgCS6RwL2dYd1towTjWqC2sa2dSC+uFEr1eYoSzsLWNcHuVgpJ8kQ5QZrPQ2GfMEi2hQjVlR6/tJCWB</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8j3aAZwuyjS3R4kj/nwZGgl1HFgrEjinrzmE4eDd6ic50oQeeaqm1FCSwfR+mXI7xBgDwk7obhvpIdCGcATTRJL</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDoYbG5xCIJQRgwKbeoRTr+dZpz/jq9Zw9x1oSlsC81TkD5LHce+RyraH5HGGQhfhQiNMK2oMKAnXNSl70YupbFzewfkS64GL6RwEIqG3TTXVHxeWOADepBTCsEEvFf3pcaAet97DQdUgH9FVZA1umDt96zIHZRisOHIU1pMWArYrakKH3ztep4hJ0gBGymsaMAyc8spHpviksadVHIIeLV/ZeGNIq30GDlp704Sd4kXj7D67GdGjpEo2Mh64d6c+yF8CN0VChZ4h0CewRHMbbuounYKQo8/dHWOYlKqev0QTzZrGHFLLr4y+1xnG79+q7guZV5wmONoV8GDH2EHPCBsh1RcezBSs9lXe5TY+yjXXXIcpbOgn7iKOGzvDLTakTw==</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>
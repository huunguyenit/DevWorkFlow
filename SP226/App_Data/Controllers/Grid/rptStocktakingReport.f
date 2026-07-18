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

<grid type="Report" filter="&Repetition.Key.005;" valid="systotal = 1" repetition="&Repetition.Key.006;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tình hình kiểm kê" e="Stocktaking Status Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2, số yêu cầu: %s..." e="Date from %d1 to %d2, Request No.: %s ..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="####" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="nhom_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm vật tư" e="Item Group"></header>
      <footer v="Mã loại vật tư" e="Item Type"></footer>
    </field>
    <field name="ten_nhom_vt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm vật tư" e="Item Group Name"></header>
      <footer v="Tên loại vật tư" e="Item Type Name"></footer>
    </field>
    <field name="dien_giai2" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="sl_can_kk" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" clientDefault="0" width="100" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl mặt hàng cần kiểm kê" e="Quantity Needs to Count"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_da_kk" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" clientDefault="0" width="100" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl mặt hàng đã kiểm kê" e="Counted Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_con_kk" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" clientDefault="0" width="100" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl mặt hàng còn phải kiểm kê" e="Quantity Remains to be Counted"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_trong" type="Decimal" width="100" dataFormatString="###.00" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tỷ trọng (%)" e="Density (%)"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="nhom_vt"/>
      <field name="ten_nhom_vt"/>
      <field name="dien_giai2"/>
      <field name="sl_can_kk"/>
      <field name="sl_da_kk"/>
      <field name="sl_con_kk"/>
      <field name="ty_trong"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idjr97X9tQQuY7dqku1lQdvMZVrM9TA7cqNKaNHBuhS1aK1CWVhFuLAT35qt5FN0n8K1g4E6FNYLD3++UH0XtAvFJ1d4KOD1lwwUBfGpZfSSN4jh0ZJPNPSusnTuZSznq+SrLIdyKrF0uz85Ug60fYlHQbMuwZTe9oaSxguD1/bC/k7DfyvQ3X+M7VlUAz9j3BpEffEsbqqSeerEIZ8bPPZ/gbB531PKknnIWYgSuoQbEQKyVpM6YR8sU37+dlmgyqfnCu3QenPR2LViYOq7gPkRpmbe3KvzSQsTkf1FtMy0og==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
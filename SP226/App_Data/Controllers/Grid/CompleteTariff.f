<?xml version="1.0" encoding="utf-8"?>

<grid table="tdmthuetp" code="ma_thue" order="ma_thue" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục biểu thuế toàn phần" e="The Scale of Flat Rate Tariff"></title>
  <subTitle v="Cập nhật biểu thuế toàn phần: thêm, sửa, xóa..." e="Add, Edit, Delete The Scale of Flat Rate Tariff..."></subTitle>
  <fields>
    <field name="ma_thue" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã thuế" e="Tax Code"></header>
    </field>
    <field name="ten_thue%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên thuế" e="Tax Name"></header>
    </field>
    <field name="thue_suat" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
    </view>
  </views>

</grid>
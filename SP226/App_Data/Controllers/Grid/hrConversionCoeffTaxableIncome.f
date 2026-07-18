<?xml version="1.0" encoding="utf-8"?>

<grid table="hrhsqdtntt" code="stt" order="stt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo hệ số qui đổi thu nhập tính thuế" e="Taxable Income Conversion Ratio Declaration"></title>
  <subTitle v="Cập nhật hệ số qui đổi thu nhập tính thuế: thêm, sửa, xóa..." e="Add, Edit, Delete Taxable Income Conversion Ratio Declaration..."></subTitle>
  <fields>
    <field name="stt" isPrimaryKey="true" width="60" type="Decimal" dataFormatString="##0" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type ="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="TNQĐ trên" e="Conversion Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="he_so" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="tien"/>
      <field name="he_so"/>
    </view>
  </views>
</grid>
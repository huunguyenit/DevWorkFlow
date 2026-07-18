<?xml version="1.0" encoding="utf-8"?>

<grid table="tdmthuelt" code="stt" order="stt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục biểu thuế lũy tiến từng phần" e="The Scale of Progressive Tax Tariff"></title>
  <subTitle v="Cập nhật biểu thuế lũy tiến từng phần: thêm, sửa, xóa..." e="Add, Edit, Delete Progressive Tariff..."></subTitle>
  <fields>
    <field name="stt" isPrimaryKey="true" width="30" type="Decimal" dataFormatString="##0" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type ="Decimal" width="120" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="TNTT tháng trên" e="Monthly Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type ="Decimal" width="120" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="TNTT năm trên" e="Annual Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_le" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="tien"/>
      <field name="tien2"/>
      <field name="ty_le"/>
    </view>
  </views>
</grid>
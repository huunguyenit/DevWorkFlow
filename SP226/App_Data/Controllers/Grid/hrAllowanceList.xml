<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrdmpc" code="ma_pc" order="ma_pc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục phụ cấp" e="Allowance List"></title>
  <subTitle v="Cập nhật phụ cấp: thêm, sửa, xóa..." e="Add, Edit, Delete Allowance..."></subTitle>
  <fields>
    <field name="ma_pc" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phụ cấp" e="Code"></header>
    </field>
    <field name="ten_pc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên phụ cấp" e="Description"></header>
    </field>
    <field name="tien" type ="Decimal" width="120" dataFormatString="@generalCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right">
      <header v="Tiền phụ cấp" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_le" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_pc"/>
      <field name="ten_pc%l"/>
      <field name="tien"/>
      <field name="ty_le"/>
    </view>
  </views>
</grid>
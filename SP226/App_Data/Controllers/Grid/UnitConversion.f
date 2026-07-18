<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY UnitTag "dmvt">
  <!ENTITY UnitResult "case when @q = '' then '' else ' and (' + @q + ')' end">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_vt">
  <!ENTITY Tag "vdmqddvt">
]>

<grid table="vdmqddvt" code="ma_vt, dvt" order="ma_vt, dvt" filter="xtype = 'U'&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục quy đổi đơn vị tính" e="Unit Conversion"></title>
  <subTitle v="Cập nhật quy đổi đơn vị tính: thêm, sửa, xóa..." e="Add, Edit, Delete Unit Conversion..."></subTitle>

  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="ItemUOMConversion" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$vdmvtdvt.ten_vt%l"/>
    </field>
    <field name="ten_vt%l" readOnly="true" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Description"></header>
    </field>
    <field name="dvt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="he_so" type="Decimal" width="120" dataFormatString="&CoefficientViewFormat;" allowSorting="true" allowFilter="true" align="right">
      <header v="Hệ số" e="Coefficient"></header>
    </field>
    <field name="dvt1" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Đvt quy đổi" e="Base Unit"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>
      <field name="dvt1"/>
    </view>
  </views>
</grid>
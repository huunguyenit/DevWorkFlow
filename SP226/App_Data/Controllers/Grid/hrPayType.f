<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrloailuong" code="ma_loai_lg" order="stt, ma_loai_lg" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo loại lương" e="Pay Type"></title>
  <subTitle v="Cập nhật loại lương: sửa, xóa..." e="Edit, Delete Pay Type..."></subTitle>
  <fields>
    <field name="form" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="####0" width="60" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_loai_lg" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại" e="Pay Type"></header>
    </field>
    <field name="ten_loai_lg%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="kieu" width="60" align="right" allowSorting="true" allowFilter="true">
      <header v="Kiểu" e="Style"></header>
    </field>
    <field name="cong_thuc" width="300" allowSorting="true" allowFilter="true" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="stt"/>
      <field name="ma_loai_lg"/>
      <field name="ten_loai_lg%l"/>
      <field name="kieu"/>
      <field name="cong_thuc"/>
    </view>
  </views>
</grid>
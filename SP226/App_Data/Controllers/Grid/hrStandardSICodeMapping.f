<?xml version="1.0" encoding="utf-8"?>

<grid table="hrmapbh" code="ma_tc" order="ma_tc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo tham chiếu BHXH" e="Standard SI Code Mapping"></title>
  <subTitle v="Cập nhật khai báo tham chiếu BHXH: thêm, sửa, xóa..." e="Add, Edit, Delete Standard SI Code Mapping..."></subTitle>

  <fields>
    <field name="ma_tc" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tham chiếu" e="Code"></header>
    </field>
    <field name="ten_tc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tham chiếu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tc"/>
      <field name="ten_tc%l"/>
    </view>
  </views>

</grid>
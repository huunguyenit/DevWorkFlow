<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmtdhv" code="ma_tdhv" order="ma_tdhv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục trình độ học vấn" e="Education Level List"></title>
  <subTitle v="Cập nhật trình độ học vấn: thêm, sửa, xóa..." e="Add, Edit, Delete Education Level..."></subTitle>
  <fields>
    <field name="ma_tdhv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã trình độ" e="Code"></header>
    </field>
    <field name="ten_tdhv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên trình độ" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tdhv"/>
      <field name="ten_tdhv%l"/>
    </view>
  </views>
</grid>
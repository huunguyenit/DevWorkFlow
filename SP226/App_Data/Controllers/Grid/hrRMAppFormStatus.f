<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmtths" code="ma_tt" order="ma_tt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục trạng thái hồ sơ" e="Application Form Status List"></title>
  <subTitle v="Cập nhật trạng thái hồ sơ: thêm, sửa, xóa..." e="Add, Edit, Delete Application Form Status..."></subTitle>
  <fields>
    <field name="ma_tt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã trạng thái" e="Code"></header>
    </field>
    <field name="ten_tt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên trạng thái" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tt"/>
      <field name="ten_tt%l"/>
    </view>
  </views>
</grid>
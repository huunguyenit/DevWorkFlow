<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmldtca" code="ma_ly_do" order="ma_ly_do" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục lý do tăng ca" e="Overtime Reason"></title>
  <subTitle v="Cập nhật lý do tăng ca: thêm, sửa, xóa..." e="Add, Edit, Delete Overtime Reason..."></subTitle>

  <fields>
    <field name="ma_ly_do" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã lý do" e="Code"></header>
    </field>
    <field name="ten_ly_do%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên lý do" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ly_do"/>
      <field name="ten_ly_do%l"/>
    </view>
  </views>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<grid table="dmqt" code="ma_qt" order="ma_qt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục quốc tịch" e="Nationality List"></title>
  <subTitle v="Cập nhật quốc tịch: thêm, sửa, xóa..." e="Add, Edit, Delete Nationality..."></subTitle>

  <fields>
    <field name="ma_qt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quốc tịch" e="Nationality"></header>
    </field>
    <field name="ten_qt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quốc tịch" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_qt"/>
      <field name="ten_qt%l"/>
    </view>
  </views>
</grid>
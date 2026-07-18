<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmtg" code="ma_tg" order="ma_tg" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục tôn giáo" e="Religion List"></title>
  <subTitle v="Cập nhật tôn giáo: thêm, sửa, xóa..." e="Add, Edit, Delete Religion..."></subTitle>
  <fields>
    <field name="ma_tg" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tôn giáo" e="Religion"></header>
    </field>
    <field name="ten_tg%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tôn giáo" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tg"/>
      <field name="ten_tg%l"/>
    </view>
  </views>
</grid>
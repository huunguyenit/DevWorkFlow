<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmnldt" code="ma_nl" order="ma_nl" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo nguồn lực đào tạo" e="Training Resources"></title>
  <subTitle v="Cập nhật nguồn lực đào tạo: thêm, sửa, xóa..." e="Add, Edit, Delete Training Resource..."></subTitle>
  <fields>
    <field name="ma_nl" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nguồn lực" e="Resource Code"></header>
    </field>
    <field name="ten_nl%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nguồn lực" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nl"/>
      <field name="ten_nl%l"/>
    </view>
  </views>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmnguontd" code="ma_nguon" order="ma_nguon" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nguồn tuyển dụng" e="Recruitment Sources"></title>
  <subTitle v="Cập nhật nguồn tuyển dụng: thêm, sửa, xóa..." e="Add, Edit, Delete Recruitment Source..."></subTitle>
  <fields>
    <field name="ma_nguon" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nguồn" e="Code"></header>
    </field>
    <field name="ten_nguon%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nguồn" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nguon"/>
      <field name="ten_nguon%l"/>
    </view>
  </views>
</grid>
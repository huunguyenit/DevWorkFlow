<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmnl" code="ma_ngach" order="ma_ngach" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục ngạch lương" e="Pay Grade List"></title>
  <subTitle v="Cập nhật ngạch lương: thêm, sửa, xóa..." e="Add, Edit, Delete Pay Grade..."></subTitle>
  <fields>
    <field name="ma_ngach" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ngạch lương" e="Code"></header>
    </field>
    <field name="ten_ngach%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ngạch lương" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ngach"/>
      <field name="ten_ngach%l"/>
    </view>
  </views>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmcn" code="ma_cn" order="ma_cn" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục chuyên ngành" e="Education Major List"></title>
  <subTitle v="Cập nhật chuyên ngành: thêm, sửa, xóa..." e="Add, Edit, Delete Education Major..."></subTitle>
  <fields>
    <field name="ma_cn" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã" e="Education Major"></header>
    </field>
    <field name="ten_cn%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chuyên ngành" e="Description"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_cn"/>
      <field name="ten_cn%l"/>
    </view>
  </views>
</grid>
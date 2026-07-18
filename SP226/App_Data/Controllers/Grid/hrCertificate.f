<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmcc" code="ma_cc" order="ma_cc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục chứng chỉ ngoại ngữ" e="Foreign Language Certificate List"></title>
  <subTitle v="Cập nhật chứng chỉ ngoại ngữ: thêm, sửa, xóa..." e="Add, Edit, Delete Foreign Language Certificate..."></subTitle>
  <fields>
    <field name="ma_cc" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng chỉ" e="Certificate"></header>
    </field>
    <field name="ten_cc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng chỉ" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_cc"/>
      <field name="ten_cc%l"/>
    </view>
  </views>
</grid>
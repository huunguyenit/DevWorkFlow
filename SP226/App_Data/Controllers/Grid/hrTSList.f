<?xml version="1.0" encoding="utf-8"?>

<grid table="hrcc" code="ma_cc" order="ma_cc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục công cụ, dụng cụ" e="Tool &#38; Supply List"></title>
  <subTitle v="Cập nhật công cụ, dụng cụ: thêm, sửa, xóa..." e="Add, Edit, Delete Tool &#38; Supply..."></subTitle>
  <fields>
    <field name="ma_cc" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="Code"></header>
    </field>
    <field name="ten_cc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công cụ" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_cc"/>
      <field name="ten_cc%l"/>
    </view>
  </views>
</grid>
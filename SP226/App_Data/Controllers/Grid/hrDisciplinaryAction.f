<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmkl" code="ma_kl" order="ma_kl" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục hình thức kỷ luật" e="Disciplinary Action List"></title>
  <subTitle v="Cập nhật hình thức kỷ luật: thêm, sửa, xóa..." e="Add, Edit, Delete Disciplinary Action..."></subTitle>
  <fields>
    <field name="ma_kl" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kỷ luật" e="Code"></header>
    </field>
    <field name="ten_kl%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kỷ luật" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kl"/>
      <field name="ten_kl%l"/>
    </view>
  </views>
</grid>
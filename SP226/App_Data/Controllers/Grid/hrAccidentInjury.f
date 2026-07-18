<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmtn" code="ma_tn" order="ma_tn" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục tai nạn/thương tật" e="Accident/Injury List"></title>
  <subTitle v="Cập nhật tai nạn/thương tật: thêm, sửa, xóa..." e="Add, Edit, Delete Accident/Injury..."></subTitle>
  <fields>
    <field name="ma_tn" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã" e="Code"></header>
    </field>
    <field name="ten_tn%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tai nạn/thương tật" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tn"/>
      <field name="ten_tn%l"/>
    </view>
  </views>
</grid>
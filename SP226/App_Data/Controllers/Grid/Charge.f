<?xml version="1.0" encoding="utf-8"?>

<grid table="dmcp" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục chi phí" e="Charge List"></title>
  <subTitle v="Cập nhật chi phí: thêm, sửa, xóa..." e="Add, Edit, Delete Charge..."></subTitle>

  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã chi phí" e="Charge Code"></header>
    </field>
    <field name="ten_cp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chi phí" e="Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_loai"/>
      <field name="ten_cp%l"/>
    </view>
  </views>

</grid>
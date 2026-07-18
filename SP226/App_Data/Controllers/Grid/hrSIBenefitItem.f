<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmtcbh" code="ma_tcbh" order="ma_tcbh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục trợ cấp BHXH" e="SI Benefit Item List"></title>
  <subTitle v="Cập nhật trợ cấp BHXH: thêm, sửa, xóa..." e="Add, Edit, Delete SI Benefit Item..."></subTitle>
  <fields>
    <field name="ma_tcbh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã trợ cấp" e="Code"></header>
    </field>
    <field name="ten_tcbh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên trợ cấp" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tcbh"/>
      <field name="ten_tcbh%l"/>
    </view>
  </views>
</grid>
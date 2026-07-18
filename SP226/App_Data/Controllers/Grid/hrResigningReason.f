<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmldnv" code="ma_ldnv" order="ma_ldnv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục lý do nghỉ việc" e="Reason for Leaving Job List"></title>
  <subTitle v="Cập nhật lý do nghỉ việc: thêm, sửa, xóa..." e="Add, Edit, Delete Reason for Leaving Job..."></subTitle>

  <fields>
    <field name="ma_ldnv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã lý do" e="Code"></header>
    </field>
    <field name="ten_ldnv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên lý do" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ldnv"/>
      <field name="ten_ldnv%l"/>
    </view>
  </views>
</grid>
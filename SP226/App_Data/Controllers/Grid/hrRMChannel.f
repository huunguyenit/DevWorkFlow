<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmkenhtd" code="ma_kenh" order="ma_kenh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục kênh tuyển dụng" e="Recruitment Channels"></title>
  <subTitle v="Cập nhật kênh tuyển dụng: thêm, sửa, xóa..." e="Add, Edit, Delete Recruitment Channel..."></subTitle>
  <fields>
    <field name="ma_kenh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kênh td" e="Code"></header>
    </field>
    <field name="ten_kenh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kênh tuyển dụng" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kenh"/>
      <field name="ten_kenh%l"/>
    </view>
  </views>
</grid>
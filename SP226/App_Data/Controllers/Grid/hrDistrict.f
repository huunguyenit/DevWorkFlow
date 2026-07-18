<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmquan" code="ma_tinh, ma_quan" order="ma_tinh ,ma_quan" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục quận/huyện" e="District List"></title>
  <subTitle v="Cập nhật quận/huyện: thêm, sửa, xóa..." e="Add, Edit, Delete District..."></subTitle>
  <fields>
    <field name="ma_tinh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tỉnh/thành" e="Province/City"></header>
    </field>
    <field name="ma_quan" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quận/huyện" e="District"></header>
    </field>
    <field name="ten_quan%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quận/huyện" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tinh"/>
      <field name="ma_quan"/>
      <field name="ten_quan%l"/>
    </view>
  </views>

</grid>
<?xml version="1.0" encoding="utf-8"?>

<grid table="dmmauct" code="ma_mau_ct" order="ma_mau_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo ký hiệu mẫu số hóa đơn" e="Invoice Form List"></title>
  <subTitle v="Cập nhật ký hiệu mẫu số hóa đơn: thêm, sửa, xóa..." e="Add, Edit, Delete Template of Invoice Form..."></subTitle>
  <fields>
    <field name="ma_mau_ct" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã ký hiệu" e="Code"></header>
    </field>
    <field name="ten_mau_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ký hiệu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_mau_ct"/>
      <field name="ten_mau_ct%l"/>
    </view>
  </views>
</grid>
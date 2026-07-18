<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmkydg" code="ma_ky" order="ma_ky" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo kỳ đánh giá" e="Appraisal Period"></title>
  <subTitle v="Cập nhật kỳ đánh giá: thêm, sửa, xóa..." e="Add, Edit, Delete Appraisal Period..."></subTitle>
  <fields>
    <field name="ma_ky" isPrimaryKey="true" dataFormatString="#0" width="100" allowSorting="true" allowFilter="true">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="ten_ky%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kỳ" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ky"/>
      <field name="ten_ky%l"/>
    </view>
  </views>
</grid>
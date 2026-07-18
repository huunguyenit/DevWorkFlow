<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmbl" code="ma_bac" order="ma_bac" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục bậc lương" e="Ranks of Salary"></title>
  <subTitle v="Cập nhật bậc lương: thêm, sửa, xóa..." e="Add, Edit, Delete Rank of Salary..."></subTitle>
  <fields>
    <field name="ma_bac" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bậc lương" e="Rank of Salary"></header>
    </field>
    <field name="ten_bac%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bậc lương" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bac"/>
      <field name="ten_bac%l"/>
    </view>
  </views>
</grid>
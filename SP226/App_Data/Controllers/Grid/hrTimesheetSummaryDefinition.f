<?xml version="1.0" encoding="utf-8"?>

<grid table="hrkbctbcc" code="ma_ct" order="ma_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo chỉ tiêu bảng chấm công tổng hợp" e="Timesheet Summary Definition"></title>
  <subTitle v="Cập nhật khai báo bảng chấm công tổng hợp: thêm, sửa, xóa..." e="Add, Edit, Delete Timesheet Summary Definition..."></subTitle>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chỉ tiêu" e="Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
    </view>
  </views>
</grid>
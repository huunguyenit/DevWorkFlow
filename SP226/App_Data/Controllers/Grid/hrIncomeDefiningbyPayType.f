<?xml version="1.0" encoding="utf-8"?>
<grid table="vhrkieuluong" code="ma_loai_lg, ma_pc" order="ma_loai_lg, ma_pc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo chỉ tiêu thu nhập cho loại lương" e="Income Defining by Pay Type"></title>
  <subTitle v="Cập nhật chỉ tiêu thu nhập cho loại lương: thêm, sửa, xóa..." e="Add, Edit, Delete Income Defining by Pay Type..."></subTitle>
  <fields>
    <field name="ma_loai_lg" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại lương" e="Type Code"></header>
    </field>
    <field name="ten_loai_lg%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại lương" e="Description"></header>
    </field>
    <field name="ma_pc" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Phụ cấp" e="Allowance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_loai_lg"/>
      <field name="ten_loai_lg%l"/>
      <field name="ma_pc"/>
    </view>
  </views>
</grid>
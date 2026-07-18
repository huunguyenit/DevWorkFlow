<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmctluong" code="ma_ct" order="stt, ma_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo chỉ tiêu lương" e="Salary Article List"></title>
  <subTitle v="Cập nhật chỉ tiêu lương: thêm, sửa, xóa..." e="Add, Edit, Delete Salary Article..."></subTitle>
  <fields>
    <field name="stt" type="Decimal" width="60" align="right" allowSorting="true" allowFilter="true">
      <header v="Stt" e="Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chỉ tiêu" e="Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
    </view>
  </views>
</grid>
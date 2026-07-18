<?xml version="1.0" encoding="utf-8"?>

<grid table="vsfctnx" code="kind, ma_ct, loai_ct, ma_px" order="kind, ma_ct, loai_ct, ma_px" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo thông tin nhập xuất tự động từ phân xưởng" e="Auto Floor Stock Moving Declaration"></title>
  <subTitle v="Cập nhật thông tin nhập xuất tự động từ phân xưởng: thêm, sửa, xóa..." e="Add, Edit, Delete Auto Floor Stock Moving Declaration..."></subTitle>
  <fields>
    <field name="kind" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>
    <field name="loai_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại chứng từ" e="Voucher Type"></header>
    </field>
    <field name="ma_px" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phân xưởng" e="Shop Code"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ma_nx" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhập xuất" e="Reason Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="kind"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="loai_ct"/>
      <field name="ma_px"/>
      <field name="ma_kh"/>
      <field name="ma_nx"/>
    </view>
  </views>
</grid>
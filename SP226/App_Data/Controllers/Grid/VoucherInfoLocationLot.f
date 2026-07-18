<?xml version="1.0" encoding="utf-8"?>

<grid table="vdmctvtrlo" code="ma_ct" order="ma_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo theo dõi vị trí, lô theo chứng từ" e="Location and Lot Tracked by Voucher"></title>
  <subTitle v="Cập nhật thông tin: thêm, sửa, xóa..." e="Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowNulls="false" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Description"></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="80" allowFilter="true">
      <header v="Theo dõi vị trí" e="Location Tracked"></header>
    </field>
    <field name="lo_yn" type="Boolean" width="80" allowFilter="true">
      <header v="Theo dõi lô" e="Lot Tracked"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
    </view>
  </views>
</grid>
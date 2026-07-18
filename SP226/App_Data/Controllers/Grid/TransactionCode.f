<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % SOApproval SYSTEM "..\Include\SOApproval.ent">
  %SOApproval;
]>

<grid table="vdmmagd" code="ma_ct, loai_ct, ma_gd" order="ma_ct, loai_ct, ma_gd" filter="&CompactModeOrderKind;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục mã giao dịch" e="Transaction Code"></title>
  <subTitle v="Cập nhật mã giao dịch: thêm, sửa, xóa..." e="Add, Edit, Delete Transaction Code..."></subTitle>

  <fields>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>
    <field name="loai_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại chứng từ" e="Voucher Type"></header>
    </field>
    <field name="ma_gd" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã giao dịch" e="Transaction Code"></header>
    </field>
    <field name="ten_gd%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên giao dịch" e="Description"></header>
    </field>
  </fields>
  <views>

    <view id="Grid">
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="loai_ct"/>
      <field name="ma_gd"/>
      <field name="ten_gd%l"/>
    </view>
  </views>
</grid>
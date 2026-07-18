<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
]>

<grid table="vhrbpks" code="loai, ma_bp" filter="&FilterCheckRight;" order="ma_bp" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khóa số liệu theo bộ phận" e="Department Locking"></title>
  <subTitle v="Cập nhật khóa số liệu theo bộ phận: thêm, sửa, xóa..." e="Add, Edit, Delete Department Locking..."></subTitle>

  <fields>
    <field name="loai" isPrimaryKey="true" width="60" allowSorting="true" allowFilter="true">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ngay_ks" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày khóa sổ" e="Locked Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ngay_ks"/>
    </view>
  </views>
</grid>
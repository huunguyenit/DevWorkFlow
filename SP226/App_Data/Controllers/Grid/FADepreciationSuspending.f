<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
]>

<grid table="vdmtskkh" code="so_the_ts, ngay_hl_tu" order="so_the_ts, ngay_hl_tu" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo tạm dừng khấu hao TSCĐ" e="Fixed Asset Depreciation Suspending"></title>
  <subTitle v="Cập nhật khai báo tạm dừng khấu hao TSCĐ: thêm, sửa, xóa..." e="Add, Edit, Delete Fixed Asset Depreciation Suspending..."></subTitle>

  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Thẻ tài sản" e="Fixed Asset"></header>
    </field>
    <field name="ten_ts%l"  width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="ngay_hl_tu" isPrimaryKey="true" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
    </field>
    <field name="ngay_hl_den" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Đến" e="To"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
    </view>
  </views>
</grid>
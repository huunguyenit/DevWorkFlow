<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrdgcong" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ma_bp, ma_cong, ngay_hl" order="ma_bp, ma_cong, ngay_hl" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật đơn giá giờ công" e="Working Hour Unit Cost"></title>
  <subTitle v="Cập nhật đơn giá giờ công: thêm, sửa, xóa..." e="Add, Edit, Delete Working Hour Unit Cost..."></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ma_cong" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công" e="Workday"></header>
    </field>
    <field name="ten_cong%l" width="0" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="don_gia" type="Decimal" dataFormatString="@generalCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đơn giá" e="Unit Cost"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_cong"/>
      <field name="ten_cong%l"/>
      <field name="ngay_hl"/>
      <field name="don_gia"/>
    </view>
  </views>
</grid>
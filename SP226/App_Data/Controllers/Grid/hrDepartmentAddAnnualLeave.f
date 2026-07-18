<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrphepbp" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ma_bp, ngay_hl" order="ma_bp" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo số phép cộng thêm cho bộ phận" e="Department Additional Annual Leave"></title>
  <subTitle v="Khai báo số phép cộng thêm cho bộ phận: thêm, sửa, xóa..." e="Add, Edit, Delete Department Additional Annual Leave..."></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="so_phep" type="Decimal" dataFormatString="##0.00" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số ngày" e="Annual Leave"></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="so_phep"/>
      <field name="ngay_hl"/>
    </view>
  </views>
</grid>
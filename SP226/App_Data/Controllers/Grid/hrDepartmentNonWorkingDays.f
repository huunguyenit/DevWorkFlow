<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrnghi0" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ma_bp, thu" order="ma_bp, thu" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo lịch nghỉ" e="Department Non-working Days"></title>
  <subTitle v="Cập nhật lịch nghỉ: thêm, sửa, xóa..." e="Add, Edit, Delete Department Non-working Days..."></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="thu" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_thu%l" width="100" allowSorting="true" allowFilter="true">
      <header v="Thứ" e="Day of Week"></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" width="60" clientDefault="0">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="thu"/>
      <field name="ten_thu%l"/>
      <field name="so_gio"/>
    </view>
  </views>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmtlbh" code="ngay_hl, loai_dt" order="status, loai_dt, ngay_hl desc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo tỷ lệ đóng bảo hiểm, công đoàn" e="Insurance and Union Due Information"></title>
  <subTitle v="Cập nhật tỷ lệ đóng bảo hiểm, công đoàn: thêm, sửa, xóa..." e="Add, Edit, Delete Insurance and Union Due Information..."></subTitle>
  <fields>
    <field name="status" type="Int32" width="0" hidden="true">
      <header v="" e=""/>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="loai_dt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại đối tượng" e="Type of Participant"></header>
    </field>
    <field name="tl_bhxh0" type="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Tỷ lệ BHXH" e="SI Rate"></header>
    </field>
    <field name="tl_bhyt0" type="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Tỷ lệ BHYT" e="HI Rate"></header>
    </field>
    <field name="tl_bhtn0" type="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Tỷ lệ BHTN" e="UI Rate"></header>
    </field>
    <field name="tl_kpcd0" type="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Tỷ lệ KPCĐ" e="UD Rate"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="status"/>
      <field name="ngay_hl"/>
      <field name="loai_dt"/>
      <field name="tl_bhxh0"/>
      <field name="tl_bhyt0"/>
      <field name="tl_bhtn0"/>
      <field name="tl_kpcd0"/>
    </view>
  </views>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<grid table="hrmucdbh" code="loai_bh, ngay_hl" order="loai_bh, ngay_hl desc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật mức trần đóng bảo hiểm" e="Insurance Contribution Rate Ceiling"></title>
  <subTitle v="Cập nhật mức trần đóng bảo hiểm: thêm, sửa, xóa..." e="Add, Edit, Delete Insurance Contribution Rate Ceiling..."></subTitle>

  <fields>
    <field name="status" width="0" hidden="true">
      <header v="" e=""/>
    </field>
    <field name="loai_bh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại bảo hiểm" e="Insurance Type"></header>
    </field>
    <field name="cach_tinh" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
    </field>
    <field name="he_so" type="Decimal" width="120" dataFormatString="### ### ##0.00" allowSorting="true" allowFilter="true" align="right">
      <header v="Hệ số" e="Coefficient"></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="120" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="status"/>
      <field name="loai_bh"/>
      <field name="cach_tinh"/>
      <field name="he_so"/>
      <field name="ngay_hl"/>
      <field name="dien_giai"/>
    </view>
  </views>

</grid>
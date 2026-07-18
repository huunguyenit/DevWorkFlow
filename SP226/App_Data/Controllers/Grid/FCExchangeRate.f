<?xml version="1.0" encoding="utf-8"?>

<grid table="vdmtgnt" code="ma_nt, ngay_ct" order="ma_nt, ngay_ct desc" filter="xtype = 'U'" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Tỷ giá ngoại tệ" e="Exchange Rate List"></title>
  <subTitle v="Cập nhật tỷ giá ngoại tệ: thêm, sửa, xóa..." e="Add , Edit, Delete Exchange Rate..."></subTitle>

  <fields>
    <field name="ma_nt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ngoại tệ" e="Currency"></header>
    </field>
    <field name="ten_nt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ngoại tệ" e="Currency Name"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="120" clientDefault="0" allowSorting="true" allowFilter="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nt"/>
      <field name="ten_nt%l"/>
      <field name="ngay_ct"/>
      <field name="ty_gia"/>
    </view>
  </views>

</grid>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrdgsp" code="ma_sp, ngay_hl" order="ma_sp, ngay_hl" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật đơn giá sản phẩm" e="Product Unit Cost"></title>
  <subTitle v="Cập nhật đơn giá sản phẩm: thêm, sửa, xóa..." e="Add, Edit, Delete Product Unit Cost..."></subTitle>
  <fields>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="don_gia" type="Decimal" dataFormatString="@generalCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đơn giá" e="Unit Cost"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ngay_hl"/>
      <field name="don_gia"/>
    </view>
  </views>
</grid>
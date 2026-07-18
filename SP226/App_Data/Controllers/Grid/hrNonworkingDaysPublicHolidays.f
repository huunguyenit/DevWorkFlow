<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrdmngaynghi" code="ma_bp, ngay" order="ma_bp, ngay desc, ma_ca" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo ngày nghỉ, ngày lễ" e="Non-working Days, Public Holidays"></title>
  <subTitle v="Cập nhật ngày nghỉ, ngày lễ: thêm, sửa, xóa..." e="Add, Edit, Delete Non-working Day or Public Holiday..."></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Mã bộ phận" e="Mã bộ phận"></header>
    </field>
    <field name="ngay" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_ca" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ca" e="Shift Code"></header>
    </field>
    <field name="ten_ca%l" width="300" allowFilter="true">
      <header v="Tên ca" e="Shift Name"></header>
    </field>
    <field name="ma_cong" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công" e="Timekeeping"></header>
    </field>
    <field name="ten_cong%l" width="300" allowFilter="true">
      <header v="Tên công" e="Description"></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" width="120" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số giờ quy định" e="Regular Hours"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ngay"/>
      <field name="ma_ca"/>
      <field name="ten_ca%l"/>
      <field name="ma_cong"/>
      <field name="ten_cong%l"/>
      <field name="so_gio"/>
    </view>
  </views>
</grid>
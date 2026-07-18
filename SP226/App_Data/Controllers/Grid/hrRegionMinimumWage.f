<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrdmlttv" code="ma_bp, ma_nt, ngay_hl" order="ma_bp, ma_nt, ngay_hl desc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật lương tối thiểu theo vùng" e="Region-based Minimum Wage Levels"></title>
  <subTitle v="Cập nhật lương tối thiểu theo vùng: thêm, sửa, xóa..." e="Add, Edit, Delete Region-based Minimum Wage Levels..."></subTitle>

  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"/>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ma_nt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ngoại tệ" e="Currency"/>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="luong_tt" type="Decimal" width="120" dataFormatString="@generalCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lương tối thiểu" e="Minimum Salary"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_nt"/>
      <field name="ngay_hl"/>
      <field name="luong_tt"/>
    </view>
  </views>

</grid>
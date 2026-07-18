<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrhstv" code="ma_bp, ngay_hl" order="ma_bp, ngay_hl desc" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo hệ số thử việc theo bộ phận" e="Probation Salary Coefficient by Department"></title>
  <subTitle v="Cập nhật hệ số thử việc theo bộ phận: thêm, sửa, xóa..." e="Add, Edit, Delete Probation Salary Coefficient by Department..."></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="he_so" type="Decimal" width="100" dataFormatString="###.00" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="he_so"/>
      <field name="ngay_hl"/>
    </view>
  </views>
</grid>
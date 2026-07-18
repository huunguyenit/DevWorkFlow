<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
]>

<grid table="vcthsts" code="so_the_ts, ky, nam" filter="&FilterCheckAccessUnit;" order="so_the_ts, nam, ky" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chuyển bộ phận sử dụng" e="Fixed Asset Transfer"></title>
  <subTitle v="Cập nhật điều chuyển bộ phận sử dụng: thêm, sửa, xóa..." e="Add, Edit, Delete Fixed Asset Transfer..."></subTitle>

  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Thẻ tài sản" e="Fixed Asset"></header>
    </field>
    <field name="ky" type="Decimal" width="60" isPrimaryKey="true" allowSorting="true" allowFilter="true"  align="right">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="nam" type="Decimal" width="60" isPrimaryKey="true"  allowSorting="true" allowFilter="true" align="right">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>

    <field name="ten_ts%l" width="300" allowFilter="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="nam"/>
      <field name="ky"/>
      <field name="ma_bp"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandCheckUnitRightBeforeInit;
      </text>
    </command>

  </commands>
</grid>
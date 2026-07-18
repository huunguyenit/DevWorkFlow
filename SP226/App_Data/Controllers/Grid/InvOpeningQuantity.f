<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vsthd" code="ma_dvcs, nam, quy, ma_nk, so_tu" filter="&FilterCheckAccessUnit;" order="ma_dvcs, nam desc, quy, ma_nk, so_tu" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào số tồn hóa đơn đầu kỳ" e="Input Opening Quantity of Invoice"></title>
  <subTitle v="Cập nhật thông tin: thêm, sửa, xóa..." e="Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="quy" isPrimaryKey="true" type="Decimal" width="80" allowSorting="true" allowFilter="true">
      <header v="Quý" e="Quarter"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" allowSorting="true" allowFilter="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nk" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyển" e="Voucher Book"></header>
    </field>
    <field name="ky_hieu" width="100" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu mẫu hóa đơn" e="Invoice Form"></header>
    </field>
    <field name="ten_loai_hd%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại hóa đơn" e="Invoice Type"></header>
    </field>
    <field name="so_seri" width="100" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu hóa đơn" e="Invoice Series"></header>
    </field>
    <field name="so_tu" isPrimaryKey="true" width="100" type="Decimal" align="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Từ số" e="Number from"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_den" width="100" type="Decimal" align="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đến số" e="Number to"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" width="100" type="Decimal" dataFormatString="### ### ### ###" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="nam"/>
      <field name="quy"/>
      <field name="ma_nk"/>
      <field name="ky_hieu"/>
      <field name="ten_loai_hd%l"/>
      <field name="so_seri"/>
      <field name="so_tu"/>
      <field name="so_den"/>
      <field name="so_luong"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pTo6TgYtfFNo/VuebFoSpTVdOIWMTnck5CmLICJ+xr7Q8/OrVdbMi5T3kiIy6Z7xt2tbo1t+brK19ibxP1BpdfU/fku7O02FvCp5u78dTEpJfjHAHiMk1pzmzlhFj3heMNwDKEq4SaOsCnQUEoS4bCE+3GKh4Nh2ByhfS5TD6dh2C/s6mOL79aAb2gucY6Rmoi+Eqn7ica5GTce+Y/e+9/s/Xd+bqS2AM0z07B+QMI+AIqscSO41BZcQhwMbz8UMa4hv0p+vCrcZhC5iG9fNI5v</Encrypted>]]>
      </text>
    </command>
  </commands>
</grid>
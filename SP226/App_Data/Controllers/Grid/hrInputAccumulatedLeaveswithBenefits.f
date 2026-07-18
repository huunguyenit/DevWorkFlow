<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrhtcdk" code="nam, stt_rec, ma_tc" order="nam, ma_nv, ma_tc" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật ngày nghỉ hưởng trợ cấp đầu kỳ" e="Input Accumulated Leaves with Benefits"></title>
  <subTitle v="Cập nhật ngày nghỉ hưởng trợ cấp đầu kỳ: thêm, sửa, xóa..." e="Add, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" width="60" allowFilter="&GridListAllowFilter.Number;">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ma_tc" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Mã trợ cấp" e="Benefit Code"></header>
    </field>
    <field name="ten_tcbh%l" width="300" allowFilter="true">
      <header v="Tên trợ cấp" e="Benefit Name"></header>
    </field>
    <field name="so_ngay_00" type="Decimal" dataFormatString="### ##0.00" width="100" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lk từ đầu năm" e="Day(s)"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="nam"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ma_tc"/>
      <field name="ten_tcbh%l"/>
      <field name="so_ngay_00"/>
    </view>
  </views>

</grid>
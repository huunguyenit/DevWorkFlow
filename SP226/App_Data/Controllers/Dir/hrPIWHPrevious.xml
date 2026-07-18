<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLGridCommandExtension SYSTEM "..\Include\XML\GridCommandExtension.xml">
]>

<dir table="hreqtlvtd" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin quá trình công tác trước đây" e="Previous Works Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="cong_ty" allowNulls="false">
      <header v="Đơn vị" e="Organization"></header>
    </field>
    <field name="vi_tri">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="luong" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Lương" e="Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="thoi_gian_lv" type="Decimal" dataFormatString="# ### ##0.00">
      <header v="Năm công tác" e="Seniority"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Đến ngày" e="To Date"></header>
    </field>
    <field name="ly_do_den">
      <header v="Lý do chuyển đến" e="Reason for Employment"></header>
    </field>
    <field name="ly_do_di">
      <header v="Lý do chuyển đi" e="Reason for Leaving"></header>
    </field>

    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="11000-1: [cong_ty].Label, [cong_ty], [stt_rec]"/>
      <item value="11000-1: [vi_tri].Label, [vi_tri], [stt_rec0]"/>
      <item value="110---1: [luong].Label, [luong], [line_nbr]"/>
      <item value="110: [thoi_gian_lv].Label, [thoi_gian_lv]"/>
      <item value="110: [ngay_tu].Label, [ngay_tu]"/>
      <item value="110: [ngay_den].Label, [ngay_den]"/>
      <item value="11000: [ly_do_den].Label, [ly_do_den]"/>
      <item value="11000: [ly_do_di].Label, [ly_do_di]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  &XMLGridCommandExtension;

</dir>
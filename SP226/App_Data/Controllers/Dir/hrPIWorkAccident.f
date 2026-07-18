<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLGridCommandExtension SYSTEM "..\Include\XML\GridCommandExtension.xml">
]>

<dir table="hretn" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tai nạn lao động" e="Work Accident"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="loai_tn" allowNulls="false">
      <header v="Loại tai nạn" e="Accident Type"/>
      <items style="AutoComplete" controller="hrAccidentInjury" reference="ten_tn%l" key="1 = 1" check="1 = 1" information="ma_tn$hrdmtn.ten_tn%l" new="Default"></items>
    </field>
    <field name="ten_tn%l" readOnly="true" defaultValue="''" external="true">
      <header v="" e=""/>
    </field>
    <field name="tn_ld_yn" type="Boolean" clientDefault="1">
      <header v="Tai nạn lao động" e="Work Accident"/>
      <items style="CheckBox"/>
    </field>
    <field name="ngay_tn" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày xảy ra" e="Date of Occurence"/>
    </field>
    <field name="so_ngay_nghi" type="Decimal" dataFormatString="##0.00">
      <header v="Số ngày nghỉ" e="No. of Days off"/>
      <items style="Numeric"></items>
    </field>
    <field name="muc_do">
      <header v="Mức độ" e="Level"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101001: [loai_tn].Label, [loai_tn], [ten_tn%l], [stt_rec]"/>
      <item value="11----1: [tn_ld_yn].Label, [tn_ld_yn], [stt_rec0]"/>
      <item value="110---1: [ngay_tn].Label, [ngay_tn], [line_nbr]"/>
      <item value="110: [so_ngay_nghi].Label, [so_ngay_nghi]"/>
      <item value="1100: [muc_do].Label, [muc_do]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  &XMLGridCommandExtension;

</dir>
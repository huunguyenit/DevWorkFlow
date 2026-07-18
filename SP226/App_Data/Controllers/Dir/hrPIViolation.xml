<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLGridCommandExtension SYSTEM "..\Include\XML\GridCommandExtension.xml">
]>

<dir table="hrekl" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kỷ luật" e="Disciplinary"></title>

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

    <field name="noi_bo_yn" type="Boolean" clientDefault="1">
      <header v="Công ty kỷ luật" e="Company"/>
      <items style="CheckBox"/>
    </field>
    <field name="hinh_thuc" allowNulls="false">
      <header v="Loại kỷ luật" e="Disciplinary Action"></header>
      <items style="AutoComplete" controller ="hrDisciplinaryAction" key="status = 1" check="1 = 1" reference="ten_kl%l"  information="ma_kl$hrdmkl.ten_kl%l" new="Default"/>
    </field>
    <field name="ten_kl%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="cap_quyet_dinh">
      <header v="Cấp quyết định" e="Decided by"/>
    </field>
    <field name="so_quyet_dinh">
      <header v="Số quyết định" e="Decision No."/>
    </field>
    <field name="ngay_ky" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày ký" e="Date Signed"/>
    </field>
    <field name="nguoi_ky">
      <header v="Người ký" e="Signed by"/>
    </field>
    <field name="ly_do">
      <header v="Lý do kỷ luật" e="Reason"/>
    </field>
    <field name="tien" type="Double" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Số tiền phạt" e="Amount"/>
      <items style="Numeric"></items>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101001: [hinh_thuc].Label, [hinh_thuc], [ten_kl%l], [stt_rec0]"/>
      <item value="11----1: [noi_bo_yn].Label, [noi_bo_yn], [stt_rec]"/>
      <item value="110---1: [cap_quyet_dinh].Label, [cap_quyet_dinh], [line_nbr]"/>
      <item value="110: [so_quyet_dinh].Label, [so_quyet_dinh]"/>
      <item value="110: [ngay_ky].Label, [ngay_ky]"/>
      <item value="110: [nguoi_ky].Label, [nguoi_ky]"/>
      <item value="11000: [ly_do].Label, [ly_do]"/>
      <item value="110: [tien].Label, [tien]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  &XMLGridCommandExtension;

</dir>
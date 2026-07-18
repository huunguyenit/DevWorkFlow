<?xml version="1.0" encoding="utf-8"?>
<grid table="kkyc" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phiếu yêu cầu kiểm kê" e="Stocktaking Requisition"></title>
  <subTitle v="Cập nhật phiếu yêu cầu kiểm kê: thêm, sửa, xóa..." e="Add, Edit, Delete Stocktaking Requisition..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="tg_kk" dataFormatString="HH:ss" width="60" align="center" allowSorting="true" allowFilter="true">
      <header v="Giờ" e="Time"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số" e="Number"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay_ct"/>
      <field name="tg_kk"/>
      <field name="so_ct"/>
      <field name="dien_giai"/>
    </view>
  </views>

</grid>
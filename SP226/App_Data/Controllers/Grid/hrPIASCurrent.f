<?xml version="1.0" encoding="utf-8"?>

<grid table="vhreqtlkdht" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày bắt đầu" e="Begin Date"></header>
    </field>
    <field name="ten_nt%l" width="150">
      <header v="Loại tiền" e="Currency"></header>
    </field>
    <field name="ten_tc%l" width="150">
      <header v="Tính chất" e="Nature"></header>
    </field>
    <field name="he_so" width="100" dataFormatString="##0.00">
      <header v="Hệ số" e="Coefficient"></header>
    </field>
    <field name="luong_co_ban" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Lương cơ bản" e="Basic Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_phu_cap" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Tổng tiền phụ cấp" e="Total Allowance"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thu_nhap" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Tổng thu nhập" e="Total Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="ngay_bd"/>
      <field name="ten_nt%l"/>
      <field name="ten_tc%l"/>
      <field name="he_so"/>
      <field name="luong_co_ban"/>
      <field name="t_tien_phu_cap"/>
      <field name="t_thu_nhap"/>
      <field name="ghi_chu"/>
    </view>
  </views>

</grid>
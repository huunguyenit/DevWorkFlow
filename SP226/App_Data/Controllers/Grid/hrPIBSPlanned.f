<?xml version="1.0" encoding="utf-8"?>

<grid table="vhreqtlbhdk" code="stt_rec, stt_rec0" order="ngay_thay_doi" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_thay_doi" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày dự kiến từ" e="Date from"></header>
    </field>
    <field name="ngay_thay_doi2" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày dự kiến đến" e="Date to"></header>
    </field>
    <field name="ten_loai%l" width="100">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="luong_co_ban" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowContain="true">
      <header v="Lương cơ bản" e="Basic Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_bhxh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowContain="true">
      <header v="Tiền BHXH" e="SI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_bhyt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowContain="true">
      <header v="Tiền BHYT" e="HI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_bhtn" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowContain="true">
      <header v="Tiền BHTN" e="UI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_kpcd" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowContain="true">
      <header v="Tiền KPCĐ" e="Union Dues"></header>
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

      <field name="ngay_thay_doi"/>
      <field name="ngay_thay_doi2"/>
      <field name="ten_loai%l"/>
      <field name="luong_co_ban"/>
      <field name="tien_bhxh"/>
      <field name="tien_bhyt"/>
      <field name="tien_bhtn"/>
      <field name="tien_kpcd"/>
      <field name="ghi_chu"/>
    </view>
  </views>

</grid>
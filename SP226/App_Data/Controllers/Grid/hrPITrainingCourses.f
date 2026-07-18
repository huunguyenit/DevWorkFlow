<?xml version="1.0" encoding="utf-8"?>

<grid table="vhredt" code="stt_rec, stt_rec0" order="line_nbr" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ten_khoa%l" width="150">
      <header v="Khóa học" e="Course"></header>
    </field>
    <field name="ten_mh%l" width="150">
      <header v="Môn học" e="Subject"></header>
    </field>
    <field name="ten_loai%l" width="150">
      <header v="Loại hình đào tạo" e="Training Type"></header>
    </field>
    <field name="ten_dvdt%l" width="150">
      <header v="Đơn vị đào tạo" e="Training Provider"></header>
    </field>
    <field name="ngay_hoc1" type="DateTime" dataFormatString="@datetimeFormat" width="80">
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_hoc2" type="DateTime" dataFormatString="@datetimeFormat" width="80">
      <header v="Đến ngày" e="To Date"></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="### ### ##0.00" width="100">
      <header v="Tổng số giờ học" e="Training Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="diem" type="Decimal" dataFormatString="@markViewFormat" width="100" align="right">
      <header v="Điểm số" e="Mark"></header>
      <items style="Numeric"></items>
    </field>
    <field name="xep_loai" width="100">
      <header v="Xếp loại" e="Grade"></header>
    </field>
    <field name="dat_yn" type="Boolean" width="80">
      <header v="Kết quả" e="Result"></header>
      <items style="CheckBox"/>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="line_nbr" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="ten_khoa%l"/>
      <field name="ten_mh%l"/>
      <field name="ten_loai%l"/>
      <field name="ten_dvdt%l"/>
      <field name="ngay_hoc1"/>
      <field name="ngay_hoc2"/>
      <field name="so_gio"/>
      <field name="diem"/>
      <field name="xep_loai"/>
      <field name="dat_yn"/>
      <field name="ghi_chu"/>

      <field name="line_nbr"/>
    </view>
  </views>

</grid>

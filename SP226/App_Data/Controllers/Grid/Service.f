<?xml version="1.0" encoding="utf-8"?>

<grid table="vservice" code="id" order="id" filter="@@admin = 1" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo lịch thông báo tự động" e="Notification Schedule"></title>
  <subTitle v="Cập nhật lịch thông báo tự động: thêm, sửa, xóa..." e="Add, Edit, Delete Notification Schedule..."></subTitle>

  <fields>
    <field name="id" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Loại thông báo" e="Notification Type"></header>
    </field>
    <field name="ten_id%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên loại thông báo" e="Notification Type Name"></header>
    </field>
    <field name="ntype%l" width="150" allowFilter="true" allowSorting="true">
      <header v="Lịch" e="Schedule"></header>
    </field>
    <field name="ngay_th" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true" allowSorting="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ngay" width="60" allowFilter="true" allowSorting="true" type="Decimal">
      <header v="Ngày trong tháng" e="Day"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gio_th" width="60" align="center" allowFilter="true" allowSorting="true">
      <header v="Giờ thực hiện" e="Time"></header>
    </field>
    <field name="ngay_cuoi_thang" type="Boolean" width="60" allowFilter="true" allowSorting="true">
      <header v="Ngày cuối tháng" e="End of Month"></header>
      <items style="CheckBox"/>
    </field>
    <field name="t2" type="Boolean" width="60" allowFilter="true" allowSorting="true">
      <header v="Thứ 2" e="Monday"></header>
    </field>
    <field name="t3" type="Boolean" width="60" allowFilter="true" allowSorting="true">
      <header v="Thứ 3" e="Tuesday"></header>
    </field>
    <field name="t4" type="Boolean" width="60" allowFilter="true" allowSorting="true">
      <header v="Thứ 4" e="Wednesday"></header>
    </field>
    <field name="t5" type="Boolean" width="60" allowFilter="true" allowSorting="true">
      <header v="Thứ 5" e="Thursday"></header>
    </field>
    <field name="t6" type="Boolean" width="60" allowFilter="true" allowSorting="true">
      <header v="Thứ 6" e="Friday"></header>
    </field>
    <field name="t7" type="Boolean" width="60" allowFilter="true" allowSorting="true">
      <header v="Thứ 7" e="Saturday"></header>
    </field>
    <field name="t1" type="Boolean" width="60" allowFilter="true" allowSorting="true">
      <header v="Chủ nhật" e="Sunday"></header>
    </field>
    <field name="ghi_chu" width="300" allowFilter="true" allowSorting="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="last_time" width="130" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm:ss" allowFilter="true" allowSorting="true">
      <header v="Thời gian thực hiện" e="Last Time"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="ten_id%l"/>
      <field name="ntype%l"/>
      <field name="ngay_th"/>
      <field name="ngay"/>
      <field name="gio_th"/>
      <field name="ngay_cuoi_thang"/>
      <field name="last_time"/>
      <field name="t2"/>
      <field name="t3"/>
      <field name="t4"/>
      <field name="t5"/>
      <field name="t6"/>
      <field name="t7"/>
      <field name="t1"/>
      <field name="ghi_chu"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKeQTrejyfMsWhyx/15RRPP56BvNblfCeG+2PN8hz5eepUyAbBYaqYsNOq+9mJnKShjTaTYyXtsq+eGqkpb3FxUYwfhpjjWnsQlwtUHnfF+t1t4RjSlnuFHgs+9cd6OV2w==</Encrypted>]]>
      </text>
    </command>
  </commands>
</grid>
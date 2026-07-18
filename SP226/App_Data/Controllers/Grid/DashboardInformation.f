<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [

]>
<grid table="vdbdashboard" code="controller, user_id, ma_dashboard" order="controller, user_id, ma_dashboard" filter="user_id = @@userID and controller_status > 0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo màn hình tổng quan" e="Dashboard Layout Setting"></title>
  <subTitle v="Cập nhật màn hình tổng quan: thêm, sửa, xóa..." e="Add, Edit, Delete Dashboard Layout Setting..."></subTitle>

  <fields>
    <field name="controller" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="dien_giai%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Type Name"></header>
    </field>

    <field name="user_id" isPrimaryKey="true" hidden="true">
      <header v="Người dùng" e="User ID"></header>
    </field>

    <field name="ma_dashboard" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align="left">
      <header v="Mã mẫu báo cáo" e="Report Code"></header>
    </field>
    <field name="ten_dashboard%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mẫu báo cáo" e="Report Name"></header>
    </field>

    <field name="f1_name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Vùng 1" e="Field 1"></header>
    </field>
    <field name="f2_name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Vùng 2" e="Field 2"></header>
    </field>
    <field name="f3_name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Vùng 3" e="Field 3"></header>
    </field>
    <field name="f4_name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Vùng 4" e="Field 4"></header>
    </field>
    <field name="f1" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Vùng 1" e="Field 1"></header>
    </field>
    <field name="f2" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Vùng 2" e="Field 2"></header>
    </field>
    <field name="f3" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Vùng 3" e="Field 3"></header>
    </field>
    <field name="f4" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Vùng 4" e="Field 4"></header>
    </field>

    <field name="ngam_dinh" type="Boolean" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Ngầm định" e="Default"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="controller"/>
      <field name="dien_giai%l"/>

      <field name="user_id"/>

      <field name="ma_dashboard"/>
      <field name="ten_dashboard%l"/>

      <field name="f1_name%l"/>
      <field name="f2_name%l"/>
      <field name="f3_name%l"/>
      <field name="f4_name%l"/>
      <field name="f1"/>
      <field name="f2"/>
      <field name="f3"/>
      <field name="f4"/>

      <field name="ngam_dinh"/>
    </view>
  </views>
</grid>
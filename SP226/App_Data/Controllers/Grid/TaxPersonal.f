<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
]>
<grid table="phns" code="ma_ns" order="ma_dvcs, ma_bp, ma_ns" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin nhân viên" e="Input Employee Information"></title>
  <subTitle v="Cập nhật thông tin nhân viên: thêm, sửa, xóa..." e="New, Edit, Delete Employee Information..."></subTitle>

  <fields>
    <field name="ma_dvcs" width="100" allowFilter="true" allowSorting="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_bp" width="100" allowFilter="true" allowSorting="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ma_ns" width="100" isPrimaryKey="true" allowFilter="true" allowSorting="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_ns%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="ma_so_thue" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_bp"/>
      <field name="ma_ns"/>
      <field name="ten_ns%l"/>
      <field name="ma_so_thue"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbpcOdjTyZahPuZgQNtU4o+U3Ku2Pf7zLPjdRX6uFE1nlgRk6DKpmXUSetCndHM6Q0=</encrypted>]]>&CommandWhenVoucherBeforeAddNew;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>
  </commands>

</grid>
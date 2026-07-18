<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmquyen" code="ma_quyen" order="ma_quyen" filter="@@admin = 1" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo quyền sử dụng" e="Access Right List"></title>
  <subTitle v="Cập nhật quyền sử dụng: thêm, sửa, xóa..." e="Add, Edit, Delete Access Right..."></subTitle>

  <fields>
    <field name="ma_quyen" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyền" e="Access Right"></header>
    </field>
    <field name="ten_quyen%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quyền" e="Description"></header>
    </field>
    <field name="loai_quyen" width="80" allowSorting="true" allowFilter="true">
      <header v="Loại" e="Type"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_quyen"/>
      <field name="ten_quyen%l"/>
      <field name="loai_quyen"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOqUr2A7uGo01ul+Ia5TiiJVhnJddg2FCvbj8+qk7s6dOse3DIzpg25XWAGumcqMZu3IS60O8CB2DYs84OKCINrFRNlozrpEmAsVmNng+9/u8U3OOCxpEEAoyzV6jG+xzE</encrypted>]]>
      </text>
    </command>
  </commands>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<grid table="groupshare" code="id" order="id" filter="(user_id0 = @@userID)" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo nhóm trao đổi, trò chuyện..." e="Chat Group Declaration..."></title>
  <subTitle v="Cập nhật thông tin nhóm: thêm, sửa, xóa..." e="Add, Edit, Delete Chat Group..."></subTitle>

  <fields>
    <field name="id" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nhom" width="80" dataFormatString="X" allowSorting="true" allowFilter="true" isPrimaryKey="true">
      <header v="Mã nhóm" e="Group ID"></header>
    </field>
    <field name="ten_nhom" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Group Name"></header>
    </field>
    <field name="user_lst" width="400" allowSorting="true" allowFilter="true">
      <header v="Danh sách người sử dụng" e="User List"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="ma_nhom"/>
      <field name="ten_nhom"/>
      <field name="user_lst"/>
    </view>
  </views>

</grid>
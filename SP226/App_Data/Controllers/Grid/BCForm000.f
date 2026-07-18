<?xml version="1.0" encoding="utf-8"?>

<grid table="biForm" code="form_id" order="form_id" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo phân tích tổng hợp tình hình kinh doanh" e="Synthetic Analysis of Performance Definition"></title>
  <subTitle v="Cập nhật danh sách tài khoản" e="Update Account List"></subTitle>

  <fields>
    <field name="form_id" isPrimaryKey="true" width="60" allowFilter="true" allowSorting="true">
      <header v="Mã số" e="ID"></header>
    </field>
    <field name="rp_name%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Báo cáo" e="Report"></header>
    </field>
    <field name="c_acc" width="300" allowFilter="true" allowSorting="true">
      <header v="Ds tài khoản có" e="Credit Account List"></header>
    </field>
    <field name="d_acc" width="300" allowFilter="true" allowSorting="true">
      <header v="Ds tài khoản nợ" e="Debit Account List"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form_id"/>
      <field name="rp_name%l"/>
      <field name="c_acc"/>
      <field name="d_acc"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>
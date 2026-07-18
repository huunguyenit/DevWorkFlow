<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
]>
<grid table="biForm014" code="form, stt, ma_so" order="form, stt, ma_so" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân tích tổng hợp tình hình kinh doanh" e="Synthetic Analysis of Performance"></title>
  <subTitle v="Lưu chuyển tiền tệ" e="Cash Flow"></subTitle>

  <fields>
    <field name="form" isPrimaryKey="true" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" width="60" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="60">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="chi_tieu%l" width="300" dataFormatString="X">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="cach_tinh" width="300" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
    </field>
    <field name="tk_no" width="150" dataFormatString="X">
      <header v="Tài khoản nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" width="150" dataFormatString="X">
      <header v="Tài khoản có" e="Credit Accounts"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="stt"/>
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
      <field name="cach_tinh"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
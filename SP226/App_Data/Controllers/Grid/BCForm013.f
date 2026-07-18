<?xml version="1.0" encoding="utf-8"?>

<grid table="biForm013" code="form, stt, ma_so" order="form, stt, ma_so" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân tích tổng hợp tình hình kinh doanh" e="Synthetic Analysis of Performance"></title>
  <subTitle v="Kết quả sản xuất kinh doanh" e="Income Statement"></subTitle>

  <fields>
    <field name="form" isPrimaryKey="true" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" width="60" align="right" allowFilter="true" allowSorting="true">
      <header v="Stt" e="Number"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="60" allowFilter="true" allowSorting="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="chi_tieu%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="thuyet_minh" width="100" allowFilter="true" allowSorting="true">
      <header v="Thuyết minh" e="Interpretation"></header>
    </field>
    <field name="cach_tinh" width="300" allowFilter="true" allowSorting="true">
      <header v="Công thức" e="Formula"></header>
    </field>
    <field name="tk_no" width="150" allowFilter="true" allowSorting="true">
      <header v="Tài khoản nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" width="150" allowFilter="true" allowSorting="true">
      <header v="Tài khoản có" e="Credit Accounts"></header>
      <items style="Numeric"></items>
    </field>
    <field name="giam_tru" width="100" allowFilter="true" allowSorting="true">
      <header v="Giảm trừ" e="Deduction"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="stt"/>
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
      <field name="thuyet_minh"/>
      <field name="cach_tinh"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
      <field name="giam_tru"/>
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
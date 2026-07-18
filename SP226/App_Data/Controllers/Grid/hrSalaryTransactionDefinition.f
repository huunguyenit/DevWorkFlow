<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrbtkcl" code="ma_dvcs, ma_loai_lg, ma_bp" order="stt, ma_dvcs, ma_loai_lg, ma_bp" filter="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access = 1)))" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo các bút toán kết chuyển lương" e="Salary Transaction Definition"></title>
  <subTitle v="Khai báo các bút toán kết chuyển lương: mới, sửa, xóa..." e="Add New, Edit, Delete Salary Transaction Definition..."></subTitle>

  <fields>    
    <field name="stt" type="Decimal" width="100" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true" allowContain="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ten_bt" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên bút toán" e="Entry Name"></header>
    </field>
    <field name="tk_no" width="100" allowFilter="true" allowSorting="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="100" allowFilter="true" allowSorting="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
    <field name="ma_loai_lg" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã loại lương" e="Pay Type"></header>
    </field>
    <field name="ten_loai_lg%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại lương" e="Pay Type Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_dvcs"/>      
      <field name="ten_bt"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
      <field name="ma_loai_lg"/>
      <field name="ten_loai_lg%l"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
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
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
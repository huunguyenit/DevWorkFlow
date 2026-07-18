<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrdccongbp" filter="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" code="stt_rec, ma_bp, ngay_hl" order="stt_rec, ma_bp, ngay_hl" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Điều chỉnh bộ phận tính công cho nhân viên" e="Cost Center Definition"></title>
  <subTitle v="Điều chỉnh bộ phận tính công cho nhân viên: mới, sửa, xóa..." e="Add New, Edit, Delete Cost Center Definition..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="200">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ma_nv" width="100">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ngay_hl"/>
      <field name="ghi_chu"/>
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
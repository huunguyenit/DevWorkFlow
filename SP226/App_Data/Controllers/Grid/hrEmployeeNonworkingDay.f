<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrnvnghi0" code="stt_rec, thu, ngay_hl_tu" order="ma_nv, ngay_hl_tu, thu" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo lịch nghỉ theo nhân viên" e="Non-working Days by Employee"></title>
  <subTitle v="Cập nhật lịch nghỉ cho nhân viên: thêm, sửa, xóa..." e="Add , Edit, Delete Non-working Days by Employee..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100"  allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và Tên" e="Employee Name"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>

    <field name="thu" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_thu%l" width="100" allowSorting="true" allowFilter="true">
      <header v="Thứ" e="Day of Week"></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" width="60" clientDefault="0" allowSorting="true" allowFilter="true">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"/>
    </field>

    <field name="ngay_hl_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Đến" e="To"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>

      <field name="thu"/>
      <field name="ten_thu%l"/>
      <field name="so_gio"/>

      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
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
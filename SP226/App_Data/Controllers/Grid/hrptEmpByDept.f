<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách nhân viên theo bộ phận" e="Employee List by Department"></title>
  <subTitle v="Ngày báo cáo %d2..." e="Report Date %d2..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_va_ten" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"></header>
    </field>
    <field name="gioi_tinh" width="80" allowSorting="true" allowFilter="true">
      <header v="Giới tính" e="Gender"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="nguoi_quan_ly" width="150" allowSorting="true" allowFilter="true">
      <header v="Người quản lý" e="Supervisor"></header>
    </field>
    <field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày vào" e="Date in" />
    </field>
    <field name="ngay_bp_bd" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày bắt đầu" e="Begin Date" />
    </field>
    <field name="ngay_bp_kt" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="End date" />
    </field>
    <field name="ten_ttnv" width="150" allowSorting="true" allowFilter="true">
      <header v="Tình trạng" e="Status"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_va_ten"/>
      <field name="gioi_tinh"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="nguoi_quan_ly"/>
      <field name="ngay_vao"/>
      <field name="ngay_bp_bd"/>
      <field name="ngay_bp_kt"/>
      <field name="ten_ttnv"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
    </text>
  </script>
  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách nhân viên theo trình độ học vấn" e="Employee List by Education Level"></title>
  <subTitle v="%s..." e="%s..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="####" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"/>
    </field>
    <field name="gioi_tinh" width="80" allowSorting="true" allowFilter="true">
      <header v="Giới tính" e="Gender"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"/>
    </field>
    <field name="ten_vi_tri" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"/>
    </field>
    <field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày vào cty" e="Date in" />
    </field>
    <field name="truong_hoc" width="300" allowSorting="true" allowFilter="true">
      <header v="Trường tốt nghiệp" e="Institute&#47;University"/>
    </field>
    <field name="ma_cn" width="100" allowSorting="true" allowFilter="true">
      <header v="Chuyên ngành" e="Education Major"></header>
    </field>
    <field name="ngay_tot_nghiep" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày tốt nghiệp" e="Graduation Date"></header>
    </field>
    <field name="ten_ttnv" width="150" allowSorting="true" allowFilter="true">
      <header v="Tình trạng" e="Status"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="gioi_tinh"/>
      <field name="ten_bp"/>
      <field name="ten_vi_tri"/>
      <field name="ngay_vao"/>
      <field name="truong_hoc"/>
      <field name="ma_cn"/>
      <field name="ngay_tot_nghiep"/>
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
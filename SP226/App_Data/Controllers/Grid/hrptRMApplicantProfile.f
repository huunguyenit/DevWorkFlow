<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo hồ sơ ứng viên" e="Applicant Profiles"></title>
  <subTitle v="%s..." e="%s..."></subTitle>
  <fields>
    <field name="ma_dot" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đợt" e="Period Code"></header>
    </field>
    <field name="ten_dot" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đợt tuyển dụng" e="Description"/>
    </field>
    <field name="ma_uv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ứng viên" e="Applicant ID"></header>
    </field>
    <field name="ho_ten_uv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"/>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="gioi_tinh" width="80" allowSorting="true" allowFilter="true">
      <header v="Giới tính" e="Gender"></header>
    </field>
    <field name="vi_tri" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí" e="Vacancy"/>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ngay_hs" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày nộp hồ sơ" e="Date Applied"></header>
    </field>
    <field name="status" width="150" allowSorting="true" allowFilter="true">
      <header v="Trạng thái hồ sơ" e="Status"/>
    </field>
    <field name="so_dt" width="150" allowSorting="true" allowFilter="true">
      <header v="Điện thoại" e="Phone No."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dot"/>
      <field name="ten_dot"/>
      <field name="ma_uv"/>
      <field name="ho_ten_uv"/>
      <field name="ngay_sinh"/>
      <field name="gioi_tinh"/>
      <field name="vi_tri"/>
      <field name="ten_bp"/>
      <field name="ngay_hs"/>
      <field name="status"/>
      <field name="so_dt"/>
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
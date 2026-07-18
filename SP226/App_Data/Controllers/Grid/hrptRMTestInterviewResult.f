<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter ="sysorder = 5"  xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo kết quả kiểm tra, phỏng vấn" e="Test and Interview Result"></title>
  <subTitle v="Ngày báo cáo từ %d1 đến %d2..." e="Report Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dot" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đợt" e="Period Code"></header>
    </field>
    <field name="ten_dot" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đợt tuyển dụng" e="Description"/>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí" e="Vacancy"/>
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
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="vong_ut" width="300" allowSorting="true" allowFilter="true">
      <header v="Vòng tuyển dụng" e="Recruitment Round"></header>
    </field>
    <field name="noi_dung" width="300" allowSorting="true" allowFilter="true">
      <header v="Nội dung" e="Content"></header>
    </field>
    <field name="ngay_ktr" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="diem" width="100" type="Decimal" allowSorting="true" dataFormatString="@markViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Điểm" e="Score"/>
    </field>
    <field name="ket_qua" width="150" allowSorting="true" allowFilter="true">
      <header v="Kết quả" e="Result"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dot"/>
      <field name="ten_dot"/>
      <field name="ten_vtr"/>
      <field name="ma_uv"/>
      <field name="ho_ten_uv"/>
      <field name="ngay_sinh"/>
      <field name="gioi_tinh"/>
      <field name="ten_bp"/>
      <field name="vong_ut"/>
      <field name="noi_dung"/>
      <field name="ngay_ktr"/>
      <field name="diem"/>
      <field name="ket_qua"/>
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
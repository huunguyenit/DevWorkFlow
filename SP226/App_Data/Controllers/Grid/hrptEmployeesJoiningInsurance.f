<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" filter="sysprint &lt;&gt; 0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách lao động tham gia bảo hiểm" e="Employees Joining Insurance"></title>
  <subTitle v="Đợt %t tháng %p năm %y..." e="Time %t Month %p Year %y..."></subTitle>

  <fields>
    <field name="tt" width="60" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ten_nv" width="300" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="so_sbh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sổ BHXH" e="SI Book No."></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="ten_cv" width="300" allowSorting="true" allowFilter="true">
      <header v="Chức vụ" e="Position"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="tt"/>
      <field name="ten_nv"/>
      <field name="so_sbh"/>
      <field name="ngay_sinh"/>
      <field name="ten_cv"/>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" code="stt_rec, ngay_ky_hd" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo yêu cầu đào tạo theo vị trí công việc" e="Training Requirement Report by Job Position"></title>
  <subTitle v="Ngày báo cáo: %d..." e="Report Date: %d..."></subTitle>
  <fields>
    <field name="stt" type="Int16" dataFormatString="### ### ### ###" width="60" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_mh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã môn học" e="Subject Code"></header>
    </field>
    <field name="ten_mh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên môn học" e="Subject Name"></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ket_qua" width="100" allowSorting="true" allowFilter="true">
      <header v="Kết quả" e="Result"></header>
    </field>
    <field name="ngay_hh_cc" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hết hạn" e="Expiry Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_mh"/>
      <field name="ten_mh"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="ket_qua"/>
      <field name="ngay_hh_cc"/>
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
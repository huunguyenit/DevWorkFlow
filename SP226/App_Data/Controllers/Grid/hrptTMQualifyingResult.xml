<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" code="stt_rec, ngay_ky_hd" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo kết quả đào tạo theo nhân viên" e="Trainee Qualifying and Result"></title>
  <subTitle v="Ngày học từ %d1 đến %d2..." e="Training Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt_in" type="Int16" dataFormatString="### ### ### ###" width="60" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ten_mh" width="150" allowSorting="true" allowFilter="true">
      <header v="Môn học" e="Subject"></header>
    </field>
    <field name="loai_hinh_dt" width="150" allowSorting="true" allowFilter="true">
      <header v="Loại hình đào tạo" e="Training Type"></header>
    </field>

    <field name="diem" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Điểm" e="Mark"></header>
    </field>
    <field name="xep_loai" width="100" allowSorting="true" allowFilter="true">
      <header v="Xếp loại" e="Grade"></header>
    </field>
    <field name="ket_qua" width="100" allowSorting="true" allowFilter="true">
      <header v="Kết quả" e="Result"></header>
    </field>
    <field name="chung_chi" width="100" allowSorting="true" allowFilter="true">
      <header v="Chứng chỉ" e="Certificate"></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Hiệu lực từ" e="Effective from"></header>
    </field>
    <field name="ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="To Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_in"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="ten_mh"/>
      <field name="loai_hinh_dt"/>

      <field name="diem"/>
      <field name="xep_loai"/>
      <field name="ket_qua"/>
      <field name="chung_chi"/>
      <field name="ngay_hl"/>
      <field name="ngay_hh"/>
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
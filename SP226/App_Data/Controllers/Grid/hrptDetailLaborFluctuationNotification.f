<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thông báo về tình hình biến động lao động" e="Detail of Labor Fluctuation Notification"></title>
  <subTitle v="%s, từ ngày %d1 đến ngày %d2..." e="%s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Int16" width="60" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Họ và tên" e="Employee Name"/>
    </field>
    <field name="thoi_diem" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Thời điểm" e="Time"/>
    </field>
    <field name="tong_nv" width="100" type="Int16" dataFormatString="### ### ###" allowSorting="true" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tổng số lao động" e="Total of Labor"/>
    </field>
    <field name="so_nv_nu" width="100" type="Int16" dataFormatString="### ### ###" allowSorting="true" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lao động nữ" e="Women Labor"/>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="dan_toc" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Dân tộc" e="Ethnic"/>
    </field>
    <field name="gioi_tinh" width="60" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Giới tính" e="Gender"/>
    </field>
    <field name="cmnd_so" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số CMND" e="ID Card No."/>
    </field>
    <field name="si_no" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số sổ BHXH" e="SI Book No."/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="gioi_tinh"/>
      <field name="thoi_diem"/>
      <field name="tong_nv"/>
      <field name="so_nv_nu"/>
      <field name="ngay_sinh"/>
      <field name="dan_toc"/>
      <field name="cmnd_so"/>
      <field name="si_no"/>
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
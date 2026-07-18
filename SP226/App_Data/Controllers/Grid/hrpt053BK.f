<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng kê thông tin người phụ thuộc" e="List of Dependants"></title>
  <subTitle v="Năm %y..." e="Year %y..."></subTitle>
  <fields>
    <field name="sysorder" type="Decimal" width="50" dataFormatString="### ###" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_ns" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_ns" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="ma_so_thue" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="ten_pt" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên người phụ thuộc" e="Dependant Name"></header>
    </field>
    <field name="ngay_sinh_pt" type="DateTime" width="100" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="ma_so_thue_pt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế NPT" e="Tax Code"></header>
    </field>
    <field name="ten_qt" width="300" allowSorting="true" allowFilter="true">
      <header v="Quốc tịch" e="Nationality"></header>
    </field>
    <field name="cmnd_pt" width="100" allowSorting="true" allowFilter="true">
      <header v="CMND/HC" e="ID/Passport"></header>
    </field>
    <field name="quan_he_pt" width="100" allowSorting="true" allowFilter="true">
      <header v="Quan hệ" e="Relationship"></header>
    </field>
    <field name="so_khai_sinh_pt" width="100" allowSorting="true" allowFilter="true">
      <header v="Giấy khai sinh" e="Birth Certificate"></header>
    </field>
    <field name="quyen_so_pt" width="100" allowSorting="true" allowFilter="true">
      <header v="Quyển số" e="Book No."></header>
    </field>
    <field name="quoc_gia_pt" width="100" allowSorting="true" allowFilter="true">
      <header v="Quốc gia" e="Nation"></header>
    </field>
    <field name="tinh_thanh_pt" width="100" allowSorting="true" allowFilter="true">
      <header v="Tỉnh/thành" e="Province/City"></header>
    </field>
    <field name="quan_huyen_pt" width="100" allowSorting="true" allowFilter="true">
      <header v="Quận/huyện" e="District"></header>
    </field>
    <field name="phuong_xa_pt" width="100" allowSorting="true" allowFilter="true">
      <header v="Phường/xã" e="Ward/Commune"></header>
    </field>
    <field name="tu_thang" type="Decimal" width="100" dataFormatString="#0" allowSorting="true" allowFilter="true">
      <header v="Từ tháng" e="From Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="den_thang" type="Decimal" width="100" dataFormatString="#0" allowSorting="true" allowFilter="true">
      <header v="Đến tháng" e="To Month"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="sysorder"/>
      <field name="ma_dvcs"/>
      <field name="ma_ns"/>
      <field name="ten_ns"/>
      <field name="ma_so_thue"/>
      <field name="ten_pt"/>
      <field name="ngay_sinh_pt"/>
      <field name="ma_so_thue_pt"/>
      <field name="ten_qt"/>
      <field name="cmnd_pt"/>
      <field name="quan_he_pt"/>
      <field name="so_khai_sinh_pt"/>
      <field name="quyen_so_pt"/>
      <field name="quoc_gia_pt"/>
      <field name="tinh_thanh_pt"/>
      <field name="quan_huyen_pt"/>
      <field name="phuong_xa_pt"/>
      <field name="tu_thang"/>
      <field name="den_thang"/>
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
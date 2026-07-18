<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách đề nghị thay đổi thông tin của người tham gia bảo hiểm" e="Employees Requesting for Insurance Profile Change"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2." e="Date from %d1 to %d2."></subTitle>

  <fields>
    <field name="tt" type="Int16" width="60" dataFormatString="#####" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"></header>
    </field>
    <field name="si_no" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sổ BHXH" e="SI Book Code"></header>
    </field>
    <field name="noi_dung" width="300" allowSorting="true" allowFilter="true">
      <header v="Nội dung thay đổi" e="Content of Change"></header>
    </field>
    <field name="tt_cu" width="150" allowSorting="true" allowFilter="true">
      <header v="Thông tin cũ" e="Old Information"></header>
    </field>
    <field name="tt_moi" width="150" allowSorting="true" allowFilter="true">
      <header v="Thông tin mới" e="New Information"></header>
    </field>
    <field name="tu_thang" width="60" allowSorting="true" allowFilter="true" align="right">
      <header v="Từ tháng" e="From"></header>
    </field>
    <field name="den_thang" width="60" allowSorting="true" allowFilter="true" align="right">
      <header v="Đến tháng" e="To"></header>
    </field>
    <field name="ly_do" width="300" allowFilter="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="si_no"/>
      <field name="noi_dung"/>
      <field name="tt_cu"/>
      <field name="tt_moi"/>
      <field name="tu_thang"/>
      <field name="den_thang"/>
      <field name="ly_do"/>
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
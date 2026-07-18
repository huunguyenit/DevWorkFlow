<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách nhân viên điều chuyển bộ phận" e="Employee Transfer"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="####" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"/>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"/>
    </field>
    <field name="gioi_tinh" width="80" allowSorting="true" allowFilter="true">
      <header v="Giới tính" e="Gender"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận cũ" e="Old Department"/>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí cũ" e="Old Position"/>
    </field>
    <field name="ngay_kt" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="End Date" />
    </field>
    <field name="ten_bp_moi" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận mới" e="New Department"/>
    </field>
    <field name="ten_vtr_moi" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí mới" e="New Position"/>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày bắt đầu" e="Start Date" />
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="gioi_tinh"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="ngay_kt"/>
      <field name="ten_bp_moi"/>
      <field name="ten_vtr_moi"/>
      <field name="ngay_bd"/>
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
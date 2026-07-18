<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" valid="systotal = 1" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo diễn biến lao động theo bộ phận, vị trí công việc" e="Employee Changes By Department and Position"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="bo_phan" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ld_dau_ky" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Lđ đầu kỳ" e="Beginning"></header>
    </field>
    <field name="tang_moi" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Tăng mới" e="New Employ."></header>
    </field>
    <field name="dieu_chuyen_den" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Chuyển đến" e="Transfer in"></header>
    </field>
    <field name="tong_ld_tang" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Tổng lđ tăng" e="Increase"></header>
    </field>

    <field name="nghi_viec" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Nghỉ việc" e="Job Leaving"></header>
    </field>
    <field name="dieu_chuyen_di" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Chuyển đi" e="Transfer out"></header>
    </field>
    <field name="tong_ld_giam" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Tổng lđ giảm" e="Decrease"></header>
    </field>
    <field name="ld_cuoi_ky" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Lđ cuối kỳ" e="Ending"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="bo_phan"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="ld_dau_ky"/>
      <field name="tang_moi"/>
      <field name="dieu_chuyen_den"/>
      <field name="tong_ld_tang"/>

      <field name="nghi_viec"/>
      <field name="dieu_chuyen_di"/>
      <field name="tong_ld_giam"/>
      <field name="ld_cuoi_ky"/>
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
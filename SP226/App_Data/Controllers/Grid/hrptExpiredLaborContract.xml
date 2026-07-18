<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo cảnh báo hết hạn hợp đồng" e="Employees with Labor Contract Due to be Expired"></title>
  <subTitle v="Ngày báo cáo: %d, số ngày cảnh báo: %sN..." e="Report Date: %d, No. of Days: %sN..."></subTitle>
  <fields>
    <field name="id" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"/>
    </field>
    <field name="bo_phan" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ma_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="so_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hợp đồng" e="Contract No."></header>
    </field>
    <field name="loai_hd" width="150" allowSorting="true" allowFilter="true">
      <header v="Loại hợp đồng" e="Contract Type"></header>
    </field>
    <field name="ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày kt hiệu lực" e="End Date"/>
    </field>
    <field name="so_ngay" width="100" type="Decimal" dataFormatString="####" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số ngày" e="Days"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="bo_phan"/>
      <field name="ma_vtr"/>
      <field name="so_hd"/>
      <field name="loai_hd"/>
      <field name="ngay_hh"/>
      <field name="so_ngay"/>
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
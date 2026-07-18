<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.020;" repetition="&Repetition.Key.019;&Repetition.And;&Repetition.Key.021;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng tổng hợp tăng ca" e="Overtime Sheet"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2, %s..." e="Date from %d1 to %d2, %s..."></subTitle>

  <fields>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tt" type="Int16" width="60" dataFormatString="### ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="n1" type="Int16" width="100" dataFormatString="### ### ###.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ngày thường" e="Regular Day"></header>
    </field>
    <field name="n2" type="Int16" width="100" dataFormatString="### ### ###.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ngày nghỉ" e="Non-Wkg Day"></header>
    </field>
    <field name="n3" type="Int16" width="100" dataFormatString="### ### ###.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ngày lễ" e="Public Holiday"></header>
    </field>
    <field name="n" type="Int16" width="100" dataFormatString="### ### ###.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng cộng" e="Total"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="ten_bp"/>
      <field name="n1"/>
      <field name="n2"/>
      <field name="n3"/>
      <field name="n"/>
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
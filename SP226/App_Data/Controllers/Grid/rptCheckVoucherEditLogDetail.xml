<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Nhật ký thay đổi chứng từ chi tiết" e="Voucher Logs Detail"></title>
  <subTitle v="Lần thay đổi %i, %c - %n, chứng từ số %v, ngày %d..." e="Revision %i. %c - %n. Voucher Number %v. Voucher Date %d..."></subTitle>
  <fields>

    <field name="gr_name" width="150" allowSorting="true" allowFilter="true">
      <header v="Thông tin" e="Information"></header>
    </field>
    <field name="field_name" width="200" allowSorting="true" allowFilter="true">
      <header v="Trường" e="Field"></header>
    </field>
    <field name="line_nbr" type="Decimal" dataFormatString="### ###" width="60" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"/>
    </field>

    <field name="user_action" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại" e="Type"></header>
    </field>

    <field name="old_value" width="300" allowSorting="true" allowFilter="true">
      <header v="Giá trị cũ" e="Old Value"></header>
    </field>
    <field name="new_value" width="300" allowSorting="true" allowFilter="true">
      <header v="Giá trị mới" e="New Value"></header>
    </field>

    <field name="gr_id" type="Decimal" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="gr_name"/>

      <field name="field_name"/>
      <field name="line_nbr"/>
      <field name="user_action"/>

      <field name="old_value" />
      <field name="new_value" />

      <field name="gr_id"/>
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
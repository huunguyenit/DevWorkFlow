<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="sysorder = 5" filter="&Repetition.Key.016;" repetition="&Repetition.Key.017;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách lao động tham gia bảo hiểm trong tháng" e="Employees Joining Insurance in Month"></title>
  <subTitle v="Tháng %m năm %y..." e="Month %m Year %y..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"/>
    </field>
    <field name="so_bh" width="150" allowSorting="true" allowFilter="true">
      <header v="Sổ bhxh" e="SI Book No."></header>
    </field>
    <field name="nv_bh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lương đóng bh" e="Base Salary"></header>
    </field>
    <field name="nv_bhxh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền bhxh nv tt" e="Empl. SI Premium"></header>
    </field>
    <field name="nv_bhyt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền bhyt nv tt" e="Empl. HI Premium"></header>
    </field>
    <field name="nv_bhtn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền bhtn nv tt" e="Empl. UI Premium"></header>
    </field>
    <field name="cty_bhxh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền bhxh cty tt" e="Comp. SI Premium"></header>
    </field>
    <field name="cty_bhyt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền bhyt cty tt" e="Comp. HI Premium"></header>
    </field>
    <field name="cty_bhtn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền bhtn cty tt" e="Comp. UI Premium"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="so_bh"/>
      <field name="nv_bh"/>
      <field name="nv_bhxh"/>
      <field name="nv_bhyt"/>
      <field name="nv_bhtn"/>
      <field name="cty_bhxh"/>
      <field name="cty_bhyt"/>
      <field name="cty_bhtn"/>
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

  &XMLStandardReportToolbar;
</grid>
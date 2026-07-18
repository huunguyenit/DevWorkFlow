<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo phép năm" e="Employee Annual Leave Summary Report"></title>
  <subTitle v="Đến ngày: %y, %s..." e="Date to: %y, %s..."></subTitle>

  <fields>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tt" type="Int16" width="60" dataFormatString="#####" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"></header>
    </field>
    <field name="tham_nien" type="Int16" dataFormatString="### ###.000" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thâm niên" e="Seniority"></header>
    </field>
    <field name="phep_dn" type="Int16" dataFormatString="### ###.#0" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư đầu" e="Opening"></header>
    </field>
    <field name="phep_hh" type="Int16" dataFormatString="### ###.#0" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phép hết hạn" e="Expired"></header>
    </field>
    <field name="phep_tn" type="Int16" dataFormatString="### ###.#0" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Trong năm" e="Available"></header>
    </field>
    <field name="phep_den_ngay" type="Int16" dataFormatString="### ###.#0" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="phep_th" type="Int16" dataFormatString="### ###.#0" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đã nghỉ" e="Used Leaves"></header>
    </field>
    <field name="phep_cl" type="Int16" dataFormatString="### ###.#0" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Còn lại" e="Remaining"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="tham_nien"/>
      <field name="phep_dn"/>
      <field name="phep_hh"/>
      <field name="phep_tn"/>
      <field name="phep_den_ngay"/>
      <field name="phep_th"/>
      <field name="phep_cl"/>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.018;" repetition="&Repetition.Key.019;" valid="stt_rec &lt;&gt; ''" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng theo dõi số ngày nghỉ phép trong năm" e="Employee Annual Leave Detailed Report"></title>
  <subTitle v="Năm: %y, %s..." e="Year: %y, %s..."></subTitle>

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
    <field name="phep_dn" type="Int16" dataFormatString="### ###.#0" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư đầu" e="Opening"></header>
    </field>
    <field name="phep_hh" type="Int16" dataFormatString="### ###.#0" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phép hết hạn" e="Expired"></header>
    </field>
    <field name="phep_tn" type="Int16" dataFormatString="### ###.#0" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Trong năm" e="Available"></header>
    </field>

    <field name="t1" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 1" e="Jan"></header>
    </field>
    <field name="t2" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 2" e="Feb"></header>
    </field>
    <field name="t3" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 3" e="Mar"></header>
    </field>
    <field name="t4" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 4" e="Apr"></header>
    </field>
    <field name="t5" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 5" e="May"></header>
    </field>
    <field name="t6" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 6" e="Jun"></header>
    </field>
    <field name="t7" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 7" e="Jul"></header>
    </field>
    <field name="t8" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 8" e="Aug"></header>
    </field>
    <field name="t9" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 9" e="Sep"></header>
    </field>
    <field name="t10" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 10" e="Oct"></header>
    </field>
    <field name="t11" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 11" e="Nov"></header>
    </field>
    <field name="t12" type="Int16" dataFormatString="### ###.#0" width="80" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tháng 12" e="Dec"></header>
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
      <field name="phep_dn"/>
      <field name="phep_hh"/>
      <field name="phep_tn"/>
      <field name="t1"/>
      <field name="t2"/>
      <field name="t3"/>
      <field name="t4"/>
      <field name="t5"/>
      <field name="t6"/>
      <field name="t7"/>
      <field name="t8"/>
      <field name="t9"/>
      <field name="t10"/>
      <field name="t11"/>
      <field name="t12"/>
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
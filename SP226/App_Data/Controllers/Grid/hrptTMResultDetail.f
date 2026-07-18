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
  <title v="Báo cáo chi tiết kết quả khóa học" e="Training Result Detailed by Course"></title>
  <subTitle v="Ngày học từ %d1 đến %d2..." e="Training Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Decimal" dataFormatString="### ###" width="60" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"/>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Job Position"></header>
    </field>
    <field name="ten_mh" width="300" allowSorting="true" allowFilter="true">
      <header v="Môn học" e="Subject"></header>
    </field>
    <field name="diem_so" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Điểm số" e="Mark"></header>
    </field>
    <field name="ten_xep_loai" width="150" allowSorting="true" allowFilter="true">
      <header v="Xếp loại" e="Grade"></header>
    </field>
    <field name="ket_qua" width="150" allowSorting="true" allowFilter="true">
      <header v="Kết quả" e="Result"></header>
    </field>
    <field name="cp_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Chi phí 1 hv" e="Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_ho_tro" type="Decimal" dataFormatString="# ### ### ##0.00" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hỗ trợ (%)" e="Supported (%)"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="ten_mh"/>
      <field name="diem_so"/>
      <field name="ten_xep_loai"/>
      <field name="ket_qua"/>
      <field name="cp_tt"/>
      <field name="tl_ho_tro"/>
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
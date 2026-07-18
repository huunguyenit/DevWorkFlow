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

<grid type="Report" filter="&Repetition.Key.016;" repetition="&Repetition.Key.017;" valid="stt &lt;&gt; 0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách thanh toán lương bằng chuyển khoản" e="Bank Transfer List"></title>
  <subTitle v="Kỳ %p..." e="Period %p..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="# ### ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="tk_nh" width="150" allowSorting="true" allowFilter="true">
      <header v="Tài khoản ngân hàng" e="Bank Account"></header>
    </field>
    <field name="ngan_hang" width="300" allowSorting="true" allowFilter="true">
      <header v="Ngân hàng" e="Bank"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thực lĩnh" e="Net Pay"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thực lĩnh" e="Net Pay"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="tk_nh"/>
      <field name="ngan_hang"/>
      <field name="tien"/>
      <field name="tien_nt"/>
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
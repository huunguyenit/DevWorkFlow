<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid ="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng kê thuế TNCN từ tiền lương, tiền công theo biểu thuế toàn phần" e="List of Personal Income Tax on Salaries or Wages  by Flat Rate Tariff"></title>
  <subTitle v="Năm %s..." e="Year %s..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_ns" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee"/>
    </field>
    <field name="ten_ns" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên nhân viên" e="Employee Name"/>
    </field>
    <field name="ma_so_thue" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="PIT Code"/>
    </field>
    <field name="cmnd" width="100" allowSorting="true" allowFilter="true">
      <header v="CMND/Hộ chiếu" e="ID/Passport"></header>
    </field>
    <field name="cu_tru_yn" width="80" allowSorting="true" allowFilter="true">
      <header v="Cư trú" e="Resident"/>
    </field>
    <field name="tn_ct_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập chịu thuế" e="Assessable Income"/>
    </field>
    <field name="tn_phi_bh_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="BH không bắt buộc" e="Other Optional Insurance Premiums"/>
    </field>
    <field name="tn_gt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập giảm thuế" e="Reduction"/>
    </field>
    <field name="hiep_dinh_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Theo hiệp định" e="By Agreements"></header>
    </field>
    <field name="thue_da_kt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế đã khấu trừ" e="Deducted"/>
    </field>
    <field name="thue_kt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế phải khấu trừ" e="Tax to be Deducted"/>
    </field>
    <field name="tn_gt_bh_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế BH không bắt buộc" e="Tax Other Optional Insurance Premiums"/>
    </field>
    <field name="thue_mg_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số thuế được giảm" e="Reduced PIT"></header>
      <items style="Numeric"/>
    </field>

    <field name="tn_ct" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập chịu thuế" e="Assessable Income"/>
    </field>
    <field name="tn_phi_bh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="BH không bắt buộc" e="Other Optional Insurance Premiums"/>
    </field>
    <field name="tn_gt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập giảm thuế" e="Reduction"/>
    </field>
    <field name="hiep_dinh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Theo hiệp định" e="By Agreements"></header>
    </field>
    <field name="thue_da_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế đã khấu trừ" e="Deducted"/>
    </field>
    <field name="thue_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế phải khấu trừ" e="Tax to be Deducted"/>
    </field>
    <field name="tn_gt_bh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế BH không bắt buộc" e="Tax Other Optional Insurance Premiums"/>
    </field>
    <field name="thue_mg" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số thuế được giảm" e="Reduced PIT"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_ns"/>
      <field name="ten_ns"/>
      <field name="ma_so_thue"/>
      <field name="cmnd"/>
      <field name="cu_tru_yn"/>

      <field name="tn_ct_nt"/>
      <field name="tn_phi_bh_nt"/>
      <field name="tn_gt_nt"/>
      <field name="hiep_dinh_nt"/>
      <field name="thue_da_kt_nt"/>
      <field name="thue_kt_nt"/>
      <field name="tn_gt_bh_nt"/>
      <field name="thue_mg_nt"/>

      <field name="tn_ct"/>
      <field name="tn_phi_bh"/>
      <field name="tn_gt"/>
      <field name="hiep_dinh"/>
      <field name="thue_da_kt"/>
      <field name="thue_kt"/>
      <field name="tn_gt_bh"/>
      <field name="thue_mg"/>
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
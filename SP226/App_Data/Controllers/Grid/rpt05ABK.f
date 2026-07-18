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
  <title v="Bảng kê thuế TNCN từ tiền lương, tiền công theo biểu thuế lũy tiến" e="List of Personal Income Tax on Salaries or Wages  by Partially Progressive Tariff"></title>
  <subTitle v="Năm %y..." e="Year %y..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_ns" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_ns" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="ma_so_thue" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="PIT Code"></header>
    </field>
    <field name="cmnd" width="100" allowSorting="true" allowFilter="true">
      <header v="CMND/Hộ chiếu" e="ID/Passport"></header>
    </field>
    <field name="uq_yn" width="80" allowSorting="true" allowFilter="true">
      <header v="Ủy quyền" e="Authorization"></header>
    </field>

    <field name="tn_ct_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập chịu thuế" e="Assessable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="tn_gt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập giảm thuế" e="Reduction"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_bt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt bản thân" e="Taxpayer Deduction"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt người phụ thuộc" e="Dependant"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_tt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt từ thiện" e="Charitable"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_bh_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt bảo hiểm" e="Insurances"></header>
      <items style="Numeric"/>
    </field>
    <field name="tn_tt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập tính thuế" e="Taxable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_dkt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế đã khấu trừ" e="Deducted"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_pkt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế phải khấu trừ" e="Tax to be Deducted"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_qt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế quyết toán" e="Finalized"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_mg_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế miễn giảm" e="Reduced"></header>
      <footer v="Thuế được giảm" e="Reduced PIT"></footer>
      <items style="Numeric"/>
    </field>
    <field name="thue_pn_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Còn phải nộp" e="Payable"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_thua_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Nộp thừa" e="Over-paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_ktthem_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Khấu trừ thêm" e="Other Deducted"></header>
      <items style="Numeric"/>
    </field>

    <field name="tn_ct" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập chịu thuế" e="Assessable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="tn_gt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập giảm thuế" e="Reduction"></header>
      <items style="Numeric"/>
    </field>
    <field name="hiep_dinh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Theo hiệp định" e="By Agreements"></header>
    </field>

    <field name="so_npt_gt" type="Decimal" width="120" dataFormatString="### ### ##0" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số lượng NPT tính giảm trừ" e="Total Number of Dependants"></header>
      <items style="Numeric"/>
    </field>

    <field name="gt_bt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt bản thân" e="Taxpayer Deduction"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt người phụ thuộc" e="Dependant"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_tt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt từ thiện" e="Charitable"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_bh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Gt bảo hiểm" e="Insurances"></header>
      <items style="Numeric"/>
    </field>
    <field name="huu_tri" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quỹ h.trí tự nguyện" e="Voluntary Pension"></header>
      <items style="Numeric"/>
    </field>
    <field name="tn_tt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thu nhập tính thuế" e="Taxable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_dkt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế đã khấu trừ" e="Deducted"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_pkt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế phải khấu trừ" e="Tax to be Deducted"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_qt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế quyết toán" e="Finalized"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_mg" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế miễn giảm" e="Reduced"></header>
      <footer v="Thuế được giảm" e="Reduced PIT"></footer>
      <items style="Numeric"/>
    </field>
    <field name="thue_pn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Còn phải nộp" e="Payable"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_thua" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Nộp thừa" e="Over-paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_ktthem" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Khấu trừ thêm" e="Other Deducted"></header>
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
      <field name="uq_yn"/>

      <field name="tn_ct_nt"/>
      <field name="tn_gt_nt"/>
      <field name="gt_bt_nt"/>
      <field name="gt_pt_nt"/>
      <field name="gt_tt_nt"/>
      <field name="gt_bh_nt"/>
      <field name="tn_tt_nt"/>
      <field name="thue_dkt_nt"/>
      <field name="thue_pkt_nt"/>
      <field name="thue_qt_nt"/>
      <field name="thue_mg_nt"/>
      <field name="thue_pn_nt"/>
      <field name="thue_thua_nt"/>
      <field name="thue_ktthem_nt"/>

      <field name="tn_ct"/>
      <field name="tn_gt"/>
      <field name="hiep_dinh"/>
      <field name="so_npt_gt"/>
      <field name="gt_bt"/>
      <field name="gt_pt"/>
      <field name="gt_tt"/>
      <field name="gt_bh"/>
      <field name="huu_tri"/>
      <field name="tn_tt"/>
      <field name="thue_dkt"/>
      <field name="thue_pkt"/>
      <field name="thue_qt"/>
      <field name="thue_mg"/>
      <field name="thue_pn"/>
      <field name="thue_thua"/>
      <field name="thue_ktthem"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idiT9+TckNl1Si1k/XSaraQlCrigfiw90MB6olCi2Q3ZF/MXt8tyhI6SN1HHHKwSqF36O3jgshsJKrfcloiM9a2vBLgdY/ADB0Ep8RV5JvDmyEJN1dTbhH53wTuwJaZQArZJVkolxviTrMSuGx4PO7i5pPFObOwRuNJJUafHp86UnMlIJloiukCyoy3aioUwu6/Q8NJ9F2ubujBH4qDha0AcQB+zTIo/a3vUe3ED7RtSSPOjZuIdoiw9N0APf+aZWkhZcCAgZBYYYJ2qBeQfawNNth4KRrAqSBTz67e47ymdEA==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
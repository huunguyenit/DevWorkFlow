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
  <title v="Thông tin lương nhân viên" e="Salary Information"></title>
  <subTitle v="Ngày báo cáo: %d..." e="Report Date: %d..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="60" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="tk_nh" width="150" allowSorting="true" allowFilter="true">
      <header v="Tk ngân hàng" e="Bank Account"></header>
    </field>
    <field name="ngan_hang" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngân hàng" e="Bank"></header>
    </field>
    <field name="loai_luong" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại lương" e="Salary Category"></header>
    </field>
    <field name="kieu_tinh" width="100" allowSorting="true" allowFilter="true">
      <header v="Kiểu tính" e="Calculating Way"></header>
    </field>
    <field name="ma_ngach_m" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngạch lương" e="Pay Grade"></header>
    </field>
    <field name="ma_bac_m" width="100" allowSorting="true" allowFilter="true">
      <header v="Bậc lương" e="Rank of Salary"></header>
    </field>
    <field name="he_so_luong_m" type="Decimal" width="120" dataFormatString="##0.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Hệ số lương" e="Salary Coefficient"></header>
    </field>
    <field name="tien_khoan_m" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Tiền khoán" e="Piece Rate Amount"></header>
    </field>
    <field name="phu_cap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Phụ cấp" e="Allowance"></header>
    </field>
    <field name="tro_cap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Trợ cấp" e="Benefit"></header>
    </field>
    <field name="he_so1" type="Decimal" width="120" dataFormatString="##0.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Hệ số 1" e="Coefficient 1"></header>
    </field>
    <field name="he_so2" type="Decimal" width="120" dataFormatString="##0.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Hệ số 2" e="Coefficient 2"></header>
    </field>
    <field name="he_so3" type="Decimal" width="120" dataFormatString="##0.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Hệ số 3" e="Coefficient 3"></header>
    </field>
    <field name="tien1" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Tiền 1" e="Amount 1"></header>
    </field>
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Tiền 2" e="Amount 2"></header>
    </field>
    <field name="tien3" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" allowSorting="true">
      <header v="Tiền 3" e="Amount 3"></header>
    </field>
    <field name="ma_nt" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại tiền" e="Currency"></header>
    </field>
    <field name="ma_ngach_ct" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngạch lương chi tiết" e="Pay Grade Detail"></header>
    </field>
    <field name="ma_bac_ct" width="100" allowSorting="true" allowFilter="true">
      <header v="Bậc lương chi tiết" e="Rank of Salary Detail"></header>
    </field>
    <field name="he_so_luong_ct" type="Decimal" width="120" dataFormatString="##0.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Hệ số lương chi tiết" e="Salary Coefficient Detail"></header>
    </field>
    <field name="tien_khoan_ct" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền khoán chi tiết" e="Piece Rate Amount Detail"></header>
    </field>
    <field name="ngay_hl_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực chi tiết" e="Effective Date Detail"></header>
    </field>
    <field name="he_so_luong_bh" type="Decimal" width="120" dataFormatString="##0.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Hệ số lương bảo hiểm" e="Base Salary Coefficient"></header>
    </field>
    <field name="tien_bh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền bảo hiểm" e="Insurance Amount"></header>
    </field>
    <field name="tien_cl" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền chênh lệch" e="Difference Amount"></header>
    </field>
    <field name="ngay_hl_bh" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ma_pc" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phụ cấp" e="Allowance"></header>
    </field>
    <field name="ten_pc" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên phụ cấp" e="Allowance Name"></header>
    </field>
    <field name="ty_le" type="Decimal" width="120" dataFormatString="#0.00" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ lệ lcb (%)" e="Base Salary Rate (%)"></header>
    </field>
    <field name="tien_pc" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowSorting="true">
      <header v="Tiền phụ cấp" e="Amount"></header>
    </field>
    <field name="ngay_hl_tu_pc" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Hiệu lực từ ngày" e="Effective Date From"></header>
    </field>
    <field name="ngay_hl_den_pc" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="Effective Date to"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="tk_nh"/>
      <field name="ngan_hang"/>
      <field name="loai_luong"/>
      <field name="kieu_tinh"/>
      <field name="ma_ngach_m"/>
      <field name="ma_bac_m"/>
      <field name="he_so_luong_m"/>
      <field name="tien_khoan_m"/>
      <field name="phu_cap"/>
      <field name="tro_cap"/>
      <field name="he_so1"/>
      <field name="he_so2"/>
      <field name="he_so3"/>
      <field name="tien1"/>
      <field name="tien2"/>
      <field name="tien3"/>
      <field name="ma_nt"/>
      <field name="ma_ngach_ct"/>
      <field name="ma_bac_ct"/>
      <field name="he_so_luong_ct"/>
      <field name="tien_khoan_ct"/>
      <field name="ngay_hl_ct"/>
      <field name="he_so_luong_bh"/>
      <field name="tien_bh"/>
      <field name="tien_cl"/>
      <field name="ngay_hl_bh"/>
      <field name="ma_pc"/>
      <field name="ten_pc"/>
      <field name="ty_le"/>
      <field name="tien_pc"/>
      <field name="ngay_hl_tu_pc"/>
      <field name="ngay_hl_den_pc"/>
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
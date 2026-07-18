<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thông tin bảo hiểm" e="Insurance Information"></title>
  <subTitle v="Ngày báo cáo %d..." e="Report Date %d..."></subTitle>

  <fields>
    <field name="dot" type="Int16" dataFormatString="#0" width="60" allowFilter="true" allowSorting="true">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true" allowSorting="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ngay_thay_doi" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true" allowSorting="true">
      <header v="Ngày thay đổi" e="Change Date"></header>
    </field>
    <field name="loai_thay_doi" width="100" allowFilter="true" allowSorting="true">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="tra_bhyt" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Không trả thẻ BHYT" e="Not Return HI Card"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true" allowSorting="true">
      <header v="Ngày từ" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true" allowSorting="true">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="hs_luong_cb0" type="Decimal" width="100" dataFormatString="### ### ### ###.000" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hs lương cb cũ" e="Old Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="hs_luong_cb" type="Decimal" dataFormatString="### ### ### ###.000" width="100" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hs lương cb mới" e="New Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_cv0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp cv cũ" e="Pos. Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_cv" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp cv mới" e="Pos. Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_vuot0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp vk cũ" e="Off-scale Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_vuot" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp vk mới" e="Off-scale Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_tn0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp tn cũ" e="Seniority Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_tn" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp tn mới" e="Seniority Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_kv0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp kv cũ" e="Region Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_kv" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp kv mới" e="Region Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="luong0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lương cũ" e="Old Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="luong" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lương mới" e="Old Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_lg0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp lương cũ" e="Old Allowances"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_lg" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Phụ cấp lương mới" e="New Allowances"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_khac0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Các khoản bổ sung cũ" e="Old Additional Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_khac" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Các khoản bổ sung mới" e="New Additional Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="luong_cb0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức đóng cũ" e="Old Sum of Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="luong_cb" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức đóng mới" e="New Sum of Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_xh_tang" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" align="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tl BHXH tăng" e="SI Incr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_xh_giam" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" align="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tl BHXH giảm" e="SI Decr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_yt_tang" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" align="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tl BHYT tăng" e="HI Incr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_yt_giam" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" align="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tl BHYT giảm" e="HI Decr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_tn_tang" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" align="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tl BHTN tăng" e="UI Incr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_tn_giam" type ="Decimal" width="100" dataFormatString="#0.00" allowSorting="true" align="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tl BHTN giảm" e="UI Decr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="muc_dong_xh0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức đóng trần cũ BHXH" e="SI Old Ceiling Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="muc_dong_yt0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức đóng trần cũ BHYT" e="HI Old Ceiling Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="muc_dong_tn0" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức đóng trần cũ BHTN" e="UI Old Ceiling Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt_cu" width="150" allowFilter="true" allowSorting="true">
      <header v="Thông tin cũ" e="Old Information"></header>
    </field>
    <field name="tt_moi" width="150" allowFilter="true" allowSorting="true">
      <header v="Thông tin mới" e="New Information"></header>
    </field>
    <field name="ghi_chu" width="300" allowFilter="true" allowSorting="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="tinh_trang" type="Decimal" dataFormatString="#0" width="100" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tình trạng" e="Status"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="dot"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ngay_thay_doi"/>
      <field name="loai_thay_doi"/>
      <field name="tra_bhyt"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>

      <field name="hs_luong_cb0"/>
      <field name="hs_luong_cb"/>
      <field name="phu_cap_cv0"/>
      <field name="phu_cap_cv"/>
      <field name="phu_cap_vuot0"/>
      <field name="phu_cap_vuot"/>
      <field name="phu_cap_tn0"/>
      <field name="phu_cap_tn"/>
      <field name="phu_cap_kv0"/>
      <field name="phu_cap_kv"/>
      <field name="luong0"/>
      <field name="luong"/>
      <field name="phu_cap_lg0"/>
      <field name="phu_cap_lg"/>
      <field name="phu_cap_khac0"/>
      <field name="phu_cap_khac"/>
      <field name="luong_cb0"/>
      <field name="luong_cb"/>
      <field name="tl_xh_tang"/>
      <field name="tl_xh_giam"/>
      <field name="tl_yt_tang"/>
      <field name="tl_yt_giam"/>
      <field name="tl_tn_tang"/>
      <field name="tl_tn_giam"/>
      <field name="muc_dong_xh0"/>
      <field name="muc_dong_yt0"/>
      <field name="muc_dong_tn0"/>

      <field name="tt_cu"/>
      <field name="tt_moi"/>
      <field name="ghi_chu"/>
      <field name="tinh_trang"/>
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
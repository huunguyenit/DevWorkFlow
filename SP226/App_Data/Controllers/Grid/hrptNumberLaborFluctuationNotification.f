<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tình hình thay đổi lao động" e="Labor Fluctuation Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="xNorm" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="tong_ld" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tổng số lđ" e="Total of labor"></header>
    </field>
    <field name="ld_nu" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lđ nữ" e="Female workers"></header>
    </field>
    <field name="dai_hoc" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đại học trở lên" e="Degree of Bachelor or higher"></header>
    </field>
    <field name="cao_dang" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Cao đẳng" e="Degree of Associate"></header>
    </field>
    <field name="trung_cap" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Trung cấp" e="Intermediate professional diploma"></header>
    </field>
    <field name="so_cap_nghe" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sơ cấp" e="Vocational Cert."></header>
    </field>
    <field name="day_nghe" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Dạy nghề" e="Continuing Vocational"></header>
    </field>
    <field name="chua_dt" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Chưa đào tạo" e="Not training"></header>
    </field>
    <field name="khong_xd" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hđ không thời hạn" e="Indefinite term contract"></header>
    </field>
    <field name="xac_dinh" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hđ có thời hạn" e="Definite term contract"></header>
    </field>
    <field name="thoi_vu" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hđ dưới 12 tháng" e="Under 12 months contract"></header>
    </field>
    <field name="nghi_huu" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Nghỉ hưu" e="Retired"></header>
    </field>
    <field name="don_phuong" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đơn phương chấm dứt" e="Unilateral termination"></header>
    </field>
    <field name="ky_luat" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Kỷ luật sa thải" e="Dismissal"></header>
    </field>
    <field name="thoa_thuan" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Thỏa thuận chấm dứt" e="Agree to terminate "></header>
    </field>
    <field name="khac" type="Decimal" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lý do khác" e="Other Reasons"></header>
    </field>
    <field name="ghi_chu" width="300" allowSorting="true" allowFilter="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="xNorm"/>
      <field name="tong_ld"/>
      <field name="ld_nu"/>
      <field name="dai_hoc"/>
      <field name="cao_dang"/>
      <field name="trung_cap"/>
      <field name="so_cap_nghe"/>
      <field name="day_nghe"/>
      <field name="chua_dt"/>
      <field name="khong_xd"/>
      <field name="xac_dinh"/>
      <field name="thoi_vu"/>
      <field name="nghi_huu"/>
      <field name="don_phuong"/>
      <field name="ky_luat"/>
      <field name="thoa_thuan"/>
      <field name="khac"/>
      <field name="ghi_chu"/>
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
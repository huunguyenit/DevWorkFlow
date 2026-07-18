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
  <title v="Báo cáo thực hiện đào tạo" e="Training Implementation"/>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="ma_khoa" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khóa học" e="Course Code"></header>
    </field>
    <field name="ten_khoa" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khóa học" e="Course Name"></header>
    </field>
    <field name="mon_hoc" width="300" allowSorting="true" allowFilter="true">
      <header v="Môn học" e="Subject"></header>
    </field>
    <field name="loai_hinh_dt" width="150" allowSorting="true" allowFilter="true">
      <header v="Loại hình đào tạo" e="Training Type"></header>
    </field>
    <field name="doi_tuong_dt" width="150" allowSorting="true" allowFilter="true">
      <header v="Đối tượng đào tạo" e="Trainees"></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="To Date"></header>
    </field>
    <field name="sl_hv" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl học viên" e="No. of Trainees"></header>
    </field>
    <field name="tong_cp" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tổng chi phí" e="Total Training Cost"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_khoa"/>
      <field name="ten_khoa"/>
      <field name="mon_hoc"/>
      <field name="loai_hinh_dt"/>
      <field name="doi_tuong_dt"/>
      <field name="tu_ngay"/>
      <field name="den_ngay"/>
      <field name="sl_hv"/>
      <field name="tong_cp"/>
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
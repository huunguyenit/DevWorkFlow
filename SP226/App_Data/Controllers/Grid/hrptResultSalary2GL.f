<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo kết quả kết chuyển lương" e="Salary Transaction Report"></title>
  <subTitle v="Kỳ: %p, năm: %y..." e="Period: %p, Year: %y..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_loai_lg" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã loại lương" e="Pay Type"></header>
    </field>
    <field name="ten_loai_lg%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại lương" e="Pay Type Name"></header>
    </field>
    <field name="ma_bp" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="tk_no" width="100" allowFilter="true" allowSorting="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="100" allowFilter="true" allowSorting="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date" />
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ten_bt" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>

    <field name="ma_bp_phi" width="100" allowFilter="true" allowSorting="true">
      <header v="Bộ phận phí" e="Cost Center"></header>
    </field>
    <field name="ma_phi" width="100" allowFilter="true" allowSorting="true">
      <header v="Phí" e="Expense"></header>
    </field>
    <field name="ma_vv" width="100" allowFilter="true" allowSorting="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_loai_lg"/>
      <field name="ten_loai_lg%l"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>

      <field name="tk_no"/>
      <field name="tk_co"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="ngay_ct"/>

      <field name="so_ct"/>
      <field name="ten_bt"/>
      <field name="ma_bp_phi"/>
      <field name="ma_phi"/>
      <field name="ma_vv"/>
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
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
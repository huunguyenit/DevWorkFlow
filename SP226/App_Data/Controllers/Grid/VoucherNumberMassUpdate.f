<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật lại số chứng từ" e="Voucher Number Mass Update"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"/>
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ giá" e="Exchange"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>

    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" width="100" allowSorting="true" allowFilter="true">
      <header v="Lsx" e="MO"></header>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true">
      <header v="Sản phẩm" e="Product"></header>
    </field>
    <field name="ma_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Hợp đồng" e="Contract"></header>
    </field>
    <field name="ma_phi" width="100" allowSorting="true" allowFilter="true">
      <header v="Phí" e="Charge"></header>
    </field>
    <field name="ma_ku" width="100" allowSorting="true" allowFilter="true">
      <header v="Khế ước" e="Loan Contract"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct0"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="dien_giai"/>
      <field name="tk"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="ma_vv"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_sp"/>
      <field name="ma_hd"/>
      <field name="ma_phi"/>
      <field name="ma_ku"/>

      <field name="ma_ct"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFobGUnhwXmtkFvkz1zQcjIvXA0wAVvZKBcd/R3sMqPdFY0HL7KJ3FQQINbl+6DkZmv1dRLBAnuNbHgqOKqnkU5HNnrSAjqIzrSSXy8qsNEH+XrFMo6vzDfmTfVPmlVD4LP3FHw+FL5sZnBu61TqmU0vOEzROwnTnh5dBfVm1inZDAFkdc47klTW7tYnOLXEU9arBeBMTVdCARCzovuSeRKXiXQkX3NoQ3xV9FZnOg2abUjQxrYE6Ceh9ZyRiQNk7iva/L0+oWdd0haN5OVLtBHu5cy43mjwK3mOlrnrWEHWmIoyzmq5r3KIYHG3cqmrR7ax58w8rLwz3W9ROWI+HJ3V</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/DsY9njHIjLlBXr4nU24+89lokvGURd/KMx2cAPInJWVolj9QQv0+KrJgHVpXIlI7MtD2h2dJQRYyBRTAilXntdPNVtzLQDb3lIkOR1vTbHPYUzkr4Y0ZhnZH7MYWvAtVLHf2unJHj7DkOo/iWmi6EP3v39+9ZB4X7qwaTMqxoiy38in5IgzBOBynju/q5F8g==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="MassUpdate">
      <title v="Cập nhật lại số chứng từ$$90" e="Voucher Number Mass Update$$120"></title>
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
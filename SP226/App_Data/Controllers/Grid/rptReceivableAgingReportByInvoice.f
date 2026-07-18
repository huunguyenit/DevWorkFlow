<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng kê công nợ của các hóa đơn theo hạn thanh toán" e="Aging Receivable Report"></title>
  <subTitle v="Ngày tính hạn thanh toán %d2..." e="Due Date %d2..."></subTitle>
  <fields>
    <field name="ngay_ct0" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    &ReferenceNumberFields;

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>

    <field name="ma_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd_ex" width="300" allowSorting="true" external="true" allowFilter="true">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>

    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>

    <field name="t_tt_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền trên hóa đơn nt" e="FC Invoice Amount"></header>
    </field>
    <field name="t_tt_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thu nt" e="FC Received"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phải thu nt" e="FC Receivable"></header>
    </field>
    <field name="so_du_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Trong hạn" e="In Permit Time"></header>
    </field>
    <field name="so_du_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quá %s0 - %s1 ngày" e="Out of %s0 - %s1 days"></header>
    </field>
    <field name="so_du_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quá %s2 - %s3 ngày" e="Out of %s2 - %s3 days"></header>
    </field>
    <field name="so_du_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quá %s4 - %s5 ngày" e="Out of %s4 - %s5 days"></header>
    </field>
    <field name="so_du_nt4" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quá trên %s6 ngày" e="Out of > %s6 days"></header>
    </field>

    <field name="t_tt0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền trên hóa đơn" e="Invoice Amount"></header>
    </field>
    <field name="t_tt1" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thu" e="Received"></header>
    </field>
    <field name="du_cuoi" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phải thu" e="Receivable"></header>
    </field>
    <field name="so_du0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Trong hạn" e="In Permit Time"></header>
    </field>
    <field name="so_du1" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quá %s0 - %s1 ngày" e="Out of %s0 - %s1 days"></header>
    </field>
    <field name="so_du2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quá %s2 - %s3 ngày" e="Out of %s2 - %s3 days"></header>
    </field>
    <field name="so_du3" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quá %s4 - %s5 ngày" e="Out of %s4 - %s5 days"></header>
    </field>
    <field name="so_du4" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quá trên %s6 ngày" e="Out of > %s6 days"></header>
    </field>

    <field name="han_tt" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Hạn t.toán" e="Payment Term"></header>
    </field>
    <field name="ngay_tt0" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày t.toán" e="Due Date"></header>
    </field>
    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct0"/>
      <field name="so_ct"/>

      &ReferenceNumberViews;

      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="ma_hd"/>
      <field name="ten_hd_ex"/>
      <field name="ma_nt"/>

      <field name="t_tt_nt0"/>
      <field name="t_tt_nt1"/>
      <field name="du_cuoi_nt"/>
      <field name="so_du_nt0"/>
      <field name="so_du_nt1"/>
      <field name="so_du_nt2"/>
      <field name="so_du_nt3"/>
      <field name="so_du_nt4"/>

      <field name="t_tt0"/>
      <field name="t_tt1"/>
      <field name="du_cuoi"/>
      <field name="so_du0"/>
      <field name="so_du1"/>
      <field name="so_du2"/>
      <field name="so_du3"/>
      <field name="so_du4"/>

      <field name="han_tt"/>
      <field name="ngay_tt0"/>
      <field name="ma_vv"/>
      <field name="dien_giai"/>

      <field name="ma_ct"/>
      <field name="stt_rec"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idiT9+TckNl1Si1k/XSaraQlCrigfiw90MB6olCi2Q3ZF/MXt8tyhI6SN1HHHKwSqF36O3jgshsJKrfcloiM9a2vaLffE11iM6HKChAwlZiBX0pM32VZq6UQ09I4Zg+bUTxkB/FfkiYLeUewO0KxjQ0nPcyW9UBIZLHtoVP3BBmbD7l0e64eG4hC3DIaE+KkkSe8hHRT4EHbKixR5lONz9pXj1nqxnVWltZsRfxYWT/RR8sgFXN82XmZzGnwYkRsgso3AYUEqd73udiAncdMgkObGo8/+IEVnlCX8tMqUHswyeua04lGDYsBq/kLtcJWgfeAWtmFrk6usG6h30dDDYL46nxwIX2PABqpAqm9zN+m1upbRs28fGM3pakC5Mf590f8/YI6wsCUtgkV0P9CaBZ+3ZRLUtIAK9TYVceyg3hiPw==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>
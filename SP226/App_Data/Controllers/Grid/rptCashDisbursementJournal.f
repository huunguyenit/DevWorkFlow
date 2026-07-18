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

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" valid="systotal = 1" filter="sysorder &lt; 99&Repetition.And;&Repetition.Key.012;" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Sổ nhật ký chi tiền" e="Cash Disbursement Journal"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ghi sổ" e="Posting Date"></header>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày lập" e="VC. Date"></header>
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" type="String" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    &ReferenceNumberFields;

    <field name="dien_giai" type="String" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk" type="String" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi có nt" e="FC Credit Amount"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ nt 1" e="FC Debit Amount 1"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ nt 2" e="FC Debit Amount 2"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ nt 3" e="FC Debit Amount 3"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt4" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ nt 4" e="FC Debit Amount 4"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ nt khác" e="FC Debit Amount"></header>
    </field>
    <field name="ma_nt" type="String" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi có" e="Credit Amount"></header>
    </field>
    <field name="tien1" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ 1" e="Debit Amount 1"></header>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ 2" e="Debit Amount 2"></header>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ 3" e="Debit Amount 3"></header>
    </field>
    <field name="tien4" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ 4" e="Debit Amount 4"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ khác" e="Debit Amount"></header>
    </field>

    <field name="tk_du" type="String" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk nợ khác" e="Debit Account"></header>
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
      <field name="ngay_ct"/>
      <field name="ngay_lct"/>

      <field name="ma_ct0"/>
      <field name="so_ct"/>

      &ReferenceNumberViews;

      <field name="dien_giai"/>
      <field name="tk"/>

      <field name="t_tien_nt"/>
      <field name="tien_nt1"/>
      <field name="tien_nt2"/>
      <field name="tien_nt3"/>
      <field name="tien_nt4"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="t_tien"/>
      <field name="tien1"/>
      <field name="tien2"/>
      <field name="tien3"/>
      <field name="tien4"/>
      <field name="tien"/>

      <field name="tk_du"/>
      <field name="ma_ct"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnKb2PhGvAybH+Swwm6OQl5XavlQfx2ShVtNhglY+0RFr+/e/xnhl2ZwzTrQYPM98aCf4etjs1zVbnWjUXQRQ/u/ZIlsQ6jmobkqvdAqqfu28Q5sAE0ZwFXjVDvvDKQ++L2O+p/TKCEvo1NP8yI8qoS519Rhyq5x0TIipHAHkuvePkF7tQpxqd+9Awa9iDnzVOHpe7hQuIPV0v+pFHYcc+h/qibf83+8mdTo/ML2RYwuxLhOpIhvH07zltwk4hC/GCLS/zVEbcWCJDaAD5roHCKDEDd9ndVsLhsxwYHLQh0Z7Y/JjysWX5ELhmvP8XroCI=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idjr97X9tQQuY7dqku1lQdvMZVrM9TA7cqNKaNHBuhS1aIPDAUjEx9+BuqttEaO6X0aGpBik4gKmE6L1ct4M23VcDwywpp60Kr5eWwm0Th81ncyetMIhg1Kn06rCYWaha752GbZQ4E6caBjnpHI8N8LBM1/OEjBU0cekvfEqRRPqFBcDvA5AKdzQ5eKFXrbGzKW0/J/EkpzRivBJD+v0ioMeU0clW7S6QxKHDU5VmUbFEXnf7C9UMHaBYt57Od/IKxHBFi8XZIl/KwM1ADejklGGmSfTYRhRGK8kLbMJDhVnK95SsCtlLuVoDm2uPnuvN0twjrGblHnYIhAs8aNIj1CctXWXxYCQPsK35/hG7ZrC55iubS7985660QxjjDMUF75DGtBNIHFk3itIsZwkiml1</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
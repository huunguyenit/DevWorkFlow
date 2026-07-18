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

  <title v="Sổ nhật ký bán hàng" e="Sales Journal"></title>
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
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ nt" e="FC Debit Amount"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi có nt 1" e="FC Credit Amount 1"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi có nt 2" e="FC Credit Amount 2"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="tien_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi có nt 3" e="FC Credit Amount 3"></header>
      <footer v="%s nt" e="FC %s"></footer>
    </field>
    <field name="ma_nt" type="String" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi nợ" e="Debit Amount"></header>
    </field>
    <field name="tien1" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi có 1" e="Credit Amount 1"></header>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi có 2" e="Credit Amount 2"></header>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Ghi có 3" e="Credit Amount 3"></header>
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
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="t_tien"/>
      <field name="tien1"/>
      <field name="tien2"/>
      <field name="tien3"/>

      <field name="ma_ct"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnKb2PhGvAybH+Swwm6OQl5XavlQfx2ShVtNhglY+0RFr+/e/xnhl2ZwzTrQYPM98aCf4etjs1zVbnWjUXQRQ/u/ZIlsQ6jmobkqvdAqqfu28Q5sAE0ZwFXjVDvvDKQ++L2O+p/TKCEvo1NP8yI8qoS/x3tY+OQvSWaPYzrvwhhjifr7h2E57dOlgY7GFEBmc1GreM+PvYdtZMWWFXNjuffiHVlF7P18yUbJSkRrHXQtsz8bV2jxHlnAhtwvy4cXMBgTmeKUNEBXBmDAAhMC1wyH2RQoUDc675Zbl8oY5Y4bTEoiS6xKu0fMhtuE62fNSc=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idjr97X9tQQuY7dqku1lQdvMZVrM9TA7cqNKaNHBuhS1aIPDAUjEx9+BuqttEaO6X0aGpBik4gKmE6L1ct4M23VcDwywpp60Kr5eWwm0Th81nV1lJNAp3Hhza3SCOb9jUQJIF1h0CxF9W2WKCXnawDNbjsmSJhzepTfUx+wy+BmC0PvWIA9R298I0AzL0Xhatda/q2VaTsPvJ2V5yN3AbUNYhVR3j/2mqKupqY7SjylRiM9eS5Uq7zCZFRoKVo0a4PojFHJyEXXgNYV3tHlgzRxEtkgj74Fjlxxh4J9Pemx20vNR+e4SCHG1vCcpIYF1ymsn0KB4UyAk4B2zX/bX9RpU0b6SQOGr5dQ0kNio160GpBvDHne2cM0z+aYhiCGC8alEmdWFMuf7B+oZD7iGb0Ps</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
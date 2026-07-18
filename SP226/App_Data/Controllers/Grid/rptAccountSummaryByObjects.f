<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" valid="systotal = 1" filter="&Repetition.Key.012;" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tổng hợp phát sinh theo khách hàng, vụ việc, tiểu khoản, tk đối ứng" e="Account Summary by Customer, Job, Sub-account, Reference Account"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glbk3', Controller: 'rptAccountSummaryByObjects', Name: '[ma]', Value: '[ma] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="" e=""></header>
    </field>
    <field name="ten" width="300" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>

    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma"/>
      <field name="ten"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idhgsqpxt6swvYCE6bw/CbFfF5bf3faKxK2fMqbKISeg/oQlapmtElsYrmhdmgEKuKojn6jglYmIe0hbdTgO2R5h7p2DUsqSjM0+lp1e8IO1B0vBbtMW5vj8TUx56/sb/5jQgWfqga0xH1oL+sYkW+YuWsCiyrYUlFmlFt7Q5BG9CMBWN6K0Ww0cO6WwNRuvn8vdy5daWTLCPFnzJSkKRbizX+JR6n1BKLbDLFyzVKeTOuI7CJd1MjykrFBbJadvGPnw9lPPIyD5MgpW7PfI5oHOwf0TH1ev/cCUx0rgCkm8Vk4gz3nmxdUQe81lc2nmOGUO6NWuSnH/GtkLigYS7FkqoehX9smI874ecNB4gOl6rQkPQfMD3ozzjlag33KA8tsMIKYe0fMPi/c6wgppwMUQEvM98CJD9feTqevxeuwbe6dSt2ViGgKurv7rfwlsgZChe7tlwR6YA/CDmkHCPEjrRsAxD3UPEXhTP1wVUrh+JtLHhfhloDwe8vVpd6j9QvEX9Ct5R9VabRlFVgd0PHN8G96EYlxpP8aOADoFhSBPoGuMt4qtYuxAxzdl1wwSoc4fcsDAaFibwmRlOQZoP3RH8EVcfH+qwdV3Cab/XBA4M0wap+aUugi39jtpC+vGNXM=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
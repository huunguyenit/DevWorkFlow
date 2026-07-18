<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'GLDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OS4a0KbZE+T1NjQVulzYCJYBiYBdX+I7QYUz5XcVfRfZsndNhaM1jctX1Dj32dqbtTRd7ZAoKKJkmsZv8rcxzANIcmC0gsBoVqyx8OSX3ojA4iTcfrvuF0SOKLQI13eK8mKt0XT+Hjvp4+h2aBG45Uqw==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết phân bổ" e="Periodic Transaction Detail"></title>
  <subTitle v="Kỳ %p năm %y..." e="Period %p Year %y..."></subTitle>
  <fields>
    <field name="ngay_ct" width="80" type="DateTime" dataFormatString="@datetimeFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="tk" width="100" dataFormatString="X" allowFilter="&GridQueryAllowFilter;">
      <header v="Tài khoản" e="Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk_du" width="100" dataFormatString="X" allowFilter="&GridQueryAllowFilter;">
      <header v="Tài khoản đối ứng" e="Reference Acct."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có" e="Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vv" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>

      <field name="dien_giai"/>
      <field name="tk"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP/hPlQ2h1pE4kiDDFigByLzKR4JlCrDoWmBl3YUTG0/IWFKwXgLXBVUZLXWsYYxQ585jbFAMLQBuCP6QSpEFp4Wfela1+vwj6nmGCPherTvifNKlDRmiPKyVmXyaMapx7W7lKu2Bb6gQxhzdTaEGarvzYIL2u1kZ0yy5hmIrokJ</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAYTyGvww7M2PxKk+DmZuSid4svpkMu3pDneSnK8VTsIIn7qlxDRwH+5zWgRXJQwUqErh5ni3vzsbpzLc6Lh7kAq0T7+7Zz9tFwmAimSD4/pUdD5MK5QcRMLewIf6UXOkyUBwNoWRAJlXClSteDlQjAIsEbi+EHW2WiQ1bXIMC56HtCmmYHZK0IODZAVfdOj7Arhntbkig4f3Tqep8IeiCGx6+ErX3QCbsSMwV5sYOK+RDFIPFx/r5elVbTiA2aT6HOLRFWfkWPrjgiiJpWsrwWqolXeAckJoHW4S3pYQkU+d7c6AZD9JipbJvrhq+MUl/BxE81imgx8YwVsc78Zcoz6i+1Lg1M6RhcvRwroVTVIIvljjM4ph8E52OhQ7HR2uqpsZFKssz/jc82Pn/B6huoyGNx8lfAwEHAvQPUnFEsV4=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmIMZDFraSPU8zYjz7rLwQv1XxNQWTzdRsdXFL3A48fJxcd5baDXCsekokE7BFCbF9hgKIZGcMPgFgzCblECOk/yCzYH9NgoaG+SkTQDO4yZLCfII49+xK21aCI5HJxXZJd46aCfSS+bSAZlKb+FWpY</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIP+wdTOv+XOJRvfHQrvTrylQKFv6djgZE6zpKC31Zx4rX1AePjjUFDhJRLldgYHzf6eO3TIGUFQCyGiJx7umo5GQ==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
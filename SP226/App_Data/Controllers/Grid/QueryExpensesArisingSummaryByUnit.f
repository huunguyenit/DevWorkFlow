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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OSCJpVRnGM+wmrzPo4P718IpNmuvoivowd6A1VAtWvOFaUGRgt24xTy3ZvWcaDMmkredy3yivaIPLGeF74fXudWGu+DsHEnKuXtI65ewykJQDyiXBK/nnu3SqsaYtj2E2IX68pCZnjHQMDCSACagEBCai9GUXOW5RbMzhkr616o10VAYkE5UQm1DsdTPdrzWvTIDemCJ21w18Kx2rok259n0OvaH+8U97zEejCjsmiQW4Y6pxlvEcJLr9wXlz40smTN20L4MKHLA3bLYwuNlKIX0VGCYVK5I+ueCg/gWaibeX/HPEuZrdLBePLVOjjeT0EhRH0ClT1mmj5LLuNt22auQ==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Xem chi tiết" e="View detail"></title>
  <subTitle v="%h: %c - %s, từ ngày %d1 đến ngày %d2..." e="%h: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã đvcs" e="Unit Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" aliasName="a" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã khách" e="Customer"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="tk" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tài khoản" e="Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk_du" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Tk đối ứng" e="Reference Account"></header>
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

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>

      <field name="tk"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="ma_vv"/>
      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1cozXKOGFQ0YlRFZh5W9YM4axBNML3ga8sX/OkO1SLECmocBYc/R4aA//Zli6t3eskk3xqqGyjig1DiUCkn5OREZof8D6OhhsDc7TOGuNu+kLpE9Bi0TRIqnM4AbR+ccE+DoiMSQBjVjqYkctw59oywPeKbHYny5fkBOAEv27iB1s9g71rbT/VWsE+6MewbfC72Df8CXvIzLKJcTzYHyfx149KV7G5Zjf4ywL2DWBmPABxwqrer8Nu9vMqMTpR4YLHH9GAov7mU89kpYJ8NFmYw3ht55etTlAnp1JPFsy7UahDLiL3xVWeOBdVJyn5daSmVsok87q9I0Y2NhVEtB97ibo/TneLiVFpVbrjUqvOvUIufRAb6s9kTez50KEt9LRVCn/xcAixrP1DOb8J7MJ3IPTnJfg9MwF9S/hJGGFpDfZzbutueGdaWDPKG0+XesHCEd3ko8BY8s/S9k9odY0Xa6lNMwRC3lZLyzGuoaJ/ga2CA+B/HfdCvupVRNQctRmPdB3zFcfOFRJPEgMtkqM4h6xJQyJUwxZshkWGYq+KRA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCOFYh8Ah7+mmvGVY9Q0bebvZum7IUzS7TnetcRo/NLY3HD3rlsYeV8795BAkWypme6LFc8MLaeBeBwyGrTLBipyPCXp71dEklnx6b6Szh/bbv/ENoZHYv3gEmOP5HjaG+jFjLI+jTNBQ6Vqfu+sfShUBTlUnLD9jbvrhGq9x43n/k7ujczSz64yP1JWM9xufKvDdjtaFo40ppVAigmPYXkZXN4k2+AkBUlJSgpkcWGrSypBc1GPfpqCNqANcWYpfry4O6WxJGPEQwqG4XZUjDTvkzORXECm2Ldrr9YtA7ZWCH4+oYtF5kJT34NTepQQseKSFhKj1HbIclUy01knmz+6ZN1dhUTbFxO0ZrsCFa6VME0u+4JzJmcmMvkRe6c7z5DaVNKE4aJ4g+TcGOHu149qz4k7bafgz0pV+vvmQBi+8gENC7OB2527hAJP/1OqFLPOahSGpTf+THGRW/aYnVpj5aJ/7KWSgk+XLP2zptw9reP4qcJzboNZ04+YN/KbC2rAA3VdrWE5mFSONZm+dvcGAH6hZ2zbe+e0vHVpGOSio0Y6tKnaspIH4ZJZ0bA0HI1bT/9Y9h2uDC1KCDNn74gEI+OkywlDvzx0630f2gepYdwfOgwunCclu0DSAt1yGTTbytQVqUb0+HcwWPo6bSTA1V9rTDFH9YzfNZ03rrTaOcPRELaI9eUhlCPvtMFHTskQ15zVf14mfEwNAWM8Mrpyoar/ioXDWrncJNe3AGfcAc2RwHmLtpOVNKB3F51aYIV9hhZeglV9hnjC+mWp9H7denteMTTZeEMOTl9utO0ZGPsb1jz+dUD3IYT9SOOjkxyPaPi/RXTu3Adok507zcaX</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmIMZDFraSPU8zYjz7rLwQv1XxNQWTzdRsdXFL3A48fJ5Zg0Ze4xpHmphXqjJMx7zWsZ36xg0aCt+GYBtPzaSocMECL1MYRswzeV1thgJtFsnYjCinUr7Ke0ju3aY1h/bKts2d7B2XG/GkgDoiXbrKU</Encrypted>]]>
      </text>
    </query>

  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLeZDSxdyAqlJvbeVRTAb8F/ZRBjDbe0Q9m5wkG7w1rcXNHjoDbykML9xi5Msq9BUyi94/GXw8E96K+AveAtA7+Nenk28lF1KisrRdu214P0Ow8nJz8DeDXCPTJr89Tn9jxO+ORbTdL8sR8CDz7W8YTzKWGp+7g+OQxUtgKTiB46liuo+i2VYyz+sSL/RF0FfKBpGvbF7bppZRums2LlsvU8dO81FfPzjxwl47052zootPOp5zTRC7bEevudj/s2RWIej3Ma1F0RQvatSQUi90iNFNKT512bIYYPXgBPHgnIQ==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
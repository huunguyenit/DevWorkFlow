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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OSCJpVRnGM+wmrzPo4P718IpNmuvoivowd6A1VAtWvOFYxVF0Wn3yuTYGT8vaw46b9ISsZKWBt/61ot2POPOkGKqvmTLUBpWYALA8y4cshCT7+IUhQzz4zqBaiPAcGu+LTUqGpmO5CdZJ51xS6Nd1LvzaEgdzIp1JAFxHB6xrEPfAr0PIE8lWesfZNLKimxBSCdnRDWeei09tL8EN1oWN5afn5BFRHxb3FK9TAlm7+cickZZ7N5eHj8NPASyA71f1E/ptxFYQF5QQRYhQpCHiUgYs8H0082nmU8fxaM+lDgUZlnjiv9IOSs1E7ep/wf0M7ZA7uJW4ITbxeHL2xvd/+GoV1Co5zXjr4wUlAue8XeSk=FastBusiness.Encryption.End">
  
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1cozXKOGFQ0YlRFZh5W9YM4axBNML3ga8sX/OkO1SLECmocBYc/R4aA//Zli6t3et0AlCDSU2pwR4nHntJLQihvgnNNmjeAhCnZXmPrmHH5qkOU7sxrpkKJUCfo/QTcnQ/aHf70f4crN+RuBq399xSVJ6rxckuEAr6NXcDa2PSA8f36VgQKPGeLmX+R+adp8XB6mjsxuwJo0RnFvr9NwxV6W/15BIO6M+0c6Ew5/pS79UEwRGHvQ04NpxracOhR4FQJfcVY9ke9DB/ZgYRPobFT0Nu87+SAQBvJehZ0crV+pCbO9ZEB692r/w3kkjNeYVhE52VYQqBJyQHuRlmBPYNdlQ0h1Scvb8yq9LULc3IDm4VXE6ZtKIeBAZLLYFRf0H834kdFWIQaXrIKrXf4GwnoQdMJuEikdf/5W0xS6KCygjCKHvU6sFsynme970TbfbuImRxZnAnw7JR4j6d4zSy2EfLbFlSQQatYeTf2kLAH/BShnvSgT0WzJsqk3jTvn+SZZZnnrTOHMCD8BpjFqKW4WQ4+rKFiHyp5AG7BqheoTVwV/1WTVn8j5UpvGkgBS+aVK6CEWlfKfeK4oKZrmiHN2YTiVobFwMQS6cZzh9Y7A==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCOFYh8Ah7+mmvGVY9Q0bebvZum7IUzS7TnetcRo/NLY3HD3rlsYeV8795BAkWypme6LFc8MLaeBeBwyGrTLBipyxNXo0DTQlxvCPFg26h6Vlk3rHu9Y5PbXJGpYjk/k64ArUBjYR7xX5xvbJE0lC2svMDU7a9WlFR8s3AdnmZS5i2+zt5OHrfGAO7IiFYja92bO/6xAk3zaHaOlbHkXs4cXXaASFcv3c8QMnqiXGLLxZaym6hpFl4330bey7vCI5lPTd3dz1CfLrHcEdBhGhUglrxcPEqTubUbDDQnbqWnwAtvcsV8nbAvxxHpiQLEu0Do0cuipA5sAWoC/VAqH22LiQSOysJscCnZe+ZvsCFGaxHOBCLgHdhYXi/FRBkY6AuzazWfDTaoUuP3tskDUTX7XxIWR+e2og5LByklCWTCKJ2oZP5Is0DtaCwTf8Zupvnz9uYJyp6w9AuvXKfdEz6a9X6vJsN2AnQSW6TPFFQAf8d1KP2bsG9cT9dQrW+pu4oEOeNV5Gw4vDbKF/EwvfjazhWjmXnXxoGngp2KptAdfpo4f0YiwOMkOrwhk7DLtTcOmP6TuUtTLPliiEEEVa0gVyuSwU5aVgHco1IVYAaNmR3+P/7YT91btPuJycOuqQzXleN6fTA0VFtb0Zfb/K7Bjl6cfTpkpJhuW7SuWORyCsKuVM5DcYGs/5485WTiq8sZwGgFRAyZscbnOe6+vPFu/0wJBnSekzpbZPy9Vj8lg5cmI3svoyl/Efq2cpFXkWI9yOSWSBnTGXB5HOFLT5RiHtxlmDEX4vx6vFILkbkmASA8KgDRPZ58PQT9SecA+w4M9lG7MAOllHWjoOZITVW559FI+e7a6o/QWfuJ1VUVWxJqAEUP82EU3BWIgmsDZqJAtlMeaMCAUv51iN2xmKXmO381a5sg0lMXiPPECvwpQ8s5ZVjhChfUlhVcALSE3Gp7DcOnggYnTqyrrVksv5WCPMnrvWA3dF72ZyKvYK+AdQyA+OXT1bhdGtrW8ig9dxsOA0N/tvnuoeERpIyLPD7k0</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmIMZDFraSPU8zYjz7rLwQv1XxNQWTzdRsdXFL3A48fJ5Zg0Ze4xpHmphXqjJMx7zWsZ36xg0aCt+GYBtPzaSocMECL1MYRswzeV1thgJtFsnYjCinUr7Ke0ju3aY1h/bKts2d7B2XG/GkgDoiXbrKU</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJJqtpNXdhfJCLLnea4B+AMR1plGG9DXkIukBks/9YROD/oiltiiad7KSY9/Ea/s3xLampDAvc9aQoLNHOF9c+W6qOFCgNfpUe7o/jvm1ju9KfgKnzsZWeGX83SdSQZhu88t2Oepjkmny/FrrqDC+qrFWDAVM4JOKwCywWpvgTVYf8iycB1RVd7BVjisnpodeZ58KwaFssx4aLkfQpyjwf3A0ykMJm2RscpE6+mo6KYvgGH7q0ko2QGJNO4CF4rcHqz2iYTGZlTBCsjdFPHkSW58eSFcFIPYoPGk6Gvrj7J61g==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
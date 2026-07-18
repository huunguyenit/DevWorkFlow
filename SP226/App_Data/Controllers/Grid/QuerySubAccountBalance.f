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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OSNC3b0ANXil5kCUGuk9a01qD+zDZZlDPuZCynhe8fkG0xWDH0pjGIkqBhNEOq7TcBKAZvOdqTvAMTD+hKxKQLUkEjB1DmmDw8hx7g4yqfO9ojRT3IeLsTfHM8u+IrTkJBufR2oB/Ci2sTde2Fh+0JDuYNT+B0YFtJbcrjmMJlY4UocH8q2V6sNT403kTOd+3bl5JMG272WqFUAwqm4nXByw==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo tài khoản" e="Detail by Account"></title>
  <subTitle v="Tài khoản: %c, từ ngày %d1 đến ngày %d2..." e="Account: %c, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName ="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" aliasName ="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk_du" width="100" aliasName ="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tk đối ứng" e="Ref. Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ nt" e="FC Dr. Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có nt" e="FC Cr. Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ" e="Dr. Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có" e="Cr. Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vv" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã vv" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="line_nbr"/>
      <field name="nh_dk"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN3ZTJqqFGHWqx4ABVXisoVLP6vLjzIMdeupAOB4QmiinxgUNrzawMjNdPVpXimeVgxfh51RRbsfUYmRLAHPSWjAKiX46QJCoPAlLBjGoyCzsG80z45DUJi937Nk1rI/46WNZipCEiGjmenEcifGOCy3IfMJTEMRyKwx9psTdaonxQ8XEhv29vb/LDaMT9RoIERiCeZ96ibI7RecPf6HC6yyb/CT32gVNG86cXnuwkwKmHX76In4TeyxQBIOx16RPSs+72S5B+7Y/TUZrH6LFDQd9IwLqnRC0NPTgb5w7h579N/AYvE9oZTAWzjA4sl4f0Y=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh4tVU6A25P5TGzvnJArdmFQJMGrlgya+mUBaNRTF6N4KGjztkuOGq9rq+PWLJZoTLOUKWTCBTPh3e6Ukj51wcFXDBLq09+QjOKxPX3Im1OggctQCW9M8AlosOzPto7Q4br</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfTTPFKFqk3rPievkf3sjvaKv2Xnc7LPo/yGdKyovNqNjVgwLZYORjAFD5atvkYb4ebhoEtik0xS5RC3bwnPJ6uwvanIbLOURYZ1FgI3F4CWuLCg/nqB1rv5Jn/TXlh7SQ</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqi2XY6ce6ay3jAIxVKAbBoGazq15q/n2LXAyHNFpeEWfmDRj/m8Fxla6/9HywWOqWfcCboobbbEX1syjKn20cG4+d4qxiS4Zb3Ondx3X8tQ5h7PKlOQR65vPmSl0/kZ6jixHxmlEcbRqWOZJIPNJCBw==</Encrypted>]]>
    </text>
  </script>
  &XMLStandardQueryToolbar;
</grid>
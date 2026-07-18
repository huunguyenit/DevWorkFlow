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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OS8GZ1lUWj77q8+i3zsE/BgSml8gQlWb3onr82DQmNB9Z/QYg+fOpPU+tU2WXi5h4ej2we9kAPkkck3SXDLyMOjBc1UeUp11G5TisiPDHNkjaI0y2FDUdLvYek6MJf9C4C95hpTmSitkE8LXpnrvzrWnlDouAsyGpy0cO3tOC+fihI0YkaK5563vOsmJkUJxnZFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết tài khoản" e="Account Detail"></title>
  <subTitle v="Tài khoản: %c, từ ngày %d1 đến ngày %d2..." e="Account: %c, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã đvcs" e="Unit Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk_du" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tk đối ứng" e="Ref. Account"></header>
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
      <header v="Mã vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
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
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="ma_vv"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfdGjRUZQUmKuye7T5d5tL7ouDkIhrJpRO4XXWZuPb3L+6wAUyJBq7OtIeqRBDjs593WA9rWsqoWF4L+Sm1zaniYDGO7N969FZbd/TU28TOMq4QpF784G7zJFP9FBJBA7Q1aum83fKKqkW62xNms7cNgsIJ4mU+w6Qc+DADhvLAH23sPKKyMFmNpkjQGuiDuEgnqCPwgXDOjIKWx1W/IAxMZlXUDATSqzieleGLQ+UDTIQ==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh4d8c03v0b8YPMbOZ9xJRnd0bMHKEQlcCEsZpZj+7owU7oJxwzrcnKOD6GvPl7E13/qRfSZFTXLqavylaLAKL0wLsJJlPk2/S9uLfjoprrHPd3UIcOMBRDWc1OftJJF845</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfHD5PrgDSpd+xj3xHgk4xoyZUqMpuAR5a9ff4qkFlhiPiLI8rhEZ6XMNvDs1TPbRUIgJsB2YIJ6h/Dyh64otdJy7H2t29KHhWVDoNa7fpLuoGIo62SwxcOJ4FkDQYMdQE</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQM9HDz/sV55eKsIcXNLATLtepTYGGsKVEZzw7lN9yfL88sMOlADNy81RhPu0nbseP03PMdXgyuJwwTPia4zeDtbQiI8C3Op3LSVs8rghzXrnekTiDo+aBQ0NUFLrqPEuuL939akeK41i/jKSaDz5tBD8o6UOepwgy3JiPrHz3dSehKq8iWO/pRt20ZROOmHeaOzhPbXB8NQCb9lb28GRsAnTpf1AzI8CNhTs0nUkJJ1SliHtAHfup+R25cUSWk3X7lwbpQS+1GKTyWAcQq45xu6x007odMnMzilVC9ImhJ5ZaTe62C50BFxRqnmaTK39YPuL/xdEJoG3YVWMbALb3/0pqapvFgZ3j7RIEflWNzkHgSQ6glN2hDkcHaqXDwE1cdXxf2aIcrJoJRlvq9HqJ9K+OOuPGxL1JHziYdqxvWihSuTAouqyD9aG/XzyBWEQo9Z9XWJDePSwfN/HE47oA98wQA6UU97QC/EihoXFM1hYjROkbyRDfRUbdPJ6XCWK9b2VrXXzydJdOW0L00b8sE7TM1EYnsGqV3CyqZqle3Ocq+UsQplCayGAzJmaaudE4VWVwUgEh24SI3ha9MHDcNT0ri9//vVlyF9wmjWCBmZ39qRAcv8MvOWMFeLrZRi5ejEMqiwYAMWucYY8hdNvSWPuGuYbX7SqtMfFAXeaEjv7DfCW//6gaMhkYgBaXozBtWRzZstCM3MrIFbyo2EEJ2hA==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
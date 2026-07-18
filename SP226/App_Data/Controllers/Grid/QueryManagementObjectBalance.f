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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OSccGHBk/7jYWTw1hGmprZvqCpi/YWNWdNCSbpzND+LymNpLPDeYMHrUkqUpkythxdv6ms+TqCwbINVqURveHJCzL8vvmtnn+5D9QmGuEmcYDXRTbRBOopmlE+WODvYxkFHe3U3NHNjH2m5fD8nZ0tC+JBhEGSmuffDX3jXAo4s9RnHn0FNIGjGQQmMDvX4B0dMObX7rj5tbpewDNcIVgqU6IRK1fcAuY0qqLEuY9fsZc=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết phát sinh theo các đối tượng quản trị" e="Detail of Management Object"></title>
  <subTitle v="Đối tượng quản trị: %c - %s, từ ngày %d1 đến ngày %d2..." e="Management Object: %c - %s, Date from %d1 to %d2..."></subTitle>
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
    <field name="tk" width="100" aliasName ="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tài khoản" e="Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk_du" width="100" allowFilter="&GridQueryAllowFilter;">
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
      <field name="tk"/>
      <field name="tk_du"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="stt_rec"/>
      <field name="line_nbr"/>
      <field name="nh_dk"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN3ZTJqqFGHWqx4ABVXisoVLADSeb4iThgfE+ZfQgo+U0+GhF2FKiDcwaIe1QYFyI9OIpjrZdqyl845x4tvIzG3FXtcXszQC8A0zSLhG4mWdbslCi0eRDUxXjSfkrJ3pA3++7VYZPUAdpAG97wqodI/VrPoajwGR6arKMSH8zPuhf6RleVI6n28pdBu8dziK/Flzxlf9SuYnvX6wyrRQ+uGQtUhGxa/3T8sGCE2BfG9rqf9zpdRHOvZM8fSf3ZTOLdWjv0C4j256sLa95oW1q9FprtetbJkUZmZXjembCRSme+YjhWy/nPiRsiN512jDQ8S7+bevV5A4gYofvnKMN1YUVFQZgI7MvyT+7eCzpkeXB9EAkuZWT1WZW1b6qpyQ6V2gFtbxIxrUYN3XA8djho58dCd7kgGjIWyjp+IjHZd28g==</Encrypted>]]>
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

        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAaGiLdP5WnTRHDzq2SDHoQPzaoMTuUyvZoc50YUcXdrPEFdMsg8Gs1q+rNvRHfe6WStyNm6YdiOYxc7TmB4f1ZcH/gGSxph7n9UhM/LElJyRic7TiKQfzAPjK+9KfpihXX8GtgSjSlPXxWcqtyP+L+iMqBIozwi8dzSKHlG0SfgzvgJFIpFswtcO549BTYiRm+qCh6xAtyAVZAvfDmrJvGfM0m320wtVtwUnettxWeDEm54wwvmfU6eAmL4IOyeqwqTxyyxYyp9l0KJI1TtinaRR3vrZQafKZDnK0GNZPvU2sQ14AKReJbQ601PzJwO1Gt52nY5fBiu79HOmdVBwRMA==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfTTPFKFqk3rPievkf3sjvaKv2Xnc7LPo/yGdKyovNqNg2aMSAccJG6SM2HeujS1mUFLDmMoJN7YIISpIQgvvPZoro13QTjbrYGgFx3mWEvfSGpxZP5tmdZI1Ouu4T1evG</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>

      &JavascriptReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XUCQyTCIjjIW+Mu4jchQB81kc27ahQiyHRptuwV5HasmgSJSQicWZ5DKAimJh7MvEAAEftjmvkZhiNBSYNMCb3ytSoQpnC1cm530KRIW9gawXhUXl6tJD9VhXW/YLaQ52uv+6c4et+9seWg6qAdZzwsQiSQ4P0UFtIagi1dS1/F4FQurcgpJeCf6uP7VDlxdpO08OhMJpApg/rtfbpxi6dcoKmLMuhCv9ppWCZLn/BCeOOp/IxIGphOyWI8k7NUC70PaCIYrYG7AMs6XWOHXO/W8URdVKETgK+k7veCh6ROb7piBc42HdnG04FnRB7MIC8IAsBeQ5SANltD7J/gsCs=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
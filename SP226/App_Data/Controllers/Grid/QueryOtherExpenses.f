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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OS3KW/Lk3+fXWY3PtQ7SDLWVg5151vPQhLJ9XKmNXXEL/NNXN6XaYD/PiNdUCca4v4zhRq+L+M3+j+Q7FZ4XiVWW1PbR78Vu1a7QlX8pvqUqKfJkub9tYqgQ7U6QNqsSMNs6PNS4BGxG0j5jCQypt/ZpSxbZCOJIYebbyJGyD/Zd5YsSXxX+/Ii1yBmM/qH9YtfWuwaVwySPGOPIQrbMJBFJ3o/zh5Tii1ns4eAEEu9cbQLI/JF60BMuVWDu9wjil/4B0OhSnqcDPkxuHi3WtAF24SBF4eaEvddg6jQ4Nmuu8=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết chi phí khác" e="Other Expenses by Detail"></title>
  <subTitle v="Chỉ tiêu: %s, %ctừ ngày %d1 đến ngày %d2..." e="Norm: %s, %cDate from %d1 to %d2..."></subTitle>
  <fields>
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
    <field name="tk" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tài khoản" e="Account"></header>
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
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
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
    <field name="stt_rec" width="0" hidden="true">
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
      <field name="ps_no"/>

      <field name="ma_vv"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1APqQO79deOcwejbPhGNP3oDyi+fL85J38HqGxTxIPRMsQ1SefCw3+lW8kjWn8PzczwjRKlT80ZNVPzmwR/L4sd0J99+wAWY0abKk3ZhAG7I56fmgV/XyFHBCDGn9LXUd6oXIyjZAmatRSVfF5dfxalKuXmZcVZsdiujcIvdNxaLyLd2r9nkgiOHp3HFMSXju0hEG+PUoSofI6NFMFkbTcbaTycIvgPllNJXej1yXIC5DNScjvS8ra/YkLE5UeOfQQsCi2V+6qpHrrSk8RLfKsXK3f++9TOFoSBr+TWCCSN1VMfFcEf7FI6B6KbyMCBQG2L2hALKQ0Z/xbGUVYveIacw0RCR+REXCOWoXxioUdYezxgFIo+2+xeE5flhaLImHY5PteeoORNyU9M9pD69dpKNlRrAeFSpvL57Kb12JcfvcNWrOBQwCYH5lb2tI9MyFhNobdyhhLX41AtbaMuQeY=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwTJHFq0I9n3jDHOgU+rOzD7a/TKK3pg8QC1pWUrzmCZP0L1Du8Pj2unYboDIQD30DN+wB5zE9fxO1CslUStc5NyhSIEkDPyZh4gA5MyI+rctz+SBzeP8v25oS2Ngqjt3HMDYauTOtuAQsSLiPUrRSt0BDA37y8lSEVohoVTCKHDRIR9W3SsH1CqcbXZ0IsqSxS74OIezZZ1UQuNxQBlqb0bpSYYM6H3Bzd+w0gBsWZezWVmmHkNoD3b9KYCY5s6s8WihbYe1YH6J8XsEiYzhaE/d+coTO3aUL97mjMLWpxOZhCcSzfwk38qJVUWP8rzlT0QQBPKVFKs2CS+lbzdJ9ywuNQNpjRTvJOk7/I5y7r2RLiLxc6xGNjJIp0zybMiVLNUwHdLylprFVpUJ1V8vEXbBvIYuLXsqExyz0ir37j/UJcMd6+IGiU1XdHmJwaMCvI+HzVemMtVY/aqUOcMKSV3LG2NuM0Z5YPji1zCUOrcnVq/mfSgCDqA2CP5hobcjGW9CBNBfq+XAMsQxsp9mCmXyTSjC16leCW0O30KujKU/Z2C2MN+xZOC2o94AFK8T/N5eMzsGaQCF02gbWrvsBr235SQjzl2z5eFbZStFJKf0nyb7Ya3UNslVaZSomzuER+JaH+u5yTOdSUiYg6RIL2djubsCeXsBnDrfmTd5DRc54JdWDEM/5VD32CjKCHh1Lb2jCyzev4DyrHplG3shpqfc6U+aTlgMwMJV3da6S0JRz19lisidBJ2nst5ibKWnkbUDpJeTzRg3ONZ7SLA1/hhva7cmMT0SLvSPSW1HZdLJ8vxAM2WEq7S6JlsUW9G5w==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFoAqQLQlBWpTPrZeMIfsD3VKZaDCUWidDEGAgPgrRlyMwry/MZWddNOZY9cqO5JXP2Fz9YNgpolHxJhJa6iPTbzrtwRLCttK0wW9YNx/ivEYAsqwvyLN2mRnAZdSSRrZBGy4PQaWYaDctb2fIRbNuNP6S+aBUiFXGR07u4bi7x54ZSCITZ0Onxkk2IYNXe2agSpDuQvbVaDDQJX4xZXq4pNV0vhwznsPsDkj5L/uMx1Bx5qEHCmDDFn4vNO90X3knBnw+GAzO0BJjP3E5GR2bRpkk4sMtmzlaNGqodI/fFMHGaqUcGEb1Yoa1lPlWXOTvTm96dSafEftHpwQXOzc2oMo5CQ9kFB8aiQfkZxFdbgN31Ee9w8rTAFmuSTXKrSxoGzNe/TJKrlmcbfH1oGNyThmvO6K49GyHFdNSeG3v0Wp972t8rEiWl3GB0gRcrsKBzxzh+YLRm1SAaI8VMVY1W6Tk+qFZ4VU3TXlSaZsLKgm9gwFS2V9fBs1cdo2qQ9Zw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCvaleMTwKUNNOqFA4wkjE/vTTc98G5E1/6NlWlzmdzeprH5j16Jdmft/xE5NREOt2Lp9GALngSlTBsiHS2uvb3rM1JXY4Ek5YFkBGFbH6yhfjaVBb8UcfUgHTLMWyg5AASBhMV2SzwCCsrWa4kKqlOLtQSDGgeuVS3CrCax8KfVoNWqy0ocXLwnPXwpU0hC2uIwJmMpJR5ReHUsTVCjG/CpN9QFW1crdjyrpJ0I9IbX4zzLfB4+Wln3/UrhCHpR89ayYxxo/Nac1bieRuplWKLzg6GxxHNGxLZ9VYql4xFQjzBSVK6Rv8jZqwjdS4OQ8TK1zKSpg8ttK0meee/ZGIW4xhbmgz19d94LCKNlYTeGPJlsV6n5GexFkZ/e0TZLlEEqd84dFOKeKV2xhyujfn7f</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
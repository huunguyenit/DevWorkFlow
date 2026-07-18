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
  <title v="Chi tiết chi phí ban quản lý dự án" e="PMU Expenses by Detail"></title>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1APqQO79deOcwejbPhGNP3oDyi+fL85J38HqGxTxIPRMsQ1SefCw3+lW8kjWn8PzczwjRKlT80ZNVPzmwR/L4sd0J99+wAWY0abKk3ZhAG7I56fmgV/XyFHBCDGn9LXUd6oXIyjZAmatRSVfF5dfxalKuXmZcVZsdiujcIvdNxaLyLd2r9nkgiOHp3HFMSXjhOhVfq+v5yvKw0+cYeq+wOAcJl9QIOesIM4lFqK0ZFEYFV3wt6gc6Cs8NHgpNxoNS4nfCc6czJy7xiTQqDPCbkm9XGCOUIXG6K5ZrB3bL+TCJ0mkQECfLniZ/VnRyTWGp71d0RHbM0FFj5xgpRwTIysoNwCGaICES/Huo0WiNUFPnZINA5BfClNsWYgD5ZwIfg6KaclD6FDNFpUadVX5w1K7iWxxBA7Ic7iJF/rhvcql2N//gPGxYYKka5CohqMW/oqO2QNPAcgiQeCmx6k37s=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwTJHFq0I9n3jDHOgU+rOzD7a/TKK3pg8QC1pWUrzmCZP0L1Du8Pj2unYboDIQD30DN+wB5zE9fxO1CslUStc5MhplzOO46OD8PcyUxAw4CTaBCAMG4uXX7uv0QNXSOimtPsktAm9ZQUTWM1muEicQf9bDiST0bTcxPktK/wsqAsXvXw7S82KMTMH0rg4yWYUhIkgIzV/UalMK+xs0hx4Ny7wiPKmUmgrWHdnIaBnpcc/yWrmRqb2F0zT8Zvtf502skU7ESVCAejPX3dEekS3RFLxJncV84D1wl9sip3rmP9hxuX8ADytGjxVSDKa7CBU1vZQCMrMMX6JTztZzI6iNfzoxS45+zRnnPRO8wax2QV1pyDU8/hi1Yp+ZwI0B1hlPNIGF6AH4Z2KaMBdeK13ZmOEzCZ8bqbTod7xJ8wPBzWtYhbJWGydG5xAsbctBUq4q9mM74jgXE30CLszk0ufMI0a0ofV1F29tPoZc692STmrX6BydLUKXuCSx2XUgW/NPccvcOhQdUEdKNHcbDsARmyTyEDD70HvTCodF9R3WIgkGP1cCrcFIlE3BePBJmVTRNvOqUvPLb/tRVK/BXyR3XRrlnR9C2LkmkBjQrakDu7sLZ+Aau6GZZM8+HsQ0vCWjN7bFOBo7XmNiMeDjYN5V0bamAs1YIQUvLNHeHjwcd2VLD8+koJgs1l6G2N49mM56naZl3yuXAqt1wBd6pdIs6+wQZihzFRyPdwcuAhLD3j/bHWEevoFch1sh4CO4R6Z4qG3by9yTbzwUwQ4ul3n3WVCSNf6YyLg5a6m7nWWbC/dTxk1g1YtpEvNC88POKsgA==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XTMNMevCkb1MuTuOu9HqxazpopPt0V0At8ilxuQX24Ew5bO7S3iLIIOcOqdz8yTUc0qosnIHOFKbuVxtXmV7+eZKY3D80Ur8qBoeGPvZI9Xn/Cki3WZJd+is2YZCSkOyYpTLLG0qXFRmviwfKMZGkBtecKRJXKxHRGie0XlxZ9oCc3wvIss3enRJtuJ/SMWqu34cWNaNG+SkS85e6seq4VauUG2rmTNGQDs2MEprauqppc12rTvW7M2B0OmDykmadAER6I92r/n7eEifSNObgBPRshGGRQ1oswYScH57EOgJ6C/A0BNN8NcX25Fhr4sbsExFnygBi8+eBFC5sBT057to9WsZbSOVgKbTPqxn69/adRLVErO6SYZH/wA+olAppC4YsuAP2DMrxQyG1TEBiDsCmrxFbckWK+RVAvaUa3OYxy3Du6nYxkfhk53S6rUh4as1DpcXBdK6f6Zt7ZKkDyhK3du2bO1c9P2Qo/PubKFtGoS3ZwFQuuPWYHSWgeaqA==</Encrypted>]]>
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
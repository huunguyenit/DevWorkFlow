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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OS3KW/Lk3+fXWY3PtQ7SDLWQ9OsWJ7BC31igWB15RaDV5Tgju8C32+JRZUtdTaF10Y5s0GGc9DnxoGFhP1rbVYyZIC0O7LdWubLAHKkkLGxeyqQ/I5cLLCU1r08+5xgwBrPY5GqrYouafvOVT1BKWdXwd+XXBymV4PshH7PYrsbgXSWM9hWG9/mxF1C7TBEe7WShAr/rgaiLVOHPNlmy2II+LXUeIFFl2+D85pag9j4H58BDIodcewpxhVzcsrrvelAGPaBd/fCPJ/iccIPf551A==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết nguồn vốn đầu tư" e="Detail Of Investment Source"></title>
  <subTitle v="%vừ ngày %d1 đến ngày %d2..." e="%vDate from %d1 to %d2..."></subTitle>
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
      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfegYEXNXulogTHPqizPO6MjEEi0BENpVwHoKG1zcBlALriFkt8w+YP9hv0Rp6be5g8zp2muFvvZFRwIvL3Goj8ykaXPGFP8EvcwPDkqSJ0d2F3WXG+DdZX4ylcp3uRzKQocBe9DIGWRAzJ28t0+AgtnkA1i6mSQdNJ8OXebjGSew7KeHLHNpGvfO1sxyrJnrXxhu6TV5NDDxbOiwMeJfSG4E6iPccpBTkiLia13P4DFfj+NXXOm4a9IFWdVfp0Hmgs=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwTJHFq0I9n3jDHOgU+rOzD7a/TKK3pg8QC1pWUrzmCZP0L1Du8Pj2unYboDIQD30DN+wB5zE9fxO1CslUStc5NM+XlqILJPSuN4u7J/XhjyXmeC6FmjLHLjW5B84ETMgmevvuY8Eotv2hTOSki7TBCc+3t2kg3+ohZBoY+YZQMADmaHlfZcuPQy5x8aw7GinyRdeIx62x0IrCWWwDtuanMtOqSzfwVHgEWM/a4Es0ZWHCw7zcAU6LwfrGT8AD090EdOSF5IZrDzyD57KjRdcPgfZvVCR8W5zjYJlWlNNEQJMLE9WEZspvZnp7ONKIqD16sj+aAEQvpuBwykHgTsV8+tAZgiTd1x//ptaEXgIknoNvDOOXnltCL1XH6pNojYfoBhJxL5WOwQsDv9J5cCj6b+k+b/sfFnquzOvJEKCPCMoqd6Pi4+9v9H8KbY8W3Tfwy4XknSE5Qq2zHyB0V8Vct5yy5TFHgA4IYlDFLzLCejPSr0ICVMWHYREYPFQ2oN3gJ5sukyqdD6vlUQzOXdYLRZFL0YcPj+UpSRNPlIWRvVdoyv3SHaQOlFhcErklP6Vxr7mmqPsKYbmhOazurqJfvrajzAKE7Cz4brKzLnwe0Zab2bxoplDA4KHUfB8iJicD3xymh0g6H3y7GKmnLeAeNhGN+qtegULtaqtlxN55+X8e++4AKs7zxtfK7DqgfV3eVEuGhlBFsotxj4fhwU6XkxOcepYY1DOc504bhrKlYviy5/kGWorJBPlR4nw4UL6y3lUGjgyjGOp95ZrjsTK+b27qYtQi0wzbbRTdIksB+HwxHCVWSF8Jri3vVQJZO3xapRVFqnRt/M9TUD8fMyZ1sE3opOSEHwrqhqfgk/hznK+FqgxYiYPewZuLT97c4ktlK7ScRlp9LdqGgfhpw7Ie9oe1w/1ial5sfGv5ufoaP+6ogc7tEDcj4HZCyYBAisbQZDArgO5QgDDndiC5t/eBPRf3xycwPZxsIE96QeAjdadVYhQjFMFnFzM3wNEnjUkQ==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XTMNMevCkb1MuTuOu9HqxYz48fSE3rKtE5UpECsrzlZBExTfHxKihJZHIcOwhQNBCevyr2iWWnaHflWxwgzW0AFq/ARhIAS1ueKVlEm8eKallzWjq9hE93jqDp/M+35jZ+4PmzSqsBX90Upc8PhpUeM7ha8zhns2KjGSyxWmI76CXSE6Lk318+tdmHXWlvWZwwdTVHs9K4tOOCdTSz41blY9TVY2pb8Gc49sGSDs4nRXch+3z2tVFQctf9MHkIy7eS4OQRoQB8Ub1u6RSw7f62ziztuxi7QIzC7sKeYQ+TbTSw3QUYR/IYtKbvRyxpec05cEf3ZI6ZVJtnh1gfAEIYp40YW5AF/lFm4Snb8Prr8kwP2nGBmE1dtssspEh9fU7Nni2Gpe8/fVkiKTH+vXkpUQLbVrLJ3AeNAXDxH+N/aJBGZ70NdFpgHPSnFv2Y68RWG6/zwjsIpTFkHFOvVUjlKZ/Zew+gGmZY5hu1vBaZqf0JAIHPF1QiiD7KvJFaka0UsElZToHlLVHYEBEuP4ouC5Z6EFWiwCl+dRYLDRRLwdS5g4uZQBGL486vMhtvf5w==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCvaleMTwKUNNOqFA4wkjE/vTTc98G5E1/6NlWlzmdzeprH5j16Jdmft/xE5NREOt2JWIoB2Rng6zAdwsxC3k75zNWIzaB0Yslu2zpWnPnfYo0Y8ZrltIpNn7DZP3x7YNTXcvCeF0b5hkVEH9QprT3pYGe9W6aztyQgU/mEmDesppvmk0hEXxUFTc0tgOv3t9aHRu292VYPZZGQh+EP881wdOZ1nl6RctNnHMGI4fZLghEhrEVUbNl8bBdyfyZJ/qWQPe/hdtAnswYSnYWvVhY5++Ox8dm2D8rv7RB8OxFTQj9O16IVaml6FaS8JQ8M5ufdWkPA1xb2W2j0+d0rsc5YTzrduvn+MqX82kuXaSa5BoAmCJGMbKyA6BKL/ee8jVfI=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
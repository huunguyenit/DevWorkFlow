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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OSJ4KeOekPvUByCAFVlBw0ngmNQFSgqHABHl58ksddf1o0ugj+xtJFcFTcyfZaN3YE3jzdgpN9//ox/mHWLc510t8Kwa2x9tkwaAlKdXdiUuNyRpK8X+nqE9Rb3IlYjdGW+tbbzpMVgISNo19LWI4dWX98IPd5eB5/ik5QxEuBSKl2iJcaTIrVAWQnZswlK7QAVoN75xTz6t+f8meFCLopNFEW9fGIdtekc77lLFJy8XNiK4m0Qa1HppXEIV5sNQuIFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết vụ việc" e="Job Detail"></title>
  <subTitle v="Vụ việc: %c - %s, từ ngày %d1 đến ngày %d2..." e="Job: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
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
      <header v="Ps nợ nt" e="FC Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Ps có nt" e="FC Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Ps nợ" e="Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Ps có" e="Credit Amount"></header>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfegYEXNXulogTHPqizPO6MjEEi0BENpVwHoKG1zcBlALriFkt8w+YP9hv0Rp6be5g/vi8/tDTs+YaD+kTCEBmNEqFRLjhP/wDn0WngeSLzTb3Hkd5+nyItoX4YsmLCGpyp9Ig8omvjQzhyvETT2eo9lBT1ds4Pw1Ve+qcNLuToscQ2T4rVWqkHTkQuWFVt9vSr2nw3oCgOKEsXJkxkBVtou+48rn6vRU4J6kvaPgqJqfv9kDTELhxvblxOzzwyl2o0=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAyBNdxAcut9eulpgiAR/4Kcn8us1YsZOdxhX+eH5TtWKeMDy4ayGMl8qkymqJfvTi5SOoq+e1eS011Lehc8D5cnME7mS8Z7CJoDwGz87oeQj/Zv5FqLXpyPcTYebtpZl3SzF2p7qA4dA+aRLvN2SVJEHZ0PSaqojb7KaHA8VGrnzy9xfpakdIIqVJAGSD7MDRzceANQ8GQf7nJKrz0Orl/0IVjB0g1lnVFwqAvripeEFw/VDSJuup9b5G78wnfWS3djsdFjdLbWMS9RajKRl7W8YrNB53EEjJf9Sh1Q65maYDKTuD42dIJEhW1+N2s8/O</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmIMZDFraSPU8zYjz7rLwQv1XxNQWTzdRsdXFL3A48fJ9EuHhifCFmd5coQF7KbVCj0CPe4Wke9Q3M3oxsO3pQc6SvnFf18sjOvBynne3BoNCeVo59I9LeHlTA4MwoAAJRB4/n85N0ghAhSjKcPqxlm</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icMbncKs/iWy93M1Og/JxVx4IRKtHyRJ6N5PCwXWujBRzbKTbYbXTrRMiy3Ee+BY9nCe8VVvzAYIB7GveDnY52Nx8WArOlsqIio2RcbBZVBYkLS0OX0raH1JwI3Usxst+pSZdfKFTFt/LwvZZmBU4ijRN7nU8SVhCDjZ2CQtmgJR6A==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
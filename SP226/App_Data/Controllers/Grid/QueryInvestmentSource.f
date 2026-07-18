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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OSQKzJ37ahCwzh8oQrCbgVqdNM+JTe0GVjwYV0I2FKClnt0tqjyiy9X3VWaIf/WqNeehao/5qudnEuUXvsyGCTzr8YTXpKubSpXA5X7sk2l0MCqxtBpxxTXpKCeeZCFnEI5hLl37VP3cizvZZta9DYIAizs9W8uDt64Lva9b2Wt1VDG5CIzeSMI/x1zv1y2DrxPFB1evBQsVDEmM6VfLExBUQ9yTkAveIoU0i4z7LGQ3+AWPdK3sbnfbF/N810Dt8gZwRU7/GFnTjMRg4F9pwHsBwrgE63UZ0DiQdyShXxBywJ2amI6/pusoe5J6+BabyzFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết nguồn vốn đầu tư" e="Investment Source Detail"></title>
  <subTitle v="Chỉ tiêu: %s, %vtừ ngày %d1 đến ngày %d2..." e="Norm: %s, %vDate from %d1 to %d2..."></subTitle>
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

    <field name="ma_vv" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1APqQO79deOcwejbPhGNP3oDyi+fL85J38HqGxTxIPRMsQ1SefCw3+lW8kjWn8PzczwjRKlT80ZNVPzmwR/L4v32pD1L02c6M9yMNod2P5HJVPnFGiRGz1bxgB34gkkug8OgkoMmS3VAYORnFQ0pXl+qkAvwpEEcj4qHEy+/bZyI35yahRVNbPE3Kje5XwYLgnB6zVoWMnLXgqaRM8FdSRGwLz7F1aYJQPRJI+aFXZ69aOCAq+1wYhmVIqsWYioIdrhjFwKG/7tlUYUJETLPs0yCe+DDML8lu4Xe/RRq+5uqLH7NfZRmtWXA9KqPrFvM2/6h47TRSnvr+fQUrHnc0zVhTA5OSBSXIkcNM207JZGBAdF2qlhXq9briN5C7hdVeTMZncKsSGDGkCtY4iiJw12qt4CGpwRR+xLh7dut5Bwge0Vc89aAWrE1jq7nF/GuQ==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwTJHFq0I9n3jDHOgU+rOzD7a/TKK3pg8QC1pWUrzmCZP0L1Du8Pj2unYboDIQD30DN+wB5zE9fxO1CslUStc5NM+XlqILJPSuN4u7J/XhjyXmeC6FmjLHLjW5B84ETMgmevvuY8Eotv2hTOSki7TBCc+3t2kg3+ohZBoY+YZQMADmaHlfZcuPQy5x8aw7GinyRdeIx62x0IrCWWwDtuanO+Q3fxvXalCD1Nvod1iQG8FQLQmkmy08LElmQCVWZPm1qH42f6HctoNG+Vk42+KlzXm+9o2QGPK8SHZvA2wAZnheSIggW0zchVg42klWg2GAM82GZnWhE6F1rFTHaaJjXfG5ZUgOULlm0Ma/ERNlE09I3i4BwzbKjyfh+9j5HlmqxMc+ZnLFQhV+vtS66BOkv60qUhGlRcm6LA4jCNpV2b5BNfXv7ZotLYePdqcxX1215DumbUSSg103Wd1pjqVmli2qJSFNG8prjSZhdJKEThZl1v3t+ENMftK6Wkb2SPPcG6Cw2AJ7gfv5TRYSgPqJzbLFRwu+U45fhw0ISSfSv9yErXGl5zBhPmUc06x569qrq220hw5TgaA634f32McWyr8r0aMeJoQLgn6JHISiK0sR4eXuiJloYQjj7eKe8z8iV4TKN9n9AkMtuqiRsi1se8Ue50Cq1JT18CrN2dUNnQcFeIms4Xj8061kQcIs6pkaQM1yvH8HjQK3gq/01vp1dj27+EyBnwzbfd9B5sEffkLn9bQiggz1ZCQAIhnvCe1239BwW3CIJlwOXkfdq/i+7GVHhcLxP8RTXW24WO1KoywUAUqgZiWwI/7JACXNWlrmK3FeuEZbVSzajsD1hdyRLnrdiEPQZkUa+cz8N+K8U+yNAYEhQfz+h4DRfpS/gFwoYVesU5JXqd5xTaiKNwPMzlL761mNzwILlFesJmlPw+7Y3KF3+tFyMFByN9jOYRYR9WTKihR/3kWMPCXj6cKdOLqIFqM+U66VpotvaQLDOvrrPJpRoMYiPoqiAAtmAtoQ==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XTMNMevCkb1MuTuOu9HqxYz48fSE3rKtE5UpECsrzlZBExTfHxKihJZHIcOwhQNBCevyr2iWWnaHflWxwgzW0AFq/ARhIAS1ueKVlEm8eKallzWjq9hE93jqDp/M+35jZ+4PmzSqsBX90Upc8PhpUeM7ha8zhns2KjGSyxWmI76CXSE6Lk318+tdmHXWlvWZwwdTVHs9K4tOOCdTSz41blY9TVY2pb8Gc49sGSDs4nRXch+3z2tVFQctf9MHkIy7eS4OQRoQB8Ub1u6RSw7f62ziztuxi7QIzC7sKeYQ+TbTSw3QUYR/IYtKbvRyxpec05cEf3ZI6ZVJtnh1gfAEIYp40YW5AF/lFm4Snb8Prr8kwP2nGBmE1dtssspEh9fU7Nni2Gpe8/fVkiKTH+vXkpUQLbVrLJ3AeNAXDxH+N/aJBGZ70NdFpgHPSnFv2Y68RWG6/zwjsIpTFkHFOvVUjlKZ/Zew+gGmZY5hu1vBaZqf0JAIHPF1QiiD7KvJFaka0UsElZToHlLVHYEBEuP4ouC5Z6EFWiwCl+dRYLDRRLwdS5g4uZQBGL486vMhtvf5w==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCvaleMTwKUNNOqFA4wkjE/vTTc98G5E1/6NlWlzmdzeprH5j16Jdmft/xE5NREOt2LPu2GSrKf4iskgm6/DwpfvQqxHwgKjHr0JObzeyOXG9wiQzqXahO+fyT/Rr1J0K1F+YdBjfi9p63H1k7xI3B5eInNtyFTCyTm4jBBulD8SPaMpIsbEkDDYuW8NKmb7b2r4R0oq5/ML+tZ8+3qKurcgGljCDE+oOqwYtBd1Wv9NjkXu8vJNLGWUsMXDXgdH2vc+aAWiuNjKZ+mh1VCz/Enn1qRxAkeh3o++zcJYLm3DZuw/5Yc3on1LAm9W75tHYBeLDH4SdNQXV10MX/mBiIloD4WaXsUclktqLQ/oBZCiw/gUdT8oBThxuuv5fhlbg4E=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
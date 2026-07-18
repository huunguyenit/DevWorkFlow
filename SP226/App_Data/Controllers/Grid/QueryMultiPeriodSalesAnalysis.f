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

  <!ENTITY Controller "'StockDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVTOieg/evw/3K6ThsSeWQtdMqe+etMk36hPhHz3h0qOoH8n6mM6WwsucKkeb+BB6Rqh7WqoUdFsftEia6sD2qnKVIkFy8Fb3OfqNeBdWwo5pa6ia7AfUC52tXtOH2nuTw6LSAHvQkLS7RlzlzmAtogiH0lU7HEX4cqap37eFUKiv66ONWkq5BAERJwcNvYv5HdMGBu95f8ZqWEUSzXvlmZTeHdc6oeVjq3dvDV5G2HnVc3AkD21XQuP3IwFGBBQ8nW4/zlW1bCUPl2voe24b1YjT14FNjUCLidHd5hb2DCaBcm0rYiFVxdpdC4QYNr852donkbnfBQGoNVvj2VYoHlXP16QXFt9s4Yrm3rkz+gJFsgBFlJSwFOG8dxa+0hkXVc+knPnUGUZomY0bOkCfTZR4NLtnZQIB81H7LFbO3eKJtcREkMHSFLPdyT6tswjdyaknLnJGVZgcy/1zOvYOkvC1yzMcysk/1N49PAFKREmXnfTBUFEisvV1dj5Xu4HECKywbWfUdBjqUPzASm8DOtEvQOj3Z5f6hJRujLKiY95aaJvVmRxjuxklVxKHH3xZhCqShHTHPkRP5+4IVGGByVFEPocw/1sML9Yv9QJAwujQlRLbG7pMQCAcMhaAXFsN2EcDvtGwzqwHq345/up7y/KGQTkuKU7zei8EydTvxAAxJU7eT+92DtA4qDvie+JQD/vriiVaErydvMmExHqMvZc=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết vật tư" e="Item Detail"></title>
  <subTitle v="Vật tư: %c - %s. %t, %d2, từ ngày: %d1..." e="Item: %c - %s. %t, %d2, Date from: %d1..."></subTitle>
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
      <header v="Khách hàng" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt2" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá bán nt" e="FC Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Doanh thu nt" e="FC Turnover"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu nt" e="FC Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien_nt2 + a.thue_nt - a.ck_nt)" allowFilter="&GridQueryAllowFilter;">
      <header v="Phải thu nt" e="FC Receivable Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá vốn nt" e="FC Cogs"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia2" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá bán" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Doanh thu" e="Turnover"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu" e="Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="pt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien2 + a.thue - a.ck)" allowFilter="&GridQueryAllowFilter;">
      <header v="Phải thu" e="Receivable Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá vốn" e="Cogs"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền vốn" e="Cogs Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập xuất" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true">
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

      <field name="sl_xuat"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="ck"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_xuat"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_bp"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfd7snYrqgNeD8yQnGbHnI7odsD4lvXJCFQOmvhqIEIIPBSSOrrR7I+Ov1VSwQKUF+rIMfMVtb+FN8hqlv52HqD3apF5AEK4GC4PXeZMF6XjBorqNA3fCzZGKd5LpqaPSL92Ewk2e8FrQuirCrEFbbusR2TWNPMtIT+aJPb3H8bA51j56djn/PhNoUQ0pcgaMluJZ1O+atjT1qQigcLIJyvcl0OPEDNkcWC13Zk/a8hyV5oW6vJGXcEITgFNGyk3xmk=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh4oHJASoJTGTydDRZBbHt0z8RuTuslzLIwSHIlJSeR9jrO66ImUaNf9a4fd9d9k60dAfDKn18zXQqRkQkBo74Sij01jOua/5fx6fxjnmvsvCXTfPdF2IJr9K2VXfxZNSFqjowuuyfHq6WLRShtosu8JOa9rrHSPFvPKEZ14Ld8HcG/ABfyNSBMEGb3WCv/0dYnJeN0fxEjUB4O5SH3+GKSUIBF/PO9lBi0L+qDXs63XhDSEBOK7JTTQDGD9Sxxw5aCXpqNrhzigJFLupKy948XRoGUXjFVyYpd9qA6mXKIyYBwRziVvCYqJle4tRruWHGLg0hy8gmFf4jhr81ZaXnDXfI358aG5dAev0+tLrciIn1GZNcHLzktlX10RBHnIi8AHyq8dPA7m9NZI/WxVA9ablN1mXP8iUxHQPIi9mjFyN6zKiuE7hxosj4GfnqZqGvw/J49Qa/VazWCcLjq0+r6gw==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X559uRh/go+xogGJXqRlARzz5s5xr8JkmY344cvaJ+2Q0/E1F4lDcUBOZrPtpX6gYJrzyn6QvDoTtUnazolTw3hmEao1Y9r88NXy1QIWjPh0PBYuTF47K5Hs/2t9lQbccnWR+mtYhqP7687nyAvuzXvB1Tn1jXLF+7A1SB2Sd+vC7+F5sTRf4AeighC9JV9vnlPcvuhyNeEhLxv3krfmhJzh8UkNf1P+GDrP+3fDiEM9jbJ64uH2GU0Jr6WkqKipVHviyl8I1b9TIr0PLAt40Ef882heMSVHJXQa9SfHbl4vo=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtvnBus/kg8ewstuZRlJDog2gXfzSddFb5luD6xQw+WpbAA0kBpcvrwxeMayHJFbO2+qflTuWYXsX8gw50x9rk81ASAF/vmblbfK9/ANh1lUmOcMPGGkbvQk6JjdURNTXf131sWc3L6KQidd7dTRZbHH5cendSfU9WZnxMuRmWpt/+X+NTiTXXNpNVbXWFfe4+JcmSojGqd9hBNoW3wZhfp+d/lSK00TdF6q7uwfevc8ee6L1zBc0yxAzDZnJyNSQIVKyp9YCu7Ky/zNaACHX1g0zApq0+/SQF+b9p/Irrtze8A+uRso/YQy4ePIMj3X/K63NOc/c34ouzF1nIsP6hr+n4o7fqCD4/YYGQiZcciMSPl40krmVwiDIWk573CFP2d936bLR0gvvPZgxWcXOV/tjidz61fcsmyXRxhPwJiXwU2xZdoXyYPl8a5uwnQf+buC7QusM/7XktBH5tbsgbstVl8MkpDvFdoKnfcIerxqwowkcKZjmd+CBsRkpCrGBC5xhN/40L0Ng9GKaE8ODC1G42j/fcdgkvIZlhDGTFh/fXfluR7qs85kDW2CszW0ds6kvlYpHcdEphe/vVFV5jKYqPKC3muqhhS3m5Nur20NsqwfZUexWFTEEjqRgEyakvyAG7AS/b1taVwdsv70uBn</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
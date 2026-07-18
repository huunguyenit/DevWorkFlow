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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVTOieg/evw/3K6ThsSeWQtcNJMSptf9FJ/ozuLQcgbDbGLInDpIXIXgFq4mM1sgyXBbL76cPpLIhQEBxdf8eqPPSaNLOs7lF/B8AwSrt+dU7zajCf12gi0F2hmuBOXzT8VB2S9CFT+kc0xSXMWesksE9By3ROzO2HEeLwXHZ3ZVIc94u/U8Obbi64x070wF1FUOKhTFtIsjrQx0HoCGoSVbrIlAbSt8cDUc7YzOaozcOFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8oJaXZdxpM8W7FWjr5YpDQkXTR0aSNtNCnTZ4YN2/uUzRVFaGdPw9LaiuhI9Rpk2l+fSpsFdvtTZoDLyTqPJabon1fYdJY2Zc7xeID0C2dgjFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8oJaXZdxpM8W7FWjr5YpDQkXTR0aSNtNCnTZ4YN2/uUzTc4JS93PfGZkaBN9CvsYpYvJT5NUU7nHhbwjReeN+4ejH20lrL0GA1C1YVThv6xUFdcZwNEntJK7LO4R3ePAAxmQcVmHHxYCd5HwVQauWyF9ibWGfUSi0sMjJLwMcchVFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo nhà cung cấp" e="Detail by Supplier"></title>
  <subTitle v="Khách hàng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Customer: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ht" e="GL Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
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
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct0" width="80" align="right" allowFilter="&GridQueryAllowFilter;">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có" e="Credit Amount"></header>
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
      <field name="ngay_lct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="ngay_ct0"/>
      <field name="so_ct0"/>
      <field name="dien_giai"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohsHu9iOgYrVlrUrKAnSA/tVz/YWpZ3u7d/6GxDNVHyfA4MoA/b/tUCtp1+NLoOyv05kWNadkTcACIt50UaRkPBoOuQH+Q29TGgDRDIfhSRwogoMc16zAX6dkWSy0GXPG+8rkJeSEdJmgxALSG5FnaXUPI81tEVfHnwepcwP7sTHi4AmoMd5JJ0fMNj7JAkQZQTFcYHs4s3t4H8Ci2cXnyfpeH6FCl5LbyYzjwr1pK9AtreJSiepWD4rP++xNs/RCt1opR0GJuESuzJMjDTfSMRazbS7WZg+wsvnbMXD8/Bho=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSUy473Cu2/IAgsW99S4Ww3QCITbNI3S/A7hICPXgZQyB5mHxOkA5HVBnwFiOh8owfuMweuMFkd+Nv+hgdKN/VHrAuewJbJrYFyW7ScbdgqTWdOjBtXc+jEd8USEjzDTrx5+zf2sUIxsuCKZ0oThH+WZqAJ1HEFakVvgZXbFRtLuikN43jjNHSatlJ2N0LGgsThLJQ9ZXVh9Smk8iuTCsc8oe5txxRHSY9KHUYJAmHVkuwNJ3T1GL8XZCRV9xwB6J0J+DFoBg+Mo9SYV0atm1npFiBx1LcCJf2vrRnxSLLXjlh5jz9KJhS5Ndv8ehE/BtOQQ==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfHD5PrgDSpd+xj3xHgk4xoyZUqMpuAR5a9ff4qkFlhiNzf1YeeNG6Rt+T++K7hq8zQYo+pvBmNaSMSu9YqmvCr5cno+HrVwmbplJuCnDUcUMkQhNNuXTgpttHueGd2S3z</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOarudXzFRBoZmhh30qF3/iqQPX3xu2PAI4oyh53qZpjNEhrYEx94TNDRC4M7fVhPJR2rT4WUAblNaIUuDJetRTk9bSyNkSiUktK1lUlicrSo8u/a9jXxd+8wFX19k9y9/wb7Ij+Us/MJ63xUBg6eczSRjvlQKUPNFZn+hpcWzzhR96RBxoK0QntCjZ8702Sko=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
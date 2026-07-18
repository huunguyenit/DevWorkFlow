<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY Identity "rptSalesSummaryByDepartment">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'GLDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTDzmCi8I1znjR07fT/S3wHGV6g0qgBbf8HhZd7ehlg3wIqIEH8tBfJPfifGYUvPms4wML4gfM5E8I0ejk8HdX5gbp7CvVG2NgPPDbFw5frz9SuXekhtFV+hOCXNJ/1uQ6YMYc/izQTBWXCNK3A0jM0gqk6fAxj5PUURAVfdQiFCR4Fk+ZbBCnO2Vb8lHjQMF82VXl/M9v+v4D+un9qHxQiZI4JVctMsKBdq/7UC1F+oCiLGFhatXhL5h+OxpUfgHc6yKn4u7SWx/1R4p91UxRIhO9izeFd4eudCfV4k6StnqbRZS212PioPmIPsOycvE82Alxck3+9gr1PMLlTi3C4I4UsD9fitAwpZulJCdlSEekIUTpW2ObT0kGLFBjm0lbTDsuSMrVvmBPPM7YhHHFNOf+hy8hOwADStp2hmiV/dPcc+llWoZ7/Bx76VpYYgZwTC7pl04awek2/YP3f4iY1cLXHauJ53GszWkLmrq+gcjLrVOMG/k4Vg7MpZezfOcUb+uqbaSwD/5+g0uBETWvfYFastBusiness.Encryption.End&Identity;FastBusiness.Encryption.Begin$Yg5kCMHpRxVk0phZxDQR7y8lOBnMa/fDtf1SPEluz1LioDaJM+wEOAdR5z1ckd3VX/6WwmvAOOlnTfxFNRl+m6L0pxTSx2+jqXesqoPTctL27IRu0YVb/cmomKW2iB/JQVG2EDvSchVXuOQsXLkBci+6ktFQrl+JDKxRyh+nsr63/Ln+kQafYzAwLJpMv+A3r2IWwBVhsB41AMgbaLWG6H8zUu2Lk0P9Cq3gYhtPSDvDjna6vvHzTlIEvqwL6rV4Vd3KhkEe4ZZ0g3gb5BkDs7JO3d8kf2f0BfafXWjshMbTsGBVrp74f18LLdJTOX4j68YuPeeuUvsxtuKhr/wDgA==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết doanh thu bán hàng theo bộ phận" e="Sales Detail by Department"></title>
  <subTitle v="Bộ phận: %c - %s, từ ngày %d1 đến ngày %d2..." e="Department: %c - %s, Date from %d to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date" />
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct_in" aliasName="b" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC Code"></header>
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

    <field name="ma_nt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
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

    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Khách hàng" e="Customer"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vv" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_hd" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Hợp đồng" e="Contract"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true" aliasName="a">
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
      <field name="so_ct"/>
      <field name="ma_ct_in"/>
      <field name="dien_giai"/>
      <field name="tk"/>
      <field name="tk_du"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="ma_kh"/>
      <field name="ma_vv"/>
      <field name="ma_hd"/>
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="line_nbr"/>
      <field name="nh_dk"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfebbzNenz87MgnfoJmFHPLw/B+F8ERz+bkgw6fMt9k4SmBJO8v2vd29//Aijbws2nGkYEQsiK0F/2yVXBTp9ybk9NLB+4cHVunM2hsMZNcCnE0kElkw7u1e+Fm+Js1YAPrx4uIUFvy1gxKyHicwsg9QodFgl+PFT8LsCGmZ+TccHvQ/WYoySH/ney6sdbvY6X8Ex3+4r4fJ89PhF2ymxC6Gkm5vkFE6WmMsP3pCIjVY9yexyLlWtfzcUHrDPGqH/0k=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAIkFrMNE9i4SYCEQKUlp6FwWaYr4IGtuqHo9Vx6oQPw6ormoQAlNhXiXHNsCk6SxV09AcifcJks+0pQGc8BUJizB3qVTW0tstfrvOHcZYqMFXhJiWrJagR8QFtkHTsFm5VI5tS4X4R+kVzPhDk3OFRp84Y1M9ISr7KjROKl+JgJfyfLWw3UmgqudEj95tXuc4mwZ9giLyMIdZUVNallxdjksKlD9zQnZcEe8w4caD9h08mpfxvHcLJcLMu+K3ccPP3QSNJkmXyWsM0G75HioiNfgeLsQynM1192x8r0Q8Oui/LprowMaA5PVOhRJJue9yj+vXFIOabGIcqy38TkDW9W2xEhRTgqyl5yWaAOSQjOR2y8p7mm0pjy4ny6ZmKrM2W1n3gPWn3lhbra8YeGbYB1k8GGOOm0dOfYFdcGZjmtf6HaMIEaavjmzf6ociJjZTXGc2SuPWfrGDlPIQuAH0BuWR40N6ARn8VP9kMwIvafOm3l2Um2i4ripsaPdOoDfpG30T3j9KRedREqzMTHhv3IhkhRnGkFMmHydrFjLOkFIZL6LxqoWoabh4dB4NkibYz3cBMZLi9aezFnTkOKOAs7tt6tK8658sm6u2TexJiqMnuQjlVrQ0+uz+l9x2LL473rSkLEcEN8/sYBSeuFSwe9B2p9502X4WAuyv5hyeXFGmPcAgPC0dZ2Fwvb7WQ4ucNAXtPzjg6nkkkdOR7E1GqrBkBa23JhvxbkrxJwR3NumbVgP+UQrkROTS5lGEL1OfYvxfcyeUTNQw1y/W5MjlL5mhUxoZkbgu2OwfBfE/xCvc/WxAHTCC/0EYilO5wz9U+RBxkVFvYCXEYynCetSsrmHVqiN3UZoR9OiOhctkz34=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfHD5PrgDSpd+xj3xHgk4xoyZUqMpuAR5a9ff4qkFlhiNjJAyrjdfp0em9EsVCdhS9/zf5lpDQBT1xqgIfUXdlBtT0pInjyOYIFJSbMi2eD7PAgWwoplOUY/587I/IHwpn</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJK9TjbTq/evEVAOKd0NtL7nyTaECezQjcZlifATRl/9e1+8GiCblGMPgyz75HXoQmNvYwxDBCOrCO9c/wMZXukCZq0EGR5BbV/IIxN1c2BIdxFlQY4/h4H7jk7G0/keGGDHuE5KjD6/EpkDiu4uw0UpuIdTQzyk/crZ5xdXxbsKo7hJQGuGkYfLYdVDpWyiIjFDzuGAvr9PEwXT223ORnKBn064ag+4z0Xc4zxTT0Wlfw==</Encrypted>]]>
    </text>
  </script>
  &XMLStandardQueryToolbar;
</grid>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY Identity "rptSalesSummaryByPeriod">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'GLDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTDzmCi8I1znjR07fT/S3wHGV6g0qgBbf8HhZd7ehlg3wIqIEH8tBfJPfifGYUvPms4wML4gfM5E8I0ejk8HdX5gbp7CvVG2NgPPDbFw5frz9SuXekhtFV+hOCXNJ/1uQ6YMYc/izQTBWXCNK3A0jM0gqk6fAxj5PUURAVfdQiFCR4Fk+ZbBCnO2Vb8lHjQMF83+Rk14s+4OZ64F1VAFe9wi39kzjeqFDcm9k2sAGqUs5SMIV9c76oApbfDERz2LIA2YeBJceYAenXualArHSqnoTmFAGYVdJfVn2sOLQ4KbPoWKPEeIa8UkcBG4siH/WPrcJR1ne2vNg+c2Z48CCF0gx+pvXd//s7+m7fJBBJFc3nY3B0FIsjMtxxei0drgKxLLkaPYd48qPKdXMwWFN0ShdxdXdiHOHrkNM52SeR7ZyRGwer80vYnlZdMGSjJbprvVomJ3eGAkddjdpctV431XkKvCzezwU8qD45pxIVFarZaK/jKD57vVWSBaUmNckM5Mh7kwMTUqmhnkK3VmgMd1FastBusiness.Encryption.End&Identity;FastBusiness.Encryption.Begin$Yg5kCMHpRxVk0phZxDQR76AxgjCScFIRi2gQ34xtuwmD7gIxpHUEbhAv0dUo00gtQnggzNKwwNVeo5eO4d3CCOu2WSywmUixMori8tuChyBcVZrgzT+CVgfKJK7T+IPxFUYxAGPJCB3Tb2S7sZ3fHaFfrxVkV3YANl4O9gRFf9J4aLkuW4Yip6iMbwA4lrLxnaE0Xx45O3AKkel0+DRzy7k3ZPgrngxQ7VeSIlfMhjVnEySlNYJwTTDyGfD9Z2JIoGDpqjQrDjPg4ssKfytdGYz3ZUGRxZahQHUdZ8qoHIdnUkgkbMi3EV+tOi4lUvs5+GUTti/EezF5P3yEXRsRRA==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết doanh thu bán hàng theo kỳ" e="Sales Detail by Period"></title>
  <subTitle v="Kỳ: %c..." e="Period: %c..."></subTitle>
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
    <field name="ma_bp" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
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
      <field name="ma_bp"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP/hPlQ2h1pE4kiDDFigByLzKR4JlCrDoWmBl3YUTG0/IWFKwXgLXBVUZLXWsYYxQ585jbFAMLQBuCP6QSpEFp4Wfela1+vwj6nmGCPherTvifNKlDRmiPKyVmXyaMapx7W7lKu2Bb6gQxhzdTaEGarvzYIL2u1kZ0yy5hmIrokJ</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAIkFrMNE9i4SYCEQKUlp6FwWaYr4IGtuqHo9Vx6oQPw6ormoQAlNhXiXHNsCk6SxV09AcifcJks+0pQGc8BUJizB3qVTW0tstfrvOHcZYqMFXhJiWrJagR8QFtkHTsFm5VI5tS4X4R+kVzPhDk3OFRp84Y1M9ISr7KjROKl+JgJfyfLWw3UmgqudEj95tXuc4mwZ9giLyMIdZUVNallxdjksKlD9zQnZcEe8w4caD9h08mpfxvHcLJcLMu+K3ccPP3QSNJkmXyWsM0G75HioiNb/vkgW2Cag1WpQKPV0gqPsL56y+Q3NpEKHTYbN14lrWR6U5h1R/VuKJFxb/aDbdILMjqqh7VDbB6piEVcaIQaHoNRnW8QKRq0MZ7AvfR9wHvGkvLlnBae9AyyYTjMYMTwzAfQA7KbUi4paRh4EewOrdXnYXlEEGkGb5UwORoSXZx5qT+bzthHck612fqh0GrI1bW9a2zyfXvzniovaEqXLRknZhJoIHajpUd7nfHXYrlulwIM65/3jgnmJzrCOqvis8sQo7KwzndQsNKBZOwAfa34pJjnx3/T8sUYXd1bCS/A282UUQf00Z82GEBsRTQRXr0Wzii8+7k/56SBiSRVQTO+yQlX7UMOCeJqyc2sbKP4U5TG22HIT2fnMlVU/a1YXA4WUI8rni396WH5VWvtJnJhSJHu+ybuDa3wr1OcPJAoB+Mk69hXfKZaBwiOFz5jauzKSMjogGI/OaKfaDZmww6n7DhrFeJuvq3ya11MnVN21ywCAONluPI+cVya71/2U7jtC+QTQZ7BudGt/K1f/InR4gLTzmmwutb/R1/mYptOzoD/7YkbGOpYxtwhdIWGH3c9dguU/ZjPl77VIiPMM=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfTTPFKFqk3rPievkf3sjvaKv2Xnc7LPo/yGdKyovNqNjVgwLZYORjAFD5atvkYb4ebhoEtik0xS5RC3bwnPJ6uwvanIbLOURYZ1FgI3F4CWuLCg/nqB1rv5Jn/TXlh7SQ</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJJ9uIhyeu5aZm9ml93sQPy0+ho/+3dmNkz4EQFfjhbLXrQTKNCQFXP8LP8tN37qN5RRZROIb0BKG24ixYDRWAsXaHG7vhsWsW/ua7K90cSmu/TszWYIhDnsmyotEpt6VERG7wmBX1Q1nMi0tNNNgDk5MtK7MfC6WkQ1ThhIY+BRYGU0NMuSBkmQHKsJFHCAg3qqlMysWbsTBXiciYcUBwO8DLCYHApAcMrGJYbvdckZnVX+PQzEl2CC9aP4IJE1t5s=</Encrypted>]]>
    </text>
  </script>
  &XMLStandardQueryToolbar;
</grid>
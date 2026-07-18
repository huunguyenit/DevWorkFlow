<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY Identity "rptSalesSummaryByJob">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'GLDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTDzmCi8I1znjR07fT/S3wHGV6g0qgBbf8HhZd7ehlg3wIqIEH8tBfJPfifGYUvPms4wML4gfM5E8I0ejk8HdX5gbp7CvVG2NgPPDbFw5frz9SuXekhtFV+hOCXNJ/1uQ6YMYc/izQTBWXCNK3A0jM0gqk6fAxj5PUURAVfdQiFCR4Fk+ZbBCnO2Vb8lHjQMF82tC21UrccdFvtPLheeyb9oD9qP/qreYbHQKmybCvJtIrLxUVRw1Ltg3lzjnUEcznRplA/vakYo993bySs5gZExSJ+BNVAyqGn2M8kzCDF9/mPjkdnE0seI+a1EHjm4Y7Au4t54XURVf1Yc/huVwGylxo4aseq7bJr8mSb/oLqjvyAJr1BDS5HgEoYxtt76oy084ypJuTGaF7UUXa4UdtXEc7MIgeW4mWegd0m+0OaCVyNlIrIU160ChWY8hCfe4wvkrRfrXqG80o6q3jgYl6u0Izs6C6JIe6DHFk2GI3EQuB8zOktknLC3GPNh/Iy298iklb6SXMQRqGb4+3A70dgsFastBusiness.Encryption.End&Identity;FastBusiness.Encryption.Begin$Yg5kCMHpRxVk0phZxDQR7x5Trpij2L42np8sLgji/H77Gt7ytYje/HNRAF4n29mIw71KFFfSy8osYbrBImyrA1ng1S8ADASZ1HCOlT/gZqks7gdM2u7jrGo29MVddVTZpVGAt9kM2AJ3t+xsF0wraOOFVwdMuqD8Kv5LvWv4W+nYBFOHFkjnoeXIILQuUnH0Y3U3IB/ymeMG0RMhor6F+sCM+TeL5/Fh9VAnjCym02hXvppEBs+G2rl2v4xgDUhb2L+LQ7K8qsZ2vi984HGh8wwxo10oMPKXsr94/30nMvX0kuu7IDi7j42Uxvp9Eh3sFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết doanh thu bán hàng theo công trình, vụ việc" e="Sales Detail by Job"></title>
  <subTitle v="Job: %c - %s, từ ngày %d1 đến ngày %d2..." e="Job: %c - %s, Date from %d to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date" />
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct_in" width="60" aliasName="b" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
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

    <field name="ma_kh" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Khách hàng" e="Customer"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_hd" width="100" allowFilter="&GridQueryAllowFilter;">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfegYEXNXulogTHPqizPO6MjEEi0BENpVwHoKG1zcBlALriFkt8w+YP9hv0Rp6be5g/sz36Sv6JE+vB+VNcIxqnu9iZ+/bCu4FjJI7bOytmYX177T1jyoxZU1mEpIbyuhiYGICBquMct2xQE93Gi4CiPLZMyMyqoU8kbF3OX2txIepWRDNY8u5BR5FBREL1l+SOGlu08AE+dBQrE/cREZv0zWrMle9HbMSCp4ifnSlbL1dqHnhAyvUp0bXt/CRZeLjc=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAIkFrMNE9i4SYCEQKUlp6FwWaYr4IGtuqHo9Vx6oQPw6ormoQAlNhXiXHNsCk6SxV09AcifcJks+0pQGc8BUJizB3qVTW0tstfrvOHcZYqMFXhJiWrJagR8QFtkHTsFm5VI5tS4X4R+kVzPhDk3OFRmQWHhvA0ay94qvBfJmLJ9QZ2wX54O9TlUDUMzuViAQvPuILINxnwgRBUZ9LW2RFUvgg6Jw+V6wqcXwaD+ABupWt/thLBd6JrGdlZBZA7vUGxm5d0z0lurUFhoFHfSs1n4d7QXeTi3P6g39j5Bm/uL6U/Rh7Abtjygu3SXmOfZvSKV2bUmcYjSiAjfM9Xx3MW4puAZI5qbdAYsTAuCBt+HbeoGtxZAQXrMY0Oah3oIHtZde/5dKcII8hiscwmQrW1k43+U2XzbGA/uvGuK5Pv5BseFIcP8EP/yRAx9hgSDqVK9trEDHgfaoOY7c/N1fFYGDnPiN/ASxmCTCBkHFumIUAIiIWPKCJKr6A9cWL7FiXj6VBqOwHiXPUmFJ7pE0XMTLH8p80xufZcOUCcAw9oIKZFEfPFLNKZBaZhiSCcy2GfroiZrTpACUzfKFS/GUM1s+PDuW6lrUZBxokKmnVPv2LmEiAlGIjHWGFHMrybfn16mSK1i3XbtwZFo9cL2KgUHWhVOYeYtnO8B3vyI8ZJu0J72UwudZ5c4UzBbMFMi5VfVcVGM5QyCfVvaMhXXfQsG9XfHyxsagFPt73/ya4s47VZ0lGRqjMlm4ruFwKG4J/YmbgA7O//iOvnSW0mhj+hQ==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfHD5PrgDSpd+xj3xHgk4xoyZUqMpuAR5a9ff4qkFlhiNjJAyrjdfp0em9EsVCdhS9/zf5lpDQBT1xqgIfUXdlBtT0pInjyOYIFJSbMi2eD7PAgWwoplOUY/587I/IHwpn</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJJ873wimhQ2cmuImpw3A1kXANcA1asYkIYw6nsqSltQ0PSNPd1A7CEGc1obEGvpqfohT4rw+HXOyK2p0s5yNn+76hbxtXpw+sUAQrHF5IxouAcGgzTmAUCNwVqojVwF0vKu2Bgp2xXNyKUwTKKNXO9TRijh//42wj5AmWNo5bwdXWwXKjDQAt3w3Qfb6T1z/IZfOj2gR61Yfr8NGCZUU1s8ZyRYskM9NROEMcCbj+AaLA==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
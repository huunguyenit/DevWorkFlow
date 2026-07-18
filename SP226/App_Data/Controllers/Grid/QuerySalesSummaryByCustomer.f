<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY Identity "rptSalesSummaryByCustomer">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'GLDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTDzmCi8I1znjR07fT/S3wHGV6g0qgBbf8HhZd7ehlg3wIqIEH8tBfJPfifGYUvPms4wML4gfM5E8I0ejk8HdX5gbp7CvVG2NgPPDbFw5frz9SuXekhtFV+hOCXNJ/1uQ6YMYc/izQTBWXCNK3A0jM0gqk6fAxj5PUURAVfdQiFCR4Fk+ZbBCnO2Vb8lHjQMF81sh2eBWv3kq8uJyfFea33VBZ9DEbrYqT0rvv9PhN/wm7ezf8AEQGc/Jbd56dwPJt/Li+rNXNwrbeGaYaCiVxXYWrOgb07Qw5zDs2cVrle3bQNEyu9XQvdg0syEMWVQXCPU93BLWUhQz1HxMouHQgZjnd4pcu3bZKpcz4xRTMQqt5VfjtsdfVbi+MVNkevXF1Yzun3S3kflZmm7W8cxgmC+ujCBu6YOhOtAeGXPr+6OOmJbxHa3gopHHZxgz0PVuBwCZFXuUFyLqEw09utlLWSsZz8Zgr0jMBrqbk5fDp3ZbCKWicV1QBxgwAfXbl6HlII=FastBusiness.Encryption.End&Identity;FastBusiness.Encryption.Begin$Yg5kCMHpRxVk0phZxDQR7xNT4fmVIhQ91hPflOjAs9GMHfM3YhkbyW+JSN82w1uvEjAYNI66+R5gBaQ/vfc8Nwh6daZixcTemTJ9uiZIgWagMSpArjzWEiGS1LGkDidXUImpapH6deEx/ZmfT3vIMpztOqWa8cRoUIhl5ysA3EIJnSMqKAuEbvdZUO1ygkW4WkFYxS5KEZKa+/c3ayZJk0hKp73zicY4jln8lJXnNUG6870hqwQ8fizRdMScEb6pNJIUhOYIUpTZU0kzFl1FvwJ+ULSaTLXO/myNorEQsUtHJ6RrwmVWsZBNJ64B4n/QFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết doanh thu bán hàng theo khách hàng" e="Sales Detail by Customer"></title>
  <subTitle v="Khách hàng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Customer: %c - %s, Date from %d to %d2..."></subTitle>
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

    <field name="ma_vv" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfetY7P9JkPblIUHP+9YqIv2x7GP07Aio5XEIPhDb54GSz/ufc1CAflcj3xQ+KT51JtBgE5oMjEbIjwKZlt7umel8t13GJvlvmsNh9IoXDJOBuUFkm86Vj/41HzjCFwr/+1HFCPgAZiiDnULLrDsmj0U8D8x5wCLST67wcV0jH2MYFE3pbBXxaPTDLYzYBc9ie7IqaSThWfVQqVdzrXEUUW8Ij6RT67Bd/LUmb34XNSGVFxM/bYnURD616eOUiEOExQ=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAIkFrMNE9i4SYCEQKUlp6FwWaYr4IGtuqHo9Vx6oQPw6ormoQAlNhXiXHNsCk6SxV09AcifcJks+0pQGc8BUJizB3qVTW0tstfrvOHcZYqMFXhJiWrJagR8QFtkHTsFm5VI5tS4X4R+kVzPhDk3OFRlPfii9g188P2ZKiom1+8/NTeDhOsJ5rNYlF/jVEsS9lZq9rGhMrD1suPbiRJc9k4Efv3uH2PLKAB+ODQ8zhDs2UuHBcoKhkFfq/5wNKXIUzDP7FPXhPED6f8L622Ch4FBPWprs8X2ydp6BAGa6+2hxO7vIBmIhtawPBUPyDx/3RzwH6ziT7aony42P1ImIOhBYm96eW847GrFM/KZ2RPyul9hspl2FwNzL6YIxndepzcnSrMjByK41JFTzWDHvtKqvZE+hiL2m/6cLE99lhfIraJ2brZaGfXnwDRCT410PljiIbToAqdz9pOncTBf0SkQwK5ixPtQ+Qxvxm2X7QnXn/Z+lDLTlZpH0y59FjO68X1LXcsYH6Wxxjs2iZ2Y9j62MB8nYE2TLg8UAKfDlZviavFgC+EZLiJTanx9AB8ewpNtXBTTi/uAboJiP+RLNSlIuFYv8VCGo1IDzHO44GEeP0B5Rw6+SRueqswJOf59ojv4bc44XpM4rSU+ZURTKArilNxUl/AIADO+jj83+8hqrNTwLNTstQo3Pg20P98LJjhF9l64Qgfl9aZcAQOWhk7AVGeaQeoO2sLqztxBIGDwomjWG7spdzMAB8uV6LLu5iN5NUszzSvGLk0fJbIpLAJic8KJJUJeeHPOLPsKFZDw0=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfHD5PrgDSpd+xj3xHgk4xoyZUqMpuAR5a9ff4qkFlhiNjJAyrjdfp0em9EsVCdhS9/zf5lpDQBT1xqgIfUXdlBtT0pInjyOYIFJSbMi2eD7PAgWwoplOUY/587I/IHwpn</Encrypted>]]>
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
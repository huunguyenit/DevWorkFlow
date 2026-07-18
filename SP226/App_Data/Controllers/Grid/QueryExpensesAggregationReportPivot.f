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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OS0UM11JzS97WqdvSlnfHS1GEc+2keO8QiIhMRaTgv9tDqsLZd0Cpq5RkH806BrjawCY84vIGN9xHLbn+pF3F3S+U7SVRzU7yznc35uETV+Op+aSmcTVmIn5aUjR1PAiWuUJap8Ag8FrGwQBrRvX6Bj7FELojT0+cYtZ+bc9Y+hyINVNbiPhQ+WlN0ml7jsQgJiQMJi2VbLkPpiKfSkckbzzx1hna02d1fF1xVsl+EjHHzPc6BX0VlSCTOA/V7+6RKPDQ1hFTT6YRMJEeNN6wsD8vCt2noEO8kIOD4rcd3rmVm8QqvU0C26tUpLnilu8H+fw3xDBBm6CvcfZDWMpxM78GSrjy6+/laEoIi/gfMKEw=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Xem chi tiết" e="View detail"></title>
  <subTitle v="%h: %c - %s, từ ngày %d1 đến ngày %d2..." e="%h: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã đvcs" e="Unit Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1cozXKOGFQ0YlRFZh5W9YM4axBNML3ga8sX/OkO1SLECmocBYc/R4aA//Zli6t3eskk3xqqGyjig1DiUCkn5OREZof8D6OhhsDc7TOGuNu+kLpE9Bi0TRIqnM4AbR+ccE+DoiMSQBjVjqYkctw59oywPeKbHYny5fkBOAEv27iB1s9g71rbT/VWsE+6MewbfC72Df8CXvIzLKJcTzYHyfxncjVoECHaFkdMPgerp3t9A+6URrKjLiKGEtr2vgUeAmiCCcfc5qwZx9MW41LfKxBUh7Cje8QxbXNwLjykGUSOtuemnxg6l3VZdRN1elWtxCLVIDr/kiwC4TTguDEFHrBeNmbD+A5reazrWDSPHXyXKokBLE6XXuauykvoKBVqlocYqGdnD9fe5MwuGeUF5m7F0uTmFwC5O/T6v51uSndSjXzCGdtA506q4mYoo5DKUF3SNczB4pR0J5LlnOB6B8b7WMb5K5ELKyR1ZiT8J0cEa51mZ2GycR4RxSThcIYT7rZnBrYxwoTb838HCvGfQIfOWaUG4MNGzh5kH83RrS/mGj7PwQ/wIFrGbCkKgAQroQr+UPlmtud+CfpYW2Z0Egr/ApYs/btRzIQ3vxUs0Iw18oQAnH1G5mE9XeLnuvjuUFIe2cDZMtdJD34uMMIYJ8SewHMQc+UQ4fAaKtC64L0ag==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCOFYh8Ah7+mmvGVY9Q0bebvZum7IUzS7TnetcRo/NLY3HD3rlsYeV8795BAkWypme6LFc8MLaeBeBwyGrTLBipyPCXp71dEklnx6b6Szh/bbv/ENoZHYv3gEmOP5HjaG+j8WfHSWLkGntKm5C3s8Tej+x94A+05y+nnso5Mt7dYCccfm4CMtF2P5soPmOric/JrW1PkkxDdmpfw6sX8tYw9Qd9k+SkOpOyYYyen2ugSdw+uJy8WrW72/9iW8R8lctbDV5YIx2QnSFXRi0Dso2dwTZ16mEZwrxV0Uhjkef3GFZRx21E9bO93TkijO3IAFAUf/wUwrzwWuxvsHa3lBVY1cFghEo9j/90x98mdo0c6bZG7voagCrINDAMb4YpxHESyWASYv9TRBtPhjKRxajTVPwUWFVmWHKutZruOZpbXTK6Ram5lR9vDRzjUgRgTaCE9YHreDcC4nSSON/Lpw3lxPU7O5u1tLeVUauntpdOnIxvbNQQ6H7Dw7mFEU6SQjww8tIrS77AsW9/d0t/Ldwxg+JF+cvgHBAC0YECJ/fPjC8mZ75sIrwF3eTpbtRPAJpZdftP/jHRXfKkw5aSgIANJEmHU5+Ah9Uc9mbLTi65/uC1x8q43QEP6bvT8lFhrmONkimJWD9wofnyGdTWbE0ejtCoqMq4XQX7erXGJ6ZspeTYz5hbc278WMKISVcNtEX7oe7Zp8/FvnAEHP1jmlLKIWP1UVO2dmRyRve38VZL+gfkU/fTPzchnjLwMp54Ny7iq2IMJwgooeNaj1TJvcdYC/6sMQ8IDVGkv+LZ7eFdX3gm+cnbuMld5IlYq2BLmAZg=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmIMZDFraSPU8zYjz7rLwQv1XxNQWTzdRsdXFL3A48fJ5Zg0Ze4xpHmphXqjJMx7zWsZ36xg0aCt+GYBtPzaSocMECL1MYRswzeV1thgJtFsnYjCinUr7Ke0ju3aY1h/bKts2d7B2XG/GkgDoiXbrKU</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPqqky3IH+yGl0kNzqVxDHd/mBbGqEsXEyjG/SVvSAM9JH+N6Gs1hbDL7AqPZ5vsX0i+xOPOB54LRCEn9he1P1yP3A4nUD5alMO+6qV+nl+rwpPa6oGawGXVUu2mGIRUD4mODYVYH4Sha5teosVceMcxGBhB35EIgF92lpxTHlZ3z5Jq39yi94fjIyQ6sqVTxA7O0aqPdZC8/OFdcHJ26avy/P29Pb3tXDnMTdsOlwEYc=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
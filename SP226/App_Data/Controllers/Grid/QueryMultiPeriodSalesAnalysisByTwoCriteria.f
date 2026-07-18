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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVakFMGAnwAWP0D/tUv6amT1rzorGxfkjBh6rO3X9e3S3e5f06N3q+0wh253+XkVrjOaJRwDv4EqRIXQ1wczqEwJWlinxVQhYtgwx/w6dfZeV3zucmUO/MLSC2CNNdaGFntsgSL7Oz8NBFfhRiX5pgloWItsFRSHAue3sBkBwOEoJnJ8iIGdgD6wRK00D1uLCH0pioYy65Nj/kSyukkzTPLSN8a1wKQvR9u5NGqYPd6qdMfDi1ZcwTbFumvbqcuN9i3r8/AtYGdLdUGW0+3Eoju+kBH67u/ulox7MITJlpBGizInTxYM4m/Fk/ff/HAJ6pulcwzh+f6BkBG5cIwjnEI875yOsG+GRbv7Z1e8+qTDC3U8dJOnQUiTvSGFmYXnFcSXA6bqg8yc9X5V+d8/AbhQRRZvtHBPKTsec28g1Suis999YEQuSx1JsnTeOp0iVj9aKv/nCM8hxEE9KR2kkkbu1wB0k1rkYxhBzBCQgh47lL4uspNXjKz5Z44ajxt+0ow==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết bán hàng" e="Detail Sales"></title>
  <subTitle v="%s: %c. %t, %d2, từ ngày: %d1..." e="%s: %c. %t, %d2, Date from: %d1..."></subTitle>
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
      <header v="Mã khách" e="Customer"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã vật tư" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nvbh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Nv bán hàng" e="Sales Employee"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu nt" e="FC Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu" e="Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt1" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="b">
      <header v="Nhóm vt 1" e="Item Group 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt2" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="b">
      <header v="Nhóm vt 2" e="Item Group 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt3" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="b">
      <header v="Nhóm vt 3" e="Item Group 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt9" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="b">
      <header v="Nhóm giá vt" e="Item Price Class"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh1" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="c">
      <header v="Nhóm kh 1" e="Customer Group 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh2" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="c">
      <header v="Nhóm kh 2" e="Customer Group 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh3" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="c">
      <header v="Nhóm kh 3" e="Customer Group 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh9" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="c">
      <header v="Nhóm giá kh" e="Customer Price Class"></header>
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
      <field name="ma_vt"/>
      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_nvbh"/>
      <field name="ma_nt"/>
      <field name="tien2"/>
      <field name="tien_nt2"/>
      <field name="ck"/>
      <field name="ck_nt"/>
      <field name="ma_bp"/>
      <field name="nh_vt1"/>
      <field name="nh_vt2"/>
      <field name="nh_vt3"/>
      <field name="nh_vt9"/>
      <field name="nh_kh1"/>
      <field name="nh_kh2"/>
      <field name="nh_kh3"/>
      <field name="nh_kh9"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5Vohctumxx7MLT01NlOlZWZrFxDac1Q2iq8NUCQ5RFNSQIsAHOLPm+J7mdyPp2dXAhLX22t9LBy2Iz9Dr7ADCrhxgalJ+niKdtxF4rhnfrlRJkczDsbcD/NzZtF5yRQzgcZ50EfxORdoHTXcC/+99vYRKAy8tfBFfaiutiZ3mRTDnO6yxBHihTnJa5YmP4cme6f+AEp/j+6iytInLTef8uu7GruSLFmwZ4eWKJP5ULbcw1CwqzTrmR7pUJoQDYKOMTPErfgY29ZbpyAla4ambgr/KHYlDmn/YrlX9Ko7CMQkTpYqWcB5HYoCijvC5nnXYkmdRPEFZaFIdVms5O8ysisk+nWuhC/bQNc5rCdGIzsXXUQH78n4XCNLMBIrFl553LqB0c7XYPeaHKxhtWdTISVmvuFLxWCgehlMnMGeh8636UOVAmeM38jXCytnwsj5X5UcatSwryxh0eh398/48Ms7gGVSqyhXn9nwjvhpDr9uMWeouQJcdJmTJzXV04iDjJZpmyCXl+p9BvY6waN0yP2bm4J7XOGwS7h5y41YMUFM3zrjxV7gDulMm+d0TqjOk1M0bJrBxWt9jtjPlhhnQZ2/Y00b/9bDtjyEDBHsuVYFLEz8C5PMYtNRlHrK3DqJQhBMVHh8CEnPZLFYDJhOc1WS0Q==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAYHJllGfVnrqlBt07AKKP5X3nrcYdMF61gSgK3ztk6KLUJLPbbzTJe2sOivJxOuqASLmjiY4k7SIgn9zdjxxEk4bu30Qoj6nBgIyUevYP2K86kHBmuqsWiETH7MPA1jyUjfwDNGvvLjV99HUmZyJJG8rB1JdiawNgVuQCwDeuCOQhhhiEHzHWtPwzsMUAnc6c+n7hA1WX4yd19mZER77TH4Y5cetRmB6kRjJxB20X9rlTnliGt3q7sPZiv1pNminty7SFDmcvcqMsHId6bSAFGVUIYYVVGETUc1KNamK2U+/Rx5B2xdV5l5nb4z/1j3LjXTfte3i+s2P3aU1eav+e/wKA70biEfGv/1tGJvomZAuesCPdGZv1tK/JqgtRfEx6FZnwKt6OoIGgDWYjC89AeWBoXZZ5sUSJ0dpCL/jdnc8TWdAKFv5Luchg5KtsCPgzZhb8DXik4ghUc9PnwY4AmpbrrN4LQ3RnVimbKFrFZG4cQ3weGfInf9skGoxEMRu4e6kjVw9W28swV5emFx5INoUZelkZEla8gb+TsdUOw2sSNvkNXOYu4gMwt8qfWdU2</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X5ZGRVkqQd8K2CNKKZLe70qhKvJefh/siSeeheX0MYPWLpHaKdVAkksdxD2ne+m4vmVob+lqCC+7fF40n2slLZ9tor+HevZALtlJV5iIVy5Brk+bKpAq2yPxAyfUj1xg98+axP7vXfXVjmPrj1Ld31Ng==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtvnBus/kg8ewstuZRlJDog2gXfzSddFb5luD6xQw+WpbAA0kBpcvrwxeMayHJFbO3FHLqams4Jad09OWXPHa92UEFrArD9rDOO5U7b884eyv5eg01mn3RvtZHe1p50x9d0lNIOlVKcGUe3shEC9gfaU0+zaIGH5/D5Y6KoWE3fIp6Ycc0GcZ1cFdNOo5+3PHBkpDs7oYlDDk93JB2yslWjFsQrpW0X2LUtcXVNQKeOpZSbRtNpgBQKDNUa0MjqUa8ZhMLhhTXJlX2HSKEIPnEIfZQHVoRQU4NCcYTE8sNVj5cRZ1AMXTzxpPGVdMB+KlEMBIkBR1Uwp4BMHafcyobdHFvSLmkt5dMbkiw3bEvreWS6PzQ9IgvUHi8N0gjX8ZHyqEiKRlI4PHUjWo+3QRp/prvvYZXOvwbn7Hymu1hOT4GEKHV0OCtE6nASkwBV+xXfoLljB+iH9ipNvc3eCXeFJD2vw5tlrdbcBEYzkhMKdJu1rhDg02TN4qVh16LrqOeP6Xo+0TxvN4iu9E28VI+77av3AQeAdJHRXAMMdPy1Tj16V4/r4Pv29Q8J+x8aSxhGWNJscwj2D1AYN2H+IMNY+YH4RW9af0H052apM6M1z6uBqAfzB0snpE8SfrKEU8s=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
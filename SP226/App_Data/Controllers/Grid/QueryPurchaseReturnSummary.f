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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVTOieg/evw/3K6ThsSeWQtcZX0VZJDMBCp+Ok2xnX2ViN6jr+W89nWMeCkDWS1iIjThiS60UwN6ijkvYiouArgEm1ve7gYg+0l8ARuvz+BsXEGGVpj5RRVQOGlIApyhkDuxhVd2aPK1PToUhMgThZ8a//bpGy9F3XzXj4//qmrn3fOK3O00Iya4GdWy9hcLh3zUegsTYBskcr+gpHpGSmmZufx5bHisjtRgJsOi1qleOF7MatGSaQigoJGnkCXmHEJ7CjBIuFUgq3eKHkrp/+4qB4fdYeePhjT22yOZu6PHx5QdKW4SIt5/2z9bWTWRSz8j/T2+u3wtbXzW+Ahco2PJn1ch3lii+1ol05nGA3p331zGkesT5JGDY/rpr1g3sisRWxAmlCfJrfohGF3szMq61wLDYIvc+XjwgJ3Np5+/7246AIKP+Irs+p7QFTJsJvqOh1tCeem9aHq/p9NPSw3wDZAmTVQsxIb4hxngNMeKmeKO+N4hMfdb5TU0pqsxxS8X7I7MhxxQgW+A6huA6Zpg=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
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
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="60" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vv" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nhập xuất" e="Reason Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_nx%l" width="300" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên nhập xuất" e="Reason Name"></header>
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
      <field name="dien_giai"/>

      <field name="sl_xuat"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia"/>
      <field name="tien_xuat"/>

      <field name="ma_kho"/>
      <field name="ma_vv"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>

    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohnIgqoCFn6KX8VZPCU699dj8eRHkU2xxNSpqGY9/JU7EfFmREr8KVpX/xKakoQvNKqPeLhI7jZwoxBljoYygyVPgSBez76oQRme7jLYLSCwhcCz1jk7LGKcTrIm7v8zPeU/eq+ISRT7H1ZWsFm/NeJYsh5pfW60YzOscHgOvTjRz+y2LWoxzacfWb5jJ+NBHw7iS8a/hxgr6LBZbNW4vPhlCbLjx+KVvP9XNL6oUY0dhypod6Fg4lranETaf/OUDFSQqwpP3Gg2eZ2pqqmTDbKA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh43Vt0eUCIJbzE+u3IdLVMSrlYiHOs6wQ2Og+eUpQdZWk66hvC+RGHBGdhlAM62cNOY6BXKazkb876cQyuIjXX09kBLI9sl662TFKiPjZXTdVdgUsyv0w/FD9ISCb5K92x8FsjhdST1LqroWR6ss3msFw1yuKgWk2ci2jt1yW0lBRICYPW+e33RUj9Ll+52xz5SK+up9FuxI+uhdIPo0i1JsQp9EjHHdXsCdTqPgLweTU3y54Qdk70lcOV92p6OASuM+wpJVX5wnkBk59ObgFOgSbL599KjRoQ7dod/JZN6aOQuY160QG1s23nwcskcxS5z7CAC7jIrPXuJicOkAK4YdLrFRnSErp1GZkheqqPz/dBP2NfRA//KgsRmklLU8SlRNg+UTCXq9KMjJZ2OBd9PYjImveBckPsUl7Hp8Qbq+8dtexZN31OOKrCJH6sNKhzJUVpy8mzVxr1J+tVqvHV3HrUQYtPEbNINqyGdbkAd26B99y7JMQpDpRNSVDH0Jlqe7gX4BTUsct4U0yDhmhevQsvfoTR5YS2Z+l8+cewhFo=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSBg6lQRaa0lHkJN8dgAruShIZSM3u/x2tShXnFNcawMTj1TlRT812VHDdlFZ+70BUXA97e+4xTwWREXspp4Lv7+ENI0cbAXGIFHkCnry1VkrQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqi2XY6ce6ay3jAIxVKAbBoCdZtSn93eVyLdOG6kJc+zfvu2ldjU4TJTDoOQRcRFMFYg54BO8z6hj41nOTW/TUqBsct+eMgfiUhhe660Cb5auVh78Z97UgmMpDtrWUZZR5v+9wxuS/cMWLp6HsmsiRWumYCWpxk9wr9Kvq+dXaLZVYZUl8Phkww8IEWurasJ7b</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
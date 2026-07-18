<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY DynamicFieldGridQueryString SYSTEM "..\Include\Command\DynamicFieldGridQueryString.txt">
  <!ENTITY DynamicFieldGridQueryWhereClause SYSTEM "..\Include\Command\DynamicFieldGridQueryWhereClause.txt">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'StockDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=FastBusiness.Encryption.End&DynamicFieldGridQueryString;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTUg0H3Cr87JYfclGWTbzUR0TXXnJ7RD/OUC+JC/HY1FsASDvme8ciNwXz8iv/0dBc04WuYTD30yvUZ24IyQr3Kb/g0L6enplTACv7/wQd1YSEnAtxR7s5Yz7jaNyZFateM94D7znZmtpwxOUIqw8VWr4U+4fTABbq5DUbpbVmi8NSNDBLss/DUnXzBVlVX1nAmZln77OVMUfckjjl2IQ0GS5V6AQWHeiXNcPZopA/Dy5P64KdKO+SLtJf09UyX7snnVbPGAMKoYjfdDDDshB3kRLfnF6JEzgXhZtKH2joHyY1tlVSS7P782caSFy0uy+BTH5KLCuMdjgtEi5hhcTELlVVSXQLVkzgrr+6Z32j7mZ395uU2pHJ5kawm/QrxIX1FVQPQN5ezRzV7pNcuqVZI0ssZM3xmRYpVNcpbn3UGtSjwY9kqKIw4LpovZygyXI4+2inoBtKhvNmuXiuuEsXIrgiWLczycvb/uzgPKsXjimAoKrXFlRj/GkSX5tV1qWK+M2CFgaBAFcPjBwYfFzwKbQ7CYiB4TatzGFXRbxEqZGufhThcM9BSZxr9imeFDxT8YB7S+D4cQQxWkAKm9TOmdGYboHVj9ssHwSOMlM41QjvGEBATqNQ67r9O2hjuOGWlI+9C27kuPgg19sWNHKv9T7kQpIC6IAhMW2Mq9GJPzQeIGO7hvNp4ciHQrMK1pQXCrDbkZ9f51wXYuppEq+zvEj0nYpQp0sAeg6dSqJtxt4o=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo đối tượng" e="Detail by Object"></title>
  <subTitle v="Đối tượng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Object: %c - %s, Date from %d1 to %d2..."></subTitle>
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

    <field name="ma_vt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã hàng" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên mặt hàng" e="Item Name"></header>
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
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế nt" e="FC Tax Amount"></header>
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
    <field name="lai_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien_nt2 - a.ck_nt - a.tien_nt_x)" allowFilter="&GridQueryAllowFilter;">
      <header v="Lãi nt" e="FC Profit"></header>
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
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế" e="Tax Amount"></header>
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
    <field name="lai" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien2 - a.ck - a.tien_xuat)" allowFilter="&GridQueryAllowFilter;">
      <header v="Lãi" e="Profit"></header>
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
    <field name="ma_vv" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
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

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="sl_xuat"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>
      <field name="lai_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="ck"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_xuat"/>
      <field name="lai"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_vv"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN2YdPUfiUkjbqIrM2UL0eZ3KpW8cVAewimHJ31rFymKydf3HMEvI36G5HULf++GNBgort3QbkSHjcksUXRKam5QTjjVT7umpzPGyK6c8yIY0E/wnQvTyZfn/gWnqhJ0sgSHoNWJ+hGyxrWAWj2KJZ2LQCVmlQDPZqyMAadHtRd4yzTcx4SO3RFtuGrZ9T3TDGj7R4A505NXBSb4qhmI1Jip2/QY9nuAPnr+4Go6tmu7kTUObLCHqG2pO91n+onDwDes0rAU5tKajTEe3Atn+Cf5rBc/NlOxTuMbl1gbW9UYd3+vVEuyizYo+FGHPkhi/9YLgHfGOQIip8YOu2kdwVkLzsmJ05K9ovPqYpr75uw7nFubu/r+54AM4SQLkPyxqUBCYD7mJ5rsiR5Cu832+/56/R8IvG1s0KIPf2gWDJovtoSNZRhEcSgoA9ABEy+atErAOuNvn9IHLxvts0JGJ0TjxwLBAOnFD4bMu7Zi5KBg22tmutSQtY9rJmJqde7eRRQ=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCN4ugGCV6OR+OHCPhx24IUwDpNObffJxXQHAmmb62stIdLH7jC963rKgetoptr/Vw8yZMkvd2l+7vybSbuCQq+WgIEeRTcGz8/2cQTQfoxhR9yg2YDeBBAF/7RHNRTNi1h+b8RzMDroWrDX+ENnxPGzL7d98FCeoIIb82J5uXoxXzLrOwD1Z1NynidUgpgNoEEWePCOxE0K4ZCMSJZ4yL37ohx161sHtv897ze6+q2XoD13pGMXZrVX1ODBbzR1mqcpTS5iv3E7L5tVcxt48F2Z2kZ+pkjKTHXSaegvwjjeAgNP+r34QWFZDlwTwoSRgKXSZNH4NwEoxMPkwmTkoLFlBfAIUCCb+lv8U6+wBLStXAnzkQ0sLZA3I10zhgfhz3xGL5o9KYQIqE0suUMz9vG4s0Hs3c+Y5N3SKw9G2iBWK7yowV03xL/GfKjN8IBgixlIdDybixSiK4vD9AQ3xDFPLEFkvfg4hegXNhFuGiH9N62xTxgYXgIuWt8xPrvkLsPX+oYiwsrM05RfCM44obfNl9+7pgtSySFl+xLwvuL0D/1z0PD3g3TDuCGje5iqaj3vCT1OV16nekYAFihmLZMiw3l5Nc4krJ7dBGg9lNSe/rGJ+dDmoEfBg7lGCEZx4AFL/xSq4xSgq4k2J79zk2DaxAMKE9JexBqm1lTN9+Poz6nwWAKlvSrez2l+/f0tOPZ/luwjZaDlMt3H48G97dmf9m/qfpL20TOLWxP5rludPQkFwe37+3V1KVMioGS75wd+UES5Lp0xPC+sg8ybd/+v0JTvoQW/74Ajv9ZA3WgETgJ0Xt/0QbVbo78EG2wcXVJzGT+Sv3sH+3Olt3qqUblD0Ixx0TN1JlbjJCIIa6zX8NphQULbfVRvWEhj4WgJGmlS8jQ0fbh4Z5iNs8JLyjPYVBW96YSVzBO9jNPYusUCQw==</Encrypted>]]>&DynamicFieldGridQueryWhereClause;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22d2Yfo4+KApF/QNiuOloUdM=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSBkj3sN+16ajQeA/Itv8RNVbQM57oetj21/Eopgj96jRcbM6X2IuraUTEKOGUWQRhcwO3VvHszUzdNTb2a2X3JN8gOqFPiA3yfxNCx+PAj15ASfkXp40CU+3uxh9Kzkln0=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqq3At2L3WQjYS4dMfV4Eai86qNAYjqdOPWI0yJR4zUk6rTUwMS3KSbYeHhmzfPuV/OQVTjor1X311KYcxuHQE+XhtWmQT/I9sIL3+ExX+wHMY+v5hugXn87BnUiW/h7PALO46DJGQj4i/FIHr1ul4JjZ1cAW9e1K/UA2kKc/JLz7o4AUrnXoy98MpcG2C+VpYyFSjwG7VX+GmwXX9JWEwnLmZxTZSk8NMU4MnmNnTs+g=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
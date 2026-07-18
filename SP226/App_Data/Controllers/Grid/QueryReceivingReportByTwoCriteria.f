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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=FastBusiness.Encryption.End&DynamicFieldGridQueryString;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTUg0H3Cr87JYfclGWTbzUR0TXXnJ7RD/OUC+JC/HY1FsASDvme8ciNwXz8iv/0dBc04WuYTD30yvUZ24IyQr3Kb581z1QBCWeG9K4YIOxV7Qa+OhsYObu/OBm0Si3tor2X7sV6HosDLlJsxAgmA3wcT8h/kuDiT7h+9CkzX3GyXJWYKiufkVSnnJ4mEuX7Q3AsUix1aOIvtUdDsIyZBBfuTncBtDpNa2pk0b7lZFkGIc7skbLTv6/nT+Ag4zOSbyhVIDThEj8+fcHqn2w9LBWN9xRv/BEPH6LLz2hgxWpoYtNvIeN1rhuTfE9j1IKwPI5pxytsUTh85JdPn/XcyN2i0iDzg8cOFcZRoirFDiQv2s6OdcIp9NwnuLo1x2rHHr0yUJyoaa2rQQ2NpEejyfPGaNxfgSPOni7ViOhnEkLHRnf9GpIG8NtnBCz2cZQs+epqEl29zuPDZYxW76Cz2KASwMRQkxAhKJX101459lrXuKrL6qcwiywIyySShKEoEu52U/2T1OCp0cjWecHitUMFCsPXDajJdvnrRTGG1InPOgeXSKrvKh8ska46vuHH0fBZo8YqdrxUVgrZ+zvuAjPWzWiWuOUkbmiakCwUKkUa5TTLRjOgr1wrI9a43r8UQpYwoMo9zxCXCu02dySM00Dnp2cxwIdtcFEUp5CS4Es6qQ2OqSJZBKRzQO/95K3m95zffVqlz/We2tNLgdY4dds7kw==FastBusiness.Encryption.End">
  
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

    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ncc" e="Supplier ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã hàng" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá vốn nt" e="FC Cogs"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
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

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá vốn" e="Cogs"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền vốn" e="Cogs Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ten_kh%l" width="300" external="true" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên ncc" e="Supplier Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên mặt hàng" e="Item Name"></header>
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

      <field name="ma_kh"/>
      <field name="ma_vt"/>

      <field name="sl_nhap"/>
      <field name="gia_nt"/>
      <field name="tien_nt_n"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia"/>
      <field name="tien_nhap"/>

      <field name="ten_kh%l"/>
      <field name="ten_vt%l"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN2YdPUfiUkjbqIrM2UL0eZ3TXBzzlIlv/CuJAGmPotc0Vp7BlDIeifm/2XvEz9s6V6m2lUzy9TaSHwg9QamMnvgJxJxV1svIiOPRpAidtwCFK3le+PaBd+hzgQ505ZhG+hf+yH9vF1PAwxuFDRP5XlE+CzvxgSyhBsJxdOxzsgGvU002ZCAkTipo3zJ5ThdW1OJF8EBaUsCNg0SkZ5BgpRA+3EUKMktNAUd32qj73RIJpLKTs73M7ZHAEmCje+eECS3TifI8bZkuJ0xplh1GiPTefxcsl4TCFUEtb/9yOOj6y15BvpnOJEdVSftkmrlNcfdZfC789+Snot0USQ2PYd30pxf+YMk9dp95FYrC2MI1OA8zjCEad2qkBXKGANkVNpBSvxpi+ycS0CaxhU73NeMODI7B0NeIKUEh4H0+ReEMPqovwSMMUwDvwCkWfm0KoHxji7C4Oe9f/yo1vsMWKFCvvQCaXO8zEYDceYNUkWKCg==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCN4ugGCV6OR+OHCPhx24IUwWR6sQeoLN9SpDacodzxcBaBqL1IMmBYYm0XNWQXkZlTx0vubuIP0qTKy5dToy6nYvkzey86w7WEVGZZOH/VCXorVMjfGRjVlokwpwj10yQv30qQG51tvmVdIC7twBYZcgC4kxzpAdAiqeY5inBl3GpC4PvK6SQM4SRm8KWgQEnB01x9QtBH9pk7DRNuAIo/swhiZ9RSnUA0Z2n1BYEHzqFVcoSVaiogYE09dwper0q5Z/s4zBWOnBwWyT83xq8TaVjpD0FIOlLsfQC4uudkZsby703aF4q0K7rySbSFrPjgBgl3wggPLs3s5IL/fSVzaQHq91LqftWlJ38jLCnKkMp5DobA0TS8XIuon7Tfkis04sJFl1flUqkczEhawgi/FlCpBrB7kjybIEkYkJUH3D/AnLtHugBG//+b0ZI/A50MUsEA/Z0nuXKL2n9xPZBV9/IZtcPjrA0xH0hkrbFBMf0VVIAJNyRArJgbMmd0K42eg99S19l7ZRAbVdNGcPNMXcWOS6yd87jvnj/VDBSg+xbApmQgEIX1NKFtvhGRH9oV+Re7oI6GIxAJNuOwwG3awOopqwqiOBPeLvsgx9GKTzLUqmbU+Gxi0PhtT48Iq8cChYARX2CfadHuW0othV/6Dgy0bII/0pH5RQS8fvAj9wv1OdaBb9iWAjILb2M5+TO/HfZUOSOF2HA9NWabda+qT5312IhqUenfOwx40WdG8JrroTfssoVFErCpWE0voIqAyMb5LGq/4a+amxbEP9Ro7CxCTYMofIDZ/t8MRiG8gS2/7mgxbruHxP7l7kgZs+LtbOARTslEWBVG2Gxo3DkYd</Encrypted>]]>&DynamicFieldGridQueryWhereClause;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFoAqQLQlBWpTPrZeMIfsD2LbN3HT8Qy5VXOYmQyjqLRHA42sy7rIDMcy7ltfD3BoDU85oBlJ4L2b95X2lpSy8M=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSBQsu8QmOI7ChWXlM/mcSOsiLfToAvGu8js68a9W4DTwzPpq2LvfS9oI7ScwbTVHXsOL6MLhOQXdVPbUFENJmoTrbOpRfDkj+hr4/ULcJ/dtA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqq3At2L3WQjYS4dMfV4Eai86qNAYjqdOPWI0yJR4zUk7gxpW24pS0eOSIi+gjd+LCb+R1elybV96trbB8vjs3vJb/CecXWKzq05fGCI90lCrO3ud3t0DdP68WeL6CsBosZKRdhFAfzLB0x3wU5R79ny9Ma+b+m304XIqTxTcQrkNWQkjZN9hY9XP1uf79jXYu</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
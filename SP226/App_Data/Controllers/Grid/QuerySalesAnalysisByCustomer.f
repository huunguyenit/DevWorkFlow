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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVTOieg/evw/3K6ThsSeWQtevgSB5nNzoG42DkNnQ/DfHOtEWdbKyHVfURp8Dk6hP5htTd9gD4jeYkvSk9Lf1HlxJs0UVI+yU1SsiP8MwMhDLwO/U5/zcXFjeZV1FS+c8h6hrqXv9sXLw8FdglAX8+ZoP+WckAzQzyvJkvLWYG8XvAFGtqJGI2WBnrQAL35+8SOwp8mFR20iNQ1j1ZknPsBZf9szlRebbFafZWLAWx0qQ5EB5kASxnQpaukQL565OinXzDKRdrl26Go6HvrkSIkEMeErBB5XjHmClKE6rCLamFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo khách hàng" e="Detail by Customer"></title>
  <subTitle v="Khách hàng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Customer: %c - %s, Date from %d1 to %d2..."></subTitle>
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
      <header v="Mã vật tư" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên vật tư" e="Item Name"></header>
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

    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nvbh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Nv bán hàng" e="Sales Employee"></header>
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
      <field name="tien_nt2"/>
      <field name="tien2"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_nvbh"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>

    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohnIgqoCFn6KX8VZPCU699dj8eRHkU2xxNSpqGY9/JU7FYAEmuywYud19iSpBG8TIkKqavvpaRWJz1q1wN53RIgG+TC6LwDKqXND5enp5uXPcXCOjJMNjjUUFwIOKxU6dmVotqnim17v8BTi5nXJI251dRk2Yc1JOoKkiB1RUjey4EO588U3vJzMcnAa4agEBFMk2DZaVNlE+xplTGGkLCaPhjx0f1dADZTCadOqg+Ghp6/qpP/RkY6w8vwFW9MDjt614sRiCqSqH/BGPI6aqA5f8aZsDv2q/5qPMBUr0aVII=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCN4ugGCV6OR+OHCPhx24IUwPw8qfnMXyYOyNlTv9S0P5MA9RZvEgQMOC9uy9rlJKoaiXc+sk4V2GvqGzlYhVxZRBkDfOj6uuijYRQPW6lC0iTAmCKEfQ9ho26fTZn22zR3YMr2jjwatOV/Slz0OpEOIe/AjKcTMjWw/fSLiuLBLDuNcJCxBppQSvHkEp7sBwafCz2WZxLyOKn9oYus30iWk</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWaChhhS14V2iMEt4LVzFrPO3qRGz8NyQ3vT6OB6shhVRHQuHyavUh2PCNsXB4S6jUSKcFoipeNg/1fXnLBAwcpHS3/0knKJXNXXDrL4JpWKQTT6ZzZmzz0msY8iDE2YrebauWI/vX/iQdlzgfyuzYqoT4HSte8vytEHLJHBKdfhIw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOarudXzFRBoZmhh30qF3/iqQPX3xu2PAI4oyh53qZpjNEhrYEx94TNDRC4M7fVhPKhLyAWKjK0jAL5zBuLqo5nFQXScLFEdollfibIWX3MvOTTDhE+9YeV69EaowbEfKjOCH9ZDeeOr/KIJ71F4AZsAv2Oal12u9r2vurstOv94Q==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
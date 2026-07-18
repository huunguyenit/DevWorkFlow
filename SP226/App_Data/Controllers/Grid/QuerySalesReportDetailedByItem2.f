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

  <!ENTITY QueryString "
declare @c char(1), @d char(1)
select @c = char(253), @d = char(252)
select * into #t from dbo.FastBusiness$Function$System$Split(@@queryString, @c)
update #t set data = replace(data, @d, '''')

declare @item varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @form varchar(32), @data varchar(1),
 @type varchar(1), @ma_nx varchar(128), @ma_vv varchar(128), @ma_hd varchar(128), @ma_bp varchar(128),
 @ma_nvbh varchar(128), @ma_kh varchar(128), @ma_kho varchar(128), @tk_dt varchar(128), @tk_vt varchar(128),
 @so_ct1 varchar(128), @so_ct2 varchar(128), @maxLength int, @ds_ma_ct varchar(1024), @ma_gd varchar(1024), @transactionList varchar(511)

select @item = data from #t where id = 1
select @dFrom = data from #t where id = 2
select @dTo = data from #t where id = 3
select @so_ct1 = data from #t where id = 4
select @so_ct2 = data from #t where id = 5
select @ma_nvbh = data from #t where id = 6
select @ma_kh = data from #t where id = 7
select @ma_kho = data from #t where id = 8
select @tk_dt = data from #t where id = 9
select @tk_vt = data from #t where id = 10
select @unit = data from #t where id = 11
select @ma_nx = data from #t where id = 12
select @ma_vv = data from #t where id = 13
select @ma_hd = data from #t where id = 14
select @ma_bp = data from #t where id = 15
select @form = data from #t where id = 16
select @data = data from #t where id = 17
select @type = data from #t where id = 18
select @maxLength = data from #t where id = 19
select @ds_ma_ct = data from #t where id = 20
select @ma_gd = data from #t where id = 21
select @transactionList = data from #t where id = 22
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" width="80" type="DateTime" dataFormatString="@datetimeFormat" allowFilter="&GridQueryAllowFilter;">
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
    <field name="ten_kh%l" width="300" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_xuat_ex" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aliasName="(case when a.ma_ct in ('HDF', 'HDR') then sl_nhap else sl_xuat end)" allowFilter="&GridQueryAllowFilter;">
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
    <field name="pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" aliasName="a.tien_nt2 + a.thue_nt - a.ck_nt" allowFilter="&GridQueryAllowFilter;">
      <header v="Phải thu nt" e="FC Receivable Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá vốn nt" e="FC Cogs"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_x_ex" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(case when a.ma_ct in ('HDF', 'HDR') then -tien_nt_n else tien_nt_x end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="60" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridQueryAllowFilter;">
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
    <field name="pt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" aliasName="a.tien2 + a.thue - a.ck" allowFilter="&GridQueryAllowFilter;">
      <header v="Phải thu" e="Receivable Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá vốn" e="Cogs"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_xuat_ex" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(case when a.ma_ct in ('HDF', 'HDR') then -tien_nhap else tien_xuat end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền vốn" e="Cogs Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kho" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
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

      <field name="sl_xuat_ex"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x_ex"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="ck"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_xuat_ex"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfd7snYrqgNeD8yQnGbHnI7odsD4lvXJCFQOmvhqIEIIPBSSOrrR7I+Ov1VSwQKUF+pALjHajGhq7s0Ia2yQXuIY1Z0ARavYWNLFlHeReEtVVQdCBgxb4xuSdt8+b5N+eRK7Dwqrq36+H1wfHWL4SIVwHOcy478dZogCdaVz7STfdlazjg05JhCZFjTkqwFoiObkieV36EPKDT7bGHZinhNis8t8KpFuI42GT8dGnipkaxbJJFW7RfIivD9WW0JuzqM=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bA9bnbayxu9njeeLf4Z23pVZi4F0xWofVhI6DW1wvck8xOvlxQZlldM3CudU+vo/zRHQr1NkVC/EdluGO/BPVJRuhb7lfjZoN2ncs54cChWyefwz16POlKbtvQX3MqYpY1tXh+1Q6s5BZBOkDw0HYqcOmhUhhneuoeXBio2y4PntNgWAuxDbYyGy/IWBx5qX6Dhvs8COJL5nFwdu9750bcdyYgq5rzkm7cBkHyRxp+FMCfMXqwxhZtcPBhR8soj3PilsxcvDrWROMit1loN/rX5adzQ7SFi1cEaA8f1hvLW8iF4e/+vPUEmZP7B5CptPgIZopc5C9GriKXLHHAyBM3Ol7zWtaRYAIGyvLog46DL9MMVsrej9Lh+yeGWe37OAwqLcneL0aodXaAtyq6xJuz4aYbJPYqe54ZzCHPNcs/DU4A2/poNbnryv1VgibCgmDUBMmBZObWx/4A+cC9ytBHq4+yUlYFjw78wAwS9f1v5Jrsz4ZfeJQX/EgpqMfgJJXVD1k0xJxTTdkOakt+tDqy7LKz787tAx6QnPhfqUljnQGYhOP7BtaDH5v/KEblHmSnMEcXdzJw+56qRuIJ/ZjXcbuLrtPZZrhylXxgCrWZbXIbyJwfsNTal/J0PIyKvaruYPfHZ+T5By3EcxbX9wJWc0L20s6K/0CPdwWqHP40rCAKlFkkjZ5IeYK17TPvvGm3mPeuTVlz/1T4UCZzyqpvBQKw5c9bwOCb35eWQm4ABNo7A+Z7SNpffpoewxGexbYzdbND/GTZf64/KHM8NxQcAA==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X5Z2dt0Kj3v7j0IkkZhdlRncExZ58376VyWJ336FV5wsS5D1DQLA1sE6/IYQqtXzdGVmBbTrkWTX+QkV1nCV/H/teIESApHeYOud03g1prNcae8NhWNXlO2mRyePP5ey/VuxlAirhylRZVpR3XFmuRSf97N4OjtNMmVxpEtPTtMnTz3TTas1zgrt0jAA4zfmZriMRNmngqd3jRlSp1Nhz0jQraSkE7JhTa8agaH9yj+K8phj0kiqZtlHv3H9OtnDXaOlxO/RexW1l2h3k+NPEXt9zNePsqxi/Fi8QykeGOqzQu8hCuwZb6cAuGErCjZEQxckt9zCroFzQh72qaxRmRlPpTgkV4//oU52VbfIWAaSfyujBIFbwFVe6EiLRDfjaf</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqi2XY6ce6ay3jAIxVKAbBoCdZtSn93eVyLdOG6kJc+zep3S/CiDCGmbSQJgm+LO+YWbzcJdjwgppNlIHbnonNxYlHDC2G27j1pl4H2g6HFAWtygug05E+Dvbt429ZqpxMoBrAK/BnfxHEX61X02Zaeejop82GqQ2UKy5A2WbsebnEO9Ras62/wiGDr0xLmqDQef5yRSRWyyKHrWga2fsUVJWQzok3j1a7C6S8vi+lewg=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
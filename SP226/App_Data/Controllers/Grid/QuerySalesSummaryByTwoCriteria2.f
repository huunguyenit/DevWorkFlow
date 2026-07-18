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

  <!ENTITY QueryString "
    &DynamicFieldGridQueryString;
declare @c char(1), @d char(1)
select @c = char(253), @d = char(252)
select * into #t from dbo.FastBusiness$Function$System$Split(@$queryString, @c)

declare @ma varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000), @tk_dt varchar(128),
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @tinh_ps varchar(1), @ma_dvcs varchar(8000), @maxLength int, @ma_kho varchar(128),
  @ma_vt varchar(128), @tk_vt varchar(128), @ma_nx varchar(128), @ma_vv varchar(128), @ct_theo varchar(128), @ma_nvbh varchar(128),
  @ds_ma_ct varchar(1024), @ma_gd varchar(1024),  @nh_theo varchar(128), @ma2 varchar(128), @ma_kh varchar(128), @nh_kh1 varchar(128),
  @nh_kh2 varchar(128), @nh_kh3 varchar(128), @ma_bp varchar(128), @ma_hd varchar(128), @nh_vt1 varchar(128), @nh_vt2 varchar(128), @nh_vt3 varchar(128), @transactionList varchar(511)

select @ma = replace(data, @d, '''') from #t where id = 1
select @ma2 = replace(data, @d, '''') from #t where id = 2
select @ngay_ct1 = data from #t where id = 3
select @ngay_ct2 = data from #t where id = 4
select @so_ct1 = data from #t where id = 5
select @so_ct2 = data from #t where id = 6
select @maxLength = data from #t where id = 7

select @ma_kho = replace(data, @d, '''') from #t where id = 8
select @ma_nvbh = replace(data, @d, '''') from #t where id = 9
select @ma_vt = replace(data, @d, '''') from #t where id = 10
select @tk_vt = replace(data, @d, '''') from #t where id = 11
select @ma_nx = data from #t where id = 12
select @ma_vv = data from #t where id = 13
select @ma_bp = replace(data, @d, '''') from #t where id = 14
select @ma_hd = replace(data, @d, '''') from #t where id = 15

select @ma_dvcs = replace(data, @d, '''') from #t where id = 16
select @mau_bc = data from #t where id = 17
select @loai_du_lieu = data from #t where id = 18
select @tinh_ps = data from #t where id = 19
select @ct_theo = data from #t where id = 20
select @ma_gd = replace(data, @d, '''') from #t where id = 21
select @ds_ma_ct = data from #t where id = 22
select @nh_theo = data from #t where id = 23
select @ma_kh = replace(data, @d, '''') from #t where id = 24
select @nh_kh1 = replace(data, @d, '''') from #t where id = 25
select @nh_kh2 = replace(data, @d, '''') from #t where id = 26
select @nh_kh3 = replace(data, @d, '''') from #t where id = 27
select @nh_vt1 = replace(data, @d, '''') from #t where id = 28
select @nh_vt2 = replace(data, @d, '''') from #t where id = 29
select @nh_vt3 = replace(data, @d, '''') from #t where id = 30
select @tk_dt = replace(data, @d, '''') from #t where id = 31
select @transactionList = data from #t where id = 32
drop table #t">
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

    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aliasName="(case when a.ma_ct in ('HDF', 'HDR') then -sl_nhap else sl_xuat end)" allowFilter="&GridQueryAllowFilter;">
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
    <field name="pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(a.tien_nt2 + a.thue_nt - a.ck_nt)" allowFilter="&GridQueryAllowFilter;">
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
    <field name="lai_nt_ex" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(a.tien_nt2 - a.ck_nt - (case when a.ma_ct in ('HDF', 'HDR') then tien_nt_n else tien_nt_x end))" allowFilter="&GridQueryAllowFilter;">
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
    <field name="tien_xuat_ex" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(case when a.ma_ct in ('HDF', 'HDR') then -tien_nhap else tien_xuat end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền vốn" e="Cogs Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="lai_ex" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(a.tien2 - a.ck - (case when a.ma_ct in ('HDF', 'HDR') then tien_nhap else tien_xuat end))" allowFilter="&GridQueryAllowFilter;">
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

      <field name="so_luong"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x_ex"/>
      <field name="lai_nt_ex"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="ck"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_xuat_ex"/>
      <field name="lai_ex"/>

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
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bA9bnbayxu9njeeLf4Z23pVZi4F0xWofVhI6DW1wvck8wbmjJ6YjSsz0NPpNb+MFu+JaZUfj//PxixRvqnIC31fXOjGVCxUY/67ZtGISKD9HnN2L139LiBVogM54Ttx0wXYyTSJNlC6hiJq7Bjxgm+eJbV6I44E4++5ayvoi84XCkdGOjmEhcHE6pzUbPnwu1TN/SjtSqmbTD3yKYYX0R61VL4W47KtPw48pue9zAFlor3ku1pcksiB20oHazDh4Ckd78skQCwFFGs4gGhj4WALe9eXuJOXCRcyvSF4uKllPE6KUCTTGovpfLAfkDK2jjfhIdsTshKmvtxa8eXa6X9C3ngfPUWJvt6dVmu90mAEFPxaA8TGeVork/b7Wlr16XWYvvbEXpZkUksih540PVQI001CnHf/WIkF7IxGaLjZSbnHRy080aKxkRU/cDM3jVb4hFq6224mmfZfGtJOnYTSv9YM+n+ee6xsmQ4lBvcInfOSXj04Qbq2gg4L7+zCfcdh4jKTk14REPU/Z9KzQ3+mpIc3cRlEkSX+++RBWxQgS4ZaHgY2p/7tK/JdhCJ6DHHKF3RIW0Elj4DzlZ9Vmh4vR1Yy8I37oyXi8BB0Y2siT87RpwTVDPGSuxDkhvNtmmEJGkmKfpdRoEYjRF4qeJcOFZDjPKFmvJn25VhUJK7ywFWLfMC50QxzlwVvdJxufHlTCK8iPRquIUD44IKa/cyOuksHcl6hQ/ZWT8bEixqKO1C1JtLolf07i/mMaG8mUrkwQ/rJfQTbPaTp81WRzOxFjogcEefUp5HOuDE+5WdMFqUDRKdzjMNOBRK7HltPsDSD9qYG8RiaO9zJl6Sc8VBzfbY7zQ1xEUuv7FdWxFGtt76nEGc2DR0zdJ6gR4G00z97u+cIzsza+MI7kAxwfUBTWaqFe9XNC4eDCAVC5ToopkYWtgIJLFC/ALrMImuEkXFMcAd+1yDi5bkzDIGXY1kjw==</Encrypted>]]>&DynamicFieldGridQueryWhereClause;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFRKD8I/mCUAirKnhHMH9Z2qwS9qOydmrRbbAoBwyNnmY/gXS2dvzQ5cS6V1d9KLXNb+wAchAd3cqOuEgn4ttniOiFv8LNWI+gzurBivSY5LsS/MJltPPVUM7aW5LIbUaK6GnowfFESC1HstgJWCd0VyMuQwIFyX9APNzjygVh2dGCGunxxipxeLvBl6f4Nox+qTE6PPhz2mY9wsOYrgcho=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSBkj3sN+16ajQeA/Itv8RNVd8+dPz8fAHz3B9XkIBknSBd42TF3Dz9Rmv3pv9+r/0Zg7BsQm9qJ2LxrurGm5taqJX3uct0d0lzkmOJ10XUgxY4mk9skXuwG6+QGR24RfjLeT8pBYyIbk3wNn9kgmrNmCoYLp7z6h1IxUxO6fmdx/Cd88mQdUaqqcBTpMBlU7ooiHANuhOPAmHtPdKzJAJ5hyTb0Tk4kn6FGrQle5LXGOmtA2dVwYKygQ2a1Q08crkT3z6/KaAHpVx0D49hK8itL17Io56ciqj80phe8YB2GGHQ6A71jcOCKK7dK4AC48NfMyv5MKh7/wQSrP+ed+lkg/O1/MdpZh9CgaG+iU6zBVa/G+S6vpXS4sbkalGpcYCSqsJ3Jgmf846oeBzETjkEqnTHl9hp+ulqiqTOjNque91dY5rN12hlPWGsagcmo/Mw=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqq3At2L3WQjYS4dMfV4Eai86qNAYjqdOPWI0yJR4zUk6rTUwMS3KSbYeHhmzfPuV/OQVTjor1X311KYcxuHQE+XhtWmQT/I9sIL3+ExX+wHN44iV+gRvqOgdlgyPz2sneatIMveGsDrDLQZwKso6+HSmFR3B7x9T6wmR2wvo21PcbQYTsiCM1ecmjrSkYB9HmMBHam/ulpw2RSRZlC68xI2t/2BKNv+IVvra4U8YjEuQ=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
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

declare @ma_vt varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000),
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @tinh_ps varchar(1), @ma_dvcs varchar(8000), @maxLength int, @ma_kho varchar(128),
  @ma_kh varchar(128), @ma_nvbh varchar(128), @tk_vt varchar(128), @ma_nx varchar(128), @tk_dt varchar(128),
  @ma_vv varchar(128), @ds_ma_ct varchar(1024), @ma_gd varchar(1024), @ma_bp varchar(128), @ma_hd varchar(128), @phan_loai varchar(128)

select @ma_vt = replace(data, @d, '''') from #t where id = 1
select @ngay_ct1 = data from #t where id = 2
select @ngay_ct2 = data from #t where id = 3
select @so_ct1 = data from #t where id = 4
select @so_ct2 = data from #t where id = 5
select @maxLength = data from #t where id = 6

select @ma_kh = replace(data, @d, '''') from #t where id = 7
select @ma_kho = replace(data, @d, '''') from #t where id = 8
select @ma_nvbh = replace(data, @d, '''') from #t where id = 9
select @tk_vt = replace(data, @d, '''') from #t where id = 10
select @ma_nx = replace(data, @d, '''') from #t where id = 11
select @ma_vv = replace(data, @d, '''') from #t where id = 12
select @ma_bp = replace(data, @d, '''') from #t where id = 13
select @ma_hd = replace(data, @d, '''') from #t where id = 14

select @ma_dvcs = replace(data, @d, '''') from #t where id = 15
select @mau_bc = data from #t where id = 16
select @loai_du_lieu = data from #t where id = 17
select @tinh_ps = data from #t where id = 18
select @ma_gd = replace(data, @d, '''') from #t where id = 19
select @ds_ma_ct = data from #t where id = 20
select @tk_dt = replace(data, @d, '''') from #t where id = 21
select @phan_loai = replace(data, @d, '''') from #t where id = 22
drop table #t">
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
    <field name="pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien_nt2 + a.thue_nt - a.ck_nt)" allowFilter="&GridQueryAllowFilter;">
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

    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập xuất" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
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
      <field name="ma_bp"/>
      <field name="dien_giai"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bA9bnbayxu9njeeLf4Z23pVZi4F0xWofVhI6DW1wvck8xOvlxQZlldM3CudU+vo/zRHQr1NkVC/EdluGO/BPVJRuhb7lfjZoN2ncs54cChWycOUGHbIwF9XjkFNJONJcukVDG3fobK+srHv+Erp0y5XUJXN/dy5pLqtdUlAPbnrQQSjcpfXoUdEsnh/gggv0RU3rF1FcltFaqB5e+YwEa6hm40MTca70vavSDP22BGTtQXlboVoSxSvtlbTFL2RR63cTv8F5NJE4+HftFWfHx6FQg5cXCRhDII842z/k7056nNSkOSAdtzVZRFiRyOehZtomm1J8gKR3xN8mPlSLf1Cl8zVrpLRSiYAjPBWy6lbJRXT8rwjf8UHXYGh4kQ1uaF7BLGP/sDTMIWQmEmAb9AhlujnKM/dKY4Jor4CnZACkJh3LWfsn2XrnvVUx0N+5zrnvD4XHGQCDc4hQHgKOQC5+tpsxNv+6+UwAAdRdjNit9ZBtlJU5qY3oCk+Se3qE3X0HZzxl98gO91+6AO19Ku6NYhP7UZ2DZVEOYa6cey7Z0v5fVXpemdIIBydIqCPc3SVUrowlCLUvbmW89gGT/FsvAl9R/o99fPZHA1dC2mvLYBprjn7ndd/vJfIdfROMY/uEmfF2u3PECGJZNx8y3qhn8r9RMx8yzrRmiQ5ZCe+vfqweSL7W8+kBgywWCqPnbZv8AO2VVW65RhrLM/btWAw1FqmmkREsOAUH9PTnh0CjY=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSAcc2lqNSBpaIYV6uOEYrchexkksf6f5lJFWvURRQQrVMDYlIT1moix4XddXgziDMncubdyJXfPXw5SjoSsctcf/QkwYrPdRGY4xARaCqxcEZDfG3fgJ4GVlwioQOR67iu3EGePUbQilu4BRUsXrXC9leVvbkz+r4iVyKFio7KOj9EAXNtCLCmN3RJSHTK3rkY9We7gJM7Z8XSKc5JI+xt82W3NAGI2YLXX+kFrYNxKuqj9ERSWOpTXmqfBC7gSwol6nw3wIsWCC5r+9MJuLS5IStZe/KBCkDxC2uF/C2snJL80YVQs5m4pnO0mUN7gEykHGqj6TmCDrNHQCWPQaBAH1LzdMssP68tZPLkBLZvstA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqi2XY6ce6ay3jAIxVKAbBoCdZtSn93eVyLdOG6kJc+zep3S/CiDCGmbSQJgm+LO+Yc2oIqDBo5BL/8wQrEM6ZU25U101TffZTYbfCBy30Th1TVmhBNvfSDORxccH5T4GsFTJaGyU9iezN1mXXcjTSLIunikGq+cIAPhN8hUHa2uOySRWyiUbBLRNIK7xJTsz3fw9viCFJgFq2GGzLOHR8fOR6jyUn+AQ3222yrw56n2g=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
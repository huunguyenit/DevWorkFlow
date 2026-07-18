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

declare @item varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @rType varchar(1), @rPeriod varchar(128), @Count int
declare @ma_vt varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000),
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @tinh_ps varchar(1), @ma_dvcs varchar(8000), @maxLength int, @ma_kho varchar(128),
  @ma_kh varchar(128), @tk_vt varchar(128), @ma_nx varchar(128), @ma_vv varchar(128), @ds_ma_ct varchar(1024), @ma_gd varchar(1024),
  @ma_bp varchar(128), @ma_hd varchar(128), @tk_dt varchar(128), @ma_nvbh varchar(128), @phan_loai varchar(1)

select @ma_vt = replace(data, @d, '''') from #t where id = 1
select @dFrom = data from #t where id = 2
select @rType = data from #t where id = 3
select @rPeriod = data from #t where id = 4
select @so_ct1 = data from #t where id = 5
select @so_ct2 = data from #t where id = 6
select @maxLength = data from #t where id = 7

select @ma_kh = replace(data, @d, '''') from #t where id = 8
select @ma_kho = replace(data, @d, '''') from #t where id = 9
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
select @ma_nvbh = replace(data, @d, '''') from #t where id = 22
select @phan_loai = replace(data, @d, '''') from #t where id = 23

set @Count = convert(int, @rPeriod)
select @dTo = dateadd(day, -1, case
  when @rType = 1 then dateadd(day, 1 * @Count, @dFrom)
  when @rType = 2 then dateadd(day, 7 * @Count, @dFrom)
  when @rType = 3 then dateadd(month, 1 * @Count, @dFrom)
  when @rType = 4 then dateadd(month, 3 * @Count, @dFrom)
  when @rType = 5 then dateadd(month, 6 * @Count, @dFrom)
  when @rType = 6 then dateadd(month, 12 * @Count, @dFrom)
end)
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết vật tư" e="Item Detail"></title>
  <subTitle v="Vật tư: %c - %s. %t, %d2, từ ngày: %d1..." e="Item: %c - %s. %t, %d2, Date from: %d1..."></subTitle>
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
      <header v="Mã bộ phận" e="Department"></header>
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
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x_ex"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfd7snYrqgNeD8yQnGbHnI7odsD4lvXJCFQOmvhqIEIIPBSSOrrR7I+Ov1VSwQKUF+rIMfMVtb+FN8hqlv52HqD3apF5AEK4GC4PXeZMF6XjBorqNA3fCzZGKd5LpqaPSL92Ewk2e8FrQuirCrEFbbusR2TWNPMtIT+aJPb3H8bA51j56djn/PhNoUQ0pcgaMluJZ1O+atjT1qQigcLIJyvcl0OPEDNkcWC13Zk/a8hyV5oW6vJGXcEITgFNGyk3xmk=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bA9bnbayxu9njeeLf4Z23pVZi4F0xWofVhI6DW1wvck8xOvlxQZlldM3CudU+vo/zRHQr1NkVC/EdluGO/BPVJRuhb7lfjZoN2ncs54cChWycOUGHbIwF9XjkFNJONJcukVDG3fobK+srHv+Erp0y5XUJXN/dy5pLqtdUlAPbnrQQSjcpfXoUdEsnh/gggv0RU3rF1FcltFaqB5e+YwEa6hm40MTca70vavSDP22BGTtQXlboVoSxSvtlbTFL2RR63cTv8F5NJE4+HftFWfHx6FZ/lbdfh6M8sn5Uaxi/ySBCiTnvj3Evms1VPmmmA6JGEIY9A7eKfxqmYpbSQ/n6BXADhx56jYv8Vvx+95czyn9W8pcXEhmj/toslkldO+txxenT/ltK+LIl/vYwPGqE6o+EjfHNZ+OcH+DbjQZq0BSeDlLcu6zitg+Yl71q/UhR6kXNVC0kRUmjq5QO2WNvL55X8+CHY+WPwn3XXfMRxQv/CC19QsnNhH6oo6UZ5qy0/JtEJJy9Mz85qk5t/y2klMMORpyY1OmoxqDnajkmr8nHiTaYLRd+tip55557cV7iiWjsyFsz4krf7L6+xrOKEm6lIYAs0UQJ26RD1C4mRAVYwbgSQWouFUPdVLaNjskVBkHmWv+O3s31TGi7JjscUXi8DBe1L+mJlUmpUFQUVaPqVrkU9d1SWlOaJH66ibe34</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X559uRh/go+xogGJXqRlARzz5s5xr8JkmY344cvaJ+2Q0/E1F4lDcUBOZrPtpX6gYJaAaiJ8VtCP96u8CpT4Ba5NFy/uwgP1qqUrcsB9olTKOX9YwnpEPqlYQeBfuio1kkxw33t9AByag23bXqzm1boNr2qKPfEQL4QmcxCokfDZEpiW8cJRMzEPS9DEUcNzgT7mdtXqvQczfOoi7nQ+bcg1UQijVYFKACiIGz8+/Y60T1b4blqCB9Gm//o4/oSLpE7in9AUxrGQO6nUMo4uzCY335tTJi8qkbWpcUnuldZ8WFCbsFHYnKYHMt16NXpnAzBb7JPb8W605ncDjBzZc4tmhgGa7OfvgeADmIu7OxJ+wRgs0If6B3W7s389vX52Jd</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtvnBus/kg8ewstuZRlJDog2gXfzSddFb5luD6xQw+WpbAA0kBpcvrwxeMayHJFbO2+qflTuWYXsX8gw50x9rk81ASAF/vmblbfK9/ANh1lUmOcMPGGkbvQk6JjdURNTXf131sWc3L6KQidd7dTRZbHH5cendSfU9WZnxMuRmWpt/+X+NTiTXXNpNVbXWFfe4+JcmSojGqd9hBNoW3wZhfp+d/lSK00TdF6q7uwfevc8ee6L1zBc0yxAzDZnJyNSQIVKyp9YCu7Ky/zNaACHX1g0zApq0+/SQF+b9p/Irrtze8A+uRso/YQy4ePIMj3X/K63NOc/c34ouzF1nIsP6hr+n4o7fqCD4/YYGQiZcciMSPl40krmVwiDIWk573CFP2d936bLR0gvvPZgxWcXOV/tjidz61fcsmyXRxhPwJiXwU2xZdoXyYPl8a5uwnQf+buC7QusM/7XktBH5tbsgbstVl8MkpDvFdoKnfcIerxqwowkcKZjmd+CBsRkpCrGBC5xhN/40L0Ng9GKaE8ODC1G42j/fcdgkvIZlhDGTFh/eLU0lDlXIZqMIP5CwBP1Y9NipEgbq9iz988OFSmM8YevzQMC5uMhfJl1bMGWpK88x6uLdq2Af0NcXfcW4R0KUX9goEFIcRi+qed2/L6Qv+ZS7esREddyKOr4bzGFVmrdA==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
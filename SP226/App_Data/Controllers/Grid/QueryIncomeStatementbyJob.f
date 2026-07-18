<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY QueryString "
declare @c char(1), @d char(1)
select @c = char(253), @d = char(252)
select * into #t from dbo.FastBusiness$Function$System$Split(@@queryString, @c)
update #t set data = replace(data, @d, '''')

declare @ngay1 smalldatetime, @ngay2 smalldatetime
        , @ma_vv_me varchar(32), @ma_vv varchar(32), @ma_dvcs varchar(8000), @mau_bc varchar(32)
        , @tk_no varchar(128), @tk_no_du varchar(128), @tk_no_gt varchar(128), @tk_co varchar(128), @tk_co_du varchar(128), @tk_co_gt varchar(128)
        , @DebitAcct varchar(1023), @RefDebitAcct varchar(1023), @DisDebitAcct varchar(1023), @CreditAcct varchar(1023), @RefCreditAcct varchar(1023), @DisCreditAcct varchar(1023)

select @ma_vv = data from #t where id = 1
select @ngay1 = data from #t where id = 2
select @ngay2 = data from #t where id = 3
select @ma_dvcs = data from #t where id = 4
select @ma_vv_me = data from #t where id = 5
select @mau_bc = data from #t where id = 6

create table #tmp (tk_no varchar(512), tk_no_du varchar(512), tk_no_gt varchar(512), tk_co varchar(512), tk_co_du varchar(512), tk_co_gt varchar(512))
insert into #tmp
	select tk_no, tk_no_du, tk_no_gt, cast('' as varchar(512)) as tk_co, cast('' as varchar(512)) as tk_co_du, cast('' as varchar(512)) as tk_co_gt 
    from v20dmvvct a join v20covvct1 b on a.ma_so = b.ma_vvct where b.no_co = 1 and (b.ma_vvct = '' or dbo.ff_ExactInlist(a.ma_so, b.ma_vvct) = 1)
	union all select '', '', '', tk_co, tk_co_du, tk_co_gt from v20dmvvct a join v20covvct1 b on a.ma_so = b.ma_vvct where b.no_co = 2
  
  select @DebitAcct = '', @RefDebitAcct = '', @DisDebitAcct = '', @CreditAcct = '', @RefCreditAcct = '', @DisCreditAcct = ''
  select @DebitAcct = @DebitAcct + case when tk_no = '' then '' else ',' end + tk_no 
	, @RefDebitAcct = @RefDebitAcct + case when tk_no_du = '' then '' else ',' end + tk_no_du
	, @DisDebitAcct = @DisDebitAcct + case when tk_no_gt = '' then '' else ',' end + tk_no_gt
	, @CreditAcct = @CreditAcct + case when tk_co = '' then '' else ',' end + tk_co
	, @RefCreditAcct = @RefCreditAcct + case when tk_co_du = '' then '' else ',' end + tk_co_du
	, @DisCreditAcct = @DisCreditAcct + case when tk_co_gt = '' then '' else ',' end + tk_co_gt  
	from #tmp
	
	select @tk_no = case when @DebitAcct &lt;&gt; '' then substring(@DebitAcct, 2, len(@DebitAcct) - 1) else '' end
		, @tk_no_du = case when @RefDebitAcct &lt;&gt; '' then substring(@RefDebitAcct, 2, len(@RefDebitAcct) - 1) else '' end
		, @tk_no_gt = case when @DisDebitAcct &lt;&gt; '' then substring(@DisDebitAcct, 2, len(@DisDebitAcct) - 1) else '' end
		, @tk_co = case when @CreditAcct &lt;&gt; '' then substring(@CreditAcct, 2, len(@CreditAcct) - 1) else '' end
		, @tk_co_du = case when @RefCreditAcct &lt;&gt; '' then substring(@RefCreditAcct, 2, len(@RefCreditAcct) - 1) else '' end
		, @tk_co_gt = case when @DisCreditAcct &lt;&gt; '' then substring(@DisCreditAcct, 2, len(@DisCreditAcct) - 1) else '' end    
drop table #t
drop table #tmp">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết vụ việc" e="Job Detail"></title>
  <subTitle v="Vụ việc: %c - %s, từ ngày %d1 đến ngày %d2..." e="Job: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" aliasName="a">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" aliasName="a" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" align="right" aliasName="a">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tk" width="100" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Ps nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Ps có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Ps nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Ps có" e="Credit Amount"></header>
    </field>

    <field name="ma_vv" width="100">
      <header v="Vụ việc" e="Job"></header>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6UmzH1aZnGeUGAWthTTNavY2QBF7Dbh9DyKzdjEjRubC3X4xZL+Y//x94XCw8MFatZe4uLhDMQ4kIAy8TymYq3oGy7DNXtYNIg1wBvCGjDrrw9oUa7jtdIU8610mrt2YjA51A/xnZvkKpPb6pQnIYs9BzN4hTSuizd32ro7i03EPEadf1Qy84AtAZwd8SZ5Q372Zipg0jJVHxSZjuB+ir3Tj8G8/e82zLpvDTxMuOLSi/6YriyfeS6+a+Wz8kU3KyiYikZ+/cJTKN7Qrr5aWxz+dK3aLtlOdSt/r69Lni9xDKFznDt98jfaJ+zLwHjhMH9gnLLx57t1eNBaHzkcsECo=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VPkMgR0amiQD198eHuwUMieaukUrh5uMxiIVXQz72LeFdBdL3eIgvM8LF1N68wsTi3M8lyFn8UwCDfJG7RiN+68AzfAROJPhRHlr5EeZHLv7KMBpXLKbJKbd/u/hzV5wOcZ9WIY4nMAZwEzQ7zaFvwxoCFVbmbEBKL9GtZFfVavSsHquILcrDfsivNmMisdebJz+LRDiOMTrkWJu/KL0uCSACM1wIBAHRqjxkzrBbGTBs9Bh9Ws0dLp2RG0WB6PenPvdcPN7bZYEDwx8pnJacXNZqDxSjcDQ75x4vdF9XjNFQueZJyUdh0VmhIovUC7WaZivxUPfmMHRlNNzdvS2kOWNQyl35kpVDHpckaBtBX5EPPqSzGW0w5TUYLs0zs5MEAJJ7cQ91seqojJCII31Tymr9Qg04uvrQuw4VRvXdP0+cutCZNNmYkqtxH4uEPebkvU4MYwCy+Hw7agT4JtQUCdv5Q7O2mtIDaHcCNpWPbvbzfnNMTjrv8EK0z0v1tnnft97wgisw0ub7KsSWk0S8h2Qvn8Hg9+xHfOLRa5ayGIdhjAGmTwjhXWdr44aVDyur/gwmti5s4nOgmehm8bgpWITZXWxgNQVpWGF52/3TT/aJj5KN4i/OkKjEoOvX0sE41naF5llDSLkE27i4yT23W+UkscVlvSC6DDHwGxxZSHXU0FQ1XzBlHTw5IotyPs2gIIl4/fIw3An4V9W0YC6urvPxk6bpOcshEHoOwYpu24gCPoVFRlkQXBqfJvVb9ggCjiGjHdxwpiI/+v/M3mJOk=</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Iz2NPqGfBS6oYvyI1TxoO3xaOjDRJ5xNwOCVQ/HND2b5MSGtLjPfK6T0NHJec+/LFOi3z9a6AwcYhNQFVWlW8oIgUM/ukaWrDaqTemiSmFmM9oKwbZ0kkiU6FeCb6QqESIeUyeLH8rfO4aAV+DNtGwwSzmw8H2DdiuZsVd5GI0eX8DJpcEx8YMLeM6+x/CBajAIzZFxhlO1DpAn58bTeASrm+WpoS0qXKskJBWWJxUXqSpUIGGIko1jwqLULjuUCFqvRQA/cYksWyRhDCcsYjqUdFk9Aoymu7Tpc1v5VhoFG1hFLgiY6IihljjCPN3A8R+7Gybw43ahsyVQxjAYGvM=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
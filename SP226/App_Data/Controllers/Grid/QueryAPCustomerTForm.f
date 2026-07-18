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
declare @refAcct varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @form varchar(32), @data varchar(1), @type varchar(1), @acct varchar(128), @cust varchar(128)
select @refAcct = replace(data, @d, '''') from #t where id = 1
select @dFrom = data from #t where id = 2
select @dTo = data from #t where id = 3
select @unit = replace(data, @d, '''') from #t where id = 4
select @acct = replace(data, @d, '''') from #t where id = 5
select @cust = replace(data, @d, '''') from #t where id = 6
select @form = data from #t where id = 7
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo tài khoản" e="Detail by Account"></title>
  <subTitle v="Tài khoản: %c - %s, từ ngày %d1 đến ngày %d2..." e="Account: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>

    <field name="ma_vv" width="100">
      <header v="Vụ việc" e="Job"></header>
    </field>

    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>

      <field name="dien_giai"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="ma_vv"/>

      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6UmzH1aZnGeUGAWthTTNavY2QBF7Dbh9DyKzdjEjRubCMmG5sTDqtGlM+6jOrClBA+hnOg+xwc7YWlyQxr+sKzI/ezCk3uK9cWENkCNEvlp7m/mzrRjU2xAuaUYf+ADOFXQ0e1/4SQktcNBdO/Xwb87/hbPvHfvrsrnx4Jfya72BaN16B9k8dsL+skHG0v05YLs/AIfOZKckkFM++L7t235h785lMM8ywrNEmcGTbQGAq4VUNmFgHswffjYRcQ0XQVSNZVit/LA0KwAWWYc5AbGLp5TC+/KfZxM9jq14gJb3v8nV9zlva7pUiu5gluWpSPKB/bWLAyk4yormyyMR7Bs=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VPkMgR0amiQD198eHuwUMieaukUrh5uMxiIVXQz72LetvoZQaoFMRaB50UGOY9brWqoGxoyEDLoKFP6E4DFwHxElPXPBtrMSpjNkUIY4YxHP8gWlcclHUVtwIfVOI9fGsSPTBZoM4OTL7LLpzvS0c3anLU3agToDoNtK8hyN4Feh1yG0isDTsrBlukY4/Phs34egdiYL3VQSqKUzPz8CwgPcxj4VK8hTfvfuxEt8EMSovXS97wF31Y5QBpq6t0mOhREQQpgjS2KZT9Wimqe1VbWrJEEoA9miCXHrLLE65hWfCxZ0uKxSMJTlA3mPa0GWtYcDvrhLKGpX78pPMtpiCQqsLgmqG+ZDpduwXSlLJRdttfHQzrWNkYPcvZ9qPb3ZjqB+b9DshiEDmJKRq/sUDHiVzTttvbEE2RMBYUWZGGL</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Iz2NPqGfBS6oYvyI1TxoO3xaOjDRJ5xNwOCVQ/HND2b5MSGtLjPfK6T0NHJec+/LFOi3z9a6AwcYhNQFVWlW8oIgUM/ukaWrDaqTemiSmFmM9oKwbZ0kkiU6FeCb6QqESIeUyeLH8rfO4aAV+DNtGwFdWgPFz/zYPQQ3CEaFdEAQdBlrsXwP7mcW+ir6iT2H8YEPFcTR8+WZW6CGFMJvbPnTfGIvHPqYbhs0Zznut5VRkclvNuU3w9MLWdnKUYWXSYHWIBMwkUPDzToOCkpZzi2bFdYmRPXIdt2xUNM4ggfwAaslrhFFJO0Ju5cIo6XJGVGtwDWfQm+hd5q3Vgv8NI=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
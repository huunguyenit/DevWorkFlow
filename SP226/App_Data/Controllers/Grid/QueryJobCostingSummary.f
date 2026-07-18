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

declare @vu_viec varchar(32), @ngay1 smalldatetime, @ngay2 smalldatetime, @ma_dvcs varchar(8000), @cach_tinh char(1), @mau_bc varchar(32)

select @vu_viec = replace(ltrim(data), @d, '''') from #t where id = 1
select @ngay1 = data from #t where id = 2
select @ngay2 = data from #t where id = 3
select @ma_dvcs = replace(data, @d, '''') from #t where id = 4
select @cach_tinh = replace(data, @d, '''') from #t where id = 5
select @mau_bc = data from #t where id = 6
drop table #t">
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6UmzH1aZnGeUGAWthTTNavY2QBF7Dbh9DyKzdjEjRubC3X4xZL+Y//x94XCw8MFatZe4uLhDMQ4kIAy8TymYq3oGy7DNXtYNIg1wBvCGjDrrw9oUa7jtdIU8610mrt2YjA51A/xnZvkKpPb6pQnIYs/Tp8DLBYpoBFs5NpmVJk+8Sx3PchFYYrJnRww6mjSjvTlcpmWMhxdFkN/h2H8BHSkNEEI7DXbFxPjSGG9N4jgW2au8SLfc9olBfyh+ORY4r47wmjaLiFYbPi6c9lhuP/UTvW45Y6vfxvxyCgJGrQrvc6DN1XwBYcPBG1QAWsvhstMqCTZvtLAR6UOyAj2cZeE=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VPkMgR0amiQD198eHuwUMieaukUrh5uMxiIVXQz72LeFdBdL3eIgvM8LF1N68wsTi3M8lyFn8UwCDfJG7RiN+68AzfAROJPhRHlr5EeZHLv7KMBpXLKbJKbd/u/hzV5wOcZ9WIY4nMAZwEzQ7zaFvyhjy50HRPGBj+lLUifYmCwOxQo9WbDvYF2r8JFlXQsfg++zruufaGnbh31bYpvI8EDlM63CHriYUSxq3xT+agOpm6Iwo9DZfJiKNigqbBUySc9678nyQc4ha/hbucoM0HwbQvSJfWqDl8HCAriTTko1O3hefNRbZd5bJy5hYPU3qdt1GUAgimBNU5CmISj7Db0lyitJXGX0PAZ/QAuHxltqLoDiBEyOyrVrSE/ofJNsqc90ft6ALh8qEMxG5k0AV0+II+/uBmqIfonKotPRbJro7GxcsgfgG+E34votSQIHy3XrfsmXJkqIqtz3xLwwUrNY+/i7Lj955zHh3DTMF/pbLgwPsYQJXD1aTBiqShq+POjP567z/3pVR/K/HJqOEiAKfGsRI0vzuEjIE3I9N7KCCYwk7R7Os/Fv5Roi8Y1+xORl3jbNZzhDVREZHtLonjTnUKc3zp4WPMDgHVm5qk5xSgm5wydFbQIWT47xJeemeHMeQHtBwm8smk+NDy/1k+ZEn0hkaX1i3K34Ho4+hshPqnByyaP8jT83MCuOzioYg8FD2SfZ8y8eXARZExCRRfA2f+XyVlt1JTfDBwRZg8vlL/a4sVmZsOHE0g/eiMKV5nV3ydhM8XnTyv3rWdIl3Zm5ADHb35e4DmFZSj4W1E8S84WP91mcYvXK6a9zWErGgDozNNdK1K5sK3z32BYj6ocLdDECev3fc1nm4oqu0EqIVLMMZwT7WPR4O9XfwbO2XrboYb6Bxn0i4LGlDHuXa820xxsY8bHGkiqfRbGkYuvULBexgFxiqSEUhrP2eR4mQ==</encrypted>]]>
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
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
declare @xDetail nvarchar(128), @groupby varchar(128), @dateFrom smalldatetime, @dateTo smalldatetime, @reportBy varchar(128)
	, @groupby_yn varchar(3), @type varchar(1), @unit varchar(8000), @form varchar(32), @dataType varchar(1), @voucher varchar(128), @revenueAcc varchar(33)

select @xDetail = replace(data, @d, '''') from #t where id = 1
select @groupby = replace(data, @d, '''') from #t where id = 2
select @dateFrom = data from #t where id = 3
select @dateTo = data from #t where id = 4
select @reportBy = data from #t where id = 5
select @groupby_yn = data from #t where id = 6
select @type = data from #t where id = 7
select @unit = replace(data, @d, '''') from #t where id = 8
select @form = data from #t where id = 9
select @dataType = data from #t where id = 10
select @voucher = replace(data, @d, '''') from #t where id = 11
select @revenueAcc = replace(data, @d, '''') from #t where id = 12
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết bán hàng" e="Detail Sales"></title>
  <subTitle v="%s: %c, Từ ngày %d1 đến %d2..." e="%s: %c, Date from %d1 to %d2..."></subTitle>
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
      <header v="Mã khách" e="Customer"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã vật tư" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nvbh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Nv bán hàng" e="Sales Employee"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien2_ex2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(case when a.ma_ct in ('HDF', 'HDR') then -tien2 else tien2 end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt2_ex2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(case when a.ma_ct in ('HDF', 'HDR') then -tien_nt2 else tien_nt2 end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck_ex2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(case when a.ma_ct in ('HDF', 'HDR') then -ck else ck end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu" e="Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck_nt_ex2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(case when a.ma_ct in ('HDF', 'HDR') then -ck_nt else ck_nt end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu nt" e="FC Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt1" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="b">
      <header v="Nhóm vt 1" e="Item Group 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt2" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="b">
      <header v="Nhóm vt 2" e="Item Group 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt3" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="b">
      <header v="Nhóm vt 3" e="Item Group 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt9" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="b">
      <header v="Nhóm giá vt" e="Item Price Class"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh1" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="c">
      <header v="Nhóm kh 1" e="Customer Group 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh2" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="c">
      <header v="Nhóm kh 2" e="Customer Group 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh3" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="c">
      <header v="Nhóm kh 3" e="Customer Group 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh9" width="100" allowFilter="&GridQueryAllowFilter;" aliasName="c">
      <header v="Nhóm giá kh" e="Customer Price Class"></header>
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
      <field name="ma_vt"/>
      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_nvbh"/>
      <field name="ma_nt"/>
      <field name="tien2_ex2"/>
      <field name="tien_nt2_ex2"/>
      <field name="ck_ex2"/>
      <field name="ck_nt_ex2"/>
      <field name="ma_bp"/>
      <field name="nh_vt1"/>
      <field name="nh_vt2"/>
      <field name="nh_vt3"/>
      <field name="nh_vt9"/>
      <field name="nh_kh1"/>
      <field name="nh_kh2"/>
      <field name="nh_kh3"/>
      <field name="nh_kh9"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5Vohctumxx7MLT01NlOlZWZrFxDac1Q2iq8NUCQ5RFNSQIsAHOLPm+J7mdyPp2dXAhLX22t9LBy2Iz9Dr7ADCrhxgalJ+niKdtxF4rhnfrlRJkczDsbcD/NzZtF5yRQzgcZ50EfxORdoHTXcC/+99vYRKAy8tfBFfaiutiZ3mRTDnO6yxBHihTnJa5YmP4cme6f+AEp/j+6iytInLTef8uu7GruSLFmwZ4eWKJP5ULbcw1CwqzTrmR7pUJoQDYKOMTPErfgY29ZbpyAla4ambgr/KHYlDmn/YrlX9Ko7CMQkTpYqWcB5HYoCijvC5nnXYkmdRPEFZaFIdVms5O8ysisk+nWuhC/bQNc5rCdGIzsXXUQH78n4XCNLMBIrFl553LqB0c7XYPeaHKxhtWdTISVmvuFLxWCgehlMnMGeh8636UOVAmeM38jXCytnwsj5X5UcatSwryxh0eh398/48Ms7gGVSqyhXn9nwjvhpDr9uMWeouQJcdJmTJzXV04iDjJZpmyCXl+p9BvY6waN0yP2bm4J7XOGwS7h5y41YMUFM3zrjxV7gDulMm+d0TqjOk1M0bJrBxWt9jtjPlhhnQZ2/Y00b/9bDtjyEDBHsuVYFLEz8C5PMYtNRlHrK3DqJQhBMVHh8CEnPZLFYDJhOc1WS0Q==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAYHJllGfVnrqlBt07AKKP5X3nrcYdMF61gSgK3ztk6KLUJLPbbzTJe2sOivJxOuqASAdUNXY4qn1PHha2Ugx53PwMDrRILjhGB33o8DoaKTGTdB0Ya/dtV3wMai8qzjZrddrYKPXTbusFkcANS+Wn+kdlgFeSe2opOS7jglcCAosim+UgFKfLS5ACkPeCXRHa3WgJEBgygAhFe3LPzNlXQ7DnEs4K8Yd2BfK+djDZ0zx98pysEux6FIKYUOALDivEYzzhbYZPhiVH+/rlzDWvVUgJsyFBl07uG2yHCbtkJHrHy8lw1YUD/hAE/Olv0weYKmT6IGmlkvJ9akkPUjb4h7ENC4+6t9z2qvDaeSpFSUVgYqdyKgXaBQX6V554saYwH93aur7ytK8N7vGCZpf0JfoCxvoLIyc0J0MgbwnqJblrArr0OZsHuyLES55Ou0gD5IkwFDSQTMFaRpBW9hJFnVre3oPTTZwfckxaKBk78O6dSPWTlfGloIbh5O1iGchtxmxrN5JdhD8Jwlw1Hrvy6eRq5IHB73HPJ7y+Pt9oeVnWvsZjC3DHnCJ8QiNRvuyHlyawRdr1LAMeV56ccJyr0VmWPvUPdgaRH+BQoQzLfzZCkvF36C/V98JC083wVsVOOSvGJmRjS8lPlgJXfWY9GrMEi0lafhRgsVxLOtY2WevMfpsmIJ3u+eY03mcd/eYDvP/kNAyPTMhgP6nUbxTtZw==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWaZj0LD6WdMROUWjQEoa6ibwJRWGw2c9mbNXhSpTq7st1wQoTDGiRVuoHLwyQaUfmyt9QAbfEIUWW4YcOPIVvOgTMFetCJTNHjrd5b0eeXkzVzHhwLYH036Peh+lu4/PGp+SSZI1NTjr8gOUWk+fvy3RbiSwB6gnUGavH09w1ZP6GtTjQErOBdH6L+Sie+zpg5eRROZwE1BIjR/VP7xh5UzWPdYwzRVj6UGVIW5BUk2OXZcDxS9fHYKl/+puf1vKrJgMHf9BmjTFJRQVX4ee/q3JGWgyCFNSvXA3TBarc1Hkdb5g2NbxyPR+W2Mh/LGr5EVtncU8jZeEXoahi88eKEV</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCua0OJbd72P+q/AvRHJMSa75OV6hDz4qnQVERTpr8zlNmTefGbrMkYTRLqK/KlJJfZCi15m4fVWV2SJHuLbJjPmWH2uYdmBbPTOR7SMjdURVE+4W02N6FrTd5rVEFMGcDCNaVNb/CUUuKMSlh9a3Qi11Wxz9BOD6/c8yA9TPuArKtuVACgc20KkxSH2zdVYyWCn9pH5PctHb9n4LBFNCKQGwgyRg+wLcCxQLUHzyaDbseb+iie/d0m2WqPK6O/I2b6re0nvaBVhhITo9q1laH4bC9TZ44A2lRBg+9JXPnIgCp8tHvQwYYV7rzvrUFpTbIbB5ePwsriuuwstEvuXDRxqRjy2yDIGBpWb4OJu7U3gjH2zfEoB3rhN1A9A/qjkkJm64MrhE3srZO/gUnyt0p4P</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
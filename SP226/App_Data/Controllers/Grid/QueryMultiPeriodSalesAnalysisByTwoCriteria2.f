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
declare @xDetail nvarchar(128), @groupBy varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @rType varchar(1), @rPeriod varchar(128), @Count int
  , @reportBy varchar(128), @type varchar(1), @unit varchar(8000), @form varchar(32), @dataType varchar(1), @voucherList varchar(128), @tKey varchar(128), @revenueAcc varchar(33)

select @xDetail = replace(data, @d, '''') from #t where id = 1
select @tKey = replace(data, @d, '''') from #t where id = 2
select @dFrom = data from #t where id = 3
select @rType = data from #t where id = 4
select @rPeriod = data from #t where id = 5
select @reportBy = data from #t where id = 6
select @groupBy = data from #t where id = 7
select @type = data from #t where id = 8
select @unit = replace(data, @d, '''') from #t where id = 9
select @form = data from #t where id = 10
select @dataType = data from #t where id = 11
select @voucherList = replace(data, @d, '''') from #t where id = 12
select @revenueAcc = replace(data, @d, '''') from #t where id = 13
set @Count = convert(int, @rPeriod)
select @dTo = dateadd(day, -1, case
  when @rType = 1 then dateadd(month, 1 * @Count, @dFrom)
  when @rType = 2 then dateadd(month, 3 * @Count, @dFrom)
  when @rType = 3 then dateadd(month, 6 * @Count, @dFrom)
  when @rType = 4 then dateadd(month, 12 * @Count, @dFrom)
end)
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết bán hàng" e="Detail Sales"></title>
  <subTitle v="%s: %c. %t, %d2, từ ngày: %d1..." e="%s: %c. %t, %d2, Date from: %d1..."></subTitle>
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
    <field name="tien_nt2_ex" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(case when a.ma_ct = 'HDF' then -tien_nt2 else tien_nt2 end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien2_ex" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(case when a.ma_ct = 'HDF' then -tien2 else tien2 end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck_nt_ex" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(case when a.ma_ct = 'HDF' then -ck_nt else ck_nt end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu nt" e="FC Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck_ex" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(case when a.ma_ct = 'HDF' then -ck else ck end)" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu" e="Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt1" width="100" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm vt 1" e="Item Group 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt2" width="100" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm vt 2" e="Item Group 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt3" width="100" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm vt 3" e="Item Group 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt9" width="100" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm giá vt" e="Item Price Class"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh1" width="100" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm kh 1" e="Customer Group 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh2" width="100" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm kh 2" e="Customer Group 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh3" width="100" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm kh 3" e="Customer Group 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh9" width="100" aliasName="c" allowFilter="&GridQueryAllowFilter;">
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
      <field name="tien2_ex"/>
      <field name="tien_nt2_ex"/>
      <field name="ck_ex"/>
      <field name="ck_nt_ex"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAYHJllGfVnrqlBt07AKKP5X3nrcYdMF61gSgK3ztk6KLUJLPbbzTJe2sOivJxOuqA/hvLn5ko/kHul1aJZ3Vf2nFWQlocGq1zFRvecinoS1IpgIirq4NpdDReNN6vD4GmZjfWE0laNB3RREQY42oJNF9U/onpUrh90UCzRAyFydsCaWG5dY45WCykI+Ng14WqoYMMTE+06aybMPdhWW0qpYS/oTbCTdPy7beewThDlm0fVAd4ZNT5mqj7aWAj8b7YU/ks9wmMBn7J9RObTl4U04hY2k3xK7rgJ8tbFNHIm88V9zaNSeFydFSE3H07kbKaW5z5TptGHx6RQtUq7YDoP+vR8nxUZQMY5QreCr46X2ePZe3oofQoARiO1lP9LgO9iYUySdwwcJhW6k7H7+N27ulUNdcvOaMi69q2l46Cp8XFbNjULPUMUW72JS4+TiusqKGI1Wpq3yyNV7reCXj07lZZQxZwU4fPLq+YVOOsBeSGZUFZivQWgBMdKTRKdbiylcu1TEJ4DxsJpr9Ar7xzq1tQNkYAr/SMUbqg/uuIhMTiAE6lB58NCESQEgv4nkrH1HlAya5hgzt33jBG1/KTnROFn3y1ueoCqUmgVQAspA0vAijAmkYjWjdBAECn+EX962t1dU3K9s4cNqhQvmpA2VD7WxgbQxPEvHwmw3kXj5RxSSULwYx+NcWIF0ENLRwob5kVPIRZhOS/q0IpV/QGZg==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X5ZGRVkqQd8K2CNKKZLe70qhKvJefh/siSeeheX0MYPWLpHaKdVAkksdxD2ne+m4vmDsacobKZ2amHnj0x6l+41yWK4bRRIHajXbCyMYetPu2MiOtYq2H4m2SmnE715CBRhmlMzdS55g1ZnmCxUJrmApIW6gor2mDa/+QZMJozhPCsXHpMHKLBLjtziZ4txScNJFGTfGAtk+oUBWkDhVb9fO9jgWZ9Hj7hYroVGIAgsE8ClwCec2tC8jsoLdIVj6xr8R+LITDurcGcPdieNVXVtE2GYTaJ5UiH8pfPW/cqnl8=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtCxI9IiBo+4X3vDmC4KOwvSeMVxyYxerVTj5EyhhNHJ3dRl06uCTANHL1sa7qCjBfpmTbw3CxEhTVyFzzXFT0wJ46lKmKK3qpSuRL/lh5ME2GyIflx/EaFqhUdqq7VDC5J4BjafogQxcA6lv6vCUoVq0rUrgPlry+cDVidZ00venQqq3G64I9R2Ay0hs12DFdaV4EZU6DumOaWHOfFDxB1ugjsEdu3BHvEl50MIefHba3OzIxq69JMFjL1/6U1PIA2PCg5CGi+A/iJClfzi109q6JjetYeIRTNDsXyyeGBJ4G0X2HFJIKuRNuJ0Rq5LzpRxIZbZMFCNKjjuUcXuibu/ZfJigFHgk+VsX51i9eyKnirPsRWm8V9gipLE1B0E4Au2D/ochtdl+N8iWJCDUEOKETd7ZqwVfvzYuYcTE8/dhYjSYulR1LfHLBF0BvzAgRHFexKCWgfuQYYPPXkKTQcTdQgybvsS+aLUlT2wtSi49/0V0YfRERTIWF+TEa5ijfE8C1D0sjUbM8vY8UjtHzrIjECqS6R9HpwK1WWxRJFiJhfW3HNgeAfB6bp70Qruiutpgb34I+6vOyjv8TIkXf0Ik1RDZ58fXp3EW5HTleZxDXT1k+FWt/Q19/+yecyFkTmCWS5PS7i3zzSzvRuHlHw</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
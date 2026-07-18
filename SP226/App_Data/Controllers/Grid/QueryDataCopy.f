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
declare @Code varchar(128)
select @Code = replace(data, @d, '''') from #t where id = 1
drop table #t">
]>

<grid order="code" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Nhật ký lỗi" e="Error Logs"></title>
  <subTitle v="Thông tin lỗi..." e="Detailed information about error messages..."></subTitle>
  <fields>
    <field name="id" width="0" type="Decimal" readOnly="true" hidden="true">
      <header v="id" e="id"></header>
      <items style="Numeric"></items>
    </field>
    <field name="note" width="300" allowFilter="true" allowSorting="true">
      <header v="Diễn giải" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="note"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNaqmfemhetUmMZ/irhA96uofi3Zxnl9z8Gha4RcDFwI5XWSuUk/VjOgfGbSbJtIyut+CorCyufYJPYKqUJKAqY=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
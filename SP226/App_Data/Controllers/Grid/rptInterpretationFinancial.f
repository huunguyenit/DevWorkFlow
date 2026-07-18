<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "rptInterpretationFinancial">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128), @ext varchar(32)
select @ticket = lower(replace(newid(),'-','')), @ext = case @circularType when '3' then '_A06133' when '2' then '_A03200' else '' end + case @reportForm when '20' then '_02' when '30' then '_03' else '' end + '.xlsx'
if @@language = 'v' select @filename = 'rptInterpretationFinancial_01BC' + @ext, @description = N'Thuyết minh tài chính'
  else select @filename = 'rptInterpretationFinancial_01FC' + @ext, @description = N'Interpretation of Financial'

insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thuyết minh tài chính" e="Interpretation of Financial"></title>
  <subTitle v="%f1, từ ngày %d1 đến ngày %d2..." e="%f1, Date from %d1 to %d2..."></subTitle>
  <fields>

    <field name="xkey" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Code"></header>
    </field>

    <field name="ps" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kỳ này" e="This Period Amt."></header>
    </field>
    <field name="ps0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kỳ trước" e="Prev. Period Amt."></header>
    </field>
    <field name="ps_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kỳ này nt" e="This Period FC Amt."></header>
    </field>
    <field name="ps_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kỳ trước nt" e="Prev. FC Amt."></header>
    </field>

    <field name="ps01" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 1" e="Column 1"></header>
    </field>
    <field name="ps02" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 2" e="Column 2"></header>
    </field>
    <field name="ps03" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 3" e="Column 3"></header>
    </field>
    <field name="ps04" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 4" e="Column 4"></header>
    </field>
    <field name="ps05" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 5" e="Column 5"></header>
    </field>
    <field name="ps06" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 6" e="Column 6"></header>
    </field>
    <field name="ps07" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 7" e="Column 7"></header>
    </field>
    <field name="ps08" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 8" e="Column 8"></header>
    </field>
    <field name="ps09" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 9" e="Column 9"></header>
    </field>
    <field name="ps10" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 10" e="Column 10"></header>
    </field>
    <field name="ps11" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 11" e="Column 11"></header>
    </field>
    <field name="ps12" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 12" e="Column 12"></header>
    </field>

    <field name="ps_nt01" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 1 nt" e="FC Column 1"></header>
    </field>
    <field name="ps_nt02" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 2 nt" e="FC Column 2"></header>
    </field>
    <field name="ps_nt03" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 3 nt" e="FC Column 3"></header>
    </field>
    <field name="ps_nt04" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 4 nt" e="FC Column 4"></header>
    </field>
    <field name="ps_nt05" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 5 nt" e="FC Column 5"></header>
    </field>
    <field name="ps_nt06" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 6 nt" e="FC Column 6"></header>
    </field>
    <field name="ps_nt07" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 7 nt" e="FC Column 7"></header>
    </field>
    <field name="ps_nt08" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 8 nt" e="FC Column 8"></header>
    </field>
    <field name="ps_nt09" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 9 nt" e="FC Column 9"></header>
    </field>
    <field name="ps_nt10" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 10 nt" e="FC Column 10"></header>
    </field>
    <field name="ps_nt11" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 11 nt" e="FC Column 11"></header>
    </field>
    <field name="ps_nt12" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Cột 12 nt" e="FC Column 12"></header>
    </field>

    <field name="du_dau" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư đầu" e="Opening"></header>
    </field>
    <field name="tang" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps tăng" e="In. Arising"></header>
    </field>
    <field name="giam" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps giảm" e="De. Arising"></header>
    </field>
    <field name="du_cuoi" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư cuối" e="Closing"></header>
    </field>

    <field name="du_dau_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư đầu nt" e="FC Opening"></header>
    </field>
    <field name="tang_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps tăng nt" e="FC In. Arising"></header>
    </field>
    <field name="giam_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps giảm nt" e="FC De. Arising"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư cuối nt" e="FC Closing"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="xkey"/>
      <field name="ma_so"/>

      <field name="ps"/>
      <field name="ps0"/>
      <field name="ps_nt"/>
      <field name="ps_nt0"/>

      <field name="ps01"/>
      <field name="ps02"/>
      <field name="ps03"/>
      <field name="ps04"/>
      <field name="ps05"/>
      <field name="ps06"/>
      <field name="ps07"/>
      <field name="ps08"/>
      <field name="ps09"/>
      <field name="ps10"/>
      <field name="ps11"/>
      <field name="ps12"/>
      <field name="ps_nt01"/>
      <field name="ps_nt02"/>
      <field name="ps_nt03"/>
      <field name="ps_nt04"/>
      <field name="ps_nt05"/>
      <field name="ps_nt06"/>
      <field name="ps_nt07"/>
      <field name="ps_nt08"/>
      <field name="ps_nt09"/>
      <field name="ps_nt10"/>
      <field name="ps_nt11"/>
      <field name="ps_nt12"/>

      <field name="du_dau"/>
      <field name="tang"/>
      <field name="giam"/>
      <field name="du_cuoi"/>
      <field name="du_dau_nt"/>
      <field name="tang_nt"/>
      <field name="giam_nt"/>
      <field name="du_cuoi_nt"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBHwD6V3UunWN6aIVgRxH56L4eHPkadQXctZSXR6P44nTi2BcBiwpQaI2KiRnBECIOB1OUbX6uCCtOdM/IEUD3g=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQMenDjQP7t+ZCXDSjfuZXrCNFuk95HHjWZuOEADqaGy2XVXbgp9IMU8WcCPXRahU1AVuNrQxpghnF8sT3YUVn63T+elddAytZ3ZIgiZx7KsmTFIAmukpBeb1FvzL+LRnehYEOXOf1kuY9S5Ch5nnn7A4WMszdpGDaEpu4JrWXdN6f9PQmu10gxhV87kKctYdSa1El38SBr05LHH/eNLm/UynC50rdZqYAuw7UsXGBE8UZEqebhSA4wb+gCEhCWNfLJNl3iWorgx4LA1gp0XhdBYneGUyOuRmhWH9+deRvTbJM2n08kP+9O5VFHNN9Psa3zTnpMIT5wHvvH4BQmP0zSUcjulB6oILT/qViAhht9FwPagFlehwOiu3x0MNvy2TZlMkgpFwtHZJMH7FOao0v4Dfu07WwBJzQ3+92xLyQlhWFx7Horjq/V17B3PF/ZWrCDj6BjHxZbd1z5jXijg8RWxT+u8cmrbW0R77tWl/6z1d6QLUC79ZFp6i+LOR3lNNJnQP57bYQzZCCJuK67ibr7MB+zO8ioXa+kuzhQiJdWU/dEhNMuxuZa96HVgWn7dK8lDOHb/pLS/xTEzUqsa3j8hHvjZ77WAAdmKzGvgd/DHOsTjzGIstYItjHrZcaeLu9sPy7KOjCMttYcYDbP1BC9PaOzq5yn5jGyFFtmtNFwV0nd18NYwH7Er8VDT/xM+og+cUAyx2rVSrP/+fJ4QFQFCP5fJjHCMgDRzDxZ8S8gRTnH69mzbuup/CRPA6a5oYg0HNS0aUs0tVfl9E8Q2un3Ct6aQ9MCF/03lHDDRNqOYadVdvgKC1302/kl9qZSndgTEbF7VKUSSK32ZuxRg47ZP0Oi4RHSvJlqqpLllmgKM04+NdGIEKQ/4GbHOHhd7MN1gkr4RU9C5p7asPh+uAAUcGMZDEbZEuIZ+51BybQkYLDfHdvSZDJ+gD/bESSxvQUgIM0UHpCW2QXseFWkuj27GQ==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5ZgBkuYpOvpAcLG+9Pum964MeKgAcxXmaIQSJhHANvMWss5b7PDICSxPjnjgvVecGjzDejfwSdZ1SJ7ZojEXH+p9ESgRnWQ1UJTBWt9VM0tLU68kjm9xWRkDJzOf+X1UJsQUbkFU3oZou0qmITJ0zWGV2IVA0XW4+RAa1xyariVrKxtzxUe7Bjc6e6BXlCyW+8ynwI9E36x0JzMbQcA0rOCTmaNOCTluNysWegYjVjRM</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu285PMrkAgKSyb/y4npBkWEy2vNSdqzaHxjElwuy6aJMZ3W2CTUiTtGiS8QdKPqDDLSrr1es+exHd4QdaucV5vswvu8ijhdXtOFNQcSV+t9JY5zAmn8/fh77AFugfj27ycEqPD5J7RiPrI/qMW226hWK3nwCBS/QYC8GGKdpshTO</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Upload">
      <title v="Tải lên" e="Upload"/>
    </button>
    <button command="Download">
      <title v="Tải xuống" e="Download"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
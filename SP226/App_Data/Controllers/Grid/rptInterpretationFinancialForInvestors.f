<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "rptInterpretationFinancialForInvestors">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128), @ext varchar(32)
select @ticket = lower(replace(newid(),'-','')), @ext = case when @circularType = '1' then '' else '_A04195' end +  + '.xlsx'
if @@language = 'v' select @filename = 'rptInterpretationFinancialForInvestors_01BC' + @ext, @description = N'Thuyết minh tài chính'
  else select @filename = 'rptInterpretationFinancialForInvestors_01FC' + @ext, @description = N'Interpretation of Financial'

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

    <field name="ky_nay" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Thực hiện trong kỳ" e="Current Period"></header>
    </field>
    <field name="lk_kn" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Lk từ đầu năm" e="Accu. from YTD"></header>
    </field>
    <field name="ky_nay_nt" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Thực hiện trong kỳ" e="Current Period"></header>
    </field>
    <field name="lk_kn_nt" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Lk từ đầu năm" e="Accu. from YTD"></header>
    </field>

    <field name="ps01" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Nhà cửa‚ vật k.trúc" e="Houses, Architec."></header>
    </field>
    <field name="ps02" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Máy móc‚ thiết bị" e="Machines and Equi."></header>
    </field>
    <field name="ps03" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Pt v.tải‚ truyền dẫn" e="Means of Transport"></header>
    </field>
    <field name="ps04" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Thiết bị‚ dụng cụ ql" e="Management Tools"></header>
    </field>
    <field name="ps05" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cây trồng v.nuôi" e="Plants and Animals"></header>
    </field>
    <field name="ps06" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Ts hữu hình khác" e="Other"></header>
    </field>
    <field name="tien" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Tổng cộng" e="Total"></header>
    </field>

    <field name="ps_nt01" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Nhà cửa‚ vật k.trúc" e="Houses, Architec."></header>
    </field>
    <field name="ps_nt02" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Máy móc‚ thiết bị" e="Machines and Equi."></header>
    </field>
    <field name="ps_nt03" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Pt v.tải‚ truyền dẫn" e="Means of Transport"></header>
    </field>
    <field name="ps_nt04" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Thiết bị‚ dụng cụ ql" e="Management Tools"></header>
    </field>
    <field name="ps_nt05" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cây trồng v.nuôi" e="Plants and Animals"></header>
    </field>
    <field name="ps_nt06" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Ts hữu hình khác" e="Other"></header>
    </field>
    <field name="tien_nt" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Tổng cộng" e="Total"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="xkey"/>
      <field name="ma_so"/>

      <field name="ky_nay"/>
      <field name="lk_kn"/>
      <field name="ky_nay_nt"/>
      <field name="lk_kn_nt"/>

      <field name="ps01"/>
      <field name="ps02"/>
      <field name="ps03"/>
      <field name="ps04"/>
      <field name="ps05"/>
      <field name="ps06"/>
      <field name="tien"/>
      <field name="ps_nt01"/>
      <field name="ps_nt02"/>
      <field name="ps_nt03"/>
      <field name="ps_nt04"/>
      <field name="ps_nt05"/>
      <field name="ps_nt06"/>
      <field name="tien_nt"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQMenDjQP7t+ZCXDSjfuZXrCNFuk95HHjWZuOEADqaGy2XVXbgp9IMU8WcCPXRahU1AVuNrQxpghnF8sT3YUVn63T+elddAytZ3ZIgiZx7KsmTFIAmukpBeb1FvzL+LRnehYEOXOf1kuY9S5Ch5nnn7A4WMszdpGDaEpu4JrWXdN6f9PQmu10gxhV87kKctYdSa1El38SBr05LHH/eNLm/UynC50rdZqYAuw7UsXGBE8UZEqebhSA4wb+gCEhCWNfLJNl3iWorgx4LA1gp0XhdBYneGUyOuRmhWH9+deRvTbJM2n08kP+9O5VFHNN9Psa3zTnpMIT5wHvvH4BQmP0zSUcjulB6oILT/qViAhht9FwPagFlehwOiu3x0MNvy2TZlMkgpFwtHZJMH7FOao0v4DbKvmkFEaSr+M49sROxa5t5aJoIOmP7SqFGtaFHRcnwi2UhcZ1kll0oo9UCli4swWXWtY7NOZRoMt4nZ1rijSyZQPtoa892riYTXyj3FPYnNJ0L79dzunLzSlPZMSua0VWNu55V0eVPtgJnbUm/a9pPQfSrg/ZamrUKTxz0tCSV7xThXEo4tXFMoPNLbgKCe25VgKKjSvceD6J76OMJ5acy26fptlQUkJPQkgSFIP95Gh30NOEGTSZClwYiNbEsEIJzE+7ZTxPcxBUII4vTtNVGvjn38Sp2WOC6aNiCjj5EBAgGB5EgsppTj9m/qbc7WrDrWHMo2mZxAsFJTmTuxWSBe5rxOOZCHQdl2wpO/0993x3jMJgjw0ieHZkBp/q3cmkVd5r2MuM6gBHLsT6OTx6M3PO7pvY4bxvG0tUIb/Qs9PvEsp+VRdNwMD3Jmu9NyzbqQHnpTqYtQAHOMvzamkXSGgdKBIRTxFVhepY7BuDVpa4mwydH40Al7itCr4z/1XcsCxDxSF8Nx6Cv36gFRyrckx4MY3ZtGPzN12UPCCej/O7+6YzLLFVc7Ti1SwCznzQ==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5ZgBkuYpOvpAcLG+9Pum964MeKgAcxXmaIQSJhHANvMWss5b7PDICSxPjnjgvVecGjzDejfwSdZ1SJ7ZojEXH+p9ESgRnWQ1UJTBWt9VM0tLU68kjm9xWRkDJzOf+X1UJsQUbkFU3oZou0qmITJ0zWGV2IVA0XW4+RAa1xyariVrKxtzxUe7Bjc6e6BXlCyW+8ynwI9E36x0JzMbQcA0rOCTmaNOCTluNysWegYjVjRM</Encrypted>]]>
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
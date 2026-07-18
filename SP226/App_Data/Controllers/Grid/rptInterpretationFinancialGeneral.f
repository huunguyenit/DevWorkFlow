<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY Controller "rptInterpretationFinancialGeneral">
  <!ENTITY TransferID "rptInterpretationFinancialGeneral">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128), @ext varchar(32)
select @ticket = lower(replace(newid(),'-','')), @ext = '_A03200' + case @reportForm when '20' then '_02' when '30' then '_03' else '' end + '.xlsx'
if @@language = 'v' select @filename = 'rptInterpretationFinancialGeneral_01BC' + @ext, @description = N'Thuyết minh tài chính'
  else select @filename = 'rptInterpretationFinancialGeneral_01FC' + @ext, @description = N'Interpretation of Financial'

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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCFFW908r2hZG9WaeHd0N3V3T6oSCBN3Qx4wkzkggV0n</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMq6Xh7xds9o+3oCl00TufVGLE78mW1GUKVnWVD5XSrl</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCFFW908r2hZG9WaeHd0N3X7ZCFOitHeFmT8S/i7EEImU+xNYwnaN1XigoczZn26BA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJXtefcCbO2jbbRo2FCSKNOk0mdYTJEP61Bjg2IXOM2ElXHyT0bLkFLGh5YG3Fwkpg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHa328rQWUhD33uKrso0w6XmBK+3JcXfOwSeU0L9C95fSFm6/bl511fLzfKHSE2Os8A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS9E4hjAhmKtfg677hCLEwXcj9eM7kzP0X5PzWMa6eqBE8=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+KJqn2j7wKdflbqAKLp8sGeg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BFcmQOrsNzXHQ3Ip3AGFT9czKU8FWsY0magh9orIVrhROoNOQ4u3knXmGcdojyHl+Vz4wapeCDbSXmbLDttX8sI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqu2lHuxmjkVCaSy+1KF7qJdjMycOlSdvOonHBsJv7YSH</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRvaPlJ+aSv++/oks9vAYMCvQ5zEyHAKE9Wl/RIXREzUIs9NHlyAT7YtPhJnUr9PVt34Zu7uGIueuZl7nIcRCLAc</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHf0K/PkZMeMcIFiiqOrbgv8XdMi2B1isS1B7VfG461a6GnLEyDgr7sGJjQSKIYs0FQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHceHln07NptlA9XqndRRXAgoRl1LkXmk6Fm8pgBOYTm8UqFvN1ypvlLsZCL+qhuAruRggR8ANfP/0IIizjr++LHPWt4tIf+R/BM39RvkxFcVcEHb+uFFEfmnI3+Z0BFp0lh0aL+CWj/XkYe+F8d3TFcAXUd8sam43l5KFcrtufBCnqcaSA/p4EcLXtfl/Xa4jJ+x3xC4z4whNycQn3qYmvV4lRzcnBOUWjIBBVTO9m6AOIL4nN4D3CFG7hCeyOdn7WFFR7LNBDqfefhzQxw58ws=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucyqnzH4dkQFO0YPe7/iZCI4rnE0WZMZJuru0TSS3S08MYXc/wwwJaAGGK4ls/7K6VUHYlEZ1frsR577EcUWlz92z0+JfnZ0Ao1JV6AHJ+sPJ9DBL6zDyMH1AmGPwPcIiK4K1K1jpXPU1opm9QGcjvzIa+MA9wR3k7hxe6DjazIjyfY+vMlwNGerdtW7TOiRchjxXON9OtQ4fq0Q4zgyABosI6dvN0dOlBP4sFKzp+QtME0puvM/oVXrGrbRpsa4RoKv7GWbApi4Lzv3I+ICIBXcwqhMBqD/BloCzSQoPDnsJ0F1y9g92VMxVVfxowORRZOMd/2Qdjv9ihrFpa73qjWNMopUMwO/GewKOtARsalbA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1PdUlmnMNn8JPDEmCiQFG+1FlSxdXJz75TV5qGY3vD7WznqZK9k18/lCpFqftldqleN0DedQ8AqYWc0qUQ31P5JyboNm8ss88tMTseZG3nNw5NZTQ4YFKLuSMho5uk3oGFnfBIn6wV7cnd1nq9rQqSI2TBunIYgf3G2gQaVTCh9HqrV6/h6L+GxDXWZKBDvTi5I5og5IinLGE7s3BVrbNi9eKJsyNcmYeF+bk0oCKHk78iyaagS5CP0BHdOwnopckQfUFDK6ky04U2yITVE3Yr8I6r5vD9CIliLMNlglmIMJAO11TaoDv/QkP6225e+ZuK12iYW2VUlCHh30houbWuZBnoD9BkejSEE0vFzVF4UWnV+bK6ktWDnhFg9qV5KOpwbL7W3C5u1dHzWHBG/EAcPya9RhpPmmsqbeO3QSVdYZ1k9o33qoxtX2MRe5UEYbF</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5ZgBkuYpOvpAcLG+9Pum964MeKgAcxXmaIQSJhHANvMWss5b7PDICSxPjnjgvVecGjzDejfwSdZ1SJ7ZojEXH+p9ESgRnWQ1UJTBWt9VM0tLU68kjm9xWRkDJzOf+X1UJsQUbkFU3oZou0qmITJ0zWGV2IVA0XW4+RAa1xyariVrKxtzxUe7Bjc6e6BXlCyW+8ynwI9E36x0JzMbQcA0rOCTmaNOCTluNysWegYjVjRM</Encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY TransferID "ManagementObjectOpeningBalance1">
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">

  <!ENTITY % ManagementObjectName SYSTEM "..\Include\ManagementObjectName.ent">
  %ManagementObjectName;

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYEnX5xOmccEg2xlSqrZSHkL9de+WQxgmO4g3OO+wk0xKzbcRH08Ke6JO+nKX3jvW/PLPasKQula/ftPZKcOsttM3d/gkIjg/0pt1Q3zUWQXDyZUeKeomuWcxFfCbC/HS0=FastBusiness.Encryption.End&Name.Title1.v;FastBusiness.Encryption.Begin$Yg5kCMHpRxVk0phZxDQR72uK0XQ6wckI7WrmOTYAAGMS1lNT7kyyKFP3goMZtwJEGGE/2HW1nG4OUGd8uSiwBKBdkapxLMEhpe4S8r3loCXDvZtU4ErEpL4U21awz1pNQ9X+70YLmnO7HMMFAvsVMw==FastBusiness.Encryption.End&Name.Title1.e;FastBusiness.Encryption.Begin$gMclfgjoOKzWjjEhAVwlpoSPhhckoZkJfv+xTLWWrddoLl635I0yKJkAc/06eL+6LMUZt39Ma5q+F9uSPzgMQzbMTiDSiZtyLIA00zuSFk4Mo4Qvmwg+r/uMEK2DEKFRFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
]>

<grid table="vcddtqt1" code="nam, ma_dvcs, tk, ma_dtqt" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, tk, ma_dtqt" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Vào số dư đầu kỳ &Name.Title1.v;" e="&Name.Title1.e; Opening Balance"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Information..."></subTitle>

  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" >
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_dtqt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Mã đối tượng" e="Object Code"></header>
    </field>
    <field name="ten_dtqt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đối tượng" e="Description"></header>
    </field>
    <field name="du_no00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ" e="Debit Balance"></header>
    </field>
    <field name="du_co00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có" e="Credit Balance"></header>
    </field>
    <field name="du_no_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ nt" e="FC Dr. Balance"></header>
    </field>
    <field name="du_co_nt00"  width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có nt" e="FC Cr. Balance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ma_dtqt"/>
      <field name="ten_dtqt%l"/>
      <field name="du_no00"/>
      <field name="du_co00"/>
      <field name="du_no_nt00"/>
      <field name="du_co_nt00"/>
    </view>
  </views>

  <commands>
    &SubTitleBalanceShowing;
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOtqaaqtAfeRROPxfM0ewpxUtlVJNbrlv/cAvsVWSNKOt</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJZJ1tBJFf3wOhTDcqmg98f8Tc03mUWkUJtpbLP90bby+94uchwoRLhZu0FL1yA5GTIc5q4IC4a03adgtIJhL92Hz+EXRHouEix4keAymOXISIvrOn+rRGy+0LGpBxBgygJgMKmNztqFl4YDYxwEcypYo407NhBWZx4ulIoXyfTMunO1S+dMfwVkaqObBn7VzHUGhYK2E86pIoQ9e5Q/9QiFTzCjXOXEQksEvM54UuZwe4T9LN4jOnosyUZonHMaG7z4Ip0MBipZwcZsbWCb9Gdi48QymBoCncmTWgW59dgJFlg8Q7ZSIWabNwJjSFEZbog2ycXcWbuAzPmgdRflrUYLFkn1HHtcMtwswszAzU5uOv1Gw+uEEWpsf5/6G+73FLO5WMsAj2BZjWqwp/WJXQQQRMlnNvT9PaXeBfru5aUXudmpe/8k7ebw37Bjy2tCk3rCrAUDodADSXLdvn/E4dMAySgoK7PyFh0lcBV/op9YZl+fpDb+PW1OaUfrunLZKFvNtCfGyyqIVVhcgCPey2i3j5Z/TNfHx4OaqMY6npvpKw+XvhQ2eIDUt+RIYo2xSfvlVW/ndXUHLNmilZYfCv1ESFC83sMdcM+8CsONdYbAtmHjD4CbE2EpDuFNROyck2ZReQ8AxszFYynWG6oEVaE=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXY6GPYpvOkW53DeGARzQ8ehFpWdqi4Y0+R3WelTE9aFGlivr/Rz5sDQB6PouPn2Lz3fs75b+TFW1hu9TymEyq+9g==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL751wZiTGtWeHzFQZhMwU6K2dxZTKcK8IzZ4gALgNH9xBQ</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCFFW908r2hZG9WaeHd0N3XCu6NShuYiROf207c60QAzsj2BmdedBeKjTCltQbrpqQ==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJXtefcCbO2jbbRo2FCSKNORC/+t0WoN9uhpfgVNhNK2W2rJczFakBbMZw6U57iHjgdZ8TcssPsNwt2vLV9YlRk=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS97jmIym5C46SaCZiEh/CBcESeBlf0s8caHdtDO646p2w=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAAoaL4fpYGFSuiHcjTG/sEliEVM7A217s4Z4JlouRq1RA==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BFcmQOrsNzXHQ3Ip3AGFT9czKU8FWsY0magh9orIVrhRA2v4TNT8S57HiXatKodJY4Jzn0eRGQaklk/qiSeQf8I=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATZwPMa0uytWmdBvFWymFiTL+VaU+z7v/Q7+tfJjY2Ll9Q==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2nqOWER1E3e74d7p6ozynUJk3KsyDF7pSe4sGnRPfQSfLtnfacUINFoXNHEtkfwdnw</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucDXRIFFn50U2np97XSqKulGUFHoVjzR6nzTldDGoKC4Mad7dxVuptj2G+uWgmU1UE=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&CZT/ABV6lnPaei3qIp0xPAHlJSVL8svkzNQQuF8An26hYMF/bgznKflX9Z5yZyMVuuKXXIc9DnBvg/i0HhKs/6LXRf7DlAJ+GZAWL3JgxHb5iAhQm2LJWh1USd3/3WQF53CWQOoXdq+7yg7PZB8Rjg==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1PdUlmnMNn8JPDEmCiQFG+1FlSxdXJz75TV5qGY3vD7WznqZK9k18/lCpFqftldqleN0DedQ8AqYWc0qUQ31P5NW7aSuqfhs7SRE3LkBOz6NeNW4CJ7hBGKlvy9FQ0/aYe2ORkydZEw1BStd1/QItBKIcHH/Mg3dhdM7Z73qL3GXc56xwrrFc2Ffiz9lu1TwXfl9SwqL/7t6CTh5lwxPZ0waMAGMBnkV5BBa7NMqptCRvpxsYXLHN8011PeTt9sBS</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
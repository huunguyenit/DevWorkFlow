<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">

  <!ENTITY StandardListScript SYSTEM "..\Include\Javascript\StandardListScript.txt">
  <!ENTITY StandardCssImport SYSTEM "..\Include\XML\StandardCssImport.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "FAAllocationCoefficient">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZlkNVKB2ZfXxtObQpcrx6yZA7EE4ePuQUbeofeV26fcNIfyVVzOajAciOkOT2vYX72gTgJLQ6wk1c355/Bu04uWC1wIeNPP3tzRDw4+F1CxByggfqLpt/ocT007qFf2dJpKSgNYlY/e+JPw1tixsnpTlE3Sq+YKlhaAvCJKc15wTwTh0uZDJOuOMvl1dAbJSQDtja1IN2LOO/f53P6vnfKsaquBLn06MSaNKTw20NCjL17pa/DpGSTct/mdNrwfF8=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vwthhspbts" code="nam, ky, so_the_ts, tk_kh, tk_cp, ma_bp_ts, ma_kh, ma_vv, ma_bp, ma_hd, so_lsx" filter="&FilterCheckAccessUnit;" order="nam, ky, so_the_ts, tk_kh, tk_cp, ma_bp_ts, ma_kh, ma_vv, ma_bp, ma_hd, so_lsx" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo hệ số phân bổ khấu hao TSCĐ" e="Fixed Asset Allocation Coefficient Definition"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, year %s2"></subTitle>

  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true" allowSorting="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" width="0" hidden="true" allowSorting="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="so_the_ts" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Số thẻ tài sản " e="Fixed Asset"></header>
    </field>
    <field name="ten_ts%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="he_so" type="Decimal" width="100" dataFormatString="### ### ### ###.000" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>

    <field name="tk_kh" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Tk khấu hao" e="Depreciation Acct."></header>
    </field>
    <field name="tk_cp" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Tk chi phí" e="Expense Acct."></header>
    </field>
    <field name="ma_bp_ts" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Bộ phận sử dụng" e="Using Dept."></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã khách hàng" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã vụ việc" e="Job"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ma_hd" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v=" Số lsx" e="MO Number"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>

      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="he_so"/>

      <field name="tk_kh"/>
      <field name="tk_cp"/>
      <field name="ma_bp_ts"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_vv"/>
      <field name="ma_hd"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6i0eHBHOVNNUA1QFUCgPtmy7sWynJX+gBPDXfC5ijRCaIOsZLIDgNNClf0tBg66hLTSMdPogGRqOh6uqI3ghBAy3NOUU5TTwKcs7jUJOHx8+9K9wF2JmpKEzA4Iz086+JLKAwHackVpBxfRes8kIUnJ7ff+tAcUPHAruy2EnEzaUBYXgMux+vygbGwwms/KmClHb2g3XJwo0Q+bdawxdUx1zdzaFyKjf+XFmLkKHg0VliFnc5r3ic59d5TjH+dC4NvU3NdEESncHecEmwNfAeZ/UmCfJoLbAnxQ4SQMIXzy+KuCVBZ04Od888GOWGWsPOOQD5Bl8rx0kf3CKbVBn8vZg==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXYogEUvqarUlDtEnQTivYjd9bavzosm37UPADntJRdrTQ=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQutA0P717mBw1s1umlyYS3QAACWDcdzfJXicY3Pvu7dHb42ckssSClmdAB1vy8awErw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKU0FwqOVOib3zXwxQXwDaEK</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5gas4VUCGzgjismd6CmvAm</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaCOH952hCcV8Gv0nClxVHAfk9t+Xq1L66ygsUD2+SkH+0Xd5sqjTGZLmCgYTLCu59g==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS9aTyehMbzBMJGMRKU/1N3ZQsXVk5EtrWFFee6f4/FYro=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+K/W4VEPOdbF0erXRCyChVy4kHXl+tCufI5WGw3qdBPtg=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaPucdgfa803QnzbtmPHCIIvqxP0hg3nAxtExBf5oNLp9U2FR0LN2/8Qd3IVIUoVReRhNCfwydNqXdsVYWZGUDFY=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATa3r/oJKi8UXtdX3Z+106Fz</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2nLvddig5/eUyfWZ5kjxhRxcBgRBXLRD2qrg2VHz4kEJw=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucDXRIFFn50U2np97XSqKulGUFHoVjzR6nzTldDGoKC4Mad7dxVuptj2G+uWgmU1UE=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&CZT/ABV6lnPaei3qIp0xPAHlJSVL8svkzNQQuF8An26hYMF/bgznKflX9Z5yZyMVuuKXXIc9DnBvg/i0HhKs/6LXRf7DlAJ+GZAWL3JgxHb5iAhQm2LJWh1USd3/3WQFkTLseWLQyvA23kJVzEyZ1w==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1PdUlmnMNn8JPDEmCiQFG+1FlSxdXJz75TV5qGY3vD7WznqZK9k18/lCpFqftldqleN0DedQ8AqYWc0qUQ31P5NW7aSuqfhs7SRE3LkBOz6NeNW4CJ7hBGKlvy9FQ0/aYCMviAsbiHQkobWwa0ibKpRkBaT1qV6Dj9DHU00RCFklQJsW7jJ/v4S/TveSTqj1lFXJjemNPzoIudr4028kiyb85x3sDKApP+ywzAMrZg9aA0wnfHNA7VB/FkOI3Cey+</Encrypted>]]>
      &DowloadScript;
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
      &StandardCssImport;
    </text>
  </css>

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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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
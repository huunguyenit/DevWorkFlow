<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "AccumulationAccount">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbS1MYjuVlWaxSRbNsMaKz0HH2KgiEO++9fTa/HJ3ZAI7z1ucefMAwfDsjzHO3VDzkGWgN7tFPLdnF3b/drkxE69J5AW8KK7ciEpcc+qaKJITBDEml9DAPyPIoiVJZLeTTPt4gwrrpn6oEk6aItIiZEGefqBNFiQJwAco9QEHWTZSrji9+qPWgEwlUrIlhUUkMGSabuMnAi3y4Qau2CKM0iFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY Parameters ", default, 'tk_lkvv'">
  <!ENTITY UnitTag "dmtk">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Account;
  %Control.Unit.Ignore;

  <!ENTITY k "tk">
  <!ENTITY Tag "vdmtklkvv">
]>

<grid table="vdmtklkvv" code="tk_lkvv" order="tk_lkvv" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục tài khoản lũy kế vụ việc" e="Accumulation Account List"></title>
  <subTitle v="Cập nhật tài khoản: thêm, sửa, xóa..." e="Add, Edit, Delete Account..."></subTitle>

  <fields>
    <field name="tk_lkvv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" readOnly="true" external="true" clientDefault="Default" defaultValue="''" allowFilter="true">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
    <field name="no_co" type="Boolean" width="80" allowFilter="true">
      <header v="Nợ/Có" e="Debit/Credit"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk_lkvv"/>
      <field name="ten_tk%l"/>
      <field name="no_co"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzJsR3S2mb+KQZ7lfiENoRQemlKsQfOkrDtEvZAOBaivk=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXYogEUvqarUlDtEnQTivYjd9SGq+EjvIKPm3gnwE7y2WnNRsL9ApxiE7HqxTZgbyeRBYG00qFO1A95+88KifuvUQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGs0P0CIxThknogj+7TRgBOWW+ryeM7Q3BXJ1DOs11j9JmkDNd4marT5Aymi1Em3rw4=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS9M8fDYRlH/tLaGZbF1Bd31nqFNn0mTppYvJIBEL3yQf4=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+KtPbSBw3ozeCQIA0bUaL7QqLh9ImGD2xX9+GVtua6LB1zGxQH4bwzeYsQ1LSnZJmukpgfY24CQ0jd9nytSrqQ5g==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATa04dMSYSXGKQDFIFb/o20G</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2nLvddig5/eUyfWZ5kjxhRxWmFnknDRDRkepQJZh/Izlk=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucDXRIFFn50U2np97XSqKulGUFHoVjzR6nzTldDGoKC4P0CcZzQlhhYuZP1apbuJ8Y9BzvwL0/8rzZwDhIPXx9FvnF9hmSrsGKCw/+O6A4TpzLS+OLMYXSOAJTOpsAKXWhbrvfC7H7x6R++xqwI1sxs3xeKzwZePotX8mgythatgg==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1PdUlmnMNn8JPDEmCiQFG+1FlSxdXJz75TV5qGY3vD7WznqZK9k18/lCpFqftldqleN0DedQ8AqYWc0qUQ31P5NW7aSuqfhs7SRE3LkBOz6NG5rebHiiFnZvryu6IW6k7XQU9bFgnF2x/oWADn/xbTwXvEkitWvE5iHAHjk3enI/wtYRf/dkgF1vsVSvV7RL9pv7YiOeQur0zSiWrxhme3kJgP0yIRD5tSz2xaxhDsar2pD8XS4wBLTcUKhGZcrDi</Encrypted>]]>
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
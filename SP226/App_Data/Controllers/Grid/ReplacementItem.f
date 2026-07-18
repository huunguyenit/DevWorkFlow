<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1)">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "ReplacementItem">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjUyjaREWDBhl85d9jFcODE5+WhLRSFytWhiuszhzrG1OpFgxF4wnl5m6CTyU0cpj2+ZRcCJZwgHx6g+4Qvb0uyroVvbyz9T+gLy/dfgsTAjauyVFFI9sNJT6PjIBRgRxXev6eqMpBgiJ/YVRSBhUnho/4ODAMVSJdRAmRpt8m4mRXG4tkcBsK7lnYEyhIQ8WDFM1XrnGerhwfGGILRdzU26iNQJXW8WgWRx4GqUTJQ6tOcsX1k/DJvCVkJWhUGj7m8EXvn7TfLB7kY/fZqjvQoJ/hqzRecbTk+Sj//pFawosZN4+Xa8aqOIlcaTaj7YVGUw==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY CostingUnitGridShowing SYSTEM "..\Include\Command\CostingUnitGridShowing.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxdmvt2x" code="ky, nam, ma_dvcs, ma_vt, ma_vt0" order="ky, nam, ma_dvcs, ma_vt, ma_vt0" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo vật tư thay thế" e="Material Replacement Declaration"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, year %s2"></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ky" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_dvcs" width="100" isPrimaryKey="true" allowFilter="true" allowSorting="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ma_vt0" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Nhóm thay thế" e="Group"></header>
    </field>
    <field name="ten_vt0%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên nhóm vật tư thay thế" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>
      <field name="ma_dvcs"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ma_vt0"/>
      <field name="ten_vt0%l"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridShowing;

    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzJsR3S2mb+KQZ7lfiENoRQemlKsQfOkrDtEvZAOBaivk=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXYogEUvqarUlDtEnQTivYjd9SGq+EjvIKPm3gnwE7y2WnNRsL9ApxiE7HqxTZgbyeRBYG00qFO1A95+88KifuvUQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKXJELVKliErwKNMSXmjLtBUjYfLEpMKpnFtoBJa1xVYz/g8rbs6dROAVgM8W+SNlfA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGs0P0CIxThknogj+7TRgBOWW+ryeM7Q3BXJ1DOs11j9JmkDNd4marT5Aymi1Em3rw4=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS9M8fDYRlH/tLaGZbF1Bd31nqFNn0mTppYvJIBEL3yQf4=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+KtPbSBw3ozeCQIA0bUaL7QqLh9ImGD2xX9+GVtua6LB1zGxQH4bwzeYsQ1LSnZJmukpgfY24CQ0jd9nytSrqQ5g==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATa04dMSYSXGKQDFIFb/o20G</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2nLvddig5/eUyfWZ5kjxhRxWmFnknDRDRkepQJZh/Izlk=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucDXRIFFn50U2np97XSqKulGUFHoVjzR6nzTldDGoKC4Jrh95NhGIpvn8SVUJ9tZx4PwFZ/BgHTTQjTgJiDnIlkyfaQADKm+w2txxG4QPJlFkah2nUJEeCrQBg1eNuN72GSFaK9YtwenGEbCf6+WXnET9htolRXpqZs5+e+yWOVVA==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1PdUlmnMNn8JPDEmCiQFG+1FlSxdXJz75TV5qGY3vD7WznqZK9k18/lCpFqftldqleN0DedQ8AqYWc0qUQ31P5NW7aSuqfhs7SRE3LkBOz6NeNW4CJ7hBGKlvy9FQ0/aYCMviAsbiHQkobWwa0ibKpRkBaT1qV6Dj9DHU00RCFkm7/xE9Uo17Z+ar5wVh9ZD5OFojaM/3vHf+mA1eFXerwBZYBijKMdXvqoQXDlG1q5EqaCpP0GvCIrgijy5CfvsM1dmqIMaywwcNNVHlNEFEaQ==</Encrypted>]]>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
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
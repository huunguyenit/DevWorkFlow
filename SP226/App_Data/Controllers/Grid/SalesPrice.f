<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "SalesPrice">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128), @compactMode char(1)
if exists(select 1 from options where name = 'm_compact_mode' and val = '1') select @compactMode = '1' else select @compactMode = '0'
select @ticket = lower(replace(newid(),'-',''))

if @@language = 'v' select @filename = case when @compactMode = '0' then 'SalesPrice.xlsx' else 'SalesPrice3.xlsx' end, @description = N'Cập nhật giá bán'
else select @filename = case when @compactMode = '0' then 'SalesPrice2.xlsx' else 'SalesPrice4.xlsx' end, @description = N'Sales Price List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY Controller "SalesPrice">

  <!ENTITY UnitTag "dmvt">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;
  %Control.Unit.Ignore;
  <!ENTITY k "ma_vt">
  <!ENTITY Tag "vdmgia2">

  <!ENTITY FieldsList "ma_vt, ma_nt, ngay_ban, loai_gia, ma_kho, ma_kh, nh_kh1, nh_kh2, nh_kh3, nh_kh9">
]>

<grid table="vdmgia2" code="&FieldsList;" order="&FieldsList;" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật giá bán" e="Sales Price List"></title>
  <subTitle v="Loại giá bán:  %s1 - %s2" e="Sales Pricing Type:  %s1 - %s2"></subTitle>
  <fields>
    <field name="loai_gia" isPrimaryKey="true" width="0" dataFormatString="@upperCaseFormat" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Description"></header>
    </field>
    <field name="dvt" width="80" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>

    <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>

    <field name="nh_kh1" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
    </field>
    <field name="ten_nh_kh1%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm khách hàng 1" e="Customer Group Name 1"></header>
    </field>
    <field name="nh_kh2" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
    </field>
    <field name="ten_nh_kh2%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm khách hàng 2" e="Customer Group Name 2"></header>
    </field>
    <field name="nh_kh3" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
    </field>
    <field name="ten_nh_kh3%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm khách hàng 3" e="Customer Group Name 3"></header>
    </field>

    <field name="nh_kh9" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm khách tính giá" e="Customer Price Class"></header>
    </field>
    <field name="ten_nh_kh9%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm khách tính giá 9" e="Customer Price Class Name 9"></header>
    </field>

    <field name="ngay_ban" isPrimaryKey="true" width="100" type ="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="gia_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Giá bán" e="Sales Price"></header>
    </field>
    <field name="ma_nt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Loại tiền tệ" e="Currency"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_gia"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="ma_kho"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="nh_kh1"/>
      <field name="ten_nh_kh1%l"/>
      <field name="nh_kh2"/>
      <field name="ten_nh_kh2%l"/>
      <field name="nh_kh3"/>
      <field name="ten_nh_kh3%l"/>
      <field name="nh_kh9"/>
      <field name="ten_nh_kh9%l"/>

      <field name="ngay_ban"/>
      <field name="gia_nt2"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzJsR3S2mb+KQZ7lfiENoRQemlKsQfOkrDtEvZAOBaivk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXYogEUvqarUlDtEnQTivYjd9SGq+EjvIKPm3gnwE7y2WnNRsL9ApxiE7HqxTZgbyeRBYG00qFO1A95+88KifuvUQ==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGs0P0CIxThknogj+7TRgBOWW+ryeM7Q3BXJ1DOs11j9JmkDNd4marT5Aymi1Em3rw4=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS9M8fDYRlH/tLaGZbF1Bd31nqFNn0mTppYvJIBEL3yQf4=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqduTHkxgvY6K2kUWuS0Lfb34aJoYm9//HEHcVsYmVNdN8eCMVTX/qzIsGjcVqD13+ls=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHZSoMPm4jIlcwhU1N+DEKLW5JYGmtmrzQqEG+S2YPCJ9r5rKqQJnw6d1lpHXS78CzGP7DzCW43JEuDL9Ui3yTZs6/LiwilT/akJQcKDYUxAU</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHf0K/PkZMeMcIFiiqOrbgv/Sdf1dbCVQSUlRQ63zwfTZXndxyBIhKLVY/wfFwWKjy7lyV8NqNT//z0lMAjFmYcl6JnuF0w+IUL4tlSKNmBWB</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATa04dMSYSXGKQDFIFb/o20G</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2nLvddig5/eUyfWZ5kjxhRxWmFnknDRDRkepQJZh/Izlk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHceHln07NptlA9XqndRRXAgoRl1LkXmk6Fm8pgBOYTm8SsJcNiKUM5UI1ki2eu7MyHiXiUF0O2FWlIB6sGmAv5hDzH3DTS2AWvNJCv2rZeizvebnirHWmjseXBJPG/powompBL5CmPbiPtOZJEZ04CNHehDFPvcaMuIRR4uPgoMQJxPNYsUYvw/hsN2kL/ey5gD8PUeOJBVqCHCjmz6qVcxsb4Hq40CblA6EfrHyOjQzpvFgyvXUSdQLDZ0UzvS3XfYW2p4k6H7n03gR8QULpDWyaOeccGFNwc0IoJ/gAfJuGlRP9Dprgx/Mfh+cc/homM8BPUM5QGaZ7P4XxzzFzvgf4VwMbHYKD7/m4vZsxCEPpeFhT/1PdUm+Yvy0w4MdZA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucDXRIFFn50U2np97XSqKulGUFHoVjzR6nzTldDGoKC4Mad7dxVuptj2G+uWgmU1UE=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&CZT/ABV6lnPaei3qIp0xPAHlJSVL8svkzNQQuF8An26hYMF/bgznKflX9Z5yZyMVuuKXXIc9DnBvg/i0HhKs/6LXRf7DlAJ+GZAWL3JgxHb5iAhQm2LJWh1USd3/3WQFREYd10x47RvvzNp1rYw6nw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1PdUlmnMNn8JPDEmCiQFG+1FlSxdXJz75TV5qGY3vD7WznqZK9k18/lCpFqftldqleN0DedQ8AqYWc0qUQ31P5NW7aSuqfhs7SRE3LkBOz6NG5rebHiiFnZvryu6IW6k7XQU9bFgnF2x/oWADn/xbTwXvEkitWvE5iHAHjk3enI/wtYRf/dkgF1vsVSvV7RL9pv7YiOeQur0zSiWrxhme3kJgP0yIRD5tSz2xaxhDsar2pD8XS4wBLTcUKhGZcrDi</Encrypted>]]>
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
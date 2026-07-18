<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "COAdjustOpeningWIPBalanceItem">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5naX5pg7wsFEoF/OAL5bzAV8nah2JoQiy6jpOaWSQiHlBZl2hNjEUak7KGFZouWEjU1ppkGB4ZbIssBLcvOScTgBxaKfORdjkcHP7+107+MsR21kNs2xgIULxPsjFL7Vq/Tgf8M184s5TV9MoNfftD7xBz4YaIMQI2A7shE29lNDvkxBqXiIPqgXVOo09F7XwNbqAyRXO+clJ6gxwsEcoOMO3SzcigJ/XzY4+CoCxQdSvDtGRzmOm/rim+4X2Tp3/NfgFf1M3YzlfSrmSxAn3CEgDN0MmsvB7DRdH93mYeOhywz/J6tkLxyWVFVJyti5/gkLFpUKjwoOy+WUOc5HKBye8yQwidszP9KraqOpIsAvsl6hJHgHrKEn5VJnu1wQs01DF3AJMAhlIFej3a2s1uWIsUm1Rhe9wou/HZQXXymbroiKlLTTcdz2DwsvIAjH0/A==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY CostingUnitGridClosing SYSTEM "..\Include\Command\CostingUnitGridClosing.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxcdvtdd0x" code="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh vật tư dở dang đầu kỳ" e="Opening WIP Balance Adjustment by Item"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, Year %s2"></subTitle>

  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" width="0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" hidden="true" width="0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã yếu tố" e="Cost Factor"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="sl_dk" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_yt"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="sl_dk"/>
      <field name="dd_dk_nt"/>
      <field name="dd_dk"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridClosing;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pQ/Iozn/13dZ9C9+pHtoqJtBLCAd830E8kenDgrVptvoxCiSla1abg5+giBwTLz1iFkuDvBuITf3MPEBaw/axWnsqcIVa68/ZVrjGfJSLGMczP9ui5cItCkjE6RRJteO4nfnyF9/YgfLEEjS7WPFHEABBOkhBt5S+pL/UtJvZGUyg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKUa8fuaH25CnMBCoI1FPuJ9SRtfZ2XvsOWXw0DS/RMb8Uf9TsOh47v/bbHkoiIaK9U=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUV0oTtciE8G29OjoeOK5lsMXNiFpZzxyG5TukzVqaFB+6DthEoKrOBnSOq8ooCqh7onBDCZ1OuE1NS16sW0vAzaPYqI9x41f6YdSIuBGV+0hZQB8DCSqaZfwRx1+U/1mMtGTpmHYDHzv+/S4WVZ3uPCCct8k/0hDSM5GIZn9yU3MMpCJk6Nx8GoD4fCER5ibW4bvTZVnu/8B4nIEsq6S9zGPHuuW9RdoD4vazQXerN0lKK37Wf1/3ePWmq1jLOUJPajy3VWRN7jIZxVfXK3/mH3Oz8yKS3NVYbqA73jq6pKhYYQBD6tdJpSCILUch35qTDKGyupqS4ipdPFWxxD/hO6+mCT/4jvAs7Z4eaXODrf24dASpQ26o0Ju+k0d66/9A95c46RO1TH4TWbeoxMpwFS35V0FqP4HUO8UFOGBVj1xtagMJErWNp8GbUtGEo7eyRvSBNm1WjTsSDyxQo2Y6g5MXpHEsi3z/WGVe0jAvtTkbruJg0ilSdej4KktgclLpQHpTA0+lez9HIO4isLgCd6MZ+uKUORnEFce+1X9NchOCCuVEEkGB751JyVw7F8Sw==</Encrypted>]]>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "CustomerBalanceAdjustment">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYT5Njhma8SSkxPYTfEr7beY0bDWhySoXUtpCKDDDnVfTwkrNW/fe/lC2iv2ZPugxVkbtMkmCKsiRU787WbrF8o1DaR4KYjrhlaoHrQ1ZoVpSFJlZguibhTqFjZAg2AHnMAJRSuO/NOeIrUVyi1Un4DE4fry+jrLILJOD6dzlZywFCzrRvI1Cp878FQcJi39+QFKWyaE3uYl3XwxupHvJtrynNeufoEaN/FGDCNUTs9OkISeCzQlvnISdlenWwNwT0=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vdccdkh" code="nam, ma_dvcs, tk, ma_kh" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, tk, ma_kh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh số dư công nợ đầu kỳ" e="Customer Opening Balance Adjustment"></title>
  <subTitle v="Năm %s1" e="Year %s1"></subTitle>

  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="0" hidden ="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kh/ncc" e="Code"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kh/ncc" e="Description"></header>
    </field>
    <field name="du_no00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right" aggregate="Sum">
      <header v="Dư nợ" e="Debit Balance"></header>
    </field>
    <field name="du_co00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right" aggregate="Sum">
      <header v="Dư có" e="Credit Balance"></header>
    </field>
    <field name="du_no_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right" aggregate="Sum">
      <header v="Dư nợ nt" e="FC Dr. Balance"></header>
    </field>
    <field name="du_co_nt00"  width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" align="right" aggregate="Sum">
      <header v="Dư có nt" e="FC Cr. Balance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="du_no00"/>
      <field name="du_co00"/>
      <field name="du_no_nt00"/>
      <field name="du_co_nt00"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pQhGL+WAwPjztXAwhiB0750wCGxc/Y1W4pv+zP5lDAAI+NnL15uZOArNuFZHhbGkyTRMAlb5Cl52bYEHn4XDLXwmrtB5f6mtDxga8YDunXnIGYf0swAD0UsK3uhc1nhEEPkKNtXgwWUG+VHgkNfrr6pRRTKI0BXS6qjbe6UGuDk+E4yS/SalREPPVMX8nT4U5Iua7KBxRqWNfpCwI/0PYqrlhQ6G42gLJPOvgVM83ztX+HBvkEzEyN4FL3IZ9kriczWgQLnKsZp2VKH+A7HRYCH/fNIcryMVqcPvb7DChDlz/ExiqxaND7XRD4HLoZ6Y0LzSTv1R2AEkHUyXBzwfKqH</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zz7n8YvLQ6cFuBFpJXwGBNSkjcd2Dva9zhbQ9545m6HH65cLmnJ3kGgwXTT44zBEEqCKNa0CYFjKPCPb3CYKVgUkznav/o69HvhY9E3l9wa</Encrypted>]]>
      </text>
    </command>
  </commands>


  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUcxY0tKOYwjF32qN1GdvzE3CQWNZodezB6BDn3uyBSv4mX+q09NxSKJXkh8tWEpxsWw14HTU5KHl0NUozZy8fyYrBYPnHRfsEy61t8pk4xcfD34u94tHKKjb6fv4nADgYFnPyv4budtsh1T8bo5JrgiGq3maFiPn89mzR3bqoCEiua2WRvBCI13a9KJtLipjkdMyBGUE2LetLAJeR+BCekw4h4uyMEaJKdcwYp8vq2FtY40NTTBzfx3V5jlLghrx9o6tdOaOsz7XjBke9m6Uq6yFBG5vd568ZdtvQoHh5vf+JSCOadBoiA6Jte8JEmac+8dp1fj0/BInELj/IvxKq1C2FLeHdWaexvbo8HeMk4dW66pbuFxZ+i+6tRWMJ5BxsvazudAKKBu4ziCOlv0svDGs9o4OrgIRjUjp+2Zxmdr7A65QY8WSR9v3Oei5fcHMisXZp6ze95Kxq8NhG9q83MEoPqk+EwLjwKK72HFCwxe0/QYmELfZ6xRWtryki7p9IUm+1aqxXQSjIuUhdYNN2tN75OtPe68WSozp1clov0K</Encrypted>]]>
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
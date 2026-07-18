<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CashFlowPlanByMonth">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaYNHchX1AiuY4sdWf68vahO5tJ/5n8xDxPXtk5k7T9eCAt63efaqHiu3eEME/CphUUsjIBmfzbwCRW5tAN7XroN/Gue86TYIfMsbw8BGmipw21cRcyJf+OsJaibA82wPOylSB/T333yIn+ovRK17E9ZC0WxZ1wGd9D9XmyNZuV3MS6MqtLgBAVHhpAvk4KEy1fPR8eVoTgIEu2OA/VKbu4FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vkhdtthang" code="nam, ma_dvcs, ma_bp, ma_vv, ma_ct, lan" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, ma_bp, ma_vv, stt, ma_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Kế hoạch dòng tiền theo tháng" e="Cash Flow Planning by Month"></title>
  <subTitle v="Năm %s" e="Year %s"></subTitle>

  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã chỉ tiêu" e="Article Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Article Name"></header>
    </field>
    <field name="lan" type="Int16" dataFormatString="#0" width="0" isPrimaryKey="true" hidden="true">
      <header v="Lần chỉnh sửa" e="Revision"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt" type="Decimal" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_bp"/>
      <field name="ma_vv"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="lan"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="stt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pS2qj/uuzcHhXTRKVozwb05iWiGqlFAmtJgAze0/bJHsMenepXtMs96NhfKXfcg1s/3taq//3YKGUffFjwTg+72RYGl0nIdQ6F49yphFzjBaaz1CjESCFRjun/WMt8tU7xjx+neOWATH1LiHhqWK8XdHKbIPhncmXnB76/21NWWrSfinsTAr2dnGm/dU0u1ox0DDLFve2gn1BnazPXhb2Rs7rPsOnvXpwnsYdoKm0Zt/ePz6MFPrejzhH2aAJKgME9YqKqgYQkvlKsbLjTLTdoTW6ucuYsekFfaFOHXHimvvSce9NvlZQ/TUGVpOX/d68LqZevfErt6+BiNWNViKYbW</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI/RlaCB8zeKbN6Fva99UeusYoyee17kZYXqKZfWQrPXZ7XBq4B+vPrbW1qOj0T12tPstYc+87CmOn+nTbXVGGxpXl4DotDNv4O4OwIKyJKv</Encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXsQ9vQb4fNz+AID8UiJiSjOT+QMO8h8/IieH3jrsTXEOlX4eDcYKQAKy7CVFx3isBY2wBj32Sf4+ZNOcbp2wSEKIQ6w7+KPPrAkX/zDZbxmg7VWI2esNEWwCy17BeZpzQgk28kdUyXIIdTmJHUnogVQ4nrIPPc1aM4dbOqHLDIwGavb0hxe6zZD7XIJi7hIE6e2F4LfIIRo1JLmRdElBXMalnRCbyFmRzN6R2C9PU/ygxouVYt7xJsZW4YQ/8olGvmEiGKkOEb44Vie8zGrKrsokbjMXZLvLOPdZ6jboOAZlMAxritCRhPgTwtGOT+5Cc9I7tDcqhEvkZhhqiW3aC2xwWc3liewmYV0X4thJI7fjxMPi37KiWHnI1geOPx+yBhqxQaYV2IWYf60WsruNyzgbQyjzMfShh8L4bIlE8X0njVaeVNTd4BJchpjjEn48TzCzrMInkjPT60N9+w+l4rvII8lR2dsswYn5oYXOPb2foSIcvcWYJ6XL0npp63Z7lv9ksPHP6sLWyw8z0FR18j4e4roh8EWPq7dZnewJee8</Encrypted>]]>
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
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
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
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
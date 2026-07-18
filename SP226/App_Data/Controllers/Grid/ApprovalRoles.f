<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ApprovalRoles">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ApprovalRoles.xlsx', @description = N'Khai báo quyền duyệt'
else select @filename = 'ApprovalRoles2.xlsx', @description = N'Approval Roles'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmquyen" code="ma_quyen" order="ma_quyen" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo quyền duyệt" e="Approval Roles"></title>
  <subTitle v="Loại duyệt: %c." e="Type: %c."></subTitle>

  <fields>
    <field name="loai_duyet" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyền" e="Code"></header>
    </field>
    <field name="ten_quyen%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quyền" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_duyet"/>
      <field name="ma_quyen"/>
      <field name="ten_quyen%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6gh/THcOEGfsgfNaUxA3DEzHVUhWA5cUWvY2xqctAJ0Ib3S76q8YIUs6oYU/Xasm6r1RZueTvu3nVEqUrCnM97jWTdTYBXohWtMdjvMsJxi26e/+AjPj8rj50rSPnVOlqq+/Ry2s85u/Iqf+8TAcEj1mWn6Q+fsqjp8q/+KIom7C3aLgiqxI3+9PjIHCKvCKQFM=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7566AN2Ij+bol3KgYrO2XvKJHOh17UvHPSGrc4GS5VqThk8G1Acvzmh/jqs2DKMgB35Go8lhFAd4jbSbbNnhSHuQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtb56TLwlZMtlaR4mLLnCPqrHH0Qs0Ml2ivNW5rEsLEZlR0lyf321dZrtFPFk+sWkVKcxfGi0z4rsS6TlwCABbcnMQNJtdM63uu5QE6BfPUo01iqfaeJh6i/ns1gX3xQ1MLU8XEINeaYNeww+ZExWqed5ULd3YR5vqpFxDuCSkWbrKrGnKgVhNlTsd50cnDCMZwtIauD8A8YeuLP2Bpw/96H/EkEHWIDOYkJ3LRkjfqeMCDQZFOHaikX0iqTnnoVJhDb6hv6eeHLYwpxJgtuIgPEeu3Mp0FAFu2upC2cPMJHSxATrI6n22GbOy62AJTBlYmdvoMLvu7zpdgejnG7aqHFeOHwnlr9+ybrmNZodPr6W5H8aeuLBYH/9l+JKDStzbSq53TxrHTx8VKK/S6vMY0WWxhleSJEb1FjbaJ3cam2WBuKeu4YvG9cat0Yfqg8LfNtyEkKbIDbwKcwgec9L2GNOR+kL4c2dJs0hwVfyurgmLFFE0Z8yZuy0dI/uIRJbYA==</Encrypted>]]>
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
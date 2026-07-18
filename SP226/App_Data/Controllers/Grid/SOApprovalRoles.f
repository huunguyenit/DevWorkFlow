<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "SOApprovalRoles">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'SOApprovalRoles.xlsx', @description = N'Khai báo quyền duyệt'
else select @filename = 'SOApprovalRoles2.xlsx', @description = N'Approval Roles'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="sodmquyen" code="loai_duyet, ma_quyen" order="loai_duyet, ma_quyen" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo quyền duyệt" e="Approval Roles"></title>
  <subTitle v="Chức năng: %c." e="Function: %c."></subTitle>

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
      <field name="ma_quyen"/>
      <field name="ten_quyen%l"/>
      <field name="loai_duyet"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6gh/THcOEGfsgfNaUxA3DEzHVUhWA5cUWvY2xqctAJ0Ib5X3vvzIxMx1J0WdLKwAlh1QKoqNRqjDfC6I1Z2MmCjL+sX+84XYlxWrvNT2b3dLX3SQwOXvEjiMxKD9Nc7pfTfC80VsOLNmNeTApv8pJByS7b05xgjv/6bGHLO9ZyfzenuJWEz5+muKVFsKdAADMEI=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7556XJhDjJLYHqQQ7rmZpzy7f8VO0n5xsZfpmZ67w/zpuGI1ELqp4rvaQhHBdJ/+eJANgU7+LxJoM6s3/TVaJ/a0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYtFzYYi6oStl3JIax5giSlMxcmjARVtaEYGowhn5HgPBKRbkdePmuyC39aG+Swj07xCJR+n56i6oXrjKQt7MHnI2x1tdg7X5Msij5JIanGSlyqk9eM6rPLb4aifEdKgdi0sTM0ZOC+zVuq/TE5uVyD58NuknOdS2vhcJ7/2pv9/+FyFmNJh7SYcWA2ooiYaDWZecnUXmU6ZNa4FMd+WBlD69n8Ng8n546iin7kyY758ZiUUfFMA5qztt8k03bUDv1XjjUdNWPliJcWcJ29x41tgGvUsnePxpmVWW12u9iblGk+JgKgOiSkz51y/oRFG5TIpI0kGC/b6xIaIQT3NgXNycqLRX+fYuArUNhtFavLWrv5h3H51QN/sHMpM8BXh4aHbcAcAzKdqRkj4XuxPoWGur3H/KZe/2AgJDKYX2IdOqxuwHeN4o0JuFnyTDSjwvq2J7uDCsf/AO+tNZv9HHU6m1nEwy+USgVipul1/yLxCuWhbzwjRr5HtF+Jlu/jYJA==</Encrypted>]]>
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
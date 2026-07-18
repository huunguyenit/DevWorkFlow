<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Expense">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Expense.xlsx', @description = N'Danh mục phí'
else select @filename = 'Expense2.xlsx', @description = N'Expense List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">


  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Expense;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_phi">
  <!ENTITY Tag "dmphi">
]>

<grid table="dmphi" code="ma_phi" order="ma_phi" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục phí" e="Expense List"></title>
  <subTitle v="Cập nhật phí: thêm, sửa, xóa..." e="Add, Edit, Delete Expense..."></subTitle>

  <fields>
    <field name="ma_phi" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phí" e="Expense Code"></header>
    </field>
    <field name="ten_phi%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên phí" e="Description"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_phi"/>
      <field name="ten_phi%l"/>
      <field name="ma_bp"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUfqeX+QJGZhCvnEAZEJqx4HP3HIImHs+Zrp7VChLBhCrcqJ2Y8EUCpeaViXDKicSo+4XnNvh0xMuHUFlvJWzkk/c97iRzOOOeWvykR88mqvb/568s7YQJJnND7bM04epy</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx/O85F7eucjyRss3N4SX0k3ZDRejCshkXMGKSaTyR2Z4UfbqL/UC3cPgIXG0iJH5IT/TXiZbGsuQyABLhetLmc=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70K2yEgwlWoHEM5h6MFwtmJMPEWa1Qow0omeibouP/KXWmdGu29Nqxokr1nEtQfbQFyVTGjS0HfEOO5WZLYkIepMMiwhe9UhTXzr7iuagwev/R9dBGYrJANqQtVpGdiQRm1bJ2h0idgFbJUqngOGzgloz7qO6QXLiypiR+pSIGDTn5nbHDDBn+9PYde8rfH1u7pfWBllnwerKvzsupuE7+J7etvEZv4+Nj+v5YWImFevUC5tq8iHU/jYb51WvnGlxON7RM+QHX/7jHPmGn7yhu+ubay3LgzyMt8g9Pze6YdcZ3eRB0oIALKM/8vL80tOfc7RTBoGN24gESyWFGMpHtfzGm9sGMtk87H4Ynl5OU8aaus0f4hD4dP9OLbWDMvhGkJxs9n4QfPqQkBZWJgGx0FRGQGwZK7H8UFxz49A9409VNXfbVAJjMmEkwR4yLc7/L2Tu2lYhHgUWGEA2qyOT/bYE4RzM68xmVNUjn74RYFn6+Fw6Y1BHHvE/7v0EyyQgtbzNxzSY1Afd3sFU9oUB+aH7ni9mt0cg2gdM5fM/qIUQUQ8Y6N+t7Ko55NdCvmb/W8Vajq+aF4OuygI6fRbRJrA=</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZHdyNxAoKPNwZiKsTaXEz4GRPUxY9/57uWluglpeePR5U1WuzYrYVtV5AmZ0PeC5MVgb7Xidsw19MNRH4oW+PH0v9JuYS92Wb/9Rfs2SbeLxKxV/u2UFLn+y0oIz4hphK6tzhnD2zTkAxMQL3vWpimctSEiufgOgwj4W1QR6AtH</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
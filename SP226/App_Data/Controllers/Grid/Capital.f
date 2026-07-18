<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Capital">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Capital.xlsx', @description = N'Danh mục nguồn vốn'
else select @filename = 'Capital2.xlsx', @description = N'Capital List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnv" code="ma_nv" order="ma_nv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nguồn vốn" e="Capital List"></title>
  <subTitle v="Cập nhật nguồn vốn: thêm, sửa, xóa..." e="Add, Edit, Delete Capital..."></subTitle>

  <fields>
    <field name="ma_nv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nguồn vốn" e="Capital Code"></header>
    </field>
    <field name="ten_nv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nguồn vốn" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten_nv%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUMq+MZ6dYqOkxJi2C8Ujan0QSHNuac4jdWkl6GbGbntjVDL4KhKIbjni8pxC5GfvvS95OsAUUSNac9SKzcbMmQiiV84u3tsHcA5Q6JqJRmm8yTE7sUCg9k6fXLs5rjlqj93iy+wTSgJRzb+PSZIAOHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiL1xIzPs4gooHAn734vvCFBfpoFYjmASa2/ABY5Eu8WcZyWLtfAf+tHGVhgA9qHFSjAdYdXtiSZPgoXjVT6NPsg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hmH7R5BM3BU4Nolk/5P7q8UP/MiXcmwIp+xv2ZHp/c71q/FoIl3iBAYyKxpcImROruoJXaLm2GlgAt/aScmZkeRGThqGp6Gxx1waFQ2vWXTvm9WDb1Gmu3egxG1/l8eecjKRQvOM8Nj6lUyozU+TFaF8MNlTDFtKkSQqaBGDhwnbKL8O1mGT3THsuXBqffaG9OzhX0KvSDIAxfQXmH+h+WKiC5u92XlylrJA7JdfP8bF9PBdpDivBQqZGLhrzTY/OH4enFofbFz4Mn1OrzuOeWB7URHuK4x6SeY9+n46hkdHCRJnOkslwvJ4+XoSpaDjnNN3l8FFohhUOALUgC6w0dBPSIujqnjcyWSsEEijRlxFF2eo5IjKLp/XkLnZxD6RNy9qx+Rx2FdGjRNXbTY0+Vl7zeLofXdyJW592aVQAfpB9wIKOUOU6UzWDZdDvfO9Om5qzXpciPh8MIKtVi8rxoOHanf4Ua3dzi+Fr/JUKxkEUI10RR3uU1ienjMdED/n9zkRf3QLS5b6XRoYEdr58TgreqhX8rMVGMtYdJYAZ+hpuyKOKFAZA1sW8kJAQHxzwU=</encrypted>]]>
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
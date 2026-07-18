<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CashFlowType">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CashFlowType.xlsx', @description = N'Danh mục loại thu, chi'
else select @filename = 'CashFlowType2.xlsx', @description = N'Cash Flow Type List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

]>

<grid table="dmloaitc" code="ma_loai" order="stt, ma_loai" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục loại thu, chi" e="Cash Flow Type List"></title>
  <subTitle v="Cập nhật loại thu, chi: thêm, sửa, xóa..." e="Add, Edit, Delete Cash Flow Type..."></subTitle>

  <fields>
    <field name="stt" width="0" hidden="true" type="Decimal">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại" e="Type Code"></header>
    </field>
    <field name="ten_loai%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_loai"/>
      <field name="ten_loai%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUMq+MZ6dYqOkxJi2C8Ujan1D7xtEfaBDQpMiQsdTFU3kLLP3XVQtnFOQ8EVvGWsL01UwMs7/u8JlD+SSaYG5IUmClr3f5Z2h7mlkxmYKfo2ZTMKvh3YiIHz6fiF0ZrMbfsMEWiSyaIVOHV65L/5OzLA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw0r+aDZxD7/z8Jv5YIeUV8FdeHP6oQ9mQVmOold9Le6exnqSUSLXptay7KoMVIs8qjGBjmk7m5paUZzC6IjmrI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hnJQizAoq/xiCMKteWyYk651Esgfy+oQoiYAscStT3B6NG90bpwfWbCYDS2Muiw3V3NoFOwwwaE8YMTOZEOyrcQYVAq9CvIUqQLDrh+CqffFJAQaxJk+Yd/uy5A4kz61i6MseL61A8mH8DHezyXCk1UrY4FZC8vF3jwRwEgQoMVE0VTPlaUQ8YtYlH+mEUQr6n1G5Vb5wwFjIMjohEGwFvbUvX+4cexRHOpF3lCrul3+0OSnuTSmhGczjmYgl/ragpOJaRY4jDNPA3erVLf1BTiR6pZ0b15JIOR2XqK3Nt6d3t2V3dsDvQpBWbWTmPn8TngXyDLtZsJI9fEx7VLdXwVYZbzwJCS9CKqloaCKWHr/pC1wuXFKAWTBzn3sKgsDF4UdTWSfitC6j6d07PqOacSBdNi5AaLRpUV1ftEQCJ8FhvQRMeSV5AlHAiIhzfd5BJd956dKJ0scwjCqHt8NeayLR6oWyZWdNh3aKQQEfrUNuZecHBxTLebmuV8a/eHE4doPbtJAf3+gHtxVmQfjSfhlYVE9yoV7z8stusCAgd66Uaa/90VQfVigS76Yi0osD8=</encrypted>]]>
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
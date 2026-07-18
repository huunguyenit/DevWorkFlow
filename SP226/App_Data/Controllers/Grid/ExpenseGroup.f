<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ExpenseGroup">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ExpenseGroup.xlsx', @description = N'Danh mục nhóm phí'
else select @filename = 'ExpenseGroup2.xlsx', @description = N'Expense Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnhphi" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục nhóm phí" e="Expense Group List"></title>
  <subTitle v="Cập nhật nhóm phí: thêm, sửa, xóa..." e="Add New, Edit, Delete Expense Group..."></subTitle>

  <fields>
    <field name="loai_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Loại nhóm" e="Group Type"></header>
    </field>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_nh"/>
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUfqeX+QJGZhCvnEAZEJqx4F9tl5ESK/xZGGLjnMI8gFFtdgstgxnC8TaoImlO+YEVMJySpAAeRed+f7PJpIQS4y0JHBD3uDuMz6SEd+iXeoNlRlIrTU2Ve0kypg29PiG/myrLjtJ7z0MQFSIPuaZztQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiCqTD+WlqF8j8IDQSBThoYaSiJVQ8mR5+fJZAmLYd93h72xSTMZbfcRD2GQA62E7sdaLMalqW6N2kmGIgAX+PVo=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70K2yEgwlWoHEM5h6MFwtmJOlidYu8ajMGrHmLYsO51PX63M4w8rK/1rQM9tdZNnYLP3IHADKT4PktHXgZDlxBHs1NZ7Z9p6GZkWgFP1PleqcxY26XsykbkhTw3v7bkAaBZ2KeW647i5PV74LgKele66dkRPKpwemsF+OrqFIfO7nNZNKnpo9fEDDw7X38G8nj9E3an0mn5zY0dfWrWP4pKS7GsmQFTpZIw40RS0NxhluCfXFsWBHKr8Q8k9Hwuwpn2a94E15YuSHx7jJ3ipV56UOlwEBMtUsgSqtXY5fStTqACOvlPSBtIHBCIO8Iev+9ORYkh0kBE3oRHUh7D97FWPnOx7xVMR/97JKW0ihGjLoLaLj+fQ35JOvvFHSpJDvxPyTR3ImC5sCJ0nRWOJk7kIdplJ/BCe8vGOhBF+csDdcvAjoChwec28CsXK9IemZXDykRfHRYruYxrXij2giNf7giEwhloPq7CNXW4kn2IF1iccbNgnfDnF7XN0Jhk/yEQ44VMuZmno8r5y4hEQzfyVVDoWgStp9N41gQ86He4tetQvvYvnMfs2yE9C7RZbhNcCGq+p5/8/Gchk2Azy8qNc=</encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "TSAcquisition">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'TSAcquisition.xlsx', @description = N'Danh mục lý do tăng giảm CCDC'
else select @filename = 'TSAcquisition2.xlsx', @description = N'Tool &amp; Supply Acquisition Reason List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmtgcc" code="ma_tg_ts" order="loai_tg_ts, ma_tg_ts" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục lý do tăng giảm CCDC" e="Tool &#38; Supply Acquisition Reason List"></title>
  <subTitle v="Cập nhật lý do tăng giảm công cụ dụng cụ: thêm, sửa, xóa..." e="Add, Edit, Delete Tool &#38; Supply Acquisition Reason..."></subTitle>

  <fields>
    <field name="loai_tg_ts" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Loại tăng giảm" e="Type"></header>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tăng giảm" e="Code"></header>
    </field>
    <field name="ten_tg_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tăng giảm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_tg_ts"/>
      <field name="ma_tg_ts"/>
      <field name="ten_tg_ts%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUCXmXu9xNH2djLC50SY4IKPilw9F7msaV6semB/mHxr3SK2sE+j/T0TDSgEnUYqmpmvfQZxJjjxakjfOdiIbu7ihpZRKN7M4lp4DCkZc8me+FdtGqZWJuj+MUK+GkTN006oHW9r/iZH9SZwnomYP2tA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiCGKo3bM+7cpSh+oiwy6bfGE2vmRKsaGUXfnRbJrPSwHJnQhNifsz3l6brJgGXPdhedNyQYkBwS60V3roZfauBI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HtKJ4ieO3XH6ypRm+zODMrDyaTctnalqNjVKRrgNOQVoBJabRvmhm5UlxYi1sAQ5Q2jwrgH7pY5GTUhP5/G6juNYowlavj2AfSi2wBeKIGYkWcSvwi3EtbOoepeEJwZQiqaQggv1sxfE0jAsECA3wOjhmHEc0zqStioc32RzHic6G0spwpnCKYh7t03tmvNyMFaYyHpvXf0IW+jcX0aeZRyCE8awTHfj202oQhRhtvtw9hOpMnQPMpnbyxt5gc3V8uX4CFe7Mb1rnT+aAtmr5gtv6iHmI11SvXWXzhRqne23RBCUG0W5VQZXjdmNu+RS6YVqCS0xJJy25UR0MWrwba2JcaLYw6CkE2WF3FuUGJtsnWnc9YcuLbS1FkQmNghBoU/V/Xv+TvshqhMH5AMfvBhuWmhrWB4ecbzF5+jCTf4FZj+u13iYLwjEHOSkPLy4xXMFhv7FpE6zAhbgNjX1nMvrLS3yAsgdzicNBAwQr1HetmqCEZF6VgXzifPstjyWjl9E80z6U64pMpP0cESej8uQ6B2Xw7dnqqy97+huwVGsczE2LZX0l73vIredXJMrB5SHH8dkerXgt6m5kfbjIA=</encrypted>]]>
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
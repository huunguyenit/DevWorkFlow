<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "FAType">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'FAType.xlsx', @description = N'Danh mục loại TSCĐ'
else select @filename = 'FAType2.xlsx', @description = N'Fixed Asset Type List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmplts" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục loại TSCĐ" e="Fixed Asset Type List"></title>
  <subTitle v="Cập nhật loại TSCĐ: thêm, sửa, xóa..." e="Add, Edit, Delete Fixed Asset Type..."></subTitle>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại" e="Code"></header>
    </field>
    <field name="ten_loai%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_ngan%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên ngắn" e="Short Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_loai"/>
      <field name="ten_loai%l"/>
      <field name="ten_ngan%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUi0W9FENnhjpTWFYUBebtpc1TsuNKTyCrG3NmwxJgdFgd30gK9a7yxFmZSw3I22JJNMpYQOnEQJZ97BaDBu38gvHAn+FAB56nNoUqlnxU/mmwlC5qx9SWRLbFxE6wTO5xKLB/EiYGVqjF0cXKVzlIOQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiBXo1bHb07E0h09UCg8CuT9+/qwmSA9063+hQeKGrD9L/ncKedZONgjaHwfPeAn1/12rj62w0nJKVhoQE401RiY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hkjZHsy/34gYCbxGcU5RGdMU4f7jJM3Yyt9vBazikjLtZAB27L96tDdVADm0pR65r0IgEhIDIkJ8AO9EYJuTGqIyn8VE1ajlk5ggKWD1a09srFTyNFp5D/9Sqb7QddUZDspUHu2NTiunwOGbP+PL4gfk2WwoAEdnJPOY/asi8cKAHoE0TzSgIedUIaabej0JeY/5Yp3FICeGwRjKFkObW3hCdpFioO0l+Sz7W1e77YtCbazG500rWrhrAzIY7obfOW7uw9cPx1AJaTVVKT85FkBAn61EaoRwD0tp0Ai7SEQSHglyJx0nE6CLfYyaZu3fQeMCzDqUky2YjDIApD0k59vSDM1AUywYV1toQ9PAlxJrmgB/YFiBXcajVji+CpzUorEMQiGHpR2FBNAgzioFGYwceEuzqo0QPlT4y7avm4RQjI9eYBFR3Ulf6rpnshvQkxmGmjm3SK+8ncUsNnaWnnko24SsUXMtMlIUnsudT535FuyhzBRUO/E3nBUVmXvTqe5Y00jwB5EKYI5Uym4sPDgl/nrYyKW3bI9OmsP8rqrejTCbvfhx45mC5/gMwCMDoU=</encrypted>]]>
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
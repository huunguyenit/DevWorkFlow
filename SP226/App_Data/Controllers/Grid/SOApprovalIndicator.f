<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "SOApprovalIndicator">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'SOApprovalIndicator.xlsx', @description = N'Khai báo trạng thái duyệt'
else select @filename = 'SOApprovalIndicator2.xlsx', @description = N'Approval Indicator'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="sodmttcttg" code="loai_duyet, u_status" order="loai_duyet, u_status" filter="xtype = 'U'" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo trạng thái duyệt" e="Approval Indicator"></title>
  <subTitle v="Chức năng: %c..." e="Function: %c..."></subTitle>

  <fields>
    <field name="loai_duyet" isPrimaryKey="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="u_status" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã trạng thái duyệt" e="Code"></header>
    </field>
    <field name="u_status_name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên trạng thái duyệt" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_duyet"/>
      <field name="u_status"/>
      <field name="u_status_name%l"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUCF4hTtnC0wSW7uS7QbeK1WDGBUbg7HUWlN+WNyEnID0Ii0oJk3VvVGPfpetG0W8pPd/L90U4uB1zpkDQGoyuqnkxoGIF1TpeAeu5cqYC30djHnigYIYWyiCRytz9+XDR6YgId0J+RK0aIWPOjiN4+Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiIX78BDGly6/dhX8Do1waTVzuCG6pPlm7oE7bgbZ54bydd7OmyDYyk6D7aKrZSUKzBQ7x9NcqB+8NHrx4kfU1b/pbGDN6KFJeFZITLZ76HWm</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hnBRUbMK0GpVv0IU/JcrMb1mbMAXxyh7EzkFZgjvXVysElRUqJyrMRhBzyVlUOBu3BQAqQ990JwaUnGz2O6oJrwvZ1FlgDkVlSbWnrO6wHVA3aowbebQ6DFW1/WAqa2lBmQpWd8vwhvwPEc5wDlGTDvOmEmraf+cBiWPcIJvPQiBTJGHUH/yI/Ec8dCvtr1VQHo34KUeaaVGSSVXPNKTk5qTWadIkPgHIYwWr6eZbJppqDJuky4YsVS11x8X2L7oUtTlVij7f7t+SZ7atNZ/D891XZ9eIRwr0WDyxB9+qN3SlmxADhdPiRd9vpk9PBpiOpkIGEEbOw++XPeL7A7Njq4JTT6fEGOZu8AAIKWPvYgMSNjo6+CTi4FUiDuBkuLz4ylp7833HUKHK2R/zMPA5Q59uY2UXsp19kqXFKjsi7p33VqNlbK4RjuYvxDmAzIeCaTT2RqPyOMf72Iy98RpgRvRZNI4kZvRUmZR6j7A7gmK/MzC+OgoBwJlAM0d80XOMwSpBFJyEqZRa1aBEV7doceyj9Uxgt5qg9oTM3ycbWkc/3r/ddE3aLpMaR7aqqxkvk=</encrypted>]]>
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
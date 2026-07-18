<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ExciseTax">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ExciseTax.xlsx', @description = N'Danh mục thuế suất thuế tiêu thụ đặc biệt'
else select @filename = 'ExciseTax2.xlsx', @description = N'Excise Tax List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmthuettdb" code="ma_thue" order="ma_thue" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục thuế suất thuế tiêu thụ đặc biệt" e="Excise Tax List"></title>
  <subTitle v="Cập nhật thuế: thêm, sửa, xóa..." e="Add, Edit, Delete Excise Tax..."></subTitle>

  <fields>
    <field name="ma_thue" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã thuế" e="Code"></header>
    </field>
    <field name="ten_thue%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên thuế" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUfqeX+QJGZhCvnEAZEJqx4HpMRewLxH04QZvwyFI+aX5jCCaDvA2/qOloShqnF/twXmlkd+6JRZhY1zfchwlUJz+sZHBkJ2M9iyA0qwIFbUmgXh8JaY59rXjeI1H+uRAEit7NKl1O9znFRUOCA2uKNA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPMsHAF2moVWvvq8TyVpKrxQey3bKtfIoDwph4rxS+2NX2rd4qgNeVjuJGHXP4r4oGnuB8Go6QRzxRjS1yDMeUs=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hkfM4GGzioSTQf7UnGpfEsXLTVq9nQxx/KOKB9hBUeWIeozlo7Y/Zra/O3HyXIEWsW1XinQX/EnG212JU0zq439evrzs8QU+ERMI2z1aihu3g97WDwDElZsYRiDbi6caps7ZUf6APPye83SvpYTRLPMS54q3bqeXzhIWazk/ZK56FgD+wntaIRYZM3acqzZWqKO2LSj7kXrCkg17IC0rJQCcsuIePsxV06Q6fh9LJ2TaQIdv6/5KQeJS9UT2JOdc7mLJj4RW/Vnhy78K8CdseeXSQDi8ODw7oBhcHt1qdCUK9+cGt+QrcLMWAMtMAImm4zdJeKokWSTBmEtEzY6EneBdLIh3qEQiWGtCUOlOApWTd8aBcPR8UPVIWkbvyW1p0zMZASPWItRSXBFvM4QMWKE5/hSME5TGq9ee7puCUEOl8MqS0aMxAe2NBeudU33WkVRhQmeXQe1xJwwaN2g2FRtAOsav2kXSGhnZuvZSA5qJMXNMPifZNSuMc8n9IbSaeGRD8A+av8ibOzYPEYTGpC/j2Rdp+GiS7djxc5rkOPFWJ737QuayL0lCvTy3VcFG4I=</encrypted>]]>
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
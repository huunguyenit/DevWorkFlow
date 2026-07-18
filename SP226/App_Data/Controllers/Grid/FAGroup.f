<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "FAGroup">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'FAGroup.xlsx', @description = N'Danh mục phân nhóm TSCĐ'
else select @filename = 'FAGroup2.xlsx', @description = N'Fixed Asset Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnhts" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục phân nhóm TSCĐ" e="Fixed Asset Group List"></title>
  <subTitle v="Cập nhật phân nhóm TSCĐ: thêm, sửa, xóa..." e="Add, Edit, Delete Fixed Asset Group..."></subTitle>

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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUi0W9FENnhjpTWFYUBebtpUl2+YgyTmIfiz2nGT1kys5tHwZvVHRT2sePUhvZgV34ilMg70fssbMRf9EGVdUDzZyULmR77h4brR0tyW/+bE1mP2r90gv/0btcIns77+HM+JywMGLuPtgkr7fu9wP5JQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiBy49sv9Ib9QIuDgdrtDF4SwtkYqy297CK+1Toj4Ive3ciWikvHH4U6gr83oxdnN2iFwS8riVZcYiwa3MFjIHNc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PzLk+vkLpt9fVfVQk/iNlSc5f4pfAAYDVpn/io9hUn93hnJDNlVSbiEetTkjIjIhWtD3JAbK/MoK0pTFomw662f+pqt0Pxak9iJ+w64l0xG67bg9bIFA9Uk1Qvs6tleaLSICCXo4bpqmPDKh9ZNf3Kyx77MDOpT2ODgqltXWY8nb0WBjZJJxkhPUkOV+CfrAkngELXS2JkefT+qhCGzWksbT1I695jxShCJ92cPnQWLunvd9n7m95lQcGLPBuYw5vLwOlwpwk4fkuMHmLdAI9D5J747VHNOcGgj9NVOoYkbl/pQqH4rGQYPLoG/ZvKTXzI2xyZT/NJZVp+A1NrUUa8dwYB9EeJWkRBQF5jEnolG5PjihW/nyEsz8F1H1NeyS07uwrbPcA5Fy/2+abAHk6mWVM13YMgfd4RvSVOcDbhbDYlkETi3GFcU1vemAL3b4epgdQ6gtVpq0y29JF0zoAri+rJw4/r/uEXtycKizM6cYfMxmW2Pvii1/rFZJuYnTtvQh4LaFlgjxoI4JIzvDHx3AIclxB9Gxrbh3KXGXmjTiOuPyQgWuX+Ze9du9U45iwPYh9IWSoKiuYqK25hmD2g=</encrypted>]]>
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
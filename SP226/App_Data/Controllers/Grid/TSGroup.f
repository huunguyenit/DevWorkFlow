<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "TSGroup">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'TSGroup.xlsx', @description = N'Danh mục phân nhóm CCDC'
else select @filename = 'TSGroup2.xlsx', @description = N'Tool &amp; Supply Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnhcc" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục phân nhóm CCDC" e="Tool &#38; Supply Group List"></title>
  <subTitle v="Cập nhật phân nhóm CCDC: thêm, sửa, xóa..." e="Add, Edit, Delete Tool &#38; Supply Group..."></subTitle>

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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUCXmXu9xNH2djLC50SY4IKAjB6mpFoOBZXzXnpSyhDUTN4q9vH4dmwofFLs8ZYmUHmDbpvygJTjp9h4Boki0/OqNDq2vGCwrF79Gkv17EqewwnfdFjRoa7wkF3FE7GgOP5yWGiQq4+4Kb9mjEJOKYtg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiGX/PHXHIGchF5UPc1Tuvl2hG+JZ+Oz8W0sOkIfGL3x2sbM0OybIw++hHoJj+9TGQuCWHgiQcADOpIRo6nbSu3o=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70P9TbZ+nRB0And6q6U8ekex+9SbWrVDwY8vvjI7JIEtQAoNk+nbbyXZBxlTDYbEjkTcwMjbTejoqBrFSkDd0lLPvREKJwR/r8Kage4WsC8Ydg3fHj5w45CmlXQnbZEpvtRoTfzQWOAhw1G2dI5IKn9x3DBbzlb07d6BzGIvcLFNIFJW0WVnx8uKSjrlM0h9Ior1eQTu2rIWZb0SrVJRsQtKpyjqiRxbP1fnUY9IAt1fhCbrzrOVXarzhlIcaIWHcziR5x4H9BeYXLo3QqY0d64Acu/nX8uOZdAbEjgfGlwHqKOkbnSRRXRY/0GYQSJwhfoA4ywfbbsMgOa5EhctO0wi4IL08Qk+n2c81jT7b6mmLmO9KMXAKnuP+amUAZS3BReeAClg8gLbAcOBCpEYYVP3xK7RrVKRkz6f1/x1akyeQnmK3RgfsWLMQ0qvWRRPkpmRRSjfsY5BINiyA8RkjhaH4SdA4QXx2tTIf8WYJZP1HeNUa+o3GaeUb4VDu/ecph6BMTh8ehhM61Xj2WxwrDtJOz3hOkGqyojZHdoczILB1x0qwDisnrfnNB5sJ9uoYW2p00/KWnhDJvDmZnlo+U4I=</encrypted>]]>
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
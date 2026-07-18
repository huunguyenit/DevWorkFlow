<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ContractGroup">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ContractGroup.xlsx', @description = N'Danh mục nhóm hợp đồng'
else select @filename = 'ContractGroup2.xlsx', @description = N'Contract Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnhhd" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục nhóm hợp đồng" e="Contract Group List"></title>
  <subTitle v="Cập nhật: thêm, sửa, xóa..." e="Add, Edit, Delete Group..."></subTitle>

  <fields>
    <field name="loai_nh" isPrimaryKey="true" width="100" align="right" allowSorting="true" allowFilter="true">
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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUMq+MZ6dYqOkxJi2C8Ujanw6JjBfnJ1kVyRDewlAPFG6SGrOGqKxDMt5lMaMYtIPdw2OF9g2c0v5+To/Uyzy/XgN9jelJxdZgCR/L/p4qGG4D8O/ldB3qh/b9B0ePTK7k69DH+fX6bY6QloAuSq/8/g==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiKLxhwChPD4yEPBbvcRo0GU+WH1vl1M+LvsWSNmfxh3xnKTAr/sijrniEfZP958PKFPgRZTKL0Zs71ArpCKLBGI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Cti3hHOdqm57uBO4fYTqhPnbP//M04fAOakqXVgZ6xkU8Q3Rte3muYdhAcJc6+wdMzLy6XyxRxPY4uo2EvQYtTtIjMkiuIOamMeikVtFo3jOXwhPdq0pOE17uSjOgLyfVDvJgvuBQa1IwTj9c+r4xsKUuEp43fWu0dFYjK/3Msdu3Ju+Kl+2G2OMk30Q47Zbccc8LLls02KaJxz8O8BCGaUMPg/L7Et0JhSwNcOXPd5lTJsmlagb8hIuN3mnuEhuDGVU8EGc+gY28E15PpFciSxWrOZ7d/n0fO0JA7dkwLHeSvDSEfPhJDCPm92VnGQ3YOohmMOxoJk0EQyjzyB0rFgI5osFDGb0hQd0EEIDuzHXwSDbF7emyb29wDZoUc6yKlQK2lpmg6hy+6l3XKJ82PKEMpPVzZ1iImC6CBlh8rtdCCMqKJbxghGcGKgwDyAJEnYBEq8uwBe9MAtb0eBfRG/iqEnv4cRf04yM4E2JBw6sPSfL9KXgcenbPV7MAsDHrkZa/wKDshBV+in//Pe2NQN8z7HFWHJhOTSNmhIY1oObjj8e0DjaVBpCqqTedbt3cXPnwHOSLOy1DJpnQT2ZF4=</encrypted>]]>
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
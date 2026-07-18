<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "FADepartment">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'FADepartment.xlsx', @description = N'Danh mục bộ phận sử dụng TSCĐ'
else select @filename = 'FADepartment2.xlsx', @description = N'Fixed Asset Using Department List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmbpts" code="ma_bp" order="ma_bp" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục bộ phận sử dụng TSCĐ" e="Fixed Asset Using Department List"></title>
  <subTitle v="Cập nhật thông tin bộ phận sử dụng TSCĐ: thêm, sửa, xóa..." e="Add New, Edit, Delete Fixed Asset Using Department..."></subTitle>

  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Code"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUi0W9FENnhjpTWFYUBebtpbcxE+cXufLKJb/2ErQJwBmmiwcvLmNy4sE6/9AgsLmW/JYjINoJ0QGK6pOsVlBI5WsYBbAz87+er1t6bc/1p4/tJiMl7sSBCpv11CyQo85A/qLi6qVgir372gromW+5ew==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiBXo1bHb07E0h09UCg8CuT+oemT+k7RgdaHRwJIqhdHvXaGpgUO5vvdGy9IScOWd4xzPdpGwWbOly63zvP3fMwY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hnXBrdqAArBPVLjz/7cGf0Plk+HZ8udjgesFPTAvYdtiTCVR9Q0eBFAHK4xX9bIkTY7K8dKbEoRtNKOL+4HX/j0TOoi/AV9z6YpTUj67l2y6ZLhcrPhdHTfoy5QxqKQl1ukH6OcFf5s8/6P9TbZMvpP5ywssPM1gUW259OUNodJBqW2Vya4RtRfmkdOl9y6JeghSrU51e3ZYBaL7GD/VZUDg3imYj1GvWVyQ4kwNLn443GwMpdvv2GlSW2mTBbJc172NYMk+XXb1XzHyTlSusLNqpw8X1WGy1/fTq5SdzaCksVgAPU2xN+ionb21Dce/p86Sfv9kUnwX58siliNhfwSQE9fJBoiuYTVojrhoiX4BOThINZ7oCRaNzAUMyVk2dXgPR/iUBI1eOomT9jyxi9Hox3cl4M2cpDUJcglHh4eo9tHmmFVjh41lqDAV/jDSJ1mAIaVj8X0qA5ruTjq0HWUIzofz8i4MeWj1/9QYsES8aDD15hnrwONdYM62tCtmNNFoPtHVbbvj9SP/vvlRY9qADkvtmINFnJ1iC7BulyQLqvhnxznYE2RTzL5GHTyXYU=</encrypted>]]>
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
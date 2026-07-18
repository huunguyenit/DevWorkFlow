<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "TSType">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'TSType.xlsx', @description = N'Danh mục loại CCDC'
else select @filename = 'TSType2.xlsx', @description = N'Tool &amp; Supply Type List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmplcc" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục loại CCDC" e="Tool &#38; Supply Type List"></title>
  <subTitle v="Cập nhật loại CCDC: thêm, sửa, xóa..." e="Add, Edit, Delete Tool &#38; Supply Type..."></subTitle>
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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUCXmXu9xNH2djLC50SY4IKKBLg+l0+ycE3Pg9duvlBdQG3UChi7LviHlm2IfnE9oQz87byuLAqsG0scR6U0bAiWp2jc4L5rHsPXMdJzHhUmhi08tfnBTqGiC/QZSQAsrICNwjmxGptlvBEgH3XIRBGA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiJFTD9u1Wn4f0oF/7EQEVAPqHNpCK026pgTxfTByCBqKYe9Ifjzju2+x4cs5M9QNrFiJHlcF03/FIef6fRJCpac=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hnIZ65vym1Q5WAW2xVSVE7ObqTJ4FthwexGwHEKsV+fIKj2a48wBIhDpm8kqNd8CGmY46Oc4W3QhfqTaVOQNsn/DAyPMYZ9gtl/USaFBE1oSIhRVC3KTi8oeVHpwkd5kg0VRW192kmeQb9Sdgq00XGW14hI3mvIv2zlGR10vHS9WdF2Gid8L/9Lc35GX6lGQpb5NYBQzCdr3bBC4IshaaWNTGEz+QDzL1NBluDD/Sn2rP2A9YOVL9qZVLuilPSRlO6VjnE5Fa87WktRpzbH5RK5lkNkkYr0qm9jNLF3VFpLAoP04+r7rh1iq5wK9aHKIJ5uy03UqQyUc4dM/W1LsWpGP4kwpIy2d/0TS32kQOreBL4cyRr3gIs5dn3KCRPAZA497fVOxfO8ZyPff/VBszZhfjgpE0X+s8Kal/LbdYfXS4rS1X8qaVhwPRRLwfwP0X6fiTBZerpVRjbXUDwzUKtXYel/SD3HzPFyxvuKOHbEg/JsGPHA+Gy0EGA03+dH4ZNUGYTvsBgJi82ax/vAqWxhzNu9vR6Rb72BWgLK2TQpwZFvKyb+IpRCo5BriMzdgjM=</encrypted>]]>
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
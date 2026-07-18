<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "TSDepartment">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'TSDepartment.xlsx', @description = N'Danh mục bộ phận sử dụng CCDC'
else select @filename = 'TSDepartment2.xlsx', @description = N'Tool &amp; Supply Using Department List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmbpcc" code="ma_bp" order="ma_bp" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục bộ phận sử dụng CCDC" e="Tool &#38; Supply Using Department List"></title>
  <subTitle v="Cập nhật bộ phận sử dụng CCDC: thêm, sửa, xóa..." e="Add New, Edit, Delete Tool &#38; Supply Using Department..."></subTitle>

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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUCXmXu9xNH2djLC50SY4IKE7W1wJX75oZtZn8EnOA72XpJ92umyAbVxMrbmThtYXpLG5Z7Y37+3Yr4dJQrb+c+WYmvblD3I9Ej9b3RY2rwgQlV05tTiqybVaMizaeSjGuzhOaSIHg0K+tqnyqtz4TUg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiJFTD9u1Wn4f0oF/7EQEVAMdfXs3uypbSIznDLb4TY6Yft0kHT2FowJTXxpfLPbSkEVdbsG1Rcb4tVuZsYXZ8/A=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hmJBumFjIQk0NlfYpwBTU6Oz8El3Bw42TgILBqkDrqhe+9KpS6qF2ESi77s7RYaRIWCwVRU1y+PwhL7LsRHk5Nc7+ZZ/gEQ0T/uZ95f2Ebfy42luElI0NSpSjS/WvePM7NpFVfIgVxiNJGF2TGSL1/d28S6uKCvgfErQjU1wmGyr00vci2LDieuvVls63IuCbr9/+wCc66+goeQpgUZRViKw8SMudJdkZxMCvToVgH3/ucEwCCEx6B13v+ht92GH6CQzDPveSD9dowsOiGYBi8BA57/xFMHZK8Rgd0kh8fcxxy3rL7iwA9vRF61ztB24xGyN9f16+ryEv6PXOwXUhs/ySo4Xkz3AUd3VlNZX5PqP0QU6dR9y39cX/6DcPWTGBx+QJ5TGE3avCeT2qDsSMqNMgelLmYoPsV2okavVgI+wglNAaGTtAOQfjlQQKUYCF7R0gf25rpmgKy9lZWhVjO+Rlj+D3y9O4f0sSj1C39LobnFlb4YmaLabImcDt3o/OmzGNkQ+J1hSCAmVHIEb/xDH5Xh1BSa/4OzzaA9S6WS9QVUbWEkLoLey/a4o65/zwU=</encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ImportTax">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ImportTax.xlsx', @description = N'Danh mục thuế suất thuế nhập khẩu'
else select @filename = 'ImportTax2.xlsx', @description = N'Import Tax List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmthuenk" code="ma_thue" order="ma_thue" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục thuế suất thuế nhập khẩu" e="Import Tax List"></title>
  <subTitle v="Cập nhật thuế: thêm, sửa, xóa..." e="Add, Edit, Delete Import Tax..."></subTitle>

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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU5LgAcp3kyCCOsUyuwDHIoF/MgG174lH/mEF9EgHs0Tp6yUMKPxue7m2aXSflEqfZ2N3fGfteX1wg+FoH2MGHS0LBpOlqogj7TBt0LMJiUo1hunGBSVqn2A6s/ACG+gr5qfDDCfh7WB9VMruHUanctA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiHvAQkqBPwC5EfviPcaVBVV6LlDtVutWqTSckaeE9Y/sywL8OtqzjN+ZDUFiAzg7H9ChZ032hMr1h2iIVfL8xcg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlfMQeKEU+n4Qg5dyJ2lxpsNqou/sCFUt7xA3nNkTR2vXfL0YfFC8uVOP5nLEtbLtmPKIOHVPTzj2YV2DvEobsTFqBlNpcqf0mafz7jB66hjaxIscMSlDCIjoAAgCXNP01KRoB39eZe+4XmfGGXBg0UWtXQj3hxKRpjLR4MwpcouzL/f9I1IOkRupw3LZhzmcU1P3Bh4+tm3/KWFpKX4s12rD06Wc1OWcUPkN6oJAi4+ZsptBsmmo0YQLIv6k28r4CJB+ahAf1bFzDCuQAD/RTxxkYdJ0BuD0HhRF0I9h0LF/j4c23CIDFeJPhLPQWlV/fuDbvJVWy9VfEm5bkv7X8jqw8H/4QwA4Dl7zCWlOgq4YsV6gKb5WaEPnEyZClEOrke/4zWrZnrUWd0DBwX5G/eFIpwfKsZwzJMCFukDicsH3tXh5n5x7HIqVsw3i4vgMnnEHW/bsmx/m0wwzycUBDHFU4qIwebnTqsqXb8FLYuDWZ2pWyn/BoQegY9f4FBloLhV6xhgnH7CikxItA8OT7EEs1Mxto6Os36FZg5aVWZFz95Cf8Kof2ILM9NI+NhFgo=</encrypted>]]>
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
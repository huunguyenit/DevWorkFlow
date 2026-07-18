<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Job">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Job.xlsx', @description = N'Danh mục vụ việc'
else select @filename = 'Job2.xlsx', @description = N'Job List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Job;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_vv">
  <!ENTITY Tag "dmvv">
]>

<grid table="dmvv" code="ma_vv" order="ma_vv" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục vụ việc" e="Job List"></title>
  <subTitle v="Cập nhật vụ việc: thêm, sửa, xóa..." e="Add, Edit, Delete Job..."></subTitle>

  <fields>
    <field name="ma_vv" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã vụ việc" e="Job"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vụ việc" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU3cQuzpw1cliYp5qFM9wCPHY9rxBDq6JQ2XknMSvQo6KJ1iB1tGesDmLCDtvM8U/m91yCmuLM2JG4rNVYvDBUl/yoOYGanPfVyFkkQDRb6QIjl57rBnd24qLHulQwQow3</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNUBrsXOTrexuecQHR5XLyfd3kHcx9PBC5W/ZcNTQHpTpkISQyXMhNQlRuLd4dfJ0AUUF/EsLSDBKP87WxEYYm4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26Dy1WF56oHeRbFprR4tIuvugJdF6J5Wzs3hPxUIx35Q6NvBNFXKTOKzaENHOvI7NGHHcu3xWMItaA2RZGji76JZSsZQvUTFYEGOdv7CMRgCji5ZOlVVBaUtnSWabdq0FX/MwTqCHMHN0Dc5Mk4Uk926KiqqeYraQWBw8veMulDPlBMLeU7NMcBXpnVcThbQ7mlZqHcpHTXrL6DT741hGOmLtcbNEOffkCZOXEemY0HxoAf1YY5jJPdYVwOOxKO0HbfxsTwUbSPGCMCgtKjlNlo7RiPgAtp7zYO3h9F4iMpNb1laMzq39DN6jEqldbuV2DjBgroSPKDuA0Vyd5uxTCR7ZejR/gwdGhujyxKp075bffVGByrbQuUunZOZSo23POuNRmc2PU5A6qn1iKsS3wDAwwpDx3gDctYKNtXVDeHlaDkloQm6v2ijWMtGlY5MYWk3FaBfhi04Fw592p5u3kCXtf9GHFhfqMdnfCBSUjmfrjjUSHIhwGGCwXzfn5EiO1+Q==</encrypted>]]>
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
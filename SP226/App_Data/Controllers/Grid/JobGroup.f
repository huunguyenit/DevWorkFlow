<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "JobGroup">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'JobGroup.xlsx', @description = N'Danh mục phân nhóm vụ việc công trình'
else select @filename = 'JobGroup2.xlsx', @description = N'Job Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dmnhvv" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục phân nhóm vụ việc/công trình" e="Job Group List"></title>
  <subTitle v="Cập nhật phân nhóm vụ việc/công trình: thêm, sửa, xóa..." e="Add, Edit, Delete Job Group..."></subTitle>

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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU3cQuzpw1cliYp5qFM9wCPIyKD1GEsSy28J7i79MClo8249S8uLPFjpl80pMXFvDfQvT3RcX7bNn6WMcvqWod/af9vJeyhmzWptMTuxS/MZvSYxU7GFgI+3qiGGCgtIhVDAqIT/+1ahFpOBAv64TAHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiA6zD2IgmK56a+KtVfCbi6heLt0yJs7beLVxl1O2dVGCW6V7bsAs4JmNZlRViYb49sNbaLCsASwOT+gz5nHklj0=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FKIYeWBqyqp3N0i+n8h5+MO3IdxmqnweUqcvk0SAZeDYNnJK6XGFiSL+f+zqvHZtVTihIv+KIE1aDb8DhCuljzMEyWnOH2l52jTDIvHb/PbWxSZJideO52VsYUMMiBt4a/7SvTrFlfb8H+DyPkb9fUN4EaBc/Yzwg9tET7e7aeFpR5fM+1/AOKScZhWLg2aK3SDSGkr737AY5KIhxYbdnH8HjPmfG2FmXnl6cw3Bl3tt86V+PR4o0fI4r5xXLMiLCKIg6ACWZR0O5uWL2HurL0zgADxKigj5ZynSz8WaiYO6tbeYf0ILPWN76uE575FP8jbT7kwaMyDTgmDnFFlRRdplHunVjli4ZFngOip1z8/mcNNNUewDfe50smHYSePyk7MG+j3Cq9k9ISTfM3KYJ+BQB5mB1IzWOqAum7f72TywQX12fXC08fBUxzFquqtZMsVdG9oGvyYHgsr2s3kf+CDUl2R35NckQsYLfZ6MaUgQaG8jNUBs9BjxU7ZiE3rnvICmxmck8tk+GxAXm8hW0SOZz6aUgeNcgsLPtVZUjnyUf70iGPOK1O1z5sbm7YIiOQAtvi/9TUIRchX5BPvSUs=</encrypted>]]>
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
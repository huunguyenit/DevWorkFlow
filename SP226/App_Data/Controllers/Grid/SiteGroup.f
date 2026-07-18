<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "SiteGroup">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'SiteGroup.xlsx', @description = N'Danh mục nhóm kho hàng'
else select @filename = 'SiteGroup2.xlsx', @description = N'Site Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnhkho" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục nhóm kho hàng" e="Site Group List"></title>
  <subTitle v="Cập nhật nhóm kho hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Site Group..."></subTitle>

  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUCF4hTtnC0wSW7uS7QbeK1ZKH9DqKtFJ0G/aEFiwOX+4vkyX0P+PwcXhV8/FsxPu5whsBbwp3mZMVjG975YBOvlaFKVhR/k2eSMRBHolDS3cPr8DjgvbXuBsNLZyok34HaEkGsqFDGaeVWLGvYCRxSA==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D3CWBwCvsj6sBg5li0+lYGYHk/2AfxpSA2yl3o+Fyjv5+bI7IpUPx1TlWk7O2yk0X8Pt1hH4/zX8lk4CSxriyp/8KEsiJkHNxTnoBgQ3pWXn5BPqyB76Y+6X8BvL+tqT8VTC84xUEaZe/R8CNsN7+xzIU+77a83goFrhdoZ2ym62Y30KZIrAKoSS9vMQe5nctfIEo3YQT4bBSF/kYc8D3QlwTWse66Og8ysMMrXOlIrzZk5GdmTG99HLNEsruVsOsoJsgx+1e2KBGNRBYK+fV/xd9uemTmzGZJ68JWp6Ok3/dZN4/ESwNerndE/oaMCZebyFNFxtLJibnT71u24VZPiKbgQiDtTv1LLwdN7eycOO5ylSKAdHifYGbn2Xbn3Hlkps4jv+mVb5ZfJyLmqjSrGRnkrFAb4PSk4Gg8POx7hKJ+9QOKh+gnrt6Bvj/8762Id6kI2KoRdqMttbL6MSQ/MwoIPb0bWowpPZG687FMzD7iZz6+8DYHoY3OxpLNK5o+ylfov+AHRbw08Q9n5fCp8=</encrypted>]]>
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
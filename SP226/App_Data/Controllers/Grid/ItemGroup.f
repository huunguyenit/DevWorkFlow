<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ItemGroup">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ItemGroup.xlsx', @description = N'Danh mục phân nhóm hàng hóa, vật tư'
else select @filename = 'ItemGroup2.xlsx', @description = N'Item Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnhvt" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục phân nhóm hàng hóa, vật tư" e="Item Group List"></title>
  <subTitle v="Cập nhật phân nhóm hàng hóa, vật tư: thêm, sửa, xóa..." e="Add, Edit, Delete Item Group..."></subTitle>

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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUVy38x8gJEuSTvFqlSS4YrgeQD/Oei++tSNDrnq9qTYONDPVJw9dypdgLfSCN+QoNM18U90HgkOUCgnnQoMJHz3mIxS7tqWhm1ZYU7BNu78yVXKQPDH6rYlD790XBVM+QwHMk83Zx8zKlGOGOQkKUoQ==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D3CWBwCvsj6sBg5li0+lYGYHk/2AfxpSA2yl3o+Fyjv5+bI7IpUPx1TlWk7O2yk0X8Pt1hH4/zX8lk4CSxriyp/8KEsiJkHNxTnoBgQ3pWXn5BPqyB76Y+6X8BvL+tqT8VTC84xUEaZe/R8CNsN7+xzIU+77a83goFrhdoZ2ym62Y30KZIrAKoSS9vMQe5nctfIEo3YQT4bBSF/kYc8D3QmCejsySw9OZPqaVjnHek3N6Y35Z7/RWnBqwHh87vdTKDEFpC0MwNp2t2/cbps3WwhKd49KmKkONBeLiOAhh0QjUC1TJ7+h5016+9IDCIH527KOTEpNyapFvKmCujikNUd2rEyF35XpZDxN7+L+Ot7aWuJrQ2jQCi9K953XpMNrG1kSMKDaCTw5mv3Qxnj9hLKbhRB2fIV22jckvSnLyrDBMIfIdg/8XYL6ERr9Rvcq2VNsF9t0lbDClwWwHpiK9vHoWfYqLvN+F+GR+HZqL1BEC+38quOcAjbnXyYuRC0OFGIB26PQCNx2UxOANSfCPbs=</encrypted>]]>
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
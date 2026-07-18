<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Item">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'InvestmentArticle.xlsx', @description = N'Danh mục chỉ tiêu'
else select @filename = 'InvestmentArticle2.xlsx', @description = N'Article List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dtdmct" code="ma_so" order="ma_so" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục chỉ tiêu" e="Article List"></title>
  <subTitle v="Cập nhật chỉ tiêu: thêm, sửa, xóa..." e="Add, Edit, Delete Article..."></subTitle>

  <fields>
    <field name="ma_so" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU5LgAcp3kyCCOsUyuwDHIoCXsiP8JLIAgRV/dapiMKq0useq1B9Ea26k7ZC8rUNrdzE1c7eCj64RpLWcnM04uw8leeympjTTHUFKfsSRMFKwMnVDllzf/oV5uyhIAMOyQmcRvQYtg76ka7GEZQ4ZkFw==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D3CWBwCvsj6sBg5li0+lYGYHk/2AfxpSA2yl3o+Fyjv5+bI7IpUPx1TlWk7O2yk0X8Pt1hH4/zX8lk4CSxriyp/8KEsiJkHNxTnoBgQ3pWXn5BPqyB76Y+6X8BvL+tqT8VTC84xUEaZe/R8CNsN7+xzIU+77a83goFrhdoZ2ym62Y30KZIrAKoSS9vMQe5nctfIEo3YQT4bBSF/kYc8D3QnyP4GQIIp+Q88Ieh6MzOiCuL5MErOtbkEz7/LlzPBdH33nVx06l2l9oAyCm5VrztxlZevNXiXv6cbsVrbh45Bp6fKUdWHYKw9ZypCLhAooCbjPqih7FgiN7s7vNHeHXlFaERPX0VYuRmdiJg2eqXr++wEnuq36QdTAurfQs8EZm34c61jiUKE7Cm5fjtOnzHM8W1GYHt3B+C2BQgRJOnAFcdEaPeculJIuF8NRGXGVQxPSd30HaJ5tCk6Am2K4VGLnNMxZDbb+qzL7OWoOiTgZMYp4q8w3Q5qgVqrJTda2Xhh5jOtsX07BIysYsjzhoVk=</encrypted>]]>
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
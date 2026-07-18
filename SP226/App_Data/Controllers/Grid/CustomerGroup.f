<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "CustomerGroup">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CustomerGroup.xlsx', @description = N'Danh mục nhóm khách hàng'
else select @filename = 'CustomerGroup2.xlsx', @description = N'Customer Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnhkh" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nhóm khách hàng" e="Customer Group List"></title>
  <subTitle v="Cập nhật nhóm khách hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Group..."></subTitle>
  <fields>
    <field name="loai_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align = "right">
      <header v="Loại nhóm" e="Group Type"></header>
    </field>
    <field name="ma_nh" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUMq+MZ6dYqOkxJi2C8Ujan7pXls48e6KVzi5j5uiqIN045UtY4x0s20KgGLd23zFUmCi+XiE8mF1/1ORtadjRBN8GEPyHKPPn/+rFYr8VFBL/WkKfQTdp7y6nAx3RenXRsba/QEWM623TTPw6/eYWNQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiG+SyGFdkK6cWYhQ9NVfok5YTWJOkIK8Tj1YVk2aMBam9KqRmPkflnFJPURYwvdcJjetdO/pITUPEo6k5nRHtNk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hno+/PirEmAxUmaQRzWuhwK4WdMyuvS0ALH/r8+8lQ6HEJ33LhWJpyOcJ8Fw5GQ+N1N1XKjjYuLLOHVBGFCJG/cmJIn9/cvfKhD7bpObVWwvO1KvzucH4jsA9l33dbQEXfBzm0FNgzk2OAP+EhrZqH4HfVHW87JFYke3o4uz2bsfKSdtW15JkSx9cZf0t+jWJec3MCujopfGMt/WgySIsC/5FIj3hZwLreZJWbReALuO/RlQs8CrNLu8ZOuWrSfvl/vqgnGbUxR0OOjZIeyPABxaLaiS9Gc+asOt7h7UBHGF5SxZl1R0rZZEWfHLQ/rQVTtv7XoC/8BcLE+lL4KT3CJw6TnTWEIePBXmBOdFy8NM5070Gs/utDFl19QuOgrisjRDxANhMsZrbmv8uX0wWXv+mtvP2SODtI7ewTimsN2/tRHvsqBvRCRalH+Jaskfyxzz2gABmdhXtBKHnbcFf8Jc4rPQ+unsnDmqndae5c9enEJ4tlTduEiF/PP1lPhRpHVgk+d1mtinUI6/XdpCxRA61AA57Z6XWFivgy/ehIJf01NMIqjixtuM/Q+d3oM5zk=</encrypted>]]>
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
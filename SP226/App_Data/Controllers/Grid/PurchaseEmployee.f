<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "PurchaseEmployee">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'PurchaseEmployee.xlsx', @description = N'Danh mục nhân viên mua hàng'
else select @filename = 'PurchaseEmployee2.xlsx', @description = N'Purchase Employee List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnvmh" code="ma_nvmh" order="ma_nvmh" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục nhân viên mua hàng" e="Purchase Employee List"></title>
  <subTitle v="Cập nhật nhân viên: thêm, sửa, xóa..." e="Add, Edit, Delete Employee..."></subTitle>

  <fields>
    <field name="ma_nvmh" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nvmh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nvmh"/>
      <field name="ten_nvmh%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJznzoo2UreQI6gdtxXgUiMer/n0nhtmI81llD4ywFk5bjwLnBuOUFkqZFahI58awDnfw8VESEGeaPLhJ1Bccn+6DNR3wKoimaDy/WPLX41+F3suQ5VGt/l7vrW/1HAJmXjW7ZBuAXaSkqAo9WaXjzXMw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758v0uItNyKKPB3H7YxWE0G1gyYfGv2rPVDIj+MO9c/7xozpnY7JRQydLLhGhWMjikqi14OHs/zGwv/wGtPdJmag=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5SeDZfei3ABrCDB97g25yXqGx2SM5e1DhhRXW545DTDx3qkj2F53edHOtuDBVJcnQ8ZciFDCIZEv2gvYjFAL7yBrmbTwSDWbZqM0iqwbiqS9IebVU2Q9E7VRT0mNGdGT1pfY5bCv/TrXN+6yUPdMy2L8SOEQbsQ/Fx3ZdiOWtPqUtPdAIwt9uW6Cy6LIZEJK8U63NHE3+GFgZNTFVbMgGXgry/pBehoUjHWQOrk8AybjBgGxRUuqySpfgVrl8JSdJApK34w28V4ey8XHNxws7ZIpzeFIzPuJQMr/cbg5HWQEWpMp3yQPASG0c+YKEteUB1vroSqmqfUVL6ombiMfkiyZyOKM5eFI7Hdd1tbadW2mv+B6qcYO6dtC89d02vd/3jntNywUL6tWMFdYd0+fP+xxGMbUnS74HC3rP3/jW6GlpaUCzlzq8iLqR1VS7h5NgbiRqoPsOQQqVQrPd94KVI1UwAxXXsRkbcBGj0SZcS6V40wlWimwFZiS3rtDSwW8Hb9b6PGYeU1gPOm7Wq9c2KRTni4fLILfvHvkdSykDN/BB3t5cHzDmn/1e5w/N32UY=</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
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
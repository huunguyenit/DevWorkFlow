<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ItemPriceClass">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ItemPriceClass.xlsx', @description = N'Danh mục nhóm giá mặt hàng'
else select @filename = 'ItemPriceClass2.xlsx', @description = N'Item Price Class List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnhvt2" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nhóm giá mặt hàng" e="Item Price Class List"></title>
  <subTitle v="Cập nhật nhóm giá mặt hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Item Price Class..."></subTitle>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm giá" e="Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm giá" e="Description"></header>
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
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUVy38x8gJEuSTvFqlSS4YrpCQ7eIJ544loo4v9Pz2KDccqG7b9Qs9aymgF0V7KeI8x+Y8NXhECj/KnjNj8WbIFhkU6aXRQ15J2WHPWRchpYbTnB40YwfHA1eFGXf3krx4XF+X2UrDdX+vZFqdidVSyw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiJfYgkUlcjD1TJ7yCRpZAyb5ylJ2FnPh2Nz5gsEkhunZCqu4B1rQSW1AKFFXjhrhDPLArW5uMQKWiT+M4Z+dOMA=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hnqMAur+nOYVATSL1QRRfrxF8Spo8oEjtHCCJdMPVlmmqgubOXukBpjos4owe1uU83MJC6PXNwNODo/4kxScCcX51IWLFPS2/D/UhaaygBEqobfB7XrYZpWz0fF/cZq06zgeJ/ldyGHPOAdRHFZQgYE9qIJKXJPStFgx0rMHkUyYZhD0Cvjp+1lQsTWCyc5keaS3Xz0iChhApFgrcJJOpRy/w8YK5rLpBX0YZIUR5+m92VR7drgiW2Jx0N8b3hrKhxRkYS7z49zbPniJsc3ExxQkCTycc12CEWfUsr1bAZwpuhzRgv86LGwzBScMEnH3nTtVV61xSU4PVT168o6zWjBMaAzIBIohg0yTvpMN9WeoygsRa0TryTun15TW5LViiYf+7Gx1S7SZ7bTCWRTAvJDyJNbAUCWn2UohoJFaU/QdsF59c+uJl8dXaeMc2LVhb7cgg0hkzhPimzESaSjMYGp6ptH4bW/N1C+2OBsEah+mVbM0rPM7VpZ0nhO2cksgchwGhCsdWDZAPW5dHK14NAw/o2nlwt0uBp4ddQ5PICmjQofQmfRmPF43RkRmBmxbWA=</encrypted>]]>
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
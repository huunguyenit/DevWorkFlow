<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CashFlowArticles">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CashFlowArticles.xlsx', @description = N'Danh mục chỉ tiêu dòng tiền'
else select @filename = 'CashFlowArticles2.xlsx', @description = N'Cash Flow Articles'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

]>

<grid table="dmctdt" code="ma_ct" order="stt, ma_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục chỉ tiêu dòng tiền" e="Cash Flow Articles"></title>
  <subTitle v="Cập nhật chỉ tiêu dòng tiền: thêm, sửa, xóa..." e="Add, Edit, Delete Cash Flow Articles..."></subTitle>

  <fields>
    <field name="stt" width="0" hidden="true" type="Decimal">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chỉ tiêu" e="Article Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUMq+MZ6dYqOkxJi2C8Ujan/eyl0g2s//xIXpHJ+9RkwoyGUb7u8QVxZj3Nofqj4WrkMS0r+Z2gL+E0h+crSE0LDLld3TS7+EofpJBErKApK1Gp7rB9U1y6XoMawz0B+mw+UffTzBtPmy8Ze/NxD/VSw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw0r+aDZxD7/z8Jv5YIeUV8Ux162l0ApTycgBmG8ZVNcEVEUXew4GPT35Bh2yK91+bWHg5KJhW8/5soZMg2svXU+fOzWkr5FtOKzZlsSoFO/</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hllV5QwqTawYz2UTQ/TAm3NTZEaWf9Hklbp2mOxQ2mxojrvzo05+SZKQ9m6zZnAPfluUQro8Z5Q/Rmk6C/28Ax8xXCJwt7V1dAPPxZdlEItJB5f/noKzc3G66MqfPJo33z/gucCwKP0myROA5IIkEY+5bC9nkYtOpcvlRQco7Nmu3FAkoleZaWxQeu1ilmndHSQc7DxhDuF2GYzdbvx8BtzN0R4DBQYN/pQYJmC6j/QqupLgkWhE2vMgsmenLFVk2YtzPdGfkZd7irTrF7MJDiVrdfI3NjiGB7qnT3izXWFKedBwrDqaefwoRPmwqLnH1skWFkhyJlESFVtQu3plrvUzPPAlloFqO3xfzw19FmW7ijfyx9ZtBQuxiWbFM097zkV8CMKxzMB3fPxtkFiW/g1i8PKu3HIj5nZtx//myJdpfVsYgeQAomXjQLT2FQWb37MrehUcagfbT67LSCeySxUqZv3hlBfR7ksic/z4zLi5fXJEYNvYhVWR/8mP9DLmbn/0ymWQOLGrmeuH/I3Rk6JmxaZJykGTVP47vRNVUjyAlNMlDQ3f0afd2Y+7Zg1MOg=</encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "SalesEmployee">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'SalesEmployee.xlsx', @description = N'Danh mục nhân viên bán hàng'
else select @filename = 'SalesEmployee2.xlsx', @description = N'Sales Employee List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnvbh" code="ma_nvbh" order="ma_nvbh" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục nhân viên bán hàng" e="Sales Employee List"></title>
  <subTitle v="Cập nhật nhân viên: thêm, sửa, xóa..." e="Add, Edit, Delete Employee..."></subTitle>

  <fields>
    <field name="ma_nvbh" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nvbh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nvbh"/>
      <field name="ten_nvbh%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUCF4hTtnC0wSW7uS7QbeK1bzbSXkibE0+hdSyC3wezh/PIIEythcGwq6U2Gn5lOaflFRKKHtXzRzcZEwVg/EBzJYX0P7vsNnUaqcwu4qMt1+AorVl/MZrsqLIaqW+1sudHkmPaF9Gv/i+Gp+aNgHaHg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNGGbgpt/sYYDycpkPWOJe243YvycwuYFN/E3w4KLqJFy22LH8MNpdYQXEqvCIUxk0ooO+oQy3ksEV2w7M1oaW0=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hnXOitwSJ0Xa1eSAzai2OeT+B6JMS0aQ5XTUSRmdRoESaatL8LAZaJtrRiZliOuzSkqVfw1QGRQkpwL4c3ytroGKrtFMf9cntM3Nvep3cma43RR4kpXkghfpsdmIfvRxnLGoO1gB0nHIQTkXJDweYTcOBzgRt4ppTin7Rbj+aDXfi8XPUXEQIJBhMNirIVV7PB0dvaA6Kd76kFWPfPD821vVflnhD5DO9ZmCLj1O7DaYKBbHolDOb3K6pZZSxUN9kNrsZrvzNEAWv/xvkvh/TOmh3Oo0MRvlTsVp80g4AQ8sfu1Wvpev3xoMssrKzwIuCh3uTnL71BC+nh/Rdf1DocCaC9cU+4vimZjcmhME3IFrvnXTlP2x3MdbYPgCv7SL61ycOqB8EAQDB5bR7dzPaW4YsloMmj0J9hYMbzEaNc+K6MdDIVGr4Sc3pMTVOM/PtuqChWZ4YLktdkFdsWxdrcTQYUcTKAj6NX60enoz/hliMHRDRdsjb/jfZRMBq6BhBrYLatymghJIdG23lm2lgh/FIo0s44pXvakAemNMJ87NK9G4q4kdKJEsDn7dNIdaZ4=</encrypted>]]>
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
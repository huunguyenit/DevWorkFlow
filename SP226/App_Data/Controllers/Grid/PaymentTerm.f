<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "PaymentTerm">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'PaymentTerm.xlsx', @description = N'Danh mục thanh toán'
else select @filename = 'PaymentTerm2.xlsx', @description = N'Payment Term List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dmtt" code="ma_tt" order="ma_tt" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục thanh toán" e="Payment Term List"></title>
  <subTitle v="Cập nhật thanh toán: thêm, sửa, xóa..." e="Add, Edit, Delete Payment Term..."></subTitle>

  <fields>
    <field name="ma_tt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã thanh toán" e="Payment Term"></header>
    </field>
    <field name="ten_tt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên thanh toán" e="Description"></header>
    </field>
    <field name="han_tt" width="120" allowSorting="true" allowFilter="true" align="right">
      <header v="Hạn thanh toán" e="Payment Day(s)"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tt"/>
      <field name="ten_tt%l"/>
      <field name="han_tt"/>
    </view>
  </views>


  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUFPdv33f5B/5I6fZz5nG0vJkKzkBswo7Cvg3YyMiyTcxwrrUB6d1W4L2joqvCUbJBvsuvulPReF8n0WcE676mga3FRBaODQMAmC3rjZqU7v9llxSezIJpA0IMEeFEy/XiJtwjOSvNBz6eUERZc5iEVA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiG9pdNbc4iyULlLmedn6fbP+OxbUauwVliQW0UNZGn6LUNUZzEixBXTwfl82PMVAYeeHtlFXpHoaG18+wuKC2Ec=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlq4ITkl8Qg+pdv6mT+3k+iTzJX2rXPjEtQkFsY2UE/BTvoDinThMamHPv9tun553FjEIB2umK0htGjdcXJtuM6tiTQ9HCeL7Z3tF0xvG7vuMZa8M2RniosxNAGB3ujl+RE5HF+3JRsf3+tFLM4ZHsaoQGM2wprtShCBLrx4StspZqjJCjNW8EusbsIDuex7rqfKdXtiauQ+/w6tx/94ynLMqdrxc7H4NqczP97rUpwepAMS0aYaxGz6/ay17dm3rl/hTjupmdka83m93/ODQbZ2PvU2twdFQoPlmqpTH8rpYVcg8yWqkp47LMWltZ21ns7cQhRA5m7ZTVaYXxucOsoq5kZgmjTtaf5ZU6+5F1HiSfvMMdqEP+6mkz+ZB3bcys+ZuU5AHtcFQUrbpQXvwIzJCBjNAT+jvKFBpKz6yoY17noTCo4WXPkARCYnLXKTK8XAS1kGYetXtf45W6CdWnqZpnR0g4Br3PPcmW6FFEjmGl6q7aSoX7GmEomUXFeQqMI/QqkVbVzYSFbNmGuPpCSOk5D5x8l51KB/LIECHlZjxLT9BfrB1+6DwymsK60YEw=</encrypted>]]>
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
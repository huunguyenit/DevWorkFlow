<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "LoanContract">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'LoanContract.xlsx', @description = N'Danh mục khế ước'
else select @filename = 'LoanContract2.xlsx', @description = N'Loan Contract List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.LoanContract;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_ku">
  <!ENTITY Tag "dmku">
]>
<grid table="dmku" code="ma_ku" order="ma_ku" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục khế ước" e="Loan Contract List"></title>
  <subTitle v="Cập nhật hàng hóa, khế ước: thêm, sửa, xóa..." e="Add, Edit, Delete Loan Contract..."></subTitle>

  <fields>
    <field name="ma_ku" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã khế ước" e="Code"></header>
    </field>
    <field name="so_ku" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ngay_ku" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ten_ku%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khế ước" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ku"/>
      <field name="so_ku"/>
      <field name="ngay_ku"/>
      <field name="ten_ku%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUxj26I1JZjjqL63EYpFpCwZA8YpL6h8JSRCHUuq+xojbhhSjVAaFVKQCNZVxILenJMYe7Gyb0SjulzzoXZJgtGmrZlZLu4VJCigVYZE9CpWsF4geEDVvLthjJ+iV33G2teOSFT/L/G7O+CHDI7b+EEg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9gWVBgvSZE0E4b5bAH8uITEfUAIma9cnALzna1Kzpa9PtQSKyilRNxvFzX4TjLf3qmMbrbUh6V8qujUABEMugI=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70DT0OpQ/YhNuLrWPj4vo0HclM4O5DcO+dF+t1d4Y8nxuJtkaDK1v7H7g1hsMihlsXxmcvG/Fyvo2gzbNlMrRZOZZOntYgD9JgFpDsESABh1/9CRFtslI3c/Mih9KJ/9djch1txBfjOx0Geqz7JOwtK7o7kJXAma/uMSTkfwcNQz9UamvMov1LAsZ+tSpo25saJnLz6RtqMGEzuDUyLif83U14PBLHb2O41+O5zP5EgXhEV4zKSf7wBJcwhNL/Pj7OIiWUTX7NbRjkNz/Bb2u7ama6EaJKhPtBiWXyn1u6bHqUl4u3VByuz7lB3rxAIw3jMHCu2EbKRQfkJIS4y+e7syIs+MKwuWgBu9QMvdD9f626zn40TYDk7wGgcFfzaVLMtuqKX+mJSjweT75btyunyQqbjBP48/eHaD8i/mIyTnKvGsSdGHRKxcbXIn12bTZDjMGub/Su/Vekc4m1VXF8tRHVK14Um4HvQB/av4EBzltC1CnJnU/DkfN9l/nHO7SqMR0PVdCeTTg5euYQ5F9GOPeLxdjOt9btZRYhbwcgnJKsdpWMiPPFuStKH+8Z47UN+zJXzf9neJaCCTmg0G9QpU=</encrypted>]]>
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
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
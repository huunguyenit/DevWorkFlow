<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrStandardSICodeMapping">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'hrStandardSICodeMappingAddress.xlsx', @description = N'Khai báo tham chiếu mã địa chỉ BHXH'
else select @filename = 'hrStandardSICodeMappingAddress2.xlsx', @description = N'Standard SI Address Code Mapping'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vhrmapbhdd" code="ma_tc, f_ma_tinh, f_ma_quan, f_ma_phuong" order="ma_tc, f_ma_tinh, f_ma_quan, f_ma_phuong" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo tham chiếu BHXH theo địa chỉ" e="Standard SI Address Code Mapping"/>
  <subTitle v="Tham chiếu: %s" e="Mapping: %s"/>

  <fields>
    <field name="ma_tc" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="Mã tham chiếu" e="Mapping Code"></header>
    </field>
    <field name="f_ma_tinh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tỉnh/thành" e="Province/City"></header>
    </field>
    <field name="ten_tinh%l" readOnly="true" external="true" defaultValue="''" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tỉnh/thành" e="Province/City Name"></header>
    </field>
    <field name="f_ma_quan" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quận/huyện" e="District"></header>
    </field>
    <field name="ten_quan%l" readOnly="true" external="true" defaultValue="''" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quận/huyện" e="District Name"></header>
    </field>
    <field name="f_ma_phuong" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã xã/phường" e="Ward/Commune"></header>
    </field>
    <field name="ten_phuong%l" readOnly="true" external="true" defaultValue="''" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên xã/phường" e="Ward/Commune Name"></header>
    </field>

    <field name="tc_ma_tinh" width="100" allowSorting="true" allowFilter="true">
      <header v="Tỉnh/thành (BHXH)" e="Province/City (SI)"></header>
    </field>
    <field name="tc_ma_quan" width="100" allowSorting="true" allowFilter="true">
      <header v="Quận/huyện (BHXH)" e="District (SI)"></header>
    </field>
    <field name="tc_ma_phuong" width="100" allowSorting="true" allowFilter="true">
      <header v="Xã/phường (BHXH)" e="Ward/Commune (SI)"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tc"/>
      <field name="f_ma_tinh"/>
      <field name="ten_tinh%l"/>
      <field name="f_ma_quan"/>
      <field name="ten_quan%l"/>
      <field name="f_ma_phuong"/>
      <field name="ten_phuong%l"/>

      <field name="tc_ma_tinh"/>
      <field name="tc_ma_quan"/>
      <field name="tc_ma_phuong"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU7NzAztnnmifnp6WURChCdm1o8ElXzZgFhN/doNS/CwjCNC0EauRxcHVjOeA/W9q/Y5EcTeVpic91YgLdSpvNI9iUU2MqaNWzEBXi4V6iK0kR1jVDpnJS/n/go8Rn4uWJJW4HRjtle0fabp0tl3s8lE0AzQyv/CyzikBVdpm2p/8=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiAGIFA2wc1cEwNPOytJ2YA2bC9UxIYPN1TMvibAAtcFSBWHbWJDW3CuCTHsQlpr72tLPA/jamovUHA0ET57qbSLcb4hV9M52SEsLIPFkqb84</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hngJtVd25vbETR2UhxgPYxozHC4488tlzGo4nqPOamWqnXd3AazTPgZ+W4+/0Rc9X6qXQRRjPqrEIyuucc8NC7Y8A2aYA6tANg4z4FAEUHPD/gWTJ78DAA77vPAsG4nWFopjJZIG/HAWfNcH7sI0jIXHG1yDIiCr/1QtSxE/fThgKptI1EEZ0Mtsu4c4buIlcS+bcxvaIS6M6ZyYf9Dan3B9/HrtYOpYfUXKUCml0w/Gl9zNd1RfvrnZzz4nDHpogeEx1KbW97yw/r0TPkmyHtDUGgPaWmTh0JZV0pjyvIosP+sBnlyL1hxd1tQs1rpPMJ05bDsvZMeewNeFyMH1goG6ra/3+P9GcscdAtGQxJA19PkouNeQBwlzDxszfBTUBHoCv7crJGCw2uv2lsKfDVmBtY9sRVeGD3ju/BJEpOKNkDEHuVrwStiKI1BNBSMajC71QZggU3v11BRCL6zbIJvhwhLHSqNIT2t75zwf33MmZHNF0uLuk3Z67GVqWHE8HI=</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZHdyNxAoKPNwZiKsTaXEz4GRPUxY9/57uWluglpeePR5U1WuzYrYVtV5AmZ0PeC5MVgb7Xidsw19MNRH4oW+PH0v9JuYS92Wb/9Rfs2SbeLxKxV/u2UFLn+y0oIz4hphK6tzhnD2zTkAxMQL3vWpimctSEiufgOgwj4W1QR6AtH</encrypted>]]>
    </text>
  </css>

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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Customer">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128), @compactMode char(1)
if exists(select 1 from options where name = 'm_compact_mode' and val = '1') select @compactMode = '1' else select @compactMode = '0'
select @ticket = lower(replace(newid(),'-',''))

if @@language = 'v' select @filename = case when @compactMode = '0' then 'Customer.xlsx' else 'Customer3.xlsx' end, @description = N'Danh mục khách hàng'
else select @filename = case when @compactMode = '0' then 'Customer2.xlsx' else 'Customer4.xlsx' end, @description = N'Customer List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Customer;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_kh">
  <!ENTITY Tag "dmkh">
]>

<grid table="dmkh" code="ma_kh" order="ma_kh" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục khách hàng" e="Customer List"></title>
  <subTitle v="Cập nhật khách hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Customer..."></subTitle>

  <fields>
    <field name="ma_kh" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chi" width="300" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dia_chi"/>
      <field name="ma_so_thue"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUMq+MZ6dYqOkxJi2C8Ujan3jLkCtSo2UZWyo+hGL8A2ndjs3hqZsxVoKEqc79ahNxM4/dis3NNo5eBPGwBVdX2gMmwzc/rGn3z3fhFFZ72hH1VtYU8KK211Bg+a5WXagA66zGxKgUexsKEp+WmuDmAA==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D+VajUg/H/dZNHpavfvQkasKMmt4VyPHaou46DP4/KOBj4uf3NKJGlS5u9M/u/3eKlQb//u59dwxmCOG0ssf1VxfHluxdmqavghN3vjgdrrgAGfGNGkfvwPCvK94KRD+vH6Bjb9aTk1HulBPV5nBi1PkpOc3XoDLYO6G2GBC34XXZ6Ht6puckXKfc6Ax9yKOgrmIFYDhnMhb7kaSmRXX99+Fqhd+Ue47Ak+7uVCAnqMwL2keGM5HgzInB0GyX+D44V01McgITDWIiqmUtbLP17l0wRJJYb3qZQ4eQyYb6J/jFQPnLnBv1Py0+2H2ldI1u8bkQkPC6AIcr/tu3MZkpfJ6fecDJ8KpXItADBZqCOzxfBVgia+LM64N0CczZjb4U+Y0Hl1ahhnlA4PEhkE7ZoNUBGO5V97GtCGTgDFqeS2AlIo/9Xm/L6veO85Nl1SsW5AwtNROgVOFWxragfbk3L04t1cvSlrMLHeUQgZ627DoCdpqLepHCWQ0Z4BFEAkjBioY58D15beOT0VMfYIfJVM=</encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Lot">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Lot.xlsx', @description = N'Danh mục lô'
else select @filename = 'Lot2.xlsx', @description = N'Lot Maintenance'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY UnitTag "dmvt">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_vt">
  <!ENTITY Tag "vdmlo">
]>

<grid table="vdmlo" code="ma_vt, ma_lo" order="ma_vt, ma_lo" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục lô" e="Lot Maintenance"></title>
  <subTitle v="Cập nhật lô: thêm, sửa, xóa..." e="Add, Edit, Delete Lot..."></subTitle>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ten_lo%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên lô" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUxj26I1JZjjqL63EYpFpCwX/VIXVXPMbvrrl6LnOUAFGJrK7QN0kBwY5ijRUoikPlptsKYBOUBAYhvV4Uf3ZaTJTnjadDJaLHrKXX5igOIuOcu69knUGRZu7AKx8aq1sg</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26DzcoNtRpS6a+8WD6xHQRpilUmusMFVNhSL45pwhP70LqvtW0JRWoGkz1/8fvlIrAiomAHEtrKyXkIx4aZkH6M0nAzWm0IudwBndNmsfnqhzCy8M4RH0ppOH206s+DTy7wd2YVWoQztyP22cji7XwYvplGlXAGeMq1skKa9bQruz0J5szlM3rTjVvMeJQ93THbyXCFIc5ui1RvB1Qt3/u/yl68if1lrd588b9Ei8Qp+qCCwjVV7mT1OowP1DvHQXEVnHW4+4d3kU4u7KKZZPF3r3SOV5RpncZWaIN9RqstrpCwt7Gpw1BErTV3B8v8bFLAr6KSzcWj3Z+MRnYgLlngji7fTsQETIQPjWRWuUXG7gDiTxHGGY1RwB1h2bP1jWtMtTNF2X2ZbRAiVoDgnQaTyHs/3N33tO+AtF58VR5KltwTOxpm5OmvBRk5ZozvwXVyaGJCmu/g6MdH1W48NK9B7b67qBAptXk9il2Z/iQh77HZCdszCsICWV2t3zNTOFMu4tp0zbAMaN24BdNuzS4QBU=</encrypted>]]>
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
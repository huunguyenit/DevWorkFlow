<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Site">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Site.xlsx', @description = N'Danh mục kho hàng'
else select @filename = 'Site2.xlsx', @description = N'Warehouse/Site List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
]>

<grid table="dmkho" code="ma_kho" order="ma_kho" filter="&Control.Unit.Access.UnitFilter;" initialize="&Control.Unit.Access.UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục kho hàng" e="Warehouse/Site List"></title>
  <subTitle v="Cập nhật kho hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Site..."></subTitle>

  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Code"></header>
    </field>
    <field name="ten_kho%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kho" e="Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUCF4hTtnC0wSW7uS7QbeK1VsU3mHX2kPE2MV2CIRoOKMSJYbRy6TkCBobS77sAG+VkIywxbGZWa1UhlUnPhi5Rm3AZecirWq/yeRz3EhTBF73lN+UeB4W9GfPZZl3JIutEz8OpNn3N+F5jr1twXC4Ug==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNGGbgpt/sYYDycpkPWOJe34h6F+njOICulgc2wH/41PGUZmju36Rkxe7DfYnBsuZ68tjcJbblDZFhRQjsXiwBY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hntsH9F3fSmLal17CaXd2KepK1Q9UKQSwglJ30Sh4sCk3ShW8RzxQm6nIdxtq3PVfa2ST9RanVYTgaSLIQpNFKio/LNJRpTEGOp6BWa4G6UgIVLYfW8T8d0U6di9bBPkYgDi8+XKvjNMTh+eHN4zxBhvldSbgbZiaqFWnUYCTVJoCvvcLwxn1DCSj80TubO39Pws3oIfQ9BbToRWNn3i03uH1XsOQGSYs0cWuIHSi71AUqpUPfTyqrqYffzGO7XvTbN7i+st0wWh+9efPh19szwKOXhNePIQ+I67IWJ/4/BrTPK2yayZARJxBdpATf8I3gEssUvWjgycgEdnYbsOo25o19lX7I83wIF6Lmxyz8M9sf9xpHB5ec8iasNWyFEMLerFOJe7ncui9+XHIB031IT8jiVhv2+tYFxRf8B/s9Grq6PXoCg9UrKJlj7jPTx5FwEqDfI1ayyNYqaYQOIXuhY8s4nsbrDEdfU4k93M/iNHkGf3xzWtQ5ncvrN7qVHftsai1emyTlVg+jiUe/Id58iCGDMhTLlXpTZQiOu5ZJH9nhjw0XnafNfhSY2+rXJawQ=</encrypted>]]>
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
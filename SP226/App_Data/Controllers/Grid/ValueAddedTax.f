<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ValueAddedTax">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ValueAddedTax.xlsx', @description = N'Danh mục thuế suất thuế GTGT'
else select @filename = 'ValueAddedTax2.xlsx', @description = N'Value Added Tax List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmthue" code="ma_thue" order="ma_thue" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục thuế suất thuế GTGT" e="Value Added Tax List"></title>
  <subTitle v="Cập nhật thuế suất thuế GTGT: thêm, sửa, xóa..." e="Add, Edit, Delete VAT..."></subTitle>

  <fields>
    <field name="ma_thue" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã thuế" e="Code"></header>
    </field>
    <field name="ten_thue%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên thuế" e="Description"></header>
    </field>
    <field name="thue_suat" width="120" allowSorting="true" allowFilter="true" align="right">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUc30Oq9tQXMjdvPDyFfw7jhtH0NHhplfw35soEuhatfRRBpHYC8GiO5qdxawRLjBtsUz3/Eg/onsKX6lEdNKRGD58sv1DKgivIIO34RDPskbAh7M5PkI/jyjAMYqrQatldl9IQwbkGLdf2mVqm1VTyg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPfDbQH+eNOEniFMwhrnDUH43RHCm99s4wARULQOtzYfdNwu9LGrqcArwzCUD/P0HGoyj6tg658m5TTLRTAf9KA=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlHETl3axfFOJhPjfGv78ScWPzQoMwW/Wwtr/tXJbDv80eMhwdzUIPR+aQeUxLvfb5F+2wJM/U+pBbAfWKneeUzG2vFlD2DrzI1AOLooiuNGEiO9IWh5b1DXFVVeo6auXzHktc3GuLOox/qZnOC8GcsC94RhaObalhOzk7R+ffhYIiPeHJKp/3vZg5b6hN1lvcQlWKI1Om3FXBdFRmIgvPaPFMujcezw4O9+Y5+n5mVgVUnmWjM6zSjIaZc7NVyzDo6hGfMEWxHGZVhhleGAe+d8hN50e4xk2AHHnAfidh49CxaJfjX7EPNdmokcvdQzwtPtcITN09xU5xuR/seLuJMz8OceNX/O6VP0Zqep+EA2Gcqo6XhnFLAypI7lG+jg8vuBsUOrVhd1ZLJfTJITSepeslG+av5qsMicAspQen6tDW4w7hlCkFuUV0mpiirDe3zJuDjGGa5zRktYoAtHy6rBqcy7/ChEI/tdm2cgK2w2b/kIuX3Vzy6fy92yn/tDitKkmvH60pq2AXw+6BwA6GwQEirDJzV7/J2fJ+jupDv7Psm/+y/yxdHoE91uhICV3M=</encrypted>]]>
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
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "FAAcquisition">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'FAAcquisition.xlsx', @description = N'Danh mục lý do tăng giảm TSCĐ'
else select @filename = 'FAAcquisition2.xlsx', @description = N'Fixed Asset Acquisition Reason List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmtgts" code="ma_tg_ts" order="loai_tg_ts, ma_tg_ts" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục lý do tăng giảm TSCĐ" e="Fixed Asset Acquisition Reason List"></title>
  <subTitle v="Cập nhật lý do tăng giảm tài sản: thêm, sửa, xóa..." e="Add, Edit, Delete Fixed Asset Acquisition Reason..."></subTitle>

  <fields>
    <field name="loai_tg_ts" width="100" allowSorting="true" allowFilter="true" align="Right">
      <header v="Loại tăng giảm" e="Type"></header>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tăng giảm" e="Code"></header>
    </field>
    <field name="ten_tg_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tăng giảm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_tg_ts"/>
      <field name="ma_tg_ts"/>
      <field name="ten_tg_ts%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUi0W9FENnhjpTWFYUBebtpXcyYcxrduNkPQwTmzgVuT8uJ4hQ8+eHgN/cc9RadnRSliEkajozkzdAq3RvY6yPdWcbMTHn87alzQoUKV4/bn0uWvPetfrzewbWygDaUQ8Kz5UcTblhCJK7veU4J+E6Sg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiP0lkqFQN2OZHi4j1j+70Flpxr/w8hrmlbJNix33jUc1RI1VE+xQoAhgWj3dRONVwO6bV6MKrh2/tCwLPF0FWJg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70B22n5y+P4nu0HitSUv6jwc5e4fNKF3v1zQFGINe71FqnkGBMzQyoWFO0P4scPRP+i+dbBiEBAgWgZwswwgYCOMJ3eZOmG6KVN76zC27b9H1C11ntS/PD8bcbsG3XzVHbQVogx6v/HJUTej7VU7uKhk2cotAkhrT2UiZrC2Vve4Gl9nmLIW4slfd9/1yekqODzqneO1/DqMUiAAMB2Z2Vt7gWu9UMgCBuoAI3q43Pd9mVYXnYOxvLhAvshUgTrkRqj5QHw8wn9imBVLrRyjSxOj0XsCWEsPUrPz+/A6vaB3/bhyYZrIM6IJFzMV+YIphoUYBXhdkt+d0BJN045lSeOHBF3NXNyWhu1IDclAHcqBuKELTfxa3sGPQywNv3mfPU3zM1z86rTMNlj5PaoBw8OXM4cfTYZHnWw9humGTbzy3OCm8NStcsN1bgqrBFBb4jqgschRmvCx2J/BxqqFMz0xHs0oqNBJVA/YDBOacp5Z99BDX1AbsHiVLI7d6UVzFhlP/i/qffZtARZ4Y8ciYtTwb2/zsNbAueuyDuXE6+TLiAf7Mo/1AYyfCCFTQgxhGT6SGXOo8SfOeXwQiue5hFVc=</encrypted>]]>
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
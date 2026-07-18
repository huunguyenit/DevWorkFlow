<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrAllowances">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'hrAllowances.xlsx', @description = N'Thông tin phụ cấp'
else select @filename = 'hrAllowances2.xlsx', @description = N'Allowances Information'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vhrctpc" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="stt_rec, ma_pc, ngay_hl_tu" order="ma_pc, ma_nv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin phụ cấp" e="Allowances"></title>
  <subTitle v="Cập nhật thông tin phụ cấp: thêm, sửa, xóa..." e="Add, Edit, Delete Allowances..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ma_pc" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phụ cấp" e="Allowance"></header>
    </field>
    <field name="ten_pc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên phụ cấp" e="Allowance Name"></header>
    </field>
    <field name="ngay_hl_tu" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_pc"/>
      <field name="ten_pc%l"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ngay_hl_tu"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU7NzAztnnmifnp6WURChCdnkRUXpheZA1Cn5bZtbwnGGkwomjzj5BUZdRUwJ05hPFzrWUDKPi99xVqos0OgwWpWB8AX1MhUZ73Or52FCyxMdOzZsNOrLqFFKy2wuEFlbi4+vKjZ+fCs5F1y+sGlWSNA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiG9iXt/nwf9s+CdFOw3ILJ5nifYswV3roJsIKGg8p7HZ3TQzF+rq3j0i1N7gK88lLg60oLqBhcl7BVbFq7UySHk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Pp7JJe0vvY1dpFtr5vgubJwg04k2Ad5+6SWsmm4NSJVy7Z7f3fv+oLb7W2hgytj4DJT4UA8FtAJhIeqS2fEAsmZmBRnPd2PZ7Ltcqq+ZAODFArYBXEQ3XwXUCO1WhZTffFdD015AjF43nuUxmhk6X8oOH+5WX/RsYkNB9uL1F7zo1dyJ4DsvmA7Ga0vU05UK8pHRK7eYzFqjQuzeGY5nDO8hg2kjYUnSCy6DQOCOGE2aFhXtff5yFZr88ofDzxtAk7sf4Qaz/MSeneT+wfX2r9cHBCsZ4mMpYz6aq1GWWzz9wV8f+NV7c0d0WANqR0VOHp+aPZf0UvxwFOM+EhJ5GHeKshFia8F+8IrQdzhyV8KauXhyFXYAQKZmmmSBNLynEkSj9dLKS1B40Ci3Ff4jBu37X9ae0y1LHb7VmKAAdO0tPWovu0mWSAVHEvYbgsmh89nLje0t+nx1QKlIo/uVLZUK6P3cMHN2GIwoTV9C3Hk3gKu0LQL/fGWGvw/8Gu2JP52tpGSvAT792MIuqX969UAjpERd9UyP6cGhDQYEwmdaB9UH91e3fUvt/PqPZTr8iaJ90CQfHyg520FDUQQ0YM=</encrypted>]]>
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
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
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
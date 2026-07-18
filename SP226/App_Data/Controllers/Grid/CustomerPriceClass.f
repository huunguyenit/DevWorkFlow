<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "CustomerPriceClass">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CustomerPriceClass.xlsx', @description = N'Danh mục nhóm giá khách hàng'
else select @filename = 'CustomerPriceClass2.xlsx', @description = N'Customer Price Class List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmnhkh2" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nhóm giá khách hàng" e="Customer Price Class List"></title>
  <subTitle v="Cập nhật nhóm giá khách hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Customer Price Class..."></subTitle>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUMq+MZ6dYqOkxJi2C8Ujan1epNUUowb5W53qRUmAKihIMsREvYyPIPVzSJO8nNRg212eULkUIl04i5YJ0YoaHRNxFoR1nC6XpgVoYeUIYZwEk4TW8B80XSKP5c2m0PsINETdaspHwU6ACTw0FMkWMsQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiG+SyGFdkK6cWYhQ9NVfok7SjwBh0l8/YvyWxznp1xDj/gTksDQZoOwX6FtiiBIpDrL0wCCzJXxbNn7rfDSfmew=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hmluaUmw4o3npDj/kds4XeT3USHnjzWgNt5rf/YWnhBv2Cr2fGoryUlwckS4/wX28isfRf28Q5jgDSw5OqU/jBuBJtYDnmosFK2nXkOGdOvaTgiHhdgr1Am+leZQg4at0z6ObDgpArFzqmwwMyXiNe62h6JJNdwKBLAwZxN2f4wJubBMSiDtd1bjl9e8rWg5LVfqwcDKC3R9FGQMcbXWLJCmg8Djw6tGv74PvPRE5RIlT/QcDuO7tjs8Lwkj/GW1KVLUbetcUZU9f9hiyh5kI6goIuqNIbRztNtIjZdELlmzUuSgH6oCx9mVkhaxgffNIJAM68a1QSaxua1fVmen6FcPlsHXIgM9bsebKztagSCP7efC6qaY0sFC7CmsP7cWhDxCAdbTWjAZCq1aqisRsnGlxfOL2BYwvgGq2x+5Z46FX/6nPguHjBjAf2L4EQzlNDQgGsFr+0OT2fl5x0rql82JcnUivYinSNkNyUCTuciK22ivik5pxueXIkNxmzCkSbd4P0komrPl5ptlNrBFI0yrn9I6J+bBmRAACvo39Rr2AIie1M8yszt9G6NXdsdQnM=</encrypted>]]>
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
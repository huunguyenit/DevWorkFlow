<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrTMRequirementJobPosition">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'hrTMRequirementJobPosition.xlsx', @description = N'Cập nhật yêu cầu đào tạo theo vị trí công việc'
else select @filename = 'hrTMRequirementJobPosition2.xlsx', @description = N'Training Requirement Input by Job Position'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vhrdtyctvt" code="ma_bp, ma_vtr, ma_mh" order="stt_ref, stt_vtr, ma_vtr, stt_mh, ma_mh" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật yêu cầu đào tạo theo vị trí công việc" e="Training Requirement Input by Job Position"></title>
  <subTitle v="Cập nhật yêu cầu đào tạo theo vị trí công việc: thêm, sửa, xóa..." e="Add, Edit, Delete Training Requirement Input by Job Position..."></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ma_vtr" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vị trí" e="Position Code"></header>
    </field>
    <field name="ten_vtr%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên vị trí công việc" e="Position Name"></header>
    </field>
    <field name="ma_mh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã môn học" e="Subject Code"></header>
    </field>
    <field name="ten_mh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên môn học" e="Subject Name"></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="stt_ref" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_vtr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_mh" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_vtr"/>
      <field name="ten_vtr%l"/>
      <field name="ma_mh"/>
      <field name="ten_mh%l"/>
      <field name="ngay_hl"/>
      <field name="stt_ref"/>
      <field name="stt_vtr"/>
      <field name="stt_mh"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU7NzAztnnmifnp6WURChCdjKZBP4iL/youykBO2WtL58NbCCPX1+R5+TOF7T7ZncyqovSj+5XMXEzPR6zVdPPDRCyVncBm1aNhJMtPdi0salcbFo0D3l3d7wQpVHcBb005nOlxBQpKJPVyCdXRKbSit502cMZBTg38G8eemjWbjM=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D1V7eWYWSZ39UoS8HHO3+zEvP/3h6uqFxlbTP87Y6DExuAfGOwr1hKfXDBbaCGYr4J5xXMNhfgTrJJWHYsRAWVCMBL8ntY7c8EUuvcV93US/ed9Y8bVQpRjVy2ZX6WfUkkRalD1aA6gEuuLsz1AjqgDNncm4zHX6CMkOb+HQ/uJTrM1beunPhBPYBHzdPSBz+jvq13bSc29jJ7yhYUrP3PVF/Rfoixz9ETUr6oRqyDI+papuPe1QBo+S/p+TkniTIIOFsgdKjutOfP3kvclLxEM5uwTj/89qDOryqgSUld1t/V4RgRgB2C1x5DO9hrzgReMpFQYAtAmLQ/HI3hwx+Q+IjwDSh4ZOsgQSbEjhkt4TCClUxYaN5hQjOrMIl1xFdd+DmTmo+R1DuxyzFSfGaVhKceiVXDZrdNc3dAb8drLKwjdnPk/4sQYAZNvxLzp6ruTIGwDNlF9xz7swDchHfH/bnTzyK0GIcGKalzl72onDnWFDb1w/H4rfki/sXTa1wr+wP4ifBw22MJFYA/AGU6n8ZYf2QrqzDx2RV9+gA/Et</encrypted>]]>
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
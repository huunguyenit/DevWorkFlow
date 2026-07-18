<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrRMEmpRequirementInput">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'hrRMEmpRequirementInput.xlsx', @description = N'Cập nhật yêu cầu số lượng nhân viên'
else select @filename = 'hrRMEmpRequirementInput2.xlsx', @description = N'Employee Requirement Input'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vhrrmslnv" filter="&FilterCheckRight;" code="ma_bp, ma_vtr, ngay_hl" order="stt_ref, stt_vtr, ma_vtr, ngay_hl" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật yêu cầu số lượng nhân viên" e="Employee Requirement Input"></title>
  <subTitle v="Cập nhật yêu cầu số lượng nhân viên: thêm, sửa, xóa..." e="Add, Edit, Delete Employee Requirement..."></subTitle>
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
    <field name="ngay_hl" isPrimaryKey="true" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="stt_ref" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_vtr" width="0" hidden="true" type="Decimal" dataFormatString="#####">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_vtr"/>
      <field name="ten_vtr%l"/>
      <field name="ngay_hl"/>
      <field name="stt_ref"/>
      <field name="stt_vtr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU7NzAztnnmifnp6WURChCdqKfN+TRI8WGCylBgDI2BUS8myI4Q/JPitznE3R0ma16iuXyBcqdy7mUIwIk4uBYsldvliOJaRQgHYwZp+t8CNOjNsGYwb5+fvjJ+ldU+z0ONZTbltFpnF7AX31IsMGAZib88nd+Cdb0K47KdMj0JYI=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiDRjbuamm8mHAZnaCIfVfbAwlIFDwfaH9qpT3cnN1HAcsBklGVbwadZqqDpG2UtbvPAktdCbc0/xFfKpDiEVvMIK7DzhqMDPcu2KhN6kg/fv</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OKhoN40pB5vGZZ/3OHzl+vFBEctWOm2GkfTK3LM1tR2PsgZ5TYaNbXKVjoeCInjJUWbtAH5E1lDtJMlFUZIAPc0YRkB5NDTFqOz+jY+WI/hKqIZg9O2f2Eg+TtYFMK7NIjvhIZfV/Akn9N52a/cG+AdUtO3bAmrAbGbUbpU7JSQuzl6vxLilV7+iZG6ZCjjfVfbd+UWcsoTJQtql7dA3FivMAK6sTxMaP868MERZmwjkwQyA6hhoeYxJ0XNJh4Ug8YmSH/IAWi+7OzXVKaVFIbOxV5ODMr52VYlX3jFK/cPpra37cVwryaJ8uYyprIEDVYJ3Qy22EMGM2YTf+EOXOoFOA+v+2ULSwsc3WFt57zsAyGgUJlHfEaiH6CLB08AO36Ye8V6jGZo63ZNinDHvHplNJwYQ3Q8HAnksviJdzCptMNbD939k5J4sPr4yhbzPk3kngnFF0Faki35PZi3Kud0mQo8qA5XS/t/7SQqVZwvi43xonZYzUDtME27qcgpupvsTGtmCnDa+/kScCSY+wI0CfRMnIYh2uHzi4t5IyxgXvuCyv/Gg0QiPOTudJCoKYYnjq1DYdkiuC4ESaKtyExUDxSKjQvUusZr64waIX56</encrypted>]]>
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
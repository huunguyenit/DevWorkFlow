<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "ProjectCostEstimation">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ProjectCostEstimation.xlsx', @description = N'Cập nhật dự toán theo công trình'
else select @filename = 'ProjectCostEstimation2.xlsx', @description = N'Project Cost Estimation'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vdtdtvv" code="ma_dvcs, nam, ma_vv" filter="&FilterCheckAccessUnit;" order="ma_dvcs, nam, ma_vv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật dự toán theo công trình" e="Project Cost Estimation"></title>
  <subTitle v="Cập nhật thông tin: thêm, sửa, xóa..." e="Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="60" allowSorting="true" allowFilter="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Công trình" e="Project"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công trình" e="Project Name"></header>
    </field>
    <field name="tien" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="tien_nt"  width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="nam"/>
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="tien"/>
      <field name="tien_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOIXQGZohWM7wsqr736FaH/cV397qy4sFRxgWAZJi/5X26g1cPUEAyHPAsJx9S0trMcU1sMpqCbz66yhJ8Ruv2zjZBXFKkWVDyPW4VM06b2GkBanxXw5WdxTIXbSJ5HU5JG0xbGBaTSFdzWSg1zrwEK7jv1pwCf4hDEHdWF5Nm9rvJFEoWiSo0p/MllitEV4YgnhWm6sw6bVpsV7wAmyDOQRSY/+8ZT+rYzRRycSfunuIUAljNKiDNCI+YvJd1RomH2htAIJQqiZWR2N1jPYbSPV2bX2BNeupozmHiuWbt8VrjfJpgC/ZADRqQIsNoKYtNBLdC56mQtg7j2KhnUqCH40BJ3b5Kan3zRzOFSDHYhzz9QmAVFRce6NjZbfCZKYpyRcr6UoGHlmQckaCJmfL5sA==</encrypted>]]>

      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D5jjOyP+JtYjIV/G5R0lIa9E+Sb65B7FAqjBM5qFsMaktnuzkTkLfiysW/VrFRZYhD43BoUKI/rwtiGW7XrhW9dN+pLkFxzzjT7evzvI/fgc4g6KA2hYNYCFIobWoNmZETi581PHUdCJlR5B35bZ10iLSZYFUOjpfk0qNnSS/pO4EaN1Rl1Sopfn5SmK7UJk3/JqEnJxhg3eFnxInyn2ZsgakrktBpQovg6UV+EXuSIR8KuZuGjm3/8WMoWEJKqUBg7bk8W+NZ1YjqI+2/gTk4Yr4u972II2xxcdBZHJDXTQUdWYTfmTqK63EDRzP+xQnMBf4hGxnQqPPLNk9E7knOMyWsFvKf7Z1iC6qfS3SDvap1zuL8N0YdE0+gNotDm4bgI7woo+78mZnK6bmouZmltg613MvWeOtsBU27qLneBp4suE3N3oG7/oF6PryLAWa2W8SrB4b23djF1Y4yPdqU6F96ql7yGxoiLUea+8kD6JJJpi1qbEDq3vwMHKRmYtROOKkUa9Hrw54L6ME2vLL+Y1nr+VVaeIhd/5g1qyeRbqXdn8TMIQS95pZBzjsMtMmA==</encrypted>]]>
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
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
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

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>
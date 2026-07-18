<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CostPlanningByArticle">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CostPlanningByArticle.xlsx', @description = N'Cập nhật kế hoạch theo chỉ tiêu'
else select @filename = 'CostPlanningByArticle2.xlsx', @description = N'Input Cost Planning by Article'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vdtkhct" code="ma_dvcs, nam, ma_vv, ma_so" filter="&FilterCheckAccessUnit;" order="ma_dvcs, nam, ma_vv, ma_so" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật kế hoạch theo chỉ tiêu" e="Input Cost Planning by Article"></title>
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
    <field name="ma_so" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
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
      <field name="ma_so"/>
      <field name="tien"/>
      <field name="tien_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOIXQGZohWM7wsqr736FaH/cV397qy4sFRxgWAZJi/5X26g1cPUEAyHPAsJx9S0trMcU1sMpqCbz66yhJ8Ruv2zjZBXFKkWVDyPW4VM06b2GkpHRuHMuA8/p+SrNqrvvzDl6Qt4S9LFI2m2sZSoQ7FG0SzMxthnmEg97xsovJnVY0H2lHt3rCjU1HpxRtFmp2ccwvt+T24B4USR8kOctpAtmNrMpBOB9votk2aWu7az5ybrUu662K07HyhSBpg6kqSVMZCRKwg8jgMh+Mcl2fo3kQuyKdJvgcibc7nPXabF1Fs08ZwR8f8K+CpUpmyYEg4ImvQm+VRUzixFQ7kzZ6PpXQGSEVogZhbmt/ZoxRUQGopGEoL6xRt1nR6BYbW0oL9038+zbrVqltW+prYDiVuIg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D5jjOyP+JtYjIV/G5R0lIa9E+Sb65B7FAqjBM5qFsMaktnuzkTkLfiysW/VrFRZYhD43BoUKI/rwtiGW7XrhW9dN+pLkFxzzjT7evzvI/fgc4g6KA2hYNYCFIobWoNmZETi581PHUdCJlR5B35bZ10iLSZYFUOjpfk0qNnSS/pO4EaN1Rl1Sopfn5SmK7UJk3/JqEnJxhg3eFnxInyn2ZsgakrktBpQovg6UV+EXuSIRX4Xayqq/5GSnnCHOrV8hRchvkX+SPmV3r4PiygZr5HbIDXK7Ihpn0b17Mzicq8SzNUW1+OqDFYpSnTJE5rTmL14iuVkeIUXQT8iBFo4ibN2FpEL+PiHU6xCvQCC3I5NkNYOX2lEHYPFLLran/XY6+ooOr4Joj5QUp4uSxxQl2Iw17AZCYEfuVZ63a4rvcAvkipPsTgY/xfS4TXF5XyttT6LdGs0PX1bdfUm4eSWd4hxa4zTgLEKDMcuBWOYHF964UH5BAX5ZdzLmyEW2A7ChEu5Hj/SPaGlhun4rR1B3C6uMND1tjLJdP0UPEjB4+gnWmQp255okLP9GCOZF/gXuDzJSrusrdvbrFebxwJoe2zU=</encrypted>]]>
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
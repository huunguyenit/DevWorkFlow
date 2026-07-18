<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "BudgetPlan">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'BudgetPlan.xlsx', @description = N'Dự toán ngân sách'
else select @filename = 'BudgetPlan2.xlsx', @description = N'Budget'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>


<grid table="ctns" code="nam, ma_dvcs, tk, ma_bp, ma_phi" filter="&FilterCheckAccessUnit;"  order="nam, ma_dvcs, tk, ma_bp, ma_phi" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Dự toán ngân sách" e="Budget"></title>
  <subTitle v="Năm %s2" e="Year %s2"></subTitle>

  <fields>
    <field name="nam" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ma_phi" isPrimaryKey="true" width="100">
      <header v="Mã phí" e="Expense"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" clientDefault="0" width="120" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" clientDefault="0" width="120" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_bp"/>
      <field name="tk"/>
      <field name="ma_phi"/>
      <field name="tien_nt"/>
      <field name="tien"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOIXQGZohWM7wsqr736FaH/cV397qy4sFRxgWAZJi/5X26g1cPUEAyHPAsJx9S0trMcU1sMpqCbz66yhJ8Ruv2zjZBXFKkWVDyPW4VM06b2GlHirVoNdmvauOCj8sxCQGT6cmaOzPSPo0KqcJ6RSrH31NJEmCcxTW+QfoZ/SOFBKVZMORXDo+nRgxGafSKq2aaLgJ+pDCzj0F2o9VcLa0GMEo+am2y96dNlKcfxeyccEChT7PMo9EAlWEjMqV97mb6e+UlrDtwyQIbFaU6+VxNumVK2wS889MhexjDlZuCnOCWzZKjUdmIlQBDL3qPhZU9HA/2U2UEpT8Mi+5cfaWHhsumzZ7FTmXEAx95AGTD/ugaiKPIfHp0GvameJZKujBuKHDHMmdR61yQMcErRvVKRgj4VkNxZmcpqm5g3sPeLFY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwNxZXySTcbG5cXZsAlJ/rc7a4b8fuZvPB5IHCrfTbwudpMDAAJt70zmAuuXbNlGVUOlxr3sFBEkmPypnTlIPkI=</encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Pz3mhgFsaDCYPdwxNewQWxge0cBAt8f/DKjEtXEbEuGBw0n5XyoURlEheKrtKzUfs8jx2chvo6TvfgT7IBTf24WXcXvrls3l+juUccE1Ek7GDazSiOqQEzmqLpH9znD8UBMiS6KYAQPU4eLRErWEXSWfnoa3aCqMxRPsW8vRVCHniaIHO2olDOxAyGgZrzj8YAYflvpkUbKNs/6cBylJ+1kUuD0E9bA790FQ0u2MiiGH6AlF+HbwvVB/l/D0sLicen02BYI9gliqCcIMIFn6SicpC7IG0OBu20aTMyRyp2jncohs4/V0euIUeT4ZGKr81DBAuerHPdofPigLl40hDdV1YwJbzn8jyL471SbOzCHre/X9omdDf6j+hcu9DEsrTuJ77wecM4F8rCdH/AVNs27JgSN4Cn3pAdHDkiyF0XETeOIFAktf1tu12PYJwPl9nh2I4pCY8PluxEkPYIA6Mj1YI7ggsaAd3VLamTJonAnpNZ4fBacew9u+4LpiSZuNYFKIMwV8qTfS08J/4nZmpoABzx/x6xDPllmeBNic2TN/eEB+Q55cmpXk13n3ApWMS5qVg3rMYJ2jd3jzf2rFGioOHTMDANVCtyYH9zfd/hQn0ngh3WJWdBHr5BX2owNKA==</encrypted>]]>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
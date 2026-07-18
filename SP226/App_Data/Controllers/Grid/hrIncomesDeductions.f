<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrIncomesDeductions">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYpmLStAaHbLqeiraGfMgwK0N3oaUwvQGN93eSKhOTFfT5c6/7dDTAiLWudA7YrVffwYl/Ycj1qc5ZensqfMi+SxATeARZxS5mavYruo2kHMFAURuXnKOntOxOdi8aIuT9W2BmRiD+Ig+jyrwS8bEKJ5vCNoLX6jLI0A8YTtaMbzG9h+LvH6zCh/tAKGUqzimSWA5op5zMV70k16jicahTzFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrcttngt" code="stt_rec, ngay, loai" order="ngay, ma_nv, loai" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin thu nhập, giảm trừ" e="Incomes, Deductions"></title>
  <subTitle v="Cập nhật thông tin thu nhập, giảm trừ: thêm, sửa, xóa..." e="Add, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true" allowSorting="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true" allowSorting="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="loai" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="100" align="right" allowFilter="true" allowSorting="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ly_do" width="300" allowFilter="true" allowSorting="true">
      <header v="Lý do" e="Reason"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="loai"/>
      <field name="tien"/>
      <field name="ly_do"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZPP0YoEHva+b0GqBGqL32OO7rumuouxaOvsuCfmLNrcIRKaC4+IbsHO3BlAxl2gIVsGW8LSy8CksXGkWAOEi4/I6rgc7DK2mE7ZeYEjJIGlI2yiK1a1GUawOil8JtMEYfQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7585SlDcwOdSlhvhYck7swm7OE111qzFLRwka3W+yQ5GkkRwb6LA+fpn0iv3OsFm3y0SFW43gEpZkXJt44tSqcDo=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtSvT6rYByOM/oYZmrFixcG3GOsxJkD8HIReHVsxpjzWtiMJCkUh/dT4hHVTSa5q5jql5y60BFk7Ce29sJXgczzQ/qUYi4rC2yptzu4IhLn0x0za9bYC4XnlXgX5kRy8/NeH4Ahus7oTGZqV+sUCIyYnvqEVkuAU0VFjOBxSnJmsvGQJTRwZIW8v5Slv4mygn48x5bGuHUufti3eLTVksj6bfI3PasWGIsJ3cHJaSmyHMitw+D0k6wg8uPGWGo2ZPXS9fvSLMa33wT6x8Kh7/kKvQfYYByaU6t+FFusw4aYgkhjZImKKBSYm6oppxB6ROe0Qx9VnIOWAQNx+0lziOz/FLBJDZawuLIN0798UB2KDQDt+I59r5MPIJmDiu/3PhkStk4zMxS/VKeJwWMK+x8L4dKtXr6ygGOcIl0w+zDoGE0Ifzr1zjPBHK3xCiBFww5PnwoCfyzNodNnK52JUoIIjf6Z++flmpbCX4h/WsDDzIyxQmmA/mE5bQUCrXa7RrTA==</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
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
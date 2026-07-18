<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrEmployeeRewardInput">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYfM+00G6yrzhO7Q3Bgob3S2uczqTS5D6/CeRrRTXMR8rEiLZxyNfWwXMUmtixQNQbJNxKsBrBWNHXK9kLZ8I/5zWh3T0b5TT2urSIBNwJlMWgY0aoiXuUDudd4dtt1E97n5UNjbX4We67Xg39Q1AhVV43N+yMpHRYBkcxa55blaeTkF6AhWKYkW3V1VCYW1ix9b6/vtVZ6tf+83CltMgbgFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrctloaikt" code="stt_rec, ky, nam" order="ma_nv" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật đánh giá khen thưởng" e="Employee Reward Input"></title>
  <subTitle v="Cập nhật đánh giá khen thưởng: thêm, sửa, xóa..." e="Add, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" isPrimaryKey="true" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true" allowSorting="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="loai_kt" width="100" allowFilter="true" allowSorting="true">
      <header v="Loại khen thưởng" e="Reward Type"></header>
    </field>
    <field name="ten_loai%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên khen thưởng" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ten_bp%l"/>
      <field name="loai_kt"/>
      <field name="ten_loai%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZOzd86kNTPyyzjQbbs/GTig+dsEDD88uoI7lGvErUSq+uDt0NryoyAkg+R4gD5Jk9drS5tm+oMXx5IXygf/hw2yFy2n+J8ozlA0+zoYfGjP3l4L77vYiGL60Erha5tLnGA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN5zf8chxzJIaUPW9138BJOlhqw33ETvI7tgdP/pgB9MclqmfguHaSGavElayEI5YTJgoeNj3w61W9zs+/89yWQzlNRyI0w2GS1kTKN8Cy8M</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O50Yr+s52WnFfzRC/T4p04jMS/tCztZBZ2jZxUQwtlTywdKymlXHK9sVm4gcRRy5grI2WkioY0c9g/vsApYqOVwvvS4+X+vIgNDwGNQ9zbXGUpVF997mncyBa+OMEqd1IfEXfKTyrPuH1YzSXs2uZ2SQQ00Mm+JwWpaxonxi4rWjZylmeOSJ8YoKOZq5vx2kk6FDSYnJS/BlXZLQk/bfXn7siCy++P3sWagbt7ROpSNz0ICAkXenSQECm7a0bG4XVfCjGPXq9wDKkbdsfzXKEKjV2TX3BJ6qLFB3dDqEcmLnHp0eu2tMluvpuhfyV43RmD2VANGTt+5ZJbe8ZGoJWuJHVOwLBkUy+zZMaXAGaJ0Q35m2i/ACb0lKkinDgPLXhxzEGAePT3vapnlm/lIku4+sh4+68sKORc8sbgv3HfXdC3Wtew/qsDO7VAjO9JdFwvB9TzJbmNdEpaPk5Nqd9TQg5Tn1bEK7tkRwC9EU/yvKLMvZtpqH5x6maQvDlI6/OWdLu7lgl6EOpkq3jM+w3+HJk6asaLdVajUZaZU7CPLSNJ51mtfrar+54WPaIVVWcGLOmbRLI6Yqug9BruGFzPcw</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

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
    <button command="Separate">
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
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
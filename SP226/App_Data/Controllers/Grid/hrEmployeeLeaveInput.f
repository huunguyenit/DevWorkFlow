<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrEmployeeLeaveInput">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaM/ukKZnzDxveiSqXms6xAbHwsBMOFZytsFBfo8CVH4DiCEu8yfsfmAYvNoLMmRnqNU1qlfYMziST0L2HD5b2cYcv2SKeMDvLs9yRGJrKtySKxZwvYOoHfhTdc4RWCKEKCV3LsQE3xPBytaAkmY3wCm925EPcinEBxXrwbsUWQkt0m0B/dCvxXLIjTC3r2Bjqian4tzgLPrl9xr8MCcDmkWsqWcI7qkX5cOs7l0wQvoQ==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>
<grid table="vhrnghi" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ngay_tu, stt_rec, loai_nghi" order="ngay_tu, ma_nv, loai_nghi" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Cập nhật thông tin nhân viên nghỉ, vắng mặt" e="Employee Leave Input"></title>
  <subTitle v="Cập nhật thông tin nhân viên nghỉ, vắng mặt: mới, sửa, xóa..." e="Add New, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ngay_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="loai_nghi" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Loại nghỉ" e="Leave Type"></header>
    </field>
    <field name="ma_ca" width="100" allowFilter="true">
      <header v="Ca" e="Shift"></header>
    </field>
    <field name="ma_cong" width="100" allowFilter="true">
      <header v="Công" e="Workday"></header>
    </field>
    <field name="so_gio" width="100" type="Decimal" dataFormatString="#0.00" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số giờ" e="Hours"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="loai_nghi"/>
      <field name="ma_ca"/>
      <field name="ma_cong"/>
      <field name="so_gio"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZKtuQb3UtW4eS8jjdyS1uXJnQXaz/1vIWhasdnC5Su51vxhtkzM2x7WS2W0iEyUavRVJ4yoRuScTq/fz2N27OLwnSgQEsXCnRtDez2rSA+dy0gCeRuhDrxVxwiRJhQmOjw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zy/qs9LaksQe4G6nPXIDoUFwgRz4VREyK5sKbcRMJy4fPpflGzrS2Ii9IZwnMQjfDMEU3UN4AEa7bwljDxMFwM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O51oX5rldNsd38UUI9XqiGi0s6wqEa1JOMb7I1M4ympeSJvq+845ewUjDwayI6A9YKt9oON+CvDP1Xrq4MbOLp8ltO6c8pS065r8oY37sgVUA1AKcjr9B6M32fhSSp1vd7lYQTrDIRDwXg7yllLTQiraTm9FKYrwb55/1/Ucu++nlSIaznl67QRzHAB4sxK2HsVa58LEeRexUlN4uuaSaH5IXN1v0N+S8gJxxvjJK6Iv046LMEXhtrd66H/8bZGMqcmiUxR73HRY3y+uohqcb5pVs+nf7TetlKrIQfTDmIOjd7d2G8aVpb/GyJt/BqVVGcB74QKRaixBUeSM8BCh2l1Hfwmst5TmIhnz3oHb0gy8OF9ROZqXdfrM19uEjyTtvqy8XyfYU1O/ml9FZlFuwhXqnWc77F/m1YdJpHOiWIZVI+uz2FYmD2WnYs0/Ql3sVwhfQJpRnf3x83ontlTbjr82WqukGpKQ3YgogZkHFSmTdaXXks8cErjqQraNQ2V5Q0Q=</Encrypted>]]>
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
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
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
    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>
    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
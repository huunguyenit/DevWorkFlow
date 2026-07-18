<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrEmployeeWorkdayAdjusting">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVax70DUAo2ZERG7RwV2VvCMgYPkRWWfedoEbSEkKiAioxidzZRM7UOa/3WoFmE/uCz9do8S2VPr/kTCnahJh24EZ8u6kdTX9RgmItzX/lz8FW7gy8BjKrTvFHZ8U4Mw+EtkVm/YpjgTU1rcpYwTxl9YDTXzrAitHHo8nkRe7b5k9/HD4cPqfG5ekgksJqTpKkFFlrwWCxv/TqldoyN3fA9A4D1rOofz30boTemRMlRtwg==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrdccong" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ngay, stt_rec, ma_ca, ma_ca_ct, ma_cong, gio_tu" order="ngay, ma_nv, ma_ca, ma_ca_ct, ma_cong, gio_tu" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh công làm việc cho nhân viên" e="Employee Workday Adjusting"></title>
  <subTitle v="Điều chỉnh công làm việc cho nhân viên: mới, sửa, xóa..." e="Add New, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_ca" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Ca" e="Shift"></header>
    </field>
    <field name="ma_ca_ct" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Chi tiết ca" e="Detailed Shift"></header>
    </field>
    <field name="ma_cong" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Công" e="Workday"></header>
    </field>
    <field name="ma_bp" width="100" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="200" allowFilter="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="gio_tu" isPrimaryKey="true" dataFormatString="HH:ss" width="60" align="center" allowFilter="true">
      <header v="Giờ vào" e="Time In"></header>
    </field>
    <field name="gio_den" dataFormatString="HH:ss" width="60" align="center" allowFilter="true">
      <header v="Giờ ra" e="Time Out"></header>
    </field>
    <field name="so_gio" width="60" type="Decimal" dataFormatString="#0.00" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số giờ" e="Hours"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_ca"/>
      <field name="ma_ca_ct"/>
      <field name="ma_cong"/>
      <field name="gio_tu"/>
      <field name="gio_den"/>
      <field name="so_gio"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZEPt/ITzivRQ59m7quav6+orIlo8YNa/PLGoDjIggJjwB8MPb92KvGd4BgtEZfcPmPrDT2QlC+Io8vV0Q1f0JExneq6fVYJ55/mh/KAD46/zWOVbhF6VaPjmFwOe6PUHhOeG5P7AYv7QS4qh0s224/k=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zy/qs9LaksQe4G6nPXIDoVWQ+Ww8FQbPjfPVubfMVwaLf4HiVmhDKxpcn/SergTmcaiA2Mr4zVliYHS5YCzBXaN/oSiipfBntz0veJnTBdz</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O53t0b04QUrJKXe/hbbeKlIOMlcYV8Le+FZfmOp5r6upZtmJ322LhQSOOnESWqQaozdBJY5Q8/swJg2BKsFSwzDxabmhbHQEf7Dmjq8CKpe8PITqw5rwlFfr+EncsV7TTz2f7Ah2qMPZUDA1hqcOfactEEQ53rBaGjdI3eGmEhVpDcVh86AbZ1JUDit3Rg+2gDL2ZwX8Xc/J9POHzu3WDUHFuS5H8YS25PR3/80r7VL+2Z9PcciiVuxhSRGhmcdDXnBYM9h37CcUlyEtAuQPK+2/ta7scqi556grot8/BR03gSk4NbPVHVQj1EbxZtUwusv4WIpz3jWaAH4zG6XPvSPc1jRChJNOySDWWeu2v0VwC+YmROyyOotycJvgikGWSO4jak14E+2oeyvrBevg0JGKJ3McVL0kp0nTb+zkkRl2+Gp1rKPDOBbfA4+aNA2fg+b4oHT1zrrlCDVEIGAYrlgVJ34KCAu0jXcOdWphURbL9l2nAcNFduwYHhpvg5E2Vbk=</Encrypted>]]>
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
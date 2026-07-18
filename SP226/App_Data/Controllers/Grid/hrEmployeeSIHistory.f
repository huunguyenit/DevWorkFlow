<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrEmployeeSIHistory">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbynULo5cvNARE1uHrtnvu2vAeUpG1UNHPCwD04PYXX0ZjRf1WO2uuDnonsx/6gWhEc+jib8I7hd36DSh88wD4VaxFok/8IguIJKL3Y45xjjHTcgfeH8+cEp+wTqdwiOq2TYuNIks92lkYnFdmPo+IPFHFnYKlhsyygSh9Q/8Uby7w03N7/LKxLEB8iWZHj/izNjo4SykHdGmL6TwBSj8omFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhreqtlbhht2" code="stt_rec, stt_rec0" order="ma_nv, ngay_thay_doi" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật quá trình tham gia BHXH" e="Employee SI History"></title>
  <subTitle v="Cập nhật quá trình tham gia BHXH: thêm, sửa, xóa..." e="Add, Edit, Delete Employee SI History..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ngay_thay_doi" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
    </field>
    <field name="ngay_thay_doi2" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>
    <field name="loai_thay_doi" width="100" allowFilter="true">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="ten_loai%l" width="150" allowFilter="true">
      <header v="Tên loại" e="Type Name"></header>
    </field>
    <field name="luong_co_ban" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowContain="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lương cơ bản" e="Basic Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_bhxh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowContain="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền BHXH" e="SI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_bhyt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowContain="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền BHYT" e="HI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_bhtn" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowContain="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền BHTN" e="UI Premium"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ngay_thay_doi"/>
      <field name="ngay_thay_doi2"/>
      <field name="loai_thay_doi"/>
      <field name="ten_loai%l"/>
      <field name="luong_co_ban"/>
      <field name="tien_bhxh"/>
      <field name="tien_bhyt"/>
      <field name="tien_bhtn"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZPQeCqMxa9Xgd83kL8awYy0p7KyU06QMI/yPNaN789m0ORO5/xXsfKejj114QWaJO4KF3e17OR8iz9TUUIzMM6TM5t8Moxz5i+G5RZB4+HsRGbesanANu+Vu+J9i9uNUlQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zy/qs9LaksQe4G6nPXIDoUEFbsGEETt3kB+aiwHGn9zkiq1OO9dQQVeE/o6fUdjPoBpi0CF1SjaCMX4WGpqc9E=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O52/FTp4/ttLNIPquh8DZ2P2P89dsZqJgrKq30sQwjrsmIcajr5qNShqWPTfVKW01xrkuV1PAYUm6I6mUrkaCdg7YrIzvKdGIddi+M3bkWfnxJg8H8Bmh6UWNFfVsjSTwIp08UpQ7t3vnZiXXmhGDfcrVPQBZSi9+yKkL8dWLqTPbtPnjMLN3tolmFhDcOjAU0hEqHroCPqmtXz1EDa26P52C7HEwn2J3jtkfFpRRNPRYL/uXzoGC8yLi+Bmlt329Z4sHY6Dtd0WcZbcIr5+NafGsgrg4zg8RZzUcj33gVaEhKOzZqavNBccTcGDI90k3u4fx70Tt7UXZQwayvuMEbMLqjQmHdR/JuHtg1bzjrYmn1oRs28Mf8osoz7LajbXmfeOSI2aTW8u0ABPY8+ECIkY0c4QUkyF5Nd1qpwYLteZ21wj8CjfXkCNIbQqr9g93Fg2+CxbnLlVrDN6CFQtejzCUNYPhqQfqws4E8Scjnbr/ipoefg+uJveNtdLpdmYmzA=</Encrypted>]]>
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
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
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
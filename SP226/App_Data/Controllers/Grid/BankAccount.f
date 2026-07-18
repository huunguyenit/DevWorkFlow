<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "BankAccount">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128), @bankAccountUnit char(1)
if exists(select 1 from options where name = 'm_td_tknh_dv' and val = '1') select @bankAccountUnit = '0' else select @bankAccountUnit = '1'
select @ticket = lower(replace(newid(),'-',''))

if @@language = 'v' select @filename = case when @bankAccountUnit = '0' then 'BankAccount.xlsx' else 'BankAccount3.xlsx' end, @description = N'Danh mục tài khoản ngân hàng'
else select @filename = case when @bankAccountUnit = '0' then 'BankAccount2.xlsx' else 'BankAccount4.xlsx' end, @description = N'Bank Account List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dmtknh" code="ma_dvcs, tk" order="ma_dvcs, tk" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục tài khoản ngân hàng" e="Bank Account List"></title>
  <subTitle v="Cập nhật tài khoản ngân hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Bank Account..."></subTitle>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tknh" width="150" allowSorting="true" allowFilter="true">
      <header v="Tài khoản ngân hàng" e="Bank Account"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ngân hàng" e="Bank Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="tknh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>


  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaopu4YdhstgdXWanDXQTqTJS4yDnDjNOAUeli6yCTGWiKsAmeqqUY3IhvGXXBgPS7wua+K5QGRJh/wADOxY+7+k+/eOjqIV06T1+bS5MbF9KIKb+IbKBHq232tJr//b3PDXUgP9QZGgpEnbKTV4FG4+koLi74BOsAd4h6QiIptKLhPSX7cOIHf6FoidKWoXEj7N9PpbR6u8t5KD4GTubvPR7yOapG9q4g8n50eppYD4eTiOXnsyLCJJjReryJWJaGieACCmf/nXgtsx2HHIqd0SYcQQns1rvpGUSEZiZGci9hEw/i/dMeUa2++pY2urbwFm8SC+Wy8pDwkXq6+De7QG7EyfDtfBoh537iabAgZCTDdqsmji1Gl9ary7tuyt2iyGGOd04FMeyzr3zN0MTdJPhFWT2Bv3F6jtp8WmsmvQqv82cT9thQPn+g73pQGQoGiNSzkownYa923O3gbn64mk/21d2qSob4RfKiaYs/9Fg==</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFUbJx0WY4VU2y8SaembRx3QKii4l2o5WuiujbAolIkkwkRWd1j3Nd9+3UErFwvGHwiVVz8rKUjTcu6OIamXzbG+LwVr14CzKzXBZnQneZQaCdEsg/3MA6ldssrJOCWOi9upZO13PPM6iqivjys8WA1Bw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiEkzQaJ5Ddft46KVmREbCk/r0rWQNcbx3s6fyRYmGipOQVF+pVK0cgG733dtFXa5vMXX88b3fK6mUYC5z1oyNWk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hmOIUkj8ATsEgMjKtotvs6wbrJUsX0O/DQm/EeUpknz3sYsF+Y6Rpr+SEk+FfgjPv4waCilTTy/djBIeeF4dDrWj4+zK9m2jupNSyp9wSvqTOUr1H6bh0nhwX6x43IzvIoYatekrUSnXEqjd1CnjWsbGbGVB6QshOEU38BNJu+/OGvPZqnfTICVps8CWsVPyAiRA+in5YAF1u4rTSn88lgAqPM+JCsMN6u+ZqSJmj/3cvlnF5QOxeS+I/gqMNzG2DOH7ONq2EU5+0OjztQXMMPcBf7K0/xnkEH2MEdJ4pMQQyS2T/hCPvAxibGp+6H0eco3v0O0YaqUodIx3jkLo64O325E4My5E8G3qH9AbLwJivfDTUyElwv2qPaI9mChv7prqpcsZf/Bbt2+KozvIhev2ay4Qand+P1OmVFPg8GJOADN/MFSo7+3uz166IlQ1FI8MyoG3F2c7A5+0cvz7wbUaDqkW5HFieL+0hSJAOTGhRLJJr4SKGoSa+nd+qJiI4lAXttqzGHZW2ShrWK0MuUbpQqp6FgP2XMjHf/L4DHy4k+D34di2A4LQkXCjGD8HZc=</encrypted>]]>
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
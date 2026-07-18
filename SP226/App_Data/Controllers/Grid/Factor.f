<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "Factor">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128), @costUnit char(1)
select @ticket = lower(replace(newid(),'-',''))
select @costUnit = rtrim(val) from options where name = 'm_gt_dvcs'
if @@language = 'v' select @filename = case when @costUnit = 0 then 'Factor.xlsx' else 'Factor3.xlsx' end, @description = N'Danh mục yếu tố'
else select @filename = case when @costUnit = 0 then 'Factor2.xlsx' else 'Factor4.xlsx' end, @description = N'Cost Factor List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY CostingUnitGridShowing SYSTEM "..\Include\Command\CostingUnitGridShowing.txt">
]>

<grid table="xdmyt" code="ma_dvcs, ma_yt" filter="&FilterCheckAccessUnit;" order="ma_dvcs, ma_yt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục yếu tố" e="Cost Factor List"></title>
  <subTitle v="Cập nhật yếu tố: thêm, sửa, xóa..." e="Add, Edit, Delete Cost Factor..."></subTitle>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã yếu tố" e="Factor"></header>
    </field>
    <field name="ten_yt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên yếu tố" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_yt"/>
      <field name="ten_yt%l"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridShowing;

    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU8QRbQvrioBkrcKl7GWKfN1rDHR45GJIdnHFmOiwy+Zw=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%yLooQnL9xQeLYF/0lD7RzhlBeKFPUh1YYJWbF6e2x8x4+SUNgOW33E/MYH5H4XVS3oid5fIPk+DmC4ni33QBh9HjUIuFztt1TA43i1dJGGIs6NxvoBwSwJqvPtPmMuBrj8sODbbDAtmUyDNiCrMDFw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw0r+aDZxD7/z8Jv5YIeUV+yrujaK8TGH9uYCBPgc/6DoAnuKOaDF/kt9+shHABL5uPxWYKDACuy4rz5bGBuUJ8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D3K5YV6/Rl5CvjyyPu8h+mA=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNrUrAiffDy1/u4VVqG34lai9WpcqBLv81SW+rnJYztPxzhI1UCviwhQE8T9cfYGAMoWrAsngP0LU4sVFiP2/+g=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJavRF2IYtE0bavROW9ROLyOZBskuL1c82SQBqgHOhno/KqU4JKiA86p43yjQasgkzApSuu543T0ptAk52TAlHtLBO8BZDUizr3j7TIsB+bMW9L/6OHRtH1FDmrndbsMQTGQ==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJaphyrcjOgwd+1PavZBzs5gJAiqQHbHSlf6VbThprhyvoZp7E+woIgqA3gU/ZFpnENOUUMxemIvsmheT9UNLLe+hmxxL9YVLg3WcUxsb91Boa</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LSEz3jHE37iO+o3sAzM85dim9OMzTx//N25M3jM8mB917BSbzwutF3eVvV2X6OLEGg=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJap2NvILMNw+3X+teeLUShp0eavlj0yxmxoW1c86dxslXn1vskfaDUfKYfMyq8lI2eOlBuJO+wwBQssTBjOghsO9SeDaIm/4wjoka1s6I8z7OBipftkoKuT+JkCY1PrPkp0geteUUzcrokEEbSpF3XJ4WI0ccZrybdWRJkamniXCq4D9r3roS2JxwuAsYm4cDi+tpRnJINNTITzU1Kepki1iXYe0b882EJZYtltcRamC9oGbwOvTfXytaXPiz5N+U9w==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIW9Lds48Wa4AHLxs876XGOo8KGbOnjOQbUdZsk0qEDLyTVnvbpAnXQTrKBDTfWrqbVh8MUHj5TW/NDKrkaM4OWZ+S7j1O8y5Wwu5SQY2C+aBHnYALayCEUyjI1Kkyd1kS/FRGGh5IbL4S/8c36bIbgyzjjaTdrwFc6N/oUrq2LbRyP4Pn38PHpd7rIkeV+anujFXFt/I90bQbvMrbZIp2oB7axf6NWtd2oYMWdRnizWlMsOjJz+zeSb/OFmVaFRams3L/pU6shAChWAUQdQnSuVxJCFTdV3PEpNpupg/KxQAfacAgaRgJeRPeP21RxRdw2C47K5MAXvLyYe4muUe1fFi1S91EbB4eC9wyzV63qXfA==</encrypted>]]>
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
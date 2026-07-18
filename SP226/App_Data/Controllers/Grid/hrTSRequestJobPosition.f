<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrTSRequestJobPosition">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'hrTSRequestJobPosition.xlsx', @description = N'Cập nhật yêu cầu công cụ, dụng cụ theo vị trí công việc'
else select @filename = 'hrTSRequestJobPosition2.xlsx', @description = N'Tool &amp; Supply Request by Job Position'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vhrccyc" code="ma_bp, vi_tri, ma_cc, ngay_hl" order="ma_bp, vi_tri, ma_cc, ngay_hl" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật yêu cầu công cụ, dụng cụ theo vị trí công việc" e="Tool &#38; Supply Request by Job Position"></title>
  <subTitle v="Cập nhật yêu cầu công cụ, dụng cụ theo vị trí công việc: thêm, sửa, xóa..." e="Add, Edit, Delete Tool &#38; Supply Request by Job Position..."></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="vi_tri" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_cc" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_vtr%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ten_cc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Công cụ, dụng cụ" e="Tool &#38; Supply"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="vi_tri"/>
      <field name="ten_vtr%l"/>
      <field name="ma_cc"/>
      <field name="ten_cc%l"/>
      <field name="so_luong"/>
      <field name="ngay_hl"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU7NzAztnnmifnp6WURChCdoZNDQ5MY5bG5VVBuOLR19IwVlTmcJCBOmOkutjQliYf8ALkd6U16zGmJPfpKYGBLsS/FLeUemoaHPt9YjApwOPRQ7nT11Ht7/kQ8p8DjLYez4/oAICncVPlwqGdQp/HUw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiIVV2dQRhS6D/JFhIfAqHry2XP+UxzJ/BqxkMH9NJxyPMmJPFAm6M0xKIASB79bLRy8cxVpE5485ftwaeo9vE4JWHtdxFEPeNtegl7pCF5Ev</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GMMAYfzQwLz7OjeeRVsBZqfUnXmQFOx1pUL0a3hUoYke28u844WRpcc3F64mCVgNCLRwB78RVmXmwvSAecEor2D7UDFoWc8cYZOuF3HNA6aNosqdEh/l9Jvj+QD7i98kCkqY623RV80MOLp/6N7IeVyiK+g0Em23apNgrWlj9rS9vhSxX3PE5UNvhXa/n3Uyxa4DF5nI4wwi/0TbxNgub/v6KG62jAYBcv4rGRApMviuk1pI5UTgaXgx8K0ws050HodVPdFuRD1pEWLHT8F/y6DTDwqU8ml1WE4V0+8WyuctqlD4mA5G7/fF78hTMdFGDqo5by4t/6vMm0xNNaYeM0OlWJ3Q2WTTdqszqfaD8haiPxer32XgWBU/V/Jsht6690s5EtmByuT+ttOH9jE6Anbmo2XQopDOEeVA9DUTYL6ulOsDdu7JOh91Sc4jdmWXeK/o6Xouf/7hfNYEmfNklvLsDobRn6oGeTSKlZJvKdaHWo6p5aq7bxb9Muh81ofAjJ95VwY5kUos8MLDdTMJ/QqqHxv5VQOgna191hUJQu+h2TjcDdQR0Sir/XD+EMafpVD/ovnDAHTF81ekQIV5Vo=</encrypted>]]>
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
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
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
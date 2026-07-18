<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "TaxableSubjectDeclaration">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'TaxableSubjectDeclaration.xlsx', @description = N'Khai báo vật tư tính thuế bảo vệ môi trường'
else select @filename = 'TaxableSubjectDeclaration2.xlsx', @description = N'Taxable Subject Declaration'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY UnitTag "dmvt">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_vt">
  <!ENTITY Tag "vdmkbtmt">
]>

<grid table="vdmkbtmt" code="loai, ma_vt, ngay_hl" order="loai, ma_vt, ngay_hl" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo vật tư tính thuế bảo vệ môi trường" e="Environment Taxable Object"/>
  <subTitle v="Loại: %s" e="Type: %s"/>

  <fields>
    <field name="loai" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" width="100"  dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
      <items style="Mask"></items>
    </field>
    <field name="muc_thue" type="Decimal" width="100" allowSorting="true" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true">
      <header v="Mức thuế" e="Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ty_le" type="Decimal" width="100" allowSorting="true" dataFormatString="#00.00" allowFilter="true">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ngay_hl"/>
      <field name="muc_thue"/>
      <field name="ty_le"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJztyboMjFatN2E/5sm7Pjk9g/AE2Jo0rxZQ9B36ilmbvY1IagFF7IOY7tfYFY6IOmvhG2g4m7k9bbpHLucnY+txOdKnKVtnwDwKqP8llV1w6gsIIgAe6nKVv2aFUCMW0ObrrO6SHTjwBGy8+q6CFrXfP7L2hnRrWAlTXOI7eFDv/Y=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+bkdEO6iKk0ImaVHWQ3sRtExAWNInKUEi7kD7kY5Mtzo9M5oFB2KUILWPEMKxsjUy05jz2lo8SPVZ4TyOh6HS9z/7p4pG4m0Aw7mSTrCbm+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTdGlPyy7XDTQDfzErQvBu7J1yVmwKWjJ6Rip8+uEp22WWuZhcYKJSupFpcch2S8WKsOV+l6cNiXt3pEtKYpvUVCZ6Pu0dLLxA7W3bF+i0Ae2OJDm5dQMQU62jl3un0sQ4nXCfJhJKYGl1iIyoclDDI3OEjMYh2fV/M9DXX5rk08Qs5PZSMqk62bke+UZ6uxYzl9RWWV/YMAFa7HnWlMF8xq6J6pcR5ln7H/j03KzxxhVsAZ8IAYXHZvhTqqn+KTkRIXu5toa3AOIGpZ0/pJ23lxIxGbTmF3rXuELBtc9ZKU4Z96cN30Lm9tNbC04mXyeaXPzo6mhlwEAz1uyvm13JM5CaK+51DltpF1xyvAyP0xFdHrHqW6deSDbDchXVLbtWOuohFurBU+QsvRG0vDqb35y9rujUl65aVG8F2dkeokmGibW2Kcl+XvBgLZhX1KRBbAzovrms56wM2ZzJDTalFCcY997W9Fegh5wMcdowXXJ7n/0KSKkQn40sWl95eSi578NusjJU8r87EY57G0qglkNfeQqxUzmHTdE080aUA9</Encrypted>]]>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
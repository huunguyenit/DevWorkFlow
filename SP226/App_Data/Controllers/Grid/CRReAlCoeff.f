<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY UnitTag "dmvt">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;%Control.Unit.Ignore;<!ENTITY k "ma_vt">
  <!ENTITY Tag "vcrdmhspbnl">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CRReAlCoeff">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CRReAlCoeff.xlsx', @description = N'Danh mục hệ số phân bổ nguồn lực'
else select @filename = 'CRReAlCoeff2.xlsx', @description = N'Resource Allocation Coefficient'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vcrdmhspbnl" code="ma_vt, ma_nl, ngay_hl" order="ma_vt, ma_nl, ngay_hl" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục hệ số phân bổ nguồn lực" e="Resource Allocation Coefficient"></title>
  <subTitle v="Cập nhật hệ số phân bổ nguồn lực: thêm, sửa, xóa..." e="Add, Edit, Delete Resource Allocation Coefficient..."></subTitle>

  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product Code"></header>
    </field>
    <field name="ma_nl" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nguồn lực" e="Resource ID"></header>
    </field>
    <field name="he_so" type="Decimal" width="100" dataFormatString="&CoefficientViewFormat;" allowSorting="true" allowFilter="true" align="right">
      <header v="Hệ số phân bổ" e="Allocation Coeff."></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Hiệu lực từ" e="Effective Start"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ma_nl"/>
      <field name="he_so"/>
      <field name="ngay_hl"/>
      <field name="dien_giai"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pTnEqxwvS4mdem45YUHmk8cSymz3Al3iBofmyvo/4cPtZCxLlUdvCKoyM0p3cssdeCCYHnnRnn2JdFjR5fhJjoHYGwRgrizAet3xdDm2N9unquX4t59Vhg2CYAr32o2VlEc9i7ePC6+C6Fz4FWoiAvSjfnTExCHRSzMBLZm9H8TOoRtlwdPUpQA3hjRvdY7kNVmIfNKf1lG+eb2M/qpF5n35sEHdNTy4tBSJ39zHVL4vGgUqmXLlUANNNKBsXFI4x5b3s5E5+ULREtY/rO9dnlpVvmUdhcZDHsK/Rkbdp0HU5W+P1A8TrV0eqecFk+0cR0=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFEbFcrbcv/VBx80l7eJ0wKpw4XrPKpI36/niGWfCjzc232TUN6AMYROxLZWOybSWwsbg2/oWV5hTaoNiTU4iSlrs8w2DZ5RwhvJc8q3EM+v</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtaGDDT45WplzIge8h1V6BWFgDP4tL9gww01cllRKUw9S3Kw5FiFQC4/U0huWQH2BIJGlv9QIIYfE5HIIZhOKoWXcf/ya9u43Miu/XbLloQ6HjjVkZAV9eq5kt1nZHAtHi6E9djkIKhgwOvLpWHnq0p8Vutkp9oSJG2U/CH6N+gmMssmJmQdxd1F8xIXlKhp+Bon8tO/c3DU8Lcolw4kzNylkZeE9RWZfv1icn2JRQ+c+DpVWijDy+MkJO89AWY3mGxjXIfVftnoNdL6KQzn5F2Fb5aBPvjHkK+ttNNQNvxc23CsiLM04U3W3sNL5eeBv9A4vDPWCA/91tl599jAAvk9heT5J1IJYVwP4cD7sQlCNY+LDTkClf5pJwUSsM9nfPpEqGg7A+ffihYRWAm0nc418G6iomWKXIWI/EI36I7UVeAyXyinc4NkL6NFfga5swen3LX6YvZBQ+pXz/A6aNcfUIAirXiA32Ipk1IRYrZcj3ypKcgpIeLpywRczGKAJYVziAz50PgnOh5u/pR5j6LM=</Encrypted>]]>
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